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
Require Import Qu8Add.Model.
Require Import Qu8Add.Types.
Require Import Qu8Add.MemoryModel.
Require Import Qu8Add.RvvMemoryModel.
Local Open Scope sac.
From Qu8Add Require Import u8_arrays_strategy_goal.
From Qu8Add Require Import u8_arrays_strategy_proof.
From Qu8Add Require Import rvv_store_strategy_goal.
From Qu8Add Require Import rvv_store_strategy_proof.

(*----- Function qcp_qu_rvv_get32 -----*)

Definition qcp_qu_rvv_get32_safety_wit_1 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (0 <= x0)) (PreH4 : (x0 <= 255)) (PreH5 : (0 <= x1)) (PreH6 : (x1 <= 255)) (PreH7 : (0 <= x2)) (PreH8 : (x2 <= 255)) (PreH9 : (0 <= x3)) (PreH10 : (x3 <= 255)) (PreH11 : (0 <= x4)) (PreH12 : (x4 <= 255)) (PreH13 : (0 <= x5)) (PreH14 : (x5 <= 255)) (PreH15 : (0 <= x6)) (PreH16 : (x6 <= 255)) (PreH17 : (0 <= x7)) (PreH18 : (x7 <= 255)) (PreH19 : (0 <= x8)) (PreH20 : (x8 <= 255)) (PreH21 : (0 <= x9)) (PreH22 : (x9 <= 255)) (PreH23 : (0 <= x10)) (PreH24 : (x10 <= 255)) (PreH25 : (0 <= x11)) (PreH26 : (x11 <= 255)) (PreH27 : (0 <= x12)) (PreH28 : (x12 <= 255)) (PreH29 : (0 <= x13)) (PreH30 : (x13 <= 255)) (PreH31 : (0 <= x14)) (PreH32 : (x14 <= 255)) (PreH33 : (0 <= x15)) (PreH34 : (x15 <= 255)) (PreH35 : (0 <= x16)) (PreH36 : (x16 <= 255)) (PreH37 : (0 <= x17)) (PreH38 : (x17 <= 255)) (PreH39 : (0 <= x18)) (PreH40 : (x18 <= 255)) (PreH41 : (0 <= x19)) (PreH42 : (x19 <= 255)) (PreH43 : (0 <= x20)) (PreH44 : (x20 <= 255)) (PreH45 : (0 <= x21)) (PreH46 : (x21 <= 255)) (PreH47 : (0 <= x22)) (PreH48 : (x22 <= 255)) (PreH49 : (0 <= x23)) (PreH50 : (x23 <= 255)) (PreH51 : (0 <= x24)) (PreH52 : (x24 <= 255)) (PreH53 : (0 <= x25)) (PreH54 : (x25 <= 255)) (PreH55 : (0 <= x26)) (PreH56 : (x26 <= 255)) (PreH57 : (0 <= x27)) (PreH58 : (x27 <= 255)) (PreH59 : (0 <= x28)) (PreH60 : (x28 <= 255)) (PreH61 : (0 <= x29)) (PreH62 : (x29 <= 255)) (PreH63 : (0 <= x30)) (PreH64 : (x30 <= 255)) (PreH65 : (0 <= x31)) (PreH66 : (x31 <= 255)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition qcp_qu_rvv_get32_safety_wit_2 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 16)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= x0)) (PreH5 : (x0 <= 255)) (PreH6 : (0 <= x1)) (PreH7 : (x1 <= 255)) (PreH8 : (0 <= x2)) (PreH9 : (x2 <= 255)) (PreH10 : (0 <= x3)) (PreH11 : (x3 <= 255)) (PreH12 : (0 <= x4)) (PreH13 : (x4 <= 255)) (PreH14 : (0 <= x5)) (PreH15 : (x5 <= 255)) (PreH16 : (0 <= x6)) (PreH17 : (x6 <= 255)) (PreH18 : (0 <= x7)) (PreH19 : (x7 <= 255)) (PreH20 : (0 <= x8)) (PreH21 : (x8 <= 255)) (PreH22 : (0 <= x9)) (PreH23 : (x9 <= 255)) (PreH24 : (0 <= x10)) (PreH25 : (x10 <= 255)) (PreH26 : (0 <= x11)) (PreH27 : (x11 <= 255)) (PreH28 : (0 <= x12)) (PreH29 : (x12 <= 255)) (PreH30 : (0 <= x13)) (PreH31 : (x13 <= 255)) (PreH32 : (0 <= x14)) (PreH33 : (x14 <= 255)) (PreH34 : (0 <= x15)) (PreH35 : (x15 <= 255)) (PreH36 : (0 <= x16)) (PreH37 : (x16 <= 255)) (PreH38 : (0 <= x17)) (PreH39 : (x17 <= 255)) (PreH40 : (0 <= x18)) (PreH41 : (x18 <= 255)) (PreH42 : (0 <= x19)) (PreH43 : (x19 <= 255)) (PreH44 : (0 <= x20)) (PreH45 : (x20 <= 255)) (PreH46 : (0 <= x21)) (PreH47 : (x21 <= 255)) (PreH48 : (0 <= x22)) (PreH49 : (x22 <= 255)) (PreH50 : (0 <= x23)) (PreH51 : (x23 <= 255)) (PreH52 : (0 <= x24)) (PreH53 : (x24 <= 255)) (PreH54 : (0 <= x25)) (PreH55 : (x25 <= 255)) (PreH56 : (0 <= x26)) (PreH57 : (x26 <= 255)) (PreH58 : (0 <= x27)) (PreH59 : (x27 <= 255)) (PreH60 : (0 <= x28)) (PreH61 : (x28 <= 255)) (PreH62 : (0 <= x29)) (PreH63 : (x29 <= 255)) (PreH64 : (0 <= x30)) (PreH65 : (x30 <= 255)) (PreH66 : (0 <= x31)) (PreH67 : (x31 <= 255)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition qcp_qu_rvv_get32_safety_wit_3 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 8)) (PreH2 : (i_pre < 16)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= x0)) (PreH6 : (x0 <= 255)) (PreH7 : (0 <= x1)) (PreH8 : (x1 <= 255)) (PreH9 : (0 <= x2)) (PreH10 : (x2 <= 255)) (PreH11 : (0 <= x3)) (PreH12 : (x3 <= 255)) (PreH13 : (0 <= x4)) (PreH14 : (x4 <= 255)) (PreH15 : (0 <= x5)) (PreH16 : (x5 <= 255)) (PreH17 : (0 <= x6)) (PreH18 : (x6 <= 255)) (PreH19 : (0 <= x7)) (PreH20 : (x7 <= 255)) (PreH21 : (0 <= x8)) (PreH22 : (x8 <= 255)) (PreH23 : (0 <= x9)) (PreH24 : (x9 <= 255)) (PreH25 : (0 <= x10)) (PreH26 : (x10 <= 255)) (PreH27 : (0 <= x11)) (PreH28 : (x11 <= 255)) (PreH29 : (0 <= x12)) (PreH30 : (x12 <= 255)) (PreH31 : (0 <= x13)) (PreH32 : (x13 <= 255)) (PreH33 : (0 <= x14)) (PreH34 : (x14 <= 255)) (PreH35 : (0 <= x15)) (PreH36 : (x15 <= 255)) (PreH37 : (0 <= x16)) (PreH38 : (x16 <= 255)) (PreH39 : (0 <= x17)) (PreH40 : (x17 <= 255)) (PreH41 : (0 <= x18)) (PreH42 : (x18 <= 255)) (PreH43 : (0 <= x19)) (PreH44 : (x19 <= 255)) (PreH45 : (0 <= x20)) (PreH46 : (x20 <= 255)) (PreH47 : (0 <= x21)) (PreH48 : (x21 <= 255)) (PreH49 : (0 <= x22)) (PreH50 : (x22 <= 255)) (PreH51 : (0 <= x23)) (PreH52 : (x23 <= 255)) (PreH53 : (0 <= x24)) (PreH54 : (x24 <= 255)) (PreH55 : (0 <= x25)) (PreH56 : (x25 <= 255)) (PreH57 : (0 <= x26)) (PreH58 : (x26 <= 255)) (PreH59 : (0 <= x27)) (PreH60 : (x27 <= 255)) (PreH61 : (0 <= x28)) (PreH62 : (x28 <= 255)) (PreH63 : (0 <= x29)) (PreH64 : (x29 <= 255)) (PreH65 : (0 <= x30)) (PreH66 : (x30 <= 255)) (PreH67 : (0 <= x31)) (PreH68 : (x31 <= 255)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition qcp_qu_rvv_get32_safety_wit_4 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 4)) (PreH2 : (i_pre < 8)) (PreH3 : (i_pre < 16)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= x0)) (PreH7 : (x0 <= 255)) (PreH8 : (0 <= x1)) (PreH9 : (x1 <= 255)) (PreH10 : (0 <= x2)) (PreH11 : (x2 <= 255)) (PreH12 : (0 <= x3)) (PreH13 : (x3 <= 255)) (PreH14 : (0 <= x4)) (PreH15 : (x4 <= 255)) (PreH16 : (0 <= x5)) (PreH17 : (x5 <= 255)) (PreH18 : (0 <= x6)) (PreH19 : (x6 <= 255)) (PreH20 : (0 <= x7)) (PreH21 : (x7 <= 255)) (PreH22 : (0 <= x8)) (PreH23 : (x8 <= 255)) (PreH24 : (0 <= x9)) (PreH25 : (x9 <= 255)) (PreH26 : (0 <= x10)) (PreH27 : (x10 <= 255)) (PreH28 : (0 <= x11)) (PreH29 : (x11 <= 255)) (PreH30 : (0 <= x12)) (PreH31 : (x12 <= 255)) (PreH32 : (0 <= x13)) (PreH33 : (x13 <= 255)) (PreH34 : (0 <= x14)) (PreH35 : (x14 <= 255)) (PreH36 : (0 <= x15)) (PreH37 : (x15 <= 255)) (PreH38 : (0 <= x16)) (PreH39 : (x16 <= 255)) (PreH40 : (0 <= x17)) (PreH41 : (x17 <= 255)) (PreH42 : (0 <= x18)) (PreH43 : (x18 <= 255)) (PreH44 : (0 <= x19)) (PreH45 : (x19 <= 255)) (PreH46 : (0 <= x20)) (PreH47 : (x20 <= 255)) (PreH48 : (0 <= x21)) (PreH49 : (x21 <= 255)) (PreH50 : (0 <= x22)) (PreH51 : (x22 <= 255)) (PreH52 : (0 <= x23)) (PreH53 : (x23 <= 255)) (PreH54 : (0 <= x24)) (PreH55 : (x24 <= 255)) (PreH56 : (0 <= x25)) (PreH57 : (x25 <= 255)) (PreH58 : (0 <= x26)) (PreH59 : (x26 <= 255)) (PreH60 : (0 <= x27)) (PreH61 : (x27 <= 255)) (PreH62 : (0 <= x28)) (PreH63 : (x28 <= 255)) (PreH64 : (0 <= x29)) (PreH65 : (x29 <= 255)) (PreH66 : (0 <= x30)) (PreH67 : (x30 <= 255)) (PreH68 : (0 <= x31)) (PreH69 : (x31 <= 255)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition qcp_qu_rvv_get32_safety_wit_5 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 2)) (PreH2 : (i_pre < 4)) (PreH3 : (i_pre < 8)) (PreH4 : (i_pre < 16)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= x0)) (PreH8 : (x0 <= 255)) (PreH9 : (0 <= x1)) (PreH10 : (x1 <= 255)) (PreH11 : (0 <= x2)) (PreH12 : (x2 <= 255)) (PreH13 : (0 <= x3)) (PreH14 : (x3 <= 255)) (PreH15 : (0 <= x4)) (PreH16 : (x4 <= 255)) (PreH17 : (0 <= x5)) (PreH18 : (x5 <= 255)) (PreH19 : (0 <= x6)) (PreH20 : (x6 <= 255)) (PreH21 : (0 <= x7)) (PreH22 : (x7 <= 255)) (PreH23 : (0 <= x8)) (PreH24 : (x8 <= 255)) (PreH25 : (0 <= x9)) (PreH26 : (x9 <= 255)) (PreH27 : (0 <= x10)) (PreH28 : (x10 <= 255)) (PreH29 : (0 <= x11)) (PreH30 : (x11 <= 255)) (PreH31 : (0 <= x12)) (PreH32 : (x12 <= 255)) (PreH33 : (0 <= x13)) (PreH34 : (x13 <= 255)) (PreH35 : (0 <= x14)) (PreH36 : (x14 <= 255)) (PreH37 : (0 <= x15)) (PreH38 : (x15 <= 255)) (PreH39 : (0 <= x16)) (PreH40 : (x16 <= 255)) (PreH41 : (0 <= x17)) (PreH42 : (x17 <= 255)) (PreH43 : (0 <= x18)) (PreH44 : (x18 <= 255)) (PreH45 : (0 <= x19)) (PreH46 : (x19 <= 255)) (PreH47 : (0 <= x20)) (PreH48 : (x20 <= 255)) (PreH49 : (0 <= x21)) (PreH50 : (x21 <= 255)) (PreH51 : (0 <= x22)) (PreH52 : (x22 <= 255)) (PreH53 : (0 <= x23)) (PreH54 : (x23 <= 255)) (PreH55 : (0 <= x24)) (PreH56 : (x24 <= 255)) (PreH57 : (0 <= x25)) (PreH58 : (x25 <= 255)) (PreH59 : (0 <= x26)) (PreH60 : (x26 <= 255)) (PreH61 : (0 <= x27)) (PreH62 : (x27 <= 255)) (PreH63 : (0 <= x28)) (PreH64 : (x28 <= 255)) (PreH65 : (0 <= x29)) (PreH66 : (x29 <= 255)) (PreH67 : (0 <= x30)) (PreH68 : (x30 <= 255)) (PreH69 : (0 <= x31)) (PreH70 : (x31 <= 255)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_qu_rvv_get32_safety_wit_6 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 2)) (PreH2 : (i_pre < 4)) (PreH3 : (i_pre < 8)) (PreH4 : (i_pre < 16)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= x0)) (PreH8 : (x0 <= 255)) (PreH9 : (0 <= x1)) (PreH10 : (x1 <= 255)) (PreH11 : (0 <= x2)) (PreH12 : (x2 <= 255)) (PreH13 : (0 <= x3)) (PreH14 : (x3 <= 255)) (PreH15 : (0 <= x4)) (PreH16 : (x4 <= 255)) (PreH17 : (0 <= x5)) (PreH18 : (x5 <= 255)) (PreH19 : (0 <= x6)) (PreH20 : (x6 <= 255)) (PreH21 : (0 <= x7)) (PreH22 : (x7 <= 255)) (PreH23 : (0 <= x8)) (PreH24 : (x8 <= 255)) (PreH25 : (0 <= x9)) (PreH26 : (x9 <= 255)) (PreH27 : (0 <= x10)) (PreH28 : (x10 <= 255)) (PreH29 : (0 <= x11)) (PreH30 : (x11 <= 255)) (PreH31 : (0 <= x12)) (PreH32 : (x12 <= 255)) (PreH33 : (0 <= x13)) (PreH34 : (x13 <= 255)) (PreH35 : (0 <= x14)) (PreH36 : (x14 <= 255)) (PreH37 : (0 <= x15)) (PreH38 : (x15 <= 255)) (PreH39 : (0 <= x16)) (PreH40 : (x16 <= 255)) (PreH41 : (0 <= x17)) (PreH42 : (x17 <= 255)) (PreH43 : (0 <= x18)) (PreH44 : (x18 <= 255)) (PreH45 : (0 <= x19)) (PreH46 : (x19 <= 255)) (PreH47 : (0 <= x20)) (PreH48 : (x20 <= 255)) (PreH49 : (0 <= x21)) (PreH50 : (x21 <= 255)) (PreH51 : (0 <= x22)) (PreH52 : (x22 <= 255)) (PreH53 : (0 <= x23)) (PreH54 : (x23 <= 255)) (PreH55 : (0 <= x24)) (PreH56 : (x24 <= 255)) (PreH57 : (0 <= x25)) (PreH58 : (x25 <= 255)) (PreH59 : (0 <= x26)) (PreH60 : (x26 <= 255)) (PreH61 : (0 <= x27)) (PreH62 : (x27 <= 255)) (PreH63 : (0 <= x28)) (PreH64 : (x28 <= 255)) (PreH65 : (0 <= x29)) (PreH66 : (x29 <= 255)) (PreH67 : (0 <= x30)) (PreH68 : (x30 <= 255)) (PreH69 : (0 <= x31)) (PreH70 : (x31 <= 255)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition qcp_qu_rvv_get32_safety_wit_7 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 4)) (PreH2 : (i_pre < 8)) (PreH3 : (i_pre < 16)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= x0)) (PreH7 : (x0 <= 255)) (PreH8 : (0 <= x1)) (PreH9 : (x1 <= 255)) (PreH10 : (0 <= x2)) (PreH11 : (x2 <= 255)) (PreH12 : (0 <= x3)) (PreH13 : (x3 <= 255)) (PreH14 : (0 <= x4)) (PreH15 : (x4 <= 255)) (PreH16 : (0 <= x5)) (PreH17 : (x5 <= 255)) (PreH18 : (0 <= x6)) (PreH19 : (x6 <= 255)) (PreH20 : (0 <= x7)) (PreH21 : (x7 <= 255)) (PreH22 : (0 <= x8)) (PreH23 : (x8 <= 255)) (PreH24 : (0 <= x9)) (PreH25 : (x9 <= 255)) (PreH26 : (0 <= x10)) (PreH27 : (x10 <= 255)) (PreH28 : (0 <= x11)) (PreH29 : (x11 <= 255)) (PreH30 : (0 <= x12)) (PreH31 : (x12 <= 255)) (PreH32 : (0 <= x13)) (PreH33 : (x13 <= 255)) (PreH34 : (0 <= x14)) (PreH35 : (x14 <= 255)) (PreH36 : (0 <= x15)) (PreH37 : (x15 <= 255)) (PreH38 : (0 <= x16)) (PreH39 : (x16 <= 255)) (PreH40 : (0 <= x17)) (PreH41 : (x17 <= 255)) (PreH42 : (0 <= x18)) (PreH43 : (x18 <= 255)) (PreH44 : (0 <= x19)) (PreH45 : (x19 <= 255)) (PreH46 : (0 <= x20)) (PreH47 : (x20 <= 255)) (PreH48 : (0 <= x21)) (PreH49 : (x21 <= 255)) (PreH50 : (0 <= x22)) (PreH51 : (x22 <= 255)) (PreH52 : (0 <= x23)) (PreH53 : (x23 <= 255)) (PreH54 : (0 <= x24)) (PreH55 : (x24 <= 255)) (PreH56 : (0 <= x25)) (PreH57 : (x25 <= 255)) (PreH58 : (0 <= x26)) (PreH59 : (x26 <= 255)) (PreH60 : (0 <= x27)) (PreH61 : (x27 <= 255)) (PreH62 : (0 <= x28)) (PreH63 : (x28 <= 255)) (PreH64 : (0 <= x29)) (PreH65 : (x29 <= 255)) (PreH66 : (0 <= x30)) (PreH67 : (x30 <= 255)) (PreH68 : (0 <= x31)) (PreH69 : (x31 <= 255)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 6) ”
.

Definition qcp_qu_rvv_get32_safety_wit_8 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 6)) (PreH2 : (i_pre >= 4)) (PreH3 : (i_pre < 8)) (PreH4 : (i_pre < 16)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= x0)) (PreH8 : (x0 <= 255)) (PreH9 : (0 <= x1)) (PreH10 : (x1 <= 255)) (PreH11 : (0 <= x2)) (PreH12 : (x2 <= 255)) (PreH13 : (0 <= x3)) (PreH14 : (x3 <= 255)) (PreH15 : (0 <= x4)) (PreH16 : (x4 <= 255)) (PreH17 : (0 <= x5)) (PreH18 : (x5 <= 255)) (PreH19 : (0 <= x6)) (PreH20 : (x6 <= 255)) (PreH21 : (0 <= x7)) (PreH22 : (x7 <= 255)) (PreH23 : (0 <= x8)) (PreH24 : (x8 <= 255)) (PreH25 : (0 <= x9)) (PreH26 : (x9 <= 255)) (PreH27 : (0 <= x10)) (PreH28 : (x10 <= 255)) (PreH29 : (0 <= x11)) (PreH30 : (x11 <= 255)) (PreH31 : (0 <= x12)) (PreH32 : (x12 <= 255)) (PreH33 : (0 <= x13)) (PreH34 : (x13 <= 255)) (PreH35 : (0 <= x14)) (PreH36 : (x14 <= 255)) (PreH37 : (0 <= x15)) (PreH38 : (x15 <= 255)) (PreH39 : (0 <= x16)) (PreH40 : (x16 <= 255)) (PreH41 : (0 <= x17)) (PreH42 : (x17 <= 255)) (PreH43 : (0 <= x18)) (PreH44 : (x18 <= 255)) (PreH45 : (0 <= x19)) (PreH46 : (x19 <= 255)) (PreH47 : (0 <= x20)) (PreH48 : (x20 <= 255)) (PreH49 : (0 <= x21)) (PreH50 : (x21 <= 255)) (PreH51 : (0 <= x22)) (PreH52 : (x22 <= 255)) (PreH53 : (0 <= x23)) (PreH54 : (x23 <= 255)) (PreH55 : (0 <= x24)) (PreH56 : (x24 <= 255)) (PreH57 : (0 <= x25)) (PreH58 : (x25 <= 255)) (PreH59 : (0 <= x26)) (PreH60 : (x26 <= 255)) (PreH61 : (0 <= x27)) (PreH62 : (x27 <= 255)) (PreH63 : (0 <= x28)) (PreH64 : (x28 <= 255)) (PreH65 : (0 <= x29)) (PreH66 : (x29 <= 255)) (PreH67 : (0 <= x30)) (PreH68 : (x30 <= 255)) (PreH69 : (0 <= x31)) (PreH70 : (x31 <= 255)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 5) ”
.

Definition qcp_qu_rvv_get32_safety_wit_9 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 6)) (PreH2 : (i_pre >= 4)) (PreH3 : (i_pre < 8)) (PreH4 : (i_pre < 16)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= x0)) (PreH8 : (x0 <= 255)) (PreH9 : (0 <= x1)) (PreH10 : (x1 <= 255)) (PreH11 : (0 <= x2)) (PreH12 : (x2 <= 255)) (PreH13 : (0 <= x3)) (PreH14 : (x3 <= 255)) (PreH15 : (0 <= x4)) (PreH16 : (x4 <= 255)) (PreH17 : (0 <= x5)) (PreH18 : (x5 <= 255)) (PreH19 : (0 <= x6)) (PreH20 : (x6 <= 255)) (PreH21 : (0 <= x7)) (PreH22 : (x7 <= 255)) (PreH23 : (0 <= x8)) (PreH24 : (x8 <= 255)) (PreH25 : (0 <= x9)) (PreH26 : (x9 <= 255)) (PreH27 : (0 <= x10)) (PreH28 : (x10 <= 255)) (PreH29 : (0 <= x11)) (PreH30 : (x11 <= 255)) (PreH31 : (0 <= x12)) (PreH32 : (x12 <= 255)) (PreH33 : (0 <= x13)) (PreH34 : (x13 <= 255)) (PreH35 : (0 <= x14)) (PreH36 : (x14 <= 255)) (PreH37 : (0 <= x15)) (PreH38 : (x15 <= 255)) (PreH39 : (0 <= x16)) (PreH40 : (x16 <= 255)) (PreH41 : (0 <= x17)) (PreH42 : (x17 <= 255)) (PreH43 : (0 <= x18)) (PreH44 : (x18 <= 255)) (PreH45 : (0 <= x19)) (PreH46 : (x19 <= 255)) (PreH47 : (0 <= x20)) (PreH48 : (x20 <= 255)) (PreH49 : (0 <= x21)) (PreH50 : (x21 <= 255)) (PreH51 : (0 <= x22)) (PreH52 : (x22 <= 255)) (PreH53 : (0 <= x23)) (PreH54 : (x23 <= 255)) (PreH55 : (0 <= x24)) (PreH56 : (x24 <= 255)) (PreH57 : (0 <= x25)) (PreH58 : (x25 <= 255)) (PreH59 : (0 <= x26)) (PreH60 : (x26 <= 255)) (PreH61 : (0 <= x27)) (PreH62 : (x27 <= 255)) (PreH63 : (0 <= x28)) (PreH64 : (x28 <= 255)) (PreH65 : (0 <= x29)) (PreH66 : (x29 <= 255)) (PreH67 : (0 <= x30)) (PreH68 : (x30 <= 255)) (PreH69 : (0 <= x31)) (PreH70 : (x31 <= 255)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 7) ”
.

Definition qcp_qu_rvv_get32_safety_wit_10 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 8)) (PreH2 : (i_pre < 16)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= x0)) (PreH6 : (x0 <= 255)) (PreH7 : (0 <= x1)) (PreH8 : (x1 <= 255)) (PreH9 : (0 <= x2)) (PreH10 : (x2 <= 255)) (PreH11 : (0 <= x3)) (PreH12 : (x3 <= 255)) (PreH13 : (0 <= x4)) (PreH14 : (x4 <= 255)) (PreH15 : (0 <= x5)) (PreH16 : (x5 <= 255)) (PreH17 : (0 <= x6)) (PreH18 : (x6 <= 255)) (PreH19 : (0 <= x7)) (PreH20 : (x7 <= 255)) (PreH21 : (0 <= x8)) (PreH22 : (x8 <= 255)) (PreH23 : (0 <= x9)) (PreH24 : (x9 <= 255)) (PreH25 : (0 <= x10)) (PreH26 : (x10 <= 255)) (PreH27 : (0 <= x11)) (PreH28 : (x11 <= 255)) (PreH29 : (0 <= x12)) (PreH30 : (x12 <= 255)) (PreH31 : (0 <= x13)) (PreH32 : (x13 <= 255)) (PreH33 : (0 <= x14)) (PreH34 : (x14 <= 255)) (PreH35 : (0 <= x15)) (PreH36 : (x15 <= 255)) (PreH37 : (0 <= x16)) (PreH38 : (x16 <= 255)) (PreH39 : (0 <= x17)) (PreH40 : (x17 <= 255)) (PreH41 : (0 <= x18)) (PreH42 : (x18 <= 255)) (PreH43 : (0 <= x19)) (PreH44 : (x19 <= 255)) (PreH45 : (0 <= x20)) (PreH46 : (x20 <= 255)) (PreH47 : (0 <= x21)) (PreH48 : (x21 <= 255)) (PreH49 : (0 <= x22)) (PreH50 : (x22 <= 255)) (PreH51 : (0 <= x23)) (PreH52 : (x23 <= 255)) (PreH53 : (0 <= x24)) (PreH54 : (x24 <= 255)) (PreH55 : (0 <= x25)) (PreH56 : (x25 <= 255)) (PreH57 : (0 <= x26)) (PreH58 : (x26 <= 255)) (PreH59 : (0 <= x27)) (PreH60 : (x27 <= 255)) (PreH61 : (0 <= x28)) (PreH62 : (x28 <= 255)) (PreH63 : (0 <= x29)) (PreH64 : (x29 <= 255)) (PreH65 : (0 <= x30)) (PreH66 : (x30 <= 255)) (PreH67 : (0 <= x31)) (PreH68 : (x31 <= 255)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 12) ”
.

Definition qcp_qu_rvv_get32_safety_wit_11 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 12)) (PreH2 : (i_pre >= 8)) (PreH3 : (i_pre < 16)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= x0)) (PreH7 : (x0 <= 255)) (PreH8 : (0 <= x1)) (PreH9 : (x1 <= 255)) (PreH10 : (0 <= x2)) (PreH11 : (x2 <= 255)) (PreH12 : (0 <= x3)) (PreH13 : (x3 <= 255)) (PreH14 : (0 <= x4)) (PreH15 : (x4 <= 255)) (PreH16 : (0 <= x5)) (PreH17 : (x5 <= 255)) (PreH18 : (0 <= x6)) (PreH19 : (x6 <= 255)) (PreH20 : (0 <= x7)) (PreH21 : (x7 <= 255)) (PreH22 : (0 <= x8)) (PreH23 : (x8 <= 255)) (PreH24 : (0 <= x9)) (PreH25 : (x9 <= 255)) (PreH26 : (0 <= x10)) (PreH27 : (x10 <= 255)) (PreH28 : (0 <= x11)) (PreH29 : (x11 <= 255)) (PreH30 : (0 <= x12)) (PreH31 : (x12 <= 255)) (PreH32 : (0 <= x13)) (PreH33 : (x13 <= 255)) (PreH34 : (0 <= x14)) (PreH35 : (x14 <= 255)) (PreH36 : (0 <= x15)) (PreH37 : (x15 <= 255)) (PreH38 : (0 <= x16)) (PreH39 : (x16 <= 255)) (PreH40 : (0 <= x17)) (PreH41 : (x17 <= 255)) (PreH42 : (0 <= x18)) (PreH43 : (x18 <= 255)) (PreH44 : (0 <= x19)) (PreH45 : (x19 <= 255)) (PreH46 : (0 <= x20)) (PreH47 : (x20 <= 255)) (PreH48 : (0 <= x21)) (PreH49 : (x21 <= 255)) (PreH50 : (0 <= x22)) (PreH51 : (x22 <= 255)) (PreH52 : (0 <= x23)) (PreH53 : (x23 <= 255)) (PreH54 : (0 <= x24)) (PreH55 : (x24 <= 255)) (PreH56 : (0 <= x25)) (PreH57 : (x25 <= 255)) (PreH58 : (0 <= x26)) (PreH59 : (x26 <= 255)) (PreH60 : (0 <= x27)) (PreH61 : (x27 <= 255)) (PreH62 : (0 <= x28)) (PreH63 : (x28 <= 255)) (PreH64 : (0 <= x29)) (PreH65 : (x29 <= 255)) (PreH66 : (0 <= x30)) (PreH67 : (x30 <= 255)) (PreH68 : (0 <= x31)) (PreH69 : (x31 <= 255)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 10) ”
.

Definition qcp_qu_rvv_get32_safety_wit_12 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 10)) (PreH2 : (i_pre < 12)) (PreH3 : (i_pre >= 8)) (PreH4 : (i_pre < 16)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= x0)) (PreH8 : (x0 <= 255)) (PreH9 : (0 <= x1)) (PreH10 : (x1 <= 255)) (PreH11 : (0 <= x2)) (PreH12 : (x2 <= 255)) (PreH13 : (0 <= x3)) (PreH14 : (x3 <= 255)) (PreH15 : (0 <= x4)) (PreH16 : (x4 <= 255)) (PreH17 : (0 <= x5)) (PreH18 : (x5 <= 255)) (PreH19 : (0 <= x6)) (PreH20 : (x6 <= 255)) (PreH21 : (0 <= x7)) (PreH22 : (x7 <= 255)) (PreH23 : (0 <= x8)) (PreH24 : (x8 <= 255)) (PreH25 : (0 <= x9)) (PreH26 : (x9 <= 255)) (PreH27 : (0 <= x10)) (PreH28 : (x10 <= 255)) (PreH29 : (0 <= x11)) (PreH30 : (x11 <= 255)) (PreH31 : (0 <= x12)) (PreH32 : (x12 <= 255)) (PreH33 : (0 <= x13)) (PreH34 : (x13 <= 255)) (PreH35 : (0 <= x14)) (PreH36 : (x14 <= 255)) (PreH37 : (0 <= x15)) (PreH38 : (x15 <= 255)) (PreH39 : (0 <= x16)) (PreH40 : (x16 <= 255)) (PreH41 : (0 <= x17)) (PreH42 : (x17 <= 255)) (PreH43 : (0 <= x18)) (PreH44 : (x18 <= 255)) (PreH45 : (0 <= x19)) (PreH46 : (x19 <= 255)) (PreH47 : (0 <= x20)) (PreH48 : (x20 <= 255)) (PreH49 : (0 <= x21)) (PreH50 : (x21 <= 255)) (PreH51 : (0 <= x22)) (PreH52 : (x22 <= 255)) (PreH53 : (0 <= x23)) (PreH54 : (x23 <= 255)) (PreH55 : (0 <= x24)) (PreH56 : (x24 <= 255)) (PreH57 : (0 <= x25)) (PreH58 : (x25 <= 255)) (PreH59 : (0 <= x26)) (PreH60 : (x26 <= 255)) (PreH61 : (0 <= x27)) (PreH62 : (x27 <= 255)) (PreH63 : (0 <= x28)) (PreH64 : (x28 <= 255)) (PreH65 : (0 <= x29)) (PreH66 : (x29 <= 255)) (PreH67 : (0 <= x30)) (PreH68 : (x30 <= 255)) (PreH69 : (0 <= x31)) (PreH70 : (x31 <= 255)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 9) ”
.

Definition qcp_qu_rvv_get32_safety_wit_13 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 10)) (PreH2 : (i_pre < 12)) (PreH3 : (i_pre >= 8)) (PreH4 : (i_pre < 16)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= x0)) (PreH8 : (x0 <= 255)) (PreH9 : (0 <= x1)) (PreH10 : (x1 <= 255)) (PreH11 : (0 <= x2)) (PreH12 : (x2 <= 255)) (PreH13 : (0 <= x3)) (PreH14 : (x3 <= 255)) (PreH15 : (0 <= x4)) (PreH16 : (x4 <= 255)) (PreH17 : (0 <= x5)) (PreH18 : (x5 <= 255)) (PreH19 : (0 <= x6)) (PreH20 : (x6 <= 255)) (PreH21 : (0 <= x7)) (PreH22 : (x7 <= 255)) (PreH23 : (0 <= x8)) (PreH24 : (x8 <= 255)) (PreH25 : (0 <= x9)) (PreH26 : (x9 <= 255)) (PreH27 : (0 <= x10)) (PreH28 : (x10 <= 255)) (PreH29 : (0 <= x11)) (PreH30 : (x11 <= 255)) (PreH31 : (0 <= x12)) (PreH32 : (x12 <= 255)) (PreH33 : (0 <= x13)) (PreH34 : (x13 <= 255)) (PreH35 : (0 <= x14)) (PreH36 : (x14 <= 255)) (PreH37 : (0 <= x15)) (PreH38 : (x15 <= 255)) (PreH39 : (0 <= x16)) (PreH40 : (x16 <= 255)) (PreH41 : (0 <= x17)) (PreH42 : (x17 <= 255)) (PreH43 : (0 <= x18)) (PreH44 : (x18 <= 255)) (PreH45 : (0 <= x19)) (PreH46 : (x19 <= 255)) (PreH47 : (0 <= x20)) (PreH48 : (x20 <= 255)) (PreH49 : (0 <= x21)) (PreH50 : (x21 <= 255)) (PreH51 : (0 <= x22)) (PreH52 : (x22 <= 255)) (PreH53 : (0 <= x23)) (PreH54 : (x23 <= 255)) (PreH55 : (0 <= x24)) (PreH56 : (x24 <= 255)) (PreH57 : (0 <= x25)) (PreH58 : (x25 <= 255)) (PreH59 : (0 <= x26)) (PreH60 : (x26 <= 255)) (PreH61 : (0 <= x27)) (PreH62 : (x27 <= 255)) (PreH63 : (0 <= x28)) (PreH64 : (x28 <= 255)) (PreH65 : (0 <= x29)) (PreH66 : (x29 <= 255)) (PreH67 : (0 <= x30)) (PreH68 : (x30 <= 255)) (PreH69 : (0 <= x31)) (PreH70 : (x31 <= 255)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 11) ”
.

Definition qcp_qu_rvv_get32_safety_wit_14 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 12)) (PreH2 : (i_pre >= 8)) (PreH3 : (i_pre < 16)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= x0)) (PreH7 : (x0 <= 255)) (PreH8 : (0 <= x1)) (PreH9 : (x1 <= 255)) (PreH10 : (0 <= x2)) (PreH11 : (x2 <= 255)) (PreH12 : (0 <= x3)) (PreH13 : (x3 <= 255)) (PreH14 : (0 <= x4)) (PreH15 : (x4 <= 255)) (PreH16 : (0 <= x5)) (PreH17 : (x5 <= 255)) (PreH18 : (0 <= x6)) (PreH19 : (x6 <= 255)) (PreH20 : (0 <= x7)) (PreH21 : (x7 <= 255)) (PreH22 : (0 <= x8)) (PreH23 : (x8 <= 255)) (PreH24 : (0 <= x9)) (PreH25 : (x9 <= 255)) (PreH26 : (0 <= x10)) (PreH27 : (x10 <= 255)) (PreH28 : (0 <= x11)) (PreH29 : (x11 <= 255)) (PreH30 : (0 <= x12)) (PreH31 : (x12 <= 255)) (PreH32 : (0 <= x13)) (PreH33 : (x13 <= 255)) (PreH34 : (0 <= x14)) (PreH35 : (x14 <= 255)) (PreH36 : (0 <= x15)) (PreH37 : (x15 <= 255)) (PreH38 : (0 <= x16)) (PreH39 : (x16 <= 255)) (PreH40 : (0 <= x17)) (PreH41 : (x17 <= 255)) (PreH42 : (0 <= x18)) (PreH43 : (x18 <= 255)) (PreH44 : (0 <= x19)) (PreH45 : (x19 <= 255)) (PreH46 : (0 <= x20)) (PreH47 : (x20 <= 255)) (PreH48 : (0 <= x21)) (PreH49 : (x21 <= 255)) (PreH50 : (0 <= x22)) (PreH51 : (x22 <= 255)) (PreH52 : (0 <= x23)) (PreH53 : (x23 <= 255)) (PreH54 : (0 <= x24)) (PreH55 : (x24 <= 255)) (PreH56 : (0 <= x25)) (PreH57 : (x25 <= 255)) (PreH58 : (0 <= x26)) (PreH59 : (x26 <= 255)) (PreH60 : (0 <= x27)) (PreH61 : (x27 <= 255)) (PreH62 : (0 <= x28)) (PreH63 : (x28 <= 255)) (PreH64 : (0 <= x29)) (PreH65 : (x29 <= 255)) (PreH66 : (0 <= x30)) (PreH67 : (x30 <= 255)) (PreH68 : (0 <= x31)) (PreH69 : (x31 <= 255)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 14) ”
.

Definition qcp_qu_rvv_get32_safety_wit_15 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 14)) (PreH2 : (i_pre >= 12)) (PreH3 : (i_pre >= 8)) (PreH4 : (i_pre < 16)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= x0)) (PreH8 : (x0 <= 255)) (PreH9 : (0 <= x1)) (PreH10 : (x1 <= 255)) (PreH11 : (0 <= x2)) (PreH12 : (x2 <= 255)) (PreH13 : (0 <= x3)) (PreH14 : (x3 <= 255)) (PreH15 : (0 <= x4)) (PreH16 : (x4 <= 255)) (PreH17 : (0 <= x5)) (PreH18 : (x5 <= 255)) (PreH19 : (0 <= x6)) (PreH20 : (x6 <= 255)) (PreH21 : (0 <= x7)) (PreH22 : (x7 <= 255)) (PreH23 : (0 <= x8)) (PreH24 : (x8 <= 255)) (PreH25 : (0 <= x9)) (PreH26 : (x9 <= 255)) (PreH27 : (0 <= x10)) (PreH28 : (x10 <= 255)) (PreH29 : (0 <= x11)) (PreH30 : (x11 <= 255)) (PreH31 : (0 <= x12)) (PreH32 : (x12 <= 255)) (PreH33 : (0 <= x13)) (PreH34 : (x13 <= 255)) (PreH35 : (0 <= x14)) (PreH36 : (x14 <= 255)) (PreH37 : (0 <= x15)) (PreH38 : (x15 <= 255)) (PreH39 : (0 <= x16)) (PreH40 : (x16 <= 255)) (PreH41 : (0 <= x17)) (PreH42 : (x17 <= 255)) (PreH43 : (0 <= x18)) (PreH44 : (x18 <= 255)) (PreH45 : (0 <= x19)) (PreH46 : (x19 <= 255)) (PreH47 : (0 <= x20)) (PreH48 : (x20 <= 255)) (PreH49 : (0 <= x21)) (PreH50 : (x21 <= 255)) (PreH51 : (0 <= x22)) (PreH52 : (x22 <= 255)) (PreH53 : (0 <= x23)) (PreH54 : (x23 <= 255)) (PreH55 : (0 <= x24)) (PreH56 : (x24 <= 255)) (PreH57 : (0 <= x25)) (PreH58 : (x25 <= 255)) (PreH59 : (0 <= x26)) (PreH60 : (x26 <= 255)) (PreH61 : (0 <= x27)) (PreH62 : (x27 <= 255)) (PreH63 : (0 <= x28)) (PreH64 : (x28 <= 255)) (PreH65 : (0 <= x29)) (PreH66 : (x29 <= 255)) (PreH67 : (0 <= x30)) (PreH68 : (x30 <= 255)) (PreH69 : (0 <= x31)) (PreH70 : (x31 <= 255)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 13) ”
.

Definition qcp_qu_rvv_get32_safety_wit_16 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 14)) (PreH2 : (i_pre >= 12)) (PreH3 : (i_pre >= 8)) (PreH4 : (i_pre < 16)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= x0)) (PreH8 : (x0 <= 255)) (PreH9 : (0 <= x1)) (PreH10 : (x1 <= 255)) (PreH11 : (0 <= x2)) (PreH12 : (x2 <= 255)) (PreH13 : (0 <= x3)) (PreH14 : (x3 <= 255)) (PreH15 : (0 <= x4)) (PreH16 : (x4 <= 255)) (PreH17 : (0 <= x5)) (PreH18 : (x5 <= 255)) (PreH19 : (0 <= x6)) (PreH20 : (x6 <= 255)) (PreH21 : (0 <= x7)) (PreH22 : (x7 <= 255)) (PreH23 : (0 <= x8)) (PreH24 : (x8 <= 255)) (PreH25 : (0 <= x9)) (PreH26 : (x9 <= 255)) (PreH27 : (0 <= x10)) (PreH28 : (x10 <= 255)) (PreH29 : (0 <= x11)) (PreH30 : (x11 <= 255)) (PreH31 : (0 <= x12)) (PreH32 : (x12 <= 255)) (PreH33 : (0 <= x13)) (PreH34 : (x13 <= 255)) (PreH35 : (0 <= x14)) (PreH36 : (x14 <= 255)) (PreH37 : (0 <= x15)) (PreH38 : (x15 <= 255)) (PreH39 : (0 <= x16)) (PreH40 : (x16 <= 255)) (PreH41 : (0 <= x17)) (PreH42 : (x17 <= 255)) (PreH43 : (0 <= x18)) (PreH44 : (x18 <= 255)) (PreH45 : (0 <= x19)) (PreH46 : (x19 <= 255)) (PreH47 : (0 <= x20)) (PreH48 : (x20 <= 255)) (PreH49 : (0 <= x21)) (PreH50 : (x21 <= 255)) (PreH51 : (0 <= x22)) (PreH52 : (x22 <= 255)) (PreH53 : (0 <= x23)) (PreH54 : (x23 <= 255)) (PreH55 : (0 <= x24)) (PreH56 : (x24 <= 255)) (PreH57 : (0 <= x25)) (PreH58 : (x25 <= 255)) (PreH59 : (0 <= x26)) (PreH60 : (x26 <= 255)) (PreH61 : (0 <= x27)) (PreH62 : (x27 <= 255)) (PreH63 : (0 <= x28)) (PreH64 : (x28 <= 255)) (PreH65 : (0 <= x29)) (PreH66 : (x29 <= 255)) (PreH67 : (0 <= x30)) (PreH68 : (x30 <= 255)) (PreH69 : (0 <= x31)) (PreH70 : (x31 <= 255)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 15) ”
.

Definition qcp_qu_rvv_get32_safety_wit_17 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 16)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= x0)) (PreH5 : (x0 <= 255)) (PreH6 : (0 <= x1)) (PreH7 : (x1 <= 255)) (PreH8 : (0 <= x2)) (PreH9 : (x2 <= 255)) (PreH10 : (0 <= x3)) (PreH11 : (x3 <= 255)) (PreH12 : (0 <= x4)) (PreH13 : (x4 <= 255)) (PreH14 : (0 <= x5)) (PreH15 : (x5 <= 255)) (PreH16 : (0 <= x6)) (PreH17 : (x6 <= 255)) (PreH18 : (0 <= x7)) (PreH19 : (x7 <= 255)) (PreH20 : (0 <= x8)) (PreH21 : (x8 <= 255)) (PreH22 : (0 <= x9)) (PreH23 : (x9 <= 255)) (PreH24 : (0 <= x10)) (PreH25 : (x10 <= 255)) (PreH26 : (0 <= x11)) (PreH27 : (x11 <= 255)) (PreH28 : (0 <= x12)) (PreH29 : (x12 <= 255)) (PreH30 : (0 <= x13)) (PreH31 : (x13 <= 255)) (PreH32 : (0 <= x14)) (PreH33 : (x14 <= 255)) (PreH34 : (0 <= x15)) (PreH35 : (x15 <= 255)) (PreH36 : (0 <= x16)) (PreH37 : (x16 <= 255)) (PreH38 : (0 <= x17)) (PreH39 : (x17 <= 255)) (PreH40 : (0 <= x18)) (PreH41 : (x18 <= 255)) (PreH42 : (0 <= x19)) (PreH43 : (x19 <= 255)) (PreH44 : (0 <= x20)) (PreH45 : (x20 <= 255)) (PreH46 : (0 <= x21)) (PreH47 : (x21 <= 255)) (PreH48 : (0 <= x22)) (PreH49 : (x22 <= 255)) (PreH50 : (0 <= x23)) (PreH51 : (x23 <= 255)) (PreH52 : (0 <= x24)) (PreH53 : (x24 <= 255)) (PreH54 : (0 <= x25)) (PreH55 : (x25 <= 255)) (PreH56 : (0 <= x26)) (PreH57 : (x26 <= 255)) (PreH58 : (0 <= x27)) (PreH59 : (x27 <= 255)) (PreH60 : (0 <= x28)) (PreH61 : (x28 <= 255)) (PreH62 : (0 <= x29)) (PreH63 : (x29 <= 255)) (PreH64 : (0 <= x30)) (PreH65 : (x30 <= 255)) (PreH66 : (0 <= x31)) (PreH67 : (x31 <= 255)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (24 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 24) ”
.

Definition qcp_qu_rvv_get32_safety_wit_18 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 24)) (PreH2 : (i_pre >= 16)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= x0)) (PreH6 : (x0 <= 255)) (PreH7 : (0 <= x1)) (PreH8 : (x1 <= 255)) (PreH9 : (0 <= x2)) (PreH10 : (x2 <= 255)) (PreH11 : (0 <= x3)) (PreH12 : (x3 <= 255)) (PreH13 : (0 <= x4)) (PreH14 : (x4 <= 255)) (PreH15 : (0 <= x5)) (PreH16 : (x5 <= 255)) (PreH17 : (0 <= x6)) (PreH18 : (x6 <= 255)) (PreH19 : (0 <= x7)) (PreH20 : (x7 <= 255)) (PreH21 : (0 <= x8)) (PreH22 : (x8 <= 255)) (PreH23 : (0 <= x9)) (PreH24 : (x9 <= 255)) (PreH25 : (0 <= x10)) (PreH26 : (x10 <= 255)) (PreH27 : (0 <= x11)) (PreH28 : (x11 <= 255)) (PreH29 : (0 <= x12)) (PreH30 : (x12 <= 255)) (PreH31 : (0 <= x13)) (PreH32 : (x13 <= 255)) (PreH33 : (0 <= x14)) (PreH34 : (x14 <= 255)) (PreH35 : (0 <= x15)) (PreH36 : (x15 <= 255)) (PreH37 : (0 <= x16)) (PreH38 : (x16 <= 255)) (PreH39 : (0 <= x17)) (PreH40 : (x17 <= 255)) (PreH41 : (0 <= x18)) (PreH42 : (x18 <= 255)) (PreH43 : (0 <= x19)) (PreH44 : (x19 <= 255)) (PreH45 : (0 <= x20)) (PreH46 : (x20 <= 255)) (PreH47 : (0 <= x21)) (PreH48 : (x21 <= 255)) (PreH49 : (0 <= x22)) (PreH50 : (x22 <= 255)) (PreH51 : (0 <= x23)) (PreH52 : (x23 <= 255)) (PreH53 : (0 <= x24)) (PreH54 : (x24 <= 255)) (PreH55 : (0 <= x25)) (PreH56 : (x25 <= 255)) (PreH57 : (0 <= x26)) (PreH58 : (x26 <= 255)) (PreH59 : (0 <= x27)) (PreH60 : (x27 <= 255)) (PreH61 : (0 <= x28)) (PreH62 : (x28 <= 255)) (PreH63 : (0 <= x29)) (PreH64 : (x29 <= 255)) (PreH65 : (0 <= x30)) (PreH66 : (x30 <= 255)) (PreH67 : (0 <= x31)) (PreH68 : (x31 <= 255)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (20 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 20) ”
.

Definition qcp_qu_rvv_get32_safety_wit_19 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 20)) (PreH2 : (i_pre < 24)) (PreH3 : (i_pre >= 16)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= x0)) (PreH7 : (x0 <= 255)) (PreH8 : (0 <= x1)) (PreH9 : (x1 <= 255)) (PreH10 : (0 <= x2)) (PreH11 : (x2 <= 255)) (PreH12 : (0 <= x3)) (PreH13 : (x3 <= 255)) (PreH14 : (0 <= x4)) (PreH15 : (x4 <= 255)) (PreH16 : (0 <= x5)) (PreH17 : (x5 <= 255)) (PreH18 : (0 <= x6)) (PreH19 : (x6 <= 255)) (PreH20 : (0 <= x7)) (PreH21 : (x7 <= 255)) (PreH22 : (0 <= x8)) (PreH23 : (x8 <= 255)) (PreH24 : (0 <= x9)) (PreH25 : (x9 <= 255)) (PreH26 : (0 <= x10)) (PreH27 : (x10 <= 255)) (PreH28 : (0 <= x11)) (PreH29 : (x11 <= 255)) (PreH30 : (0 <= x12)) (PreH31 : (x12 <= 255)) (PreH32 : (0 <= x13)) (PreH33 : (x13 <= 255)) (PreH34 : (0 <= x14)) (PreH35 : (x14 <= 255)) (PreH36 : (0 <= x15)) (PreH37 : (x15 <= 255)) (PreH38 : (0 <= x16)) (PreH39 : (x16 <= 255)) (PreH40 : (0 <= x17)) (PreH41 : (x17 <= 255)) (PreH42 : (0 <= x18)) (PreH43 : (x18 <= 255)) (PreH44 : (0 <= x19)) (PreH45 : (x19 <= 255)) (PreH46 : (0 <= x20)) (PreH47 : (x20 <= 255)) (PreH48 : (0 <= x21)) (PreH49 : (x21 <= 255)) (PreH50 : (0 <= x22)) (PreH51 : (x22 <= 255)) (PreH52 : (0 <= x23)) (PreH53 : (x23 <= 255)) (PreH54 : (0 <= x24)) (PreH55 : (x24 <= 255)) (PreH56 : (0 <= x25)) (PreH57 : (x25 <= 255)) (PreH58 : (0 <= x26)) (PreH59 : (x26 <= 255)) (PreH60 : (0 <= x27)) (PreH61 : (x27 <= 255)) (PreH62 : (0 <= x28)) (PreH63 : (x28 <= 255)) (PreH64 : (0 <= x29)) (PreH65 : (x29 <= 255)) (PreH66 : (0 <= x30)) (PreH67 : (x30 <= 255)) (PreH68 : (0 <= x31)) (PreH69 : (x31 <= 255)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (18 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 18) ”
.

Definition qcp_qu_rvv_get32_safety_wit_20 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 18)) (PreH2 : (i_pre < 20)) (PreH3 : (i_pre < 24)) (PreH4 : (i_pre >= 16)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= x0)) (PreH8 : (x0 <= 255)) (PreH9 : (0 <= x1)) (PreH10 : (x1 <= 255)) (PreH11 : (0 <= x2)) (PreH12 : (x2 <= 255)) (PreH13 : (0 <= x3)) (PreH14 : (x3 <= 255)) (PreH15 : (0 <= x4)) (PreH16 : (x4 <= 255)) (PreH17 : (0 <= x5)) (PreH18 : (x5 <= 255)) (PreH19 : (0 <= x6)) (PreH20 : (x6 <= 255)) (PreH21 : (0 <= x7)) (PreH22 : (x7 <= 255)) (PreH23 : (0 <= x8)) (PreH24 : (x8 <= 255)) (PreH25 : (0 <= x9)) (PreH26 : (x9 <= 255)) (PreH27 : (0 <= x10)) (PreH28 : (x10 <= 255)) (PreH29 : (0 <= x11)) (PreH30 : (x11 <= 255)) (PreH31 : (0 <= x12)) (PreH32 : (x12 <= 255)) (PreH33 : (0 <= x13)) (PreH34 : (x13 <= 255)) (PreH35 : (0 <= x14)) (PreH36 : (x14 <= 255)) (PreH37 : (0 <= x15)) (PreH38 : (x15 <= 255)) (PreH39 : (0 <= x16)) (PreH40 : (x16 <= 255)) (PreH41 : (0 <= x17)) (PreH42 : (x17 <= 255)) (PreH43 : (0 <= x18)) (PreH44 : (x18 <= 255)) (PreH45 : (0 <= x19)) (PreH46 : (x19 <= 255)) (PreH47 : (0 <= x20)) (PreH48 : (x20 <= 255)) (PreH49 : (0 <= x21)) (PreH50 : (x21 <= 255)) (PreH51 : (0 <= x22)) (PreH52 : (x22 <= 255)) (PreH53 : (0 <= x23)) (PreH54 : (x23 <= 255)) (PreH55 : (0 <= x24)) (PreH56 : (x24 <= 255)) (PreH57 : (0 <= x25)) (PreH58 : (x25 <= 255)) (PreH59 : (0 <= x26)) (PreH60 : (x26 <= 255)) (PreH61 : (0 <= x27)) (PreH62 : (x27 <= 255)) (PreH63 : (0 <= x28)) (PreH64 : (x28 <= 255)) (PreH65 : (0 <= x29)) (PreH66 : (x29 <= 255)) (PreH67 : (0 <= x30)) (PreH68 : (x30 <= 255)) (PreH69 : (0 <= x31)) (PreH70 : (x31 <= 255)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (17 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 17) ”
.

Definition qcp_qu_rvv_get32_safety_wit_21 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 18)) (PreH2 : (i_pre < 20)) (PreH3 : (i_pre < 24)) (PreH4 : (i_pre >= 16)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= x0)) (PreH8 : (x0 <= 255)) (PreH9 : (0 <= x1)) (PreH10 : (x1 <= 255)) (PreH11 : (0 <= x2)) (PreH12 : (x2 <= 255)) (PreH13 : (0 <= x3)) (PreH14 : (x3 <= 255)) (PreH15 : (0 <= x4)) (PreH16 : (x4 <= 255)) (PreH17 : (0 <= x5)) (PreH18 : (x5 <= 255)) (PreH19 : (0 <= x6)) (PreH20 : (x6 <= 255)) (PreH21 : (0 <= x7)) (PreH22 : (x7 <= 255)) (PreH23 : (0 <= x8)) (PreH24 : (x8 <= 255)) (PreH25 : (0 <= x9)) (PreH26 : (x9 <= 255)) (PreH27 : (0 <= x10)) (PreH28 : (x10 <= 255)) (PreH29 : (0 <= x11)) (PreH30 : (x11 <= 255)) (PreH31 : (0 <= x12)) (PreH32 : (x12 <= 255)) (PreH33 : (0 <= x13)) (PreH34 : (x13 <= 255)) (PreH35 : (0 <= x14)) (PreH36 : (x14 <= 255)) (PreH37 : (0 <= x15)) (PreH38 : (x15 <= 255)) (PreH39 : (0 <= x16)) (PreH40 : (x16 <= 255)) (PreH41 : (0 <= x17)) (PreH42 : (x17 <= 255)) (PreH43 : (0 <= x18)) (PreH44 : (x18 <= 255)) (PreH45 : (0 <= x19)) (PreH46 : (x19 <= 255)) (PreH47 : (0 <= x20)) (PreH48 : (x20 <= 255)) (PreH49 : (0 <= x21)) (PreH50 : (x21 <= 255)) (PreH51 : (0 <= x22)) (PreH52 : (x22 <= 255)) (PreH53 : (0 <= x23)) (PreH54 : (x23 <= 255)) (PreH55 : (0 <= x24)) (PreH56 : (x24 <= 255)) (PreH57 : (0 <= x25)) (PreH58 : (x25 <= 255)) (PreH59 : (0 <= x26)) (PreH60 : (x26 <= 255)) (PreH61 : (0 <= x27)) (PreH62 : (x27 <= 255)) (PreH63 : (0 <= x28)) (PreH64 : (x28 <= 255)) (PreH65 : (0 <= x29)) (PreH66 : (x29 <= 255)) (PreH67 : (0 <= x30)) (PreH68 : (x30 <= 255)) (PreH69 : (0 <= x31)) (PreH70 : (x31 <= 255)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (19 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 19) ”
.

Definition qcp_qu_rvv_get32_safety_wit_22 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 20)) (PreH2 : (i_pre < 24)) (PreH3 : (i_pre >= 16)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= x0)) (PreH7 : (x0 <= 255)) (PreH8 : (0 <= x1)) (PreH9 : (x1 <= 255)) (PreH10 : (0 <= x2)) (PreH11 : (x2 <= 255)) (PreH12 : (0 <= x3)) (PreH13 : (x3 <= 255)) (PreH14 : (0 <= x4)) (PreH15 : (x4 <= 255)) (PreH16 : (0 <= x5)) (PreH17 : (x5 <= 255)) (PreH18 : (0 <= x6)) (PreH19 : (x6 <= 255)) (PreH20 : (0 <= x7)) (PreH21 : (x7 <= 255)) (PreH22 : (0 <= x8)) (PreH23 : (x8 <= 255)) (PreH24 : (0 <= x9)) (PreH25 : (x9 <= 255)) (PreH26 : (0 <= x10)) (PreH27 : (x10 <= 255)) (PreH28 : (0 <= x11)) (PreH29 : (x11 <= 255)) (PreH30 : (0 <= x12)) (PreH31 : (x12 <= 255)) (PreH32 : (0 <= x13)) (PreH33 : (x13 <= 255)) (PreH34 : (0 <= x14)) (PreH35 : (x14 <= 255)) (PreH36 : (0 <= x15)) (PreH37 : (x15 <= 255)) (PreH38 : (0 <= x16)) (PreH39 : (x16 <= 255)) (PreH40 : (0 <= x17)) (PreH41 : (x17 <= 255)) (PreH42 : (0 <= x18)) (PreH43 : (x18 <= 255)) (PreH44 : (0 <= x19)) (PreH45 : (x19 <= 255)) (PreH46 : (0 <= x20)) (PreH47 : (x20 <= 255)) (PreH48 : (0 <= x21)) (PreH49 : (x21 <= 255)) (PreH50 : (0 <= x22)) (PreH51 : (x22 <= 255)) (PreH52 : (0 <= x23)) (PreH53 : (x23 <= 255)) (PreH54 : (0 <= x24)) (PreH55 : (x24 <= 255)) (PreH56 : (0 <= x25)) (PreH57 : (x25 <= 255)) (PreH58 : (0 <= x26)) (PreH59 : (x26 <= 255)) (PreH60 : (0 <= x27)) (PreH61 : (x27 <= 255)) (PreH62 : (0 <= x28)) (PreH63 : (x28 <= 255)) (PreH64 : (0 <= x29)) (PreH65 : (x29 <= 255)) (PreH66 : (0 <= x30)) (PreH67 : (x30 <= 255)) (PreH68 : (0 <= x31)) (PreH69 : (x31 <= 255)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (22 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 22) ”
.

Definition qcp_qu_rvv_get32_safety_wit_23 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 22)) (PreH2 : (i_pre >= 20)) (PreH3 : (i_pre < 24)) (PreH4 : (i_pre >= 16)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= x0)) (PreH8 : (x0 <= 255)) (PreH9 : (0 <= x1)) (PreH10 : (x1 <= 255)) (PreH11 : (0 <= x2)) (PreH12 : (x2 <= 255)) (PreH13 : (0 <= x3)) (PreH14 : (x3 <= 255)) (PreH15 : (0 <= x4)) (PreH16 : (x4 <= 255)) (PreH17 : (0 <= x5)) (PreH18 : (x5 <= 255)) (PreH19 : (0 <= x6)) (PreH20 : (x6 <= 255)) (PreH21 : (0 <= x7)) (PreH22 : (x7 <= 255)) (PreH23 : (0 <= x8)) (PreH24 : (x8 <= 255)) (PreH25 : (0 <= x9)) (PreH26 : (x9 <= 255)) (PreH27 : (0 <= x10)) (PreH28 : (x10 <= 255)) (PreH29 : (0 <= x11)) (PreH30 : (x11 <= 255)) (PreH31 : (0 <= x12)) (PreH32 : (x12 <= 255)) (PreH33 : (0 <= x13)) (PreH34 : (x13 <= 255)) (PreH35 : (0 <= x14)) (PreH36 : (x14 <= 255)) (PreH37 : (0 <= x15)) (PreH38 : (x15 <= 255)) (PreH39 : (0 <= x16)) (PreH40 : (x16 <= 255)) (PreH41 : (0 <= x17)) (PreH42 : (x17 <= 255)) (PreH43 : (0 <= x18)) (PreH44 : (x18 <= 255)) (PreH45 : (0 <= x19)) (PreH46 : (x19 <= 255)) (PreH47 : (0 <= x20)) (PreH48 : (x20 <= 255)) (PreH49 : (0 <= x21)) (PreH50 : (x21 <= 255)) (PreH51 : (0 <= x22)) (PreH52 : (x22 <= 255)) (PreH53 : (0 <= x23)) (PreH54 : (x23 <= 255)) (PreH55 : (0 <= x24)) (PreH56 : (x24 <= 255)) (PreH57 : (0 <= x25)) (PreH58 : (x25 <= 255)) (PreH59 : (0 <= x26)) (PreH60 : (x26 <= 255)) (PreH61 : (0 <= x27)) (PreH62 : (x27 <= 255)) (PreH63 : (0 <= x28)) (PreH64 : (x28 <= 255)) (PreH65 : (0 <= x29)) (PreH66 : (x29 <= 255)) (PreH67 : (0 <= x30)) (PreH68 : (x30 <= 255)) (PreH69 : (0 <= x31)) (PreH70 : (x31 <= 255)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (21 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 21) ”
.

Definition qcp_qu_rvv_get32_safety_wit_24 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 22)) (PreH2 : (i_pre >= 20)) (PreH3 : (i_pre < 24)) (PreH4 : (i_pre >= 16)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= x0)) (PreH8 : (x0 <= 255)) (PreH9 : (0 <= x1)) (PreH10 : (x1 <= 255)) (PreH11 : (0 <= x2)) (PreH12 : (x2 <= 255)) (PreH13 : (0 <= x3)) (PreH14 : (x3 <= 255)) (PreH15 : (0 <= x4)) (PreH16 : (x4 <= 255)) (PreH17 : (0 <= x5)) (PreH18 : (x5 <= 255)) (PreH19 : (0 <= x6)) (PreH20 : (x6 <= 255)) (PreH21 : (0 <= x7)) (PreH22 : (x7 <= 255)) (PreH23 : (0 <= x8)) (PreH24 : (x8 <= 255)) (PreH25 : (0 <= x9)) (PreH26 : (x9 <= 255)) (PreH27 : (0 <= x10)) (PreH28 : (x10 <= 255)) (PreH29 : (0 <= x11)) (PreH30 : (x11 <= 255)) (PreH31 : (0 <= x12)) (PreH32 : (x12 <= 255)) (PreH33 : (0 <= x13)) (PreH34 : (x13 <= 255)) (PreH35 : (0 <= x14)) (PreH36 : (x14 <= 255)) (PreH37 : (0 <= x15)) (PreH38 : (x15 <= 255)) (PreH39 : (0 <= x16)) (PreH40 : (x16 <= 255)) (PreH41 : (0 <= x17)) (PreH42 : (x17 <= 255)) (PreH43 : (0 <= x18)) (PreH44 : (x18 <= 255)) (PreH45 : (0 <= x19)) (PreH46 : (x19 <= 255)) (PreH47 : (0 <= x20)) (PreH48 : (x20 <= 255)) (PreH49 : (0 <= x21)) (PreH50 : (x21 <= 255)) (PreH51 : (0 <= x22)) (PreH52 : (x22 <= 255)) (PreH53 : (0 <= x23)) (PreH54 : (x23 <= 255)) (PreH55 : (0 <= x24)) (PreH56 : (x24 <= 255)) (PreH57 : (0 <= x25)) (PreH58 : (x25 <= 255)) (PreH59 : (0 <= x26)) (PreH60 : (x26 <= 255)) (PreH61 : (0 <= x27)) (PreH62 : (x27 <= 255)) (PreH63 : (0 <= x28)) (PreH64 : (x28 <= 255)) (PreH65 : (0 <= x29)) (PreH66 : (x29 <= 255)) (PreH67 : (0 <= x30)) (PreH68 : (x30 <= 255)) (PreH69 : (0 <= x31)) (PreH70 : (x31 <= 255)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (23 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 23) ”
.

Definition qcp_qu_rvv_get32_safety_wit_25 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 24)) (PreH2 : (i_pre >= 16)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= x0)) (PreH6 : (x0 <= 255)) (PreH7 : (0 <= x1)) (PreH8 : (x1 <= 255)) (PreH9 : (0 <= x2)) (PreH10 : (x2 <= 255)) (PreH11 : (0 <= x3)) (PreH12 : (x3 <= 255)) (PreH13 : (0 <= x4)) (PreH14 : (x4 <= 255)) (PreH15 : (0 <= x5)) (PreH16 : (x5 <= 255)) (PreH17 : (0 <= x6)) (PreH18 : (x6 <= 255)) (PreH19 : (0 <= x7)) (PreH20 : (x7 <= 255)) (PreH21 : (0 <= x8)) (PreH22 : (x8 <= 255)) (PreH23 : (0 <= x9)) (PreH24 : (x9 <= 255)) (PreH25 : (0 <= x10)) (PreH26 : (x10 <= 255)) (PreH27 : (0 <= x11)) (PreH28 : (x11 <= 255)) (PreH29 : (0 <= x12)) (PreH30 : (x12 <= 255)) (PreH31 : (0 <= x13)) (PreH32 : (x13 <= 255)) (PreH33 : (0 <= x14)) (PreH34 : (x14 <= 255)) (PreH35 : (0 <= x15)) (PreH36 : (x15 <= 255)) (PreH37 : (0 <= x16)) (PreH38 : (x16 <= 255)) (PreH39 : (0 <= x17)) (PreH40 : (x17 <= 255)) (PreH41 : (0 <= x18)) (PreH42 : (x18 <= 255)) (PreH43 : (0 <= x19)) (PreH44 : (x19 <= 255)) (PreH45 : (0 <= x20)) (PreH46 : (x20 <= 255)) (PreH47 : (0 <= x21)) (PreH48 : (x21 <= 255)) (PreH49 : (0 <= x22)) (PreH50 : (x22 <= 255)) (PreH51 : (0 <= x23)) (PreH52 : (x23 <= 255)) (PreH53 : (0 <= x24)) (PreH54 : (x24 <= 255)) (PreH55 : (0 <= x25)) (PreH56 : (x25 <= 255)) (PreH57 : (0 <= x26)) (PreH58 : (x26 <= 255)) (PreH59 : (0 <= x27)) (PreH60 : (x27 <= 255)) (PreH61 : (0 <= x28)) (PreH62 : (x28 <= 255)) (PreH63 : (0 <= x29)) (PreH64 : (x29 <= 255)) (PreH65 : (0 <= x30)) (PreH66 : (x30 <= 255)) (PreH67 : (0 <= x31)) (PreH68 : (x31 <= 255)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (28 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 28) ”
.

Definition qcp_qu_rvv_get32_safety_wit_26 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 28)) (PreH2 : (i_pre >= 24)) (PreH3 : (i_pre >= 16)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= x0)) (PreH7 : (x0 <= 255)) (PreH8 : (0 <= x1)) (PreH9 : (x1 <= 255)) (PreH10 : (0 <= x2)) (PreH11 : (x2 <= 255)) (PreH12 : (0 <= x3)) (PreH13 : (x3 <= 255)) (PreH14 : (0 <= x4)) (PreH15 : (x4 <= 255)) (PreH16 : (0 <= x5)) (PreH17 : (x5 <= 255)) (PreH18 : (0 <= x6)) (PreH19 : (x6 <= 255)) (PreH20 : (0 <= x7)) (PreH21 : (x7 <= 255)) (PreH22 : (0 <= x8)) (PreH23 : (x8 <= 255)) (PreH24 : (0 <= x9)) (PreH25 : (x9 <= 255)) (PreH26 : (0 <= x10)) (PreH27 : (x10 <= 255)) (PreH28 : (0 <= x11)) (PreH29 : (x11 <= 255)) (PreH30 : (0 <= x12)) (PreH31 : (x12 <= 255)) (PreH32 : (0 <= x13)) (PreH33 : (x13 <= 255)) (PreH34 : (0 <= x14)) (PreH35 : (x14 <= 255)) (PreH36 : (0 <= x15)) (PreH37 : (x15 <= 255)) (PreH38 : (0 <= x16)) (PreH39 : (x16 <= 255)) (PreH40 : (0 <= x17)) (PreH41 : (x17 <= 255)) (PreH42 : (0 <= x18)) (PreH43 : (x18 <= 255)) (PreH44 : (0 <= x19)) (PreH45 : (x19 <= 255)) (PreH46 : (0 <= x20)) (PreH47 : (x20 <= 255)) (PreH48 : (0 <= x21)) (PreH49 : (x21 <= 255)) (PreH50 : (0 <= x22)) (PreH51 : (x22 <= 255)) (PreH52 : (0 <= x23)) (PreH53 : (x23 <= 255)) (PreH54 : (0 <= x24)) (PreH55 : (x24 <= 255)) (PreH56 : (0 <= x25)) (PreH57 : (x25 <= 255)) (PreH58 : (0 <= x26)) (PreH59 : (x26 <= 255)) (PreH60 : (0 <= x27)) (PreH61 : (x27 <= 255)) (PreH62 : (0 <= x28)) (PreH63 : (x28 <= 255)) (PreH64 : (0 <= x29)) (PreH65 : (x29 <= 255)) (PreH66 : (0 <= x30)) (PreH67 : (x30 <= 255)) (PreH68 : (0 <= x31)) (PreH69 : (x31 <= 255)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (26 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 26) ”
.

Definition qcp_qu_rvv_get32_safety_wit_27 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 26)) (PreH2 : (i_pre < 28)) (PreH3 : (i_pre >= 24)) (PreH4 : (i_pre >= 16)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= x0)) (PreH8 : (x0 <= 255)) (PreH9 : (0 <= x1)) (PreH10 : (x1 <= 255)) (PreH11 : (0 <= x2)) (PreH12 : (x2 <= 255)) (PreH13 : (0 <= x3)) (PreH14 : (x3 <= 255)) (PreH15 : (0 <= x4)) (PreH16 : (x4 <= 255)) (PreH17 : (0 <= x5)) (PreH18 : (x5 <= 255)) (PreH19 : (0 <= x6)) (PreH20 : (x6 <= 255)) (PreH21 : (0 <= x7)) (PreH22 : (x7 <= 255)) (PreH23 : (0 <= x8)) (PreH24 : (x8 <= 255)) (PreH25 : (0 <= x9)) (PreH26 : (x9 <= 255)) (PreH27 : (0 <= x10)) (PreH28 : (x10 <= 255)) (PreH29 : (0 <= x11)) (PreH30 : (x11 <= 255)) (PreH31 : (0 <= x12)) (PreH32 : (x12 <= 255)) (PreH33 : (0 <= x13)) (PreH34 : (x13 <= 255)) (PreH35 : (0 <= x14)) (PreH36 : (x14 <= 255)) (PreH37 : (0 <= x15)) (PreH38 : (x15 <= 255)) (PreH39 : (0 <= x16)) (PreH40 : (x16 <= 255)) (PreH41 : (0 <= x17)) (PreH42 : (x17 <= 255)) (PreH43 : (0 <= x18)) (PreH44 : (x18 <= 255)) (PreH45 : (0 <= x19)) (PreH46 : (x19 <= 255)) (PreH47 : (0 <= x20)) (PreH48 : (x20 <= 255)) (PreH49 : (0 <= x21)) (PreH50 : (x21 <= 255)) (PreH51 : (0 <= x22)) (PreH52 : (x22 <= 255)) (PreH53 : (0 <= x23)) (PreH54 : (x23 <= 255)) (PreH55 : (0 <= x24)) (PreH56 : (x24 <= 255)) (PreH57 : (0 <= x25)) (PreH58 : (x25 <= 255)) (PreH59 : (0 <= x26)) (PreH60 : (x26 <= 255)) (PreH61 : (0 <= x27)) (PreH62 : (x27 <= 255)) (PreH63 : (0 <= x28)) (PreH64 : (x28 <= 255)) (PreH65 : (0 <= x29)) (PreH66 : (x29 <= 255)) (PreH67 : (0 <= x30)) (PreH68 : (x30 <= 255)) (PreH69 : (0 <= x31)) (PreH70 : (x31 <= 255)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (25 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 25) ”
.

Definition qcp_qu_rvv_get32_safety_wit_28 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 26)) (PreH2 : (i_pre < 28)) (PreH3 : (i_pre >= 24)) (PreH4 : (i_pre >= 16)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= x0)) (PreH8 : (x0 <= 255)) (PreH9 : (0 <= x1)) (PreH10 : (x1 <= 255)) (PreH11 : (0 <= x2)) (PreH12 : (x2 <= 255)) (PreH13 : (0 <= x3)) (PreH14 : (x3 <= 255)) (PreH15 : (0 <= x4)) (PreH16 : (x4 <= 255)) (PreH17 : (0 <= x5)) (PreH18 : (x5 <= 255)) (PreH19 : (0 <= x6)) (PreH20 : (x6 <= 255)) (PreH21 : (0 <= x7)) (PreH22 : (x7 <= 255)) (PreH23 : (0 <= x8)) (PreH24 : (x8 <= 255)) (PreH25 : (0 <= x9)) (PreH26 : (x9 <= 255)) (PreH27 : (0 <= x10)) (PreH28 : (x10 <= 255)) (PreH29 : (0 <= x11)) (PreH30 : (x11 <= 255)) (PreH31 : (0 <= x12)) (PreH32 : (x12 <= 255)) (PreH33 : (0 <= x13)) (PreH34 : (x13 <= 255)) (PreH35 : (0 <= x14)) (PreH36 : (x14 <= 255)) (PreH37 : (0 <= x15)) (PreH38 : (x15 <= 255)) (PreH39 : (0 <= x16)) (PreH40 : (x16 <= 255)) (PreH41 : (0 <= x17)) (PreH42 : (x17 <= 255)) (PreH43 : (0 <= x18)) (PreH44 : (x18 <= 255)) (PreH45 : (0 <= x19)) (PreH46 : (x19 <= 255)) (PreH47 : (0 <= x20)) (PreH48 : (x20 <= 255)) (PreH49 : (0 <= x21)) (PreH50 : (x21 <= 255)) (PreH51 : (0 <= x22)) (PreH52 : (x22 <= 255)) (PreH53 : (0 <= x23)) (PreH54 : (x23 <= 255)) (PreH55 : (0 <= x24)) (PreH56 : (x24 <= 255)) (PreH57 : (0 <= x25)) (PreH58 : (x25 <= 255)) (PreH59 : (0 <= x26)) (PreH60 : (x26 <= 255)) (PreH61 : (0 <= x27)) (PreH62 : (x27 <= 255)) (PreH63 : (0 <= x28)) (PreH64 : (x28 <= 255)) (PreH65 : (0 <= x29)) (PreH66 : (x29 <= 255)) (PreH67 : (0 <= x30)) (PreH68 : (x30 <= 255)) (PreH69 : (0 <= x31)) (PreH70 : (x31 <= 255)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (27 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 27) ”
.

Definition qcp_qu_rvv_get32_safety_wit_29 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 28)) (PreH2 : (i_pre >= 24)) (PreH3 : (i_pre >= 16)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= x0)) (PreH7 : (x0 <= 255)) (PreH8 : (0 <= x1)) (PreH9 : (x1 <= 255)) (PreH10 : (0 <= x2)) (PreH11 : (x2 <= 255)) (PreH12 : (0 <= x3)) (PreH13 : (x3 <= 255)) (PreH14 : (0 <= x4)) (PreH15 : (x4 <= 255)) (PreH16 : (0 <= x5)) (PreH17 : (x5 <= 255)) (PreH18 : (0 <= x6)) (PreH19 : (x6 <= 255)) (PreH20 : (0 <= x7)) (PreH21 : (x7 <= 255)) (PreH22 : (0 <= x8)) (PreH23 : (x8 <= 255)) (PreH24 : (0 <= x9)) (PreH25 : (x9 <= 255)) (PreH26 : (0 <= x10)) (PreH27 : (x10 <= 255)) (PreH28 : (0 <= x11)) (PreH29 : (x11 <= 255)) (PreH30 : (0 <= x12)) (PreH31 : (x12 <= 255)) (PreH32 : (0 <= x13)) (PreH33 : (x13 <= 255)) (PreH34 : (0 <= x14)) (PreH35 : (x14 <= 255)) (PreH36 : (0 <= x15)) (PreH37 : (x15 <= 255)) (PreH38 : (0 <= x16)) (PreH39 : (x16 <= 255)) (PreH40 : (0 <= x17)) (PreH41 : (x17 <= 255)) (PreH42 : (0 <= x18)) (PreH43 : (x18 <= 255)) (PreH44 : (0 <= x19)) (PreH45 : (x19 <= 255)) (PreH46 : (0 <= x20)) (PreH47 : (x20 <= 255)) (PreH48 : (0 <= x21)) (PreH49 : (x21 <= 255)) (PreH50 : (0 <= x22)) (PreH51 : (x22 <= 255)) (PreH52 : (0 <= x23)) (PreH53 : (x23 <= 255)) (PreH54 : (0 <= x24)) (PreH55 : (x24 <= 255)) (PreH56 : (0 <= x25)) (PreH57 : (x25 <= 255)) (PreH58 : (0 <= x26)) (PreH59 : (x26 <= 255)) (PreH60 : (0 <= x27)) (PreH61 : (x27 <= 255)) (PreH62 : (0 <= x28)) (PreH63 : (x28 <= 255)) (PreH64 : (0 <= x29)) (PreH65 : (x29 <= 255)) (PreH66 : (0 <= x30)) (PreH67 : (x30 <= 255)) (PreH68 : (0 <= x31)) (PreH69 : (x31 <= 255)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (30 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 30) ”
.

Definition qcp_qu_rvv_get32_safety_wit_30 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 30)) (PreH2 : (i_pre >= 28)) (PreH3 : (i_pre >= 24)) (PreH4 : (i_pre >= 16)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= x0)) (PreH8 : (x0 <= 255)) (PreH9 : (0 <= x1)) (PreH10 : (x1 <= 255)) (PreH11 : (0 <= x2)) (PreH12 : (x2 <= 255)) (PreH13 : (0 <= x3)) (PreH14 : (x3 <= 255)) (PreH15 : (0 <= x4)) (PreH16 : (x4 <= 255)) (PreH17 : (0 <= x5)) (PreH18 : (x5 <= 255)) (PreH19 : (0 <= x6)) (PreH20 : (x6 <= 255)) (PreH21 : (0 <= x7)) (PreH22 : (x7 <= 255)) (PreH23 : (0 <= x8)) (PreH24 : (x8 <= 255)) (PreH25 : (0 <= x9)) (PreH26 : (x9 <= 255)) (PreH27 : (0 <= x10)) (PreH28 : (x10 <= 255)) (PreH29 : (0 <= x11)) (PreH30 : (x11 <= 255)) (PreH31 : (0 <= x12)) (PreH32 : (x12 <= 255)) (PreH33 : (0 <= x13)) (PreH34 : (x13 <= 255)) (PreH35 : (0 <= x14)) (PreH36 : (x14 <= 255)) (PreH37 : (0 <= x15)) (PreH38 : (x15 <= 255)) (PreH39 : (0 <= x16)) (PreH40 : (x16 <= 255)) (PreH41 : (0 <= x17)) (PreH42 : (x17 <= 255)) (PreH43 : (0 <= x18)) (PreH44 : (x18 <= 255)) (PreH45 : (0 <= x19)) (PreH46 : (x19 <= 255)) (PreH47 : (0 <= x20)) (PreH48 : (x20 <= 255)) (PreH49 : (0 <= x21)) (PreH50 : (x21 <= 255)) (PreH51 : (0 <= x22)) (PreH52 : (x22 <= 255)) (PreH53 : (0 <= x23)) (PreH54 : (x23 <= 255)) (PreH55 : (0 <= x24)) (PreH56 : (x24 <= 255)) (PreH57 : (0 <= x25)) (PreH58 : (x25 <= 255)) (PreH59 : (0 <= x26)) (PreH60 : (x26 <= 255)) (PreH61 : (0 <= x27)) (PreH62 : (x27 <= 255)) (PreH63 : (0 <= x28)) (PreH64 : (x28 <= 255)) (PreH65 : (0 <= x29)) (PreH66 : (x29 <= 255)) (PreH67 : (0 <= x30)) (PreH68 : (x30 <= 255)) (PreH69 : (0 <= x31)) (PreH70 : (x31 <= 255)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (29 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 29) ”
.

Definition qcp_qu_rvv_get32_safety_wit_31 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 30)) (PreH2 : (i_pre >= 28)) (PreH3 : (i_pre >= 24)) (PreH4 : (i_pre >= 16)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : (0 <= x0)) (PreH8 : (x0 <= 255)) (PreH9 : (0 <= x1)) (PreH10 : (x1 <= 255)) (PreH11 : (0 <= x2)) (PreH12 : (x2 <= 255)) (PreH13 : (0 <= x3)) (PreH14 : (x3 <= 255)) (PreH15 : (0 <= x4)) (PreH16 : (x4 <= 255)) (PreH17 : (0 <= x5)) (PreH18 : (x5 <= 255)) (PreH19 : (0 <= x6)) (PreH20 : (x6 <= 255)) (PreH21 : (0 <= x7)) (PreH22 : (x7 <= 255)) (PreH23 : (0 <= x8)) (PreH24 : (x8 <= 255)) (PreH25 : (0 <= x9)) (PreH26 : (x9 <= 255)) (PreH27 : (0 <= x10)) (PreH28 : (x10 <= 255)) (PreH29 : (0 <= x11)) (PreH30 : (x11 <= 255)) (PreH31 : (0 <= x12)) (PreH32 : (x12 <= 255)) (PreH33 : (0 <= x13)) (PreH34 : (x13 <= 255)) (PreH35 : (0 <= x14)) (PreH36 : (x14 <= 255)) (PreH37 : (0 <= x15)) (PreH38 : (x15 <= 255)) (PreH39 : (0 <= x16)) (PreH40 : (x16 <= 255)) (PreH41 : (0 <= x17)) (PreH42 : (x17 <= 255)) (PreH43 : (0 <= x18)) (PreH44 : (x18 <= 255)) (PreH45 : (0 <= x19)) (PreH46 : (x19 <= 255)) (PreH47 : (0 <= x20)) (PreH48 : (x20 <= 255)) (PreH49 : (0 <= x21)) (PreH50 : (x21 <= 255)) (PreH51 : (0 <= x22)) (PreH52 : (x22 <= 255)) (PreH53 : (0 <= x23)) (PreH54 : (x23 <= 255)) (PreH55 : (0 <= x24)) (PreH56 : (x24 <= 255)) (PreH57 : (0 <= x25)) (PreH58 : (x25 <= 255)) (PreH59 : (0 <= x26)) (PreH60 : (x26 <= 255)) (PreH61 : (0 <= x27)) (PreH62 : (x27 <= 255)) (PreH63 : (0 <= x28)) (PreH64 : (x28 <= 255)) (PreH65 : (0 <= x29)) (PreH66 : (x29 <= 255)) (PreH67 : (0 <= x30)) (PreH68 : (x30 <= 255)) (PreH69 : (0 <= x31)) (PreH70 : (x31 <= 255)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (31 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 31) ”
.

Definition qcp_qu_rvv_get32_return_wit_1 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 31)) (PreH2 : (i_pre >= 30)) (PreH3 : (i_pre >= 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (x31 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ (0 <= x31) ” 
  &&  “ (x31 <= 255) ”
  &&  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 31)) (PreH2 : (i_pre >= 30)) (PreH3 : (i_pre >= 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  TT && emp 
|--
  “ (x31 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qu_rvv_get32_return_wit_1_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 31)) (PreH2 : (i_pre >= 30)) (PreH3 : (i_pre >= 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  (x31 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qu_rvv_get32_return_wit_2 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 31)) (PreH2 : (i_pre >= 30)) (PreH3 : (i_pre >= 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (x30 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ (0 <= x30) ” 
  &&  “ (x30 <= 255) ”
  &&  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 31)) (PreH2 : (i_pre >= 30)) (PreH3 : (i_pre >= 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  TT && emp 
|--
  “ (x30 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qu_rvv_get32_return_wit_2_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 31)) (PreH2 : (i_pre >= 30)) (PreH3 : (i_pre >= 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  (x30 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qu_rvv_get32_return_wit_3 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 29)) (PreH2 : (i_pre < 30)) (PreH3 : (i_pre >= 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (x29 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ (0 <= x29) ” 
  &&  “ (x29 <= 255) ”
  &&  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 29)) (PreH2 : (i_pre < 30)) (PreH3 : (i_pre >= 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  TT && emp 
|--
  “ (x29 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qu_rvv_get32_return_wit_3_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 29)) (PreH2 : (i_pre < 30)) (PreH3 : (i_pre >= 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  (x29 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qu_rvv_get32_return_wit_4 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 29)) (PreH2 : (i_pre < 30)) (PreH3 : (i_pre >= 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (x28 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ (0 <= x28) ” 
  &&  “ (x28 <= 255) ”
  &&  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 29)) (PreH2 : (i_pre < 30)) (PreH3 : (i_pre >= 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  TT && emp 
|--
  “ (x28 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qu_rvv_get32_return_wit_4_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 29)) (PreH2 : (i_pre < 30)) (PreH3 : (i_pre >= 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  (x28 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qu_rvv_get32_return_wit_5 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 27)) (PreH2 : (i_pre >= 26)) (PreH3 : (i_pre < 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (x27 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ (0 <= x27) ” 
  &&  “ (x27 <= 255) ”
  &&  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 27)) (PreH2 : (i_pre >= 26)) (PreH3 : (i_pre < 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  TT && emp 
|--
  “ (x27 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qu_rvv_get32_return_wit_5_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 27)) (PreH2 : (i_pre >= 26)) (PreH3 : (i_pre < 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  (x27 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qu_rvv_get32_return_wit_6 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 27)) (PreH2 : (i_pre >= 26)) (PreH3 : (i_pre < 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (x26 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ (0 <= x26) ” 
  &&  “ (x26 <= 255) ”
  &&  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 27)) (PreH2 : (i_pre >= 26)) (PreH3 : (i_pre < 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  TT && emp 
|--
  “ (x26 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qu_rvv_get32_return_wit_6_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 27)) (PreH2 : (i_pre >= 26)) (PreH3 : (i_pre < 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  (x26 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qu_rvv_get32_return_wit_7 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 25)) (PreH2 : (i_pre < 26)) (PreH3 : (i_pre < 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (x25 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ (0 <= x25) ” 
  &&  “ (x25 <= 255) ”
  &&  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 25)) (PreH2 : (i_pre < 26)) (PreH3 : (i_pre < 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  TT && emp 
|--
  “ (x25 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qu_rvv_get32_return_wit_7_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 25)) (PreH2 : (i_pre < 26)) (PreH3 : (i_pre < 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  (x25 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qu_rvv_get32_return_wit_8 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 25)) (PreH2 : (i_pre < 26)) (PreH3 : (i_pre < 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (x24 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ (0 <= x24) ” 
  &&  “ (x24 <= 255) ”
  &&  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 25)) (PreH2 : (i_pre < 26)) (PreH3 : (i_pre < 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  TT && emp 
|--
  “ (x24 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qu_rvv_get32_return_wit_8_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 25)) (PreH2 : (i_pre < 26)) (PreH3 : (i_pre < 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  (x24 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qu_rvv_get32_return_wit_9 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 23)) (PreH2 : (i_pre >= 22)) (PreH3 : (i_pre >= 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (x23 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ (0 <= x23) ” 
  &&  “ (x23 <= 255) ”
  &&  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 23)) (PreH2 : (i_pre >= 22)) (PreH3 : (i_pre >= 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  TT && emp 
|--
  “ (x23 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qu_rvv_get32_return_wit_9_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 23)) (PreH2 : (i_pre >= 22)) (PreH3 : (i_pre >= 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  (x23 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qu_rvv_get32_return_wit_10 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 23)) (PreH2 : (i_pre >= 22)) (PreH3 : (i_pre >= 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (x22 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ (0 <= x22) ” 
  &&  “ (x22 <= 255) ”
  &&  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 23)) (PreH2 : (i_pre >= 22)) (PreH3 : (i_pre >= 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  TT && emp 
|--
  “ (x22 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qu_rvv_get32_return_wit_10_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 23)) (PreH2 : (i_pre >= 22)) (PreH3 : (i_pre >= 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  (x22 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qu_rvv_get32_return_wit_11 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 21)) (PreH2 : (i_pre < 22)) (PreH3 : (i_pre >= 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (x21 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ (0 <= x21) ” 
  &&  “ (x21 <= 255) ”
  &&  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 21)) (PreH2 : (i_pre < 22)) (PreH3 : (i_pre >= 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  TT && emp 
|--
  “ (x21 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qu_rvv_get32_return_wit_11_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 21)) (PreH2 : (i_pre < 22)) (PreH3 : (i_pre >= 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  (x21 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qu_rvv_get32_return_wit_12 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 21)) (PreH2 : (i_pre < 22)) (PreH3 : (i_pre >= 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (x20 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ (0 <= x20) ” 
  &&  “ (x20 <= 255) ”
  &&  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 21)) (PreH2 : (i_pre < 22)) (PreH3 : (i_pre >= 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  TT && emp 
|--
  “ (x20 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qu_rvv_get32_return_wit_12_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 21)) (PreH2 : (i_pre < 22)) (PreH3 : (i_pre >= 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  (x20 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qu_rvv_get32_return_wit_13 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 19)) (PreH2 : (i_pre >= 18)) (PreH3 : (i_pre < 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (x19 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ (0 <= x19) ” 
  &&  “ (x19 <= 255) ”
  &&  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 19)) (PreH2 : (i_pre >= 18)) (PreH3 : (i_pre < 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  TT && emp 
|--
  “ (x19 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qu_rvv_get32_return_wit_13_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 19)) (PreH2 : (i_pre >= 18)) (PreH3 : (i_pre < 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  (x19 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qu_rvv_get32_return_wit_14 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 19)) (PreH2 : (i_pre >= 18)) (PreH3 : (i_pre < 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (x18 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ (0 <= x18) ” 
  &&  “ (x18 <= 255) ”
  &&  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 19)) (PreH2 : (i_pre >= 18)) (PreH3 : (i_pre < 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  TT && emp 
|--
  “ (x18 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qu_rvv_get32_return_wit_14_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 19)) (PreH2 : (i_pre >= 18)) (PreH3 : (i_pre < 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  (x18 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qu_rvv_get32_return_wit_15 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 17)) (PreH2 : (i_pre < 18)) (PreH3 : (i_pre < 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (x17 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ (0 <= x17) ” 
  &&  “ (x17 <= 255) ”
  &&  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 17)) (PreH2 : (i_pre < 18)) (PreH3 : (i_pre < 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  TT && emp 
|--
  “ (x17 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qu_rvv_get32_return_wit_15_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 17)) (PreH2 : (i_pre < 18)) (PreH3 : (i_pre < 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  (x17 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qu_rvv_get32_return_wit_16 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 17)) (PreH2 : (i_pre < 18)) (PreH3 : (i_pre < 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (x16 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ (0 <= x16) ” 
  &&  “ (x16 <= 255) ”
  &&  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 17)) (PreH2 : (i_pre < 18)) (PreH3 : (i_pre < 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  TT && emp 
|--
  “ (x16 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qu_rvv_get32_return_wit_16_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 17)) (PreH2 : (i_pre < 18)) (PreH3 : (i_pre < 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  (x16 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qu_rvv_get32_return_wit_17 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 15)) (PreH2 : (i_pre >= 14)) (PreH3 : (i_pre >= 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (x15 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ (0 <= x15) ” 
  &&  “ (x15 <= 255) ”
  &&  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 15)) (PreH2 : (i_pre >= 14)) (PreH3 : (i_pre >= 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  TT && emp 
|--
  “ (x15 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qu_rvv_get32_return_wit_17_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 15)) (PreH2 : (i_pre >= 14)) (PreH3 : (i_pre >= 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  (x15 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qu_rvv_get32_return_wit_18 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 15)) (PreH2 : (i_pre >= 14)) (PreH3 : (i_pre >= 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (x14 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ (0 <= x14) ” 
  &&  “ (x14 <= 255) ”
  &&  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 15)) (PreH2 : (i_pre >= 14)) (PreH3 : (i_pre >= 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  TT && emp 
|--
  “ (x14 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qu_rvv_get32_return_wit_18_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 15)) (PreH2 : (i_pre >= 14)) (PreH3 : (i_pre >= 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  (x14 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qu_rvv_get32_return_wit_19 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 13)) (PreH2 : (i_pre < 14)) (PreH3 : (i_pre >= 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (x13 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ (0 <= x13) ” 
  &&  “ (x13 <= 255) ”
  &&  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 13)) (PreH2 : (i_pre < 14)) (PreH3 : (i_pre >= 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  TT && emp 
|--
  “ (x13 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qu_rvv_get32_return_wit_19_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 13)) (PreH2 : (i_pre < 14)) (PreH3 : (i_pre >= 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  (x13 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qu_rvv_get32_return_wit_20 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 13)) (PreH2 : (i_pre < 14)) (PreH3 : (i_pre >= 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (x12 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ (0 <= x12) ” 
  &&  “ (x12 <= 255) ”
  &&  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 13)) (PreH2 : (i_pre < 14)) (PreH3 : (i_pre >= 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  TT && emp 
|--
  “ (x12 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qu_rvv_get32_return_wit_20_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 13)) (PreH2 : (i_pre < 14)) (PreH3 : (i_pre >= 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  (x12 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qu_rvv_get32_return_wit_21 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 11)) (PreH2 : (i_pre >= 10)) (PreH3 : (i_pre < 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (x11 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ (0 <= x11) ” 
  &&  “ (x11 <= 255) ”
  &&  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 11)) (PreH2 : (i_pre >= 10)) (PreH3 : (i_pre < 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  TT && emp 
|--
  “ (x11 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qu_rvv_get32_return_wit_21_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 11)) (PreH2 : (i_pre >= 10)) (PreH3 : (i_pre < 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  (x11 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qu_rvv_get32_return_wit_22 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 11)) (PreH2 : (i_pre >= 10)) (PreH3 : (i_pre < 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (x10 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ (0 <= x10) ” 
  &&  “ (x10 <= 255) ”
  &&  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 11)) (PreH2 : (i_pre >= 10)) (PreH3 : (i_pre < 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  TT && emp 
|--
  “ (x10 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qu_rvv_get32_return_wit_22_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 11)) (PreH2 : (i_pre >= 10)) (PreH3 : (i_pre < 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  (x10 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qu_rvv_get32_return_wit_23 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 9)) (PreH2 : (i_pre < 10)) (PreH3 : (i_pre < 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (x9 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ (0 <= x9) ” 
  &&  “ (x9 <= 255) ”
  &&  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 9)) (PreH2 : (i_pre < 10)) (PreH3 : (i_pre < 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  TT && emp 
|--
  “ (x9 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qu_rvv_get32_return_wit_23_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 9)) (PreH2 : (i_pre < 10)) (PreH3 : (i_pre < 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  (x9 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qu_rvv_get32_return_wit_24 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 9)) (PreH2 : (i_pre < 10)) (PreH3 : (i_pre < 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (x8 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ (0 <= x8) ” 
  &&  “ (x8 <= 255) ”
  &&  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 9)) (PreH2 : (i_pre < 10)) (PreH3 : (i_pre < 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  TT && emp 
|--
  “ (x8 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qu_rvv_get32_return_wit_24_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 9)) (PreH2 : (i_pre < 10)) (PreH3 : (i_pre < 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  (x8 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qu_rvv_get32_return_wit_25 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 7)) (PreH2 : (i_pre >= 6)) (PreH3 : (i_pre >= 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (x7 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ (0 <= x7) ” 
  &&  “ (x7 <= 255) ”
  &&  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 7)) (PreH2 : (i_pre >= 6)) (PreH3 : (i_pre >= 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  TT && emp 
|--
  “ (x7 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qu_rvv_get32_return_wit_25_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 7)) (PreH2 : (i_pre >= 6)) (PreH3 : (i_pre >= 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  (x7 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qu_rvv_get32_return_wit_26 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 7)) (PreH2 : (i_pre >= 6)) (PreH3 : (i_pre >= 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (x6 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ (0 <= x6) ” 
  &&  “ (x6 <= 255) ”
  &&  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 7)) (PreH2 : (i_pre >= 6)) (PreH3 : (i_pre >= 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  TT && emp 
|--
  “ (x6 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qu_rvv_get32_return_wit_26_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 7)) (PreH2 : (i_pre >= 6)) (PreH3 : (i_pre >= 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  (x6 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qu_rvv_get32_return_wit_27 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 5)) (PreH2 : (i_pre < 6)) (PreH3 : (i_pre >= 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (x5 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ (0 <= x5) ” 
  &&  “ (x5 <= 255) ”
  &&  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 5)) (PreH2 : (i_pre < 6)) (PreH3 : (i_pre >= 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  TT && emp 
|--
  “ (x5 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qu_rvv_get32_return_wit_27_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 5)) (PreH2 : (i_pre < 6)) (PreH3 : (i_pre >= 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  (x5 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qu_rvv_get32_return_wit_28 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 5)) (PreH2 : (i_pre < 6)) (PreH3 : (i_pre >= 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (x4 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ (0 <= x4) ” 
  &&  “ (x4 <= 255) ”
  &&  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 5)) (PreH2 : (i_pre < 6)) (PreH3 : (i_pre >= 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  TT && emp 
|--
  “ (x4 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qu_rvv_get32_return_wit_28_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 5)) (PreH2 : (i_pre < 6)) (PreH3 : (i_pre >= 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  (x4 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qu_rvv_get32_return_wit_29 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 3)) (PreH2 : (i_pre >= 2)) (PreH3 : (i_pre < 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (x3 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ (0 <= x3) ” 
  &&  “ (x3 <= 255) ”
  &&  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 3)) (PreH2 : (i_pre >= 2)) (PreH3 : (i_pre < 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  TT && emp 
|--
  “ (x3 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qu_rvv_get32_return_wit_29_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 3)) (PreH2 : (i_pre >= 2)) (PreH3 : (i_pre < 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  (x3 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qu_rvv_get32_return_wit_30 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 3)) (PreH2 : (i_pre >= 2)) (PreH3 : (i_pre < 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (x2 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ (0 <= x2) ” 
  &&  “ (x2 <= 255) ”
  &&  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 3)) (PreH2 : (i_pre >= 2)) (PreH3 : (i_pre < 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  TT && emp 
|--
  “ (x2 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qu_rvv_get32_return_wit_30_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 3)) (PreH2 : (i_pre >= 2)) (PreH3 : (i_pre < 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  (x2 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qu_rvv_get32_return_wit_31 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 1)) (PreH2 : (i_pre < 2)) (PreH3 : (i_pre < 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (x1 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ (0 <= x1) ” 
  &&  “ (x1 <= 255) ”
  &&  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 1)) (PreH2 : (i_pre < 2)) (PreH3 : (i_pre < 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  TT && emp 
|--
  “ (x1 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qu_rvv_get32_return_wit_31_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 1)) (PreH2 : (i_pre < 2)) (PreH3 : (i_pre < 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  (x1 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qu_rvv_get32_return_wit_32 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 1)) (PreH2 : (i_pre < 2)) (PreH3 : (i_pre < 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (x0 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ (0 <= x0) ” 
  &&  “ (x0 <= 255) ”
  &&  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 1)) (PreH2 : (i_pre < 2)) (PreH3 : (i_pre < 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  TT && emp 
|--
  “ (x0 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qu_rvv_get32_return_wit_32_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 1)) (PreH2 : (i_pre < 2)) (PreH3 : (i_pre < 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  (x0 = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

(*----- Function qcp_u8_rvv_store_next -----*)

Definition qcp_u8_rvv_store_next_return_wit_1 := 
(
forall (value_pre: Z) (i_pre: Z) (vl_pre: Z) (p_pre: Z) (P: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < vl_pre)) (PreH3 : (vl_pre <= 32)) (PreH4 : (0 <= value_pre)) (PreH5 : (value_pre <= 255)) ,
  (UCharArray.seg p_pre 0 (i_pre + 1 ) (app (P) ((cons (value_pre) ((@nil Z))))) )
  **  (UCharArray.undef_seg p_pre (i_pre + 1 ) vl_pre )
|--
  (UCharArray.seg p_pre 0 (i_pre + 1 ) (u8_rvv_snoc (P) (value_pre)) )
  **  (UCharArray.undef_seg p_pre (i_pre + 1 ) vl_pre )
) \/
(
forall (value_pre: Z) (i_pre: Z) (vl_pre: Z) (P: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < vl_pre)) (PreH3 : (vl_pre <= 32)) (PreH4 : (0 <= value_pre)) (PreH5 : (value_pre <= 255)) ,
  TT && emp 
|--
  “ ((app (P) ((cons (value_pre) ((@nil Z))))) = (u8_rvv_snoc (P) (value_pre))) ”
  &&  emp
).

Definition qcp_u8_rvv_store_next_return_wit_1_split_goal_1 := 
forall (value_pre: Z) (i_pre: Z) (vl_pre: Z) (P: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < vl_pre)) (PreH3 : (vl_pre <= 32)) (PreH4 : (0 <= value_pre)) (PreH5 : (value_pre <= 255)) ,
  ((app (P) ((cons (value_pre) ((@nil Z))))) = (u8_rvv_snoc (P) (value_pre)))
.

Definition qcp_u8_rvv_store_next_partial_solve_wit_1 := 
forall (value_pre: Z) (i_pre: Z) (vl_pre: Z) (p_pre: Z) (P: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < vl_pre)) (PreH3 : (vl_pre <= 32)) (PreH4 : (0 <= value_pre)) (PreH5 : (value_pre <= 255)) ,
  (UCharArray.seg p_pre 0 i_pre P )
  **  (UCharArray.undef_seg p_pre i_pre vl_pre )
|--
  “ (0 <= i_pre) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= value_pre) ” 
  &&  “ (value_pre <= 255) ”
  &&  (((p_pre + (i_pre * sizeof(UCHAR)))) # UChar  |->_)
  **  (UCharArray.undef_seg p_pre (i_pre + 1 ) vl_pre )
  **  (UCharArray.seg p_pre 0 i_pre P )
.

(*----- Function qcp_qu_rvv_store32 -----*)

Definition qcp_qu_rvv_store32_safety_wit_1 := 
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (0 <= x0)) (PreH4 : (x0 <= 255)) (PreH5 : (0 <= x1)) (PreH6 : (x1 <= 255)) (PreH7 : (0 <= x2)) (PreH8 : (x2 <= 255)) (PreH9 : (0 <= x3)) (PreH10 : (x3 <= 255)) (PreH11 : (0 <= x4)) (PreH12 : (x4 <= 255)) (PreH13 : (0 <= x5)) (PreH14 : (x5 <= 255)) (PreH15 : (0 <= x6)) (PreH16 : (x6 <= 255)) (PreH17 : (0 <= x7)) (PreH18 : (x7 <= 255)) (PreH19 : (0 <= x8)) (PreH20 : (x8 <= 255)) (PreH21 : (0 <= x9)) (PreH22 : (x9 <= 255)) (PreH23 : (0 <= x10)) (PreH24 : (x10 <= 255)) (PreH25 : (0 <= x11)) (PreH26 : (x11 <= 255)) (PreH27 : (0 <= x12)) (PreH28 : (x12 <= 255)) (PreH29 : (0 <= x13)) (PreH30 : (x13 <= 255)) (PreH31 : (0 <= x14)) (PreH32 : (x14 <= 255)) (PreH33 : (0 <= x15)) (PreH34 : (x15 <= 255)) (PreH35 : (0 <= x16)) (PreH36 : (x16 <= 255)) (PreH37 : (0 <= x17)) (PreH38 : (x17 <= 255)) (PreH39 : (0 <= x18)) (PreH40 : (x18 <= 255)) (PreH41 : (0 <= x19)) (PreH42 : (x19 <= 255)) (PreH43 : (0 <= x20)) (PreH44 : (x20 <= 255)) (PreH45 : (0 <= x21)) (PreH46 : (x21 <= 255)) (PreH47 : (0 <= x22)) (PreH48 : (x22 <= 255)) (PreH49 : (0 <= x23)) (PreH50 : (x23 <= 255)) (PreH51 : (0 <= x24)) (PreH52 : (x24 <= 255)) (PreH53 : (0 <= x25)) (PreH54 : (x25 <= 255)) (PreH55 : (0 <= x26)) (PreH56 : (x26 <= 255)) (PreH57 : (0 <= x27)) (PreH58 : (x27 <= 255)) (PreH59 : (0 <= x28)) (PreH60 : (x28 <= 255)) (PreH61 : (0 <= x29)) (PreH62 : (x29 <= 255)) (PreH63 : (0 <= x30)) (PreH64 : (x30 <= 255)) (PreH65 : (0 <= x31)) (PreH66 : (x31 <= 255)) ,
  ((( &( "i" ) )) # UInt64  |->_)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
  **  (UCharArray.undef_seg p_pre 0 vl_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_qu_rvv_store32_entail_wit_1 := 
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (0 <= x0)) (PreH4 : (x0 <= 255)) (PreH5 : (0 <= x1)) (PreH6 : (x1 <= 255)) (PreH7 : (0 <= x2)) (PreH8 : (x2 <= 255)) (PreH9 : (0 <= x3)) (PreH10 : (x3 <= 255)) (PreH11 : (0 <= x4)) (PreH12 : (x4 <= 255)) (PreH13 : (0 <= x5)) (PreH14 : (x5 <= 255)) (PreH15 : (0 <= x6)) (PreH16 : (x6 <= 255)) (PreH17 : (0 <= x7)) (PreH18 : (x7 <= 255)) (PreH19 : (0 <= x8)) (PreH20 : (x8 <= 255)) (PreH21 : (0 <= x9)) (PreH22 : (x9 <= 255)) (PreH23 : (0 <= x10)) (PreH24 : (x10 <= 255)) (PreH25 : (0 <= x11)) (PreH26 : (x11 <= 255)) (PreH27 : (0 <= x12)) (PreH28 : (x12 <= 255)) (PreH29 : (0 <= x13)) (PreH30 : (x13 <= 255)) (PreH31 : (0 <= x14)) (PreH32 : (x14 <= 255)) (PreH33 : (0 <= x15)) (PreH34 : (x15 <= 255)) (PreH35 : (0 <= x16)) (PreH36 : (x16 <= 255)) (PreH37 : (0 <= x17)) (PreH38 : (x17 <= 255)) (PreH39 : (0 <= x18)) (PreH40 : (x18 <= 255)) (PreH41 : (0 <= x19)) (PreH42 : (x19 <= 255)) (PreH43 : (0 <= x20)) (PreH44 : (x20 <= 255)) (PreH45 : (0 <= x21)) (PreH46 : (x21 <= 255)) (PreH47 : (0 <= x22)) (PreH48 : (x22 <= 255)) (PreH49 : (0 <= x23)) (PreH50 : (x23 <= 255)) (PreH51 : (0 <= x24)) (PreH52 : (x24 <= 255)) (PreH53 : (0 <= x25)) (PreH54 : (x25 <= 255)) (PreH55 : (0 <= x26)) (PreH56 : (x26 <= 255)) (PreH57 : (0 <= x27)) (PreH58 : (x27 <= 255)) (PreH59 : (0 <= x28)) (PreH60 : (x28 <= 255)) (PreH61 : (0 <= x29)) (PreH62 : (x29 <= 255)) (PreH63 : (0 <= x30)) (PreH64 : (x30 <= 255)) (PreH65 : (0 <= x31)) (PreH66 : (x31 <= 255)) ,
  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
  **  (UCharArray.undef_seg p_pre 0 vl_pre )
|--
  “ (0 <= 0) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= x0) ” 
  &&  “ (x0 <= 255) ” 
  &&  “ (0 <= x1) ” 
  &&  “ (x1 <= 255) ” 
  &&  “ (0 <= x2) ” 
  &&  “ (x2 <= 255) ” 
  &&  “ (0 <= x3) ” 
  &&  “ (x3 <= 255) ” 
  &&  “ (0 <= x4) ” 
  &&  “ (x4 <= 255) ” 
  &&  “ (0 <= x5) ” 
  &&  “ (x5 <= 255) ” 
  &&  “ (0 <= x6) ” 
  &&  “ (x6 <= 255) ” 
  &&  “ (0 <= x7) ” 
  &&  “ (x7 <= 255) ” 
  &&  “ (0 <= x8) ” 
  &&  “ (x8 <= 255) ” 
  &&  “ (0 <= x9) ” 
  &&  “ (x9 <= 255) ” 
  &&  “ (0 <= x10) ” 
  &&  “ (x10 <= 255) ” 
  &&  “ (0 <= x11) ” 
  &&  “ (x11 <= 255) ” 
  &&  “ (0 <= x12) ” 
  &&  “ (x12 <= 255) ” 
  &&  “ (0 <= x13) ” 
  &&  “ (x13 <= 255) ” 
  &&  “ (0 <= x14) ” 
  &&  “ (x14 <= 255) ” 
  &&  “ (0 <= x15) ” 
  &&  “ (x15 <= 255) ” 
  &&  “ (0 <= x16) ” 
  &&  “ (x16 <= 255) ” 
  &&  “ (0 <= x17) ” 
  &&  “ (x17 <= 255) ” 
  &&  “ (0 <= x18) ” 
  &&  “ (x18 <= 255) ” 
  &&  “ (0 <= x19) ” 
  &&  “ (x19 <= 255) ” 
  &&  “ (0 <= x20) ” 
  &&  “ (x20 <= 255) ” 
  &&  “ (0 <= x21) ” 
  &&  “ (x21 <= 255) ” 
  &&  “ (0 <= x22) ” 
  &&  “ (x22 <= 255) ” 
  &&  “ (0 <= x23) ” 
  &&  “ (x23 <= 255) ” 
  &&  “ (0 <= x24) ” 
  &&  “ (x24 <= 255) ” 
  &&  “ (0 <= x25) ” 
  &&  “ (x25 <= 255) ” 
  &&  “ (0 <= x26) ” 
  &&  “ (x26 <= 255) ” 
  &&  “ (0 <= x27) ” 
  &&  “ (x27 <= 255) ” 
  &&  “ (0 <= x28) ” 
  &&  “ (x28 <= 255) ” 
  &&  “ (0 <= x29) ” 
  &&  “ (x29 <= 255) ” 
  &&  “ (0 <= x30) ” 
  &&  “ (x30 <= 255) ” 
  &&  “ (0 <= x31) ” 
  &&  “ (x31 <= 255) ”
  &&  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
  **  (UCharArray.seg p_pre 0 0 (u8_rvv_prefix (0) ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )
  **  (UCharArray.undef_seg p_pre 0 vl_pre )
.

Definition qcp_qu_rvv_store32_entail_wit_2 := 
(
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (i: Z) (retval: Z) (PreH1 : (retval = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (i < vl_pre)) (PreH5 : (0 <= i)) (PreH6 : (i <= vl_pre)) (PreH7 : (vl_pre <= 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  (UCharArray.seg p_pre 0 (i + 1 ) (u8_rvv_snoc ((u8_rvv_prefix (i) ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))))) (retval)) )
  **  (UCharArray.undef_seg p_pre (i + 1 ) vl_pre )
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
|--
  “ (0 <= (i + 1 )) ” 
  &&  “ ((i + 1 ) <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= x0) ” 
  &&  “ (x0 <= 255) ” 
  &&  “ (0 <= x1) ” 
  &&  “ (x1 <= 255) ” 
  &&  “ (0 <= x2) ” 
  &&  “ (x2 <= 255) ” 
  &&  “ (0 <= x3) ” 
  &&  “ (x3 <= 255) ” 
  &&  “ (0 <= x4) ” 
  &&  “ (x4 <= 255) ” 
  &&  “ (0 <= x5) ” 
  &&  “ (x5 <= 255) ” 
  &&  “ (0 <= x6) ” 
  &&  “ (x6 <= 255) ” 
  &&  “ (0 <= x7) ” 
  &&  “ (x7 <= 255) ” 
  &&  “ (0 <= x8) ” 
  &&  “ (x8 <= 255) ” 
  &&  “ (0 <= x9) ” 
  &&  “ (x9 <= 255) ” 
  &&  “ (0 <= x10) ” 
  &&  “ (x10 <= 255) ” 
  &&  “ (0 <= x11) ” 
  &&  “ (x11 <= 255) ” 
  &&  “ (0 <= x12) ” 
  &&  “ (x12 <= 255) ” 
  &&  “ (0 <= x13) ” 
  &&  “ (x13 <= 255) ” 
  &&  “ (0 <= x14) ” 
  &&  “ (x14 <= 255) ” 
  &&  “ (0 <= x15) ” 
  &&  “ (x15 <= 255) ” 
  &&  “ (0 <= x16) ” 
  &&  “ (x16 <= 255) ” 
  &&  “ (0 <= x17) ” 
  &&  “ (x17 <= 255) ” 
  &&  “ (0 <= x18) ” 
  &&  “ (x18 <= 255) ” 
  &&  “ (0 <= x19) ” 
  &&  “ (x19 <= 255) ” 
  &&  “ (0 <= x20) ” 
  &&  “ (x20 <= 255) ” 
  &&  “ (0 <= x21) ” 
  &&  “ (x21 <= 255) ” 
  &&  “ (0 <= x22) ” 
  &&  “ (x22 <= 255) ” 
  &&  “ (0 <= x23) ” 
  &&  “ (x23 <= 255) ” 
  &&  “ (0 <= x24) ” 
  &&  “ (x24 <= 255) ” 
  &&  “ (0 <= x25) ” 
  &&  “ (x25 <= 255) ” 
  &&  “ (0 <= x26) ” 
  &&  “ (x26 <= 255) ” 
  &&  “ (0 <= x27) ” 
  &&  “ (x27 <= 255) ” 
  &&  “ (0 <= x28) ” 
  &&  “ (x28 <= 255) ” 
  &&  “ (0 <= x29) ” 
  &&  “ (x29 <= 255) ” 
  &&  “ (0 <= x30) ” 
  &&  “ (x30 <= 255) ” 
  &&  “ (0 <= x31) ” 
  &&  “ (x31 <= 255) ”
  &&  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
  **  (UCharArray.seg p_pre 0 (i + 1 ) (u8_rvv_prefix ((i + 1 )) ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )
  **  (UCharArray.undef_seg p_pre (i + 1 ) vl_pre )
) \/
(
forall (vl_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (i: Z) (retval: Z) (PreH1 : (retval = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (i < vl_pre)) (PreH5 : (0 <= i)) (PreH6 : (i <= vl_pre)) (PreH7 : (vl_pre <= 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  TT && emp 
|--
  “ ((u8_rvv_snoc ((u8_rvv_prefix (i) ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))))) (retval)) = (u8_rvv_prefix ((i + 1 )) ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))))) ”
  &&  emp
).

Definition qcp_qu_rvv_store32_entail_wit_2_split_goal_1 := 
forall (vl_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (i: Z) (retval: Z) (PreH1 : (retval = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (i < vl_pre)) (PreH5 : (0 <= i)) (PreH6 : (i <= vl_pre)) (PreH7 : (vl_pre <= 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  ((u8_rvv_snoc ((u8_rvv_prefix (i) ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))))) (retval)) = (u8_rvv_prefix ((i + 1 )) ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))))
.

Definition qcp_qu_rvv_store32_return_wit_1 := 
(
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (i: Z) (PreH1 : (i >= vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 32)) (PreH5 : (0 <= x0)) (PreH6 : (x0 <= 255)) (PreH7 : (0 <= x1)) (PreH8 : (x1 <= 255)) (PreH9 : (0 <= x2)) (PreH10 : (x2 <= 255)) (PreH11 : (0 <= x3)) (PreH12 : (x3 <= 255)) (PreH13 : (0 <= x4)) (PreH14 : (x4 <= 255)) (PreH15 : (0 <= x5)) (PreH16 : (x5 <= 255)) (PreH17 : (0 <= x6)) (PreH18 : (x6 <= 255)) (PreH19 : (0 <= x7)) (PreH20 : (x7 <= 255)) (PreH21 : (0 <= x8)) (PreH22 : (x8 <= 255)) (PreH23 : (0 <= x9)) (PreH24 : (x9 <= 255)) (PreH25 : (0 <= x10)) (PreH26 : (x10 <= 255)) (PreH27 : (0 <= x11)) (PreH28 : (x11 <= 255)) (PreH29 : (0 <= x12)) (PreH30 : (x12 <= 255)) (PreH31 : (0 <= x13)) (PreH32 : (x13 <= 255)) (PreH33 : (0 <= x14)) (PreH34 : (x14 <= 255)) (PreH35 : (0 <= x15)) (PreH36 : (x15 <= 255)) (PreH37 : (0 <= x16)) (PreH38 : (x16 <= 255)) (PreH39 : (0 <= x17)) (PreH40 : (x17 <= 255)) (PreH41 : (0 <= x18)) (PreH42 : (x18 <= 255)) (PreH43 : (0 <= x19)) (PreH44 : (x19 <= 255)) (PreH45 : (0 <= x20)) (PreH46 : (x20 <= 255)) (PreH47 : (0 <= x21)) (PreH48 : (x21 <= 255)) (PreH49 : (0 <= x22)) (PreH50 : (x22 <= 255)) (PreH51 : (0 <= x23)) (PreH52 : (x23 <= 255)) (PreH53 : (0 <= x24)) (PreH54 : (x24 <= 255)) (PreH55 : (0 <= x25)) (PreH56 : (x25 <= 255)) (PreH57 : (0 <= x26)) (PreH58 : (x26 <= 255)) (PreH59 : (0 <= x27)) (PreH60 : (x27 <= 255)) (PreH61 : (0 <= x28)) (PreH62 : (x28 <= 255)) (PreH63 : (0 <= x29)) (PreH64 : (x29 <= 255)) (PreH65 : (0 <= x30)) (PreH66 : (x30 <= 255)) (PreH67 : (0 <= x31)) (PreH68 : (x31 <= 255)) ,
  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
  **  (UCharArray.seg p_pre 0 i (u8_rvv_prefix (i) ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )
  **  (UCharArray.undef_seg p_pre i vl_pre )
|--
  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
  **  (UCharArray.seg p_pre 0 vl_pre (u8_rvv_prefix (vl_pre) ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )
) \/
(
forall (vl_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (i: Z) (PreH1 : (i >= vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 32)) (PreH5 : (0 <= x0)) (PreH6 : (x0 <= 255)) (PreH7 : (0 <= x1)) (PreH8 : (x1 <= 255)) (PreH9 : (0 <= x2)) (PreH10 : (x2 <= 255)) (PreH11 : (0 <= x3)) (PreH12 : (x3 <= 255)) (PreH13 : (0 <= x4)) (PreH14 : (x4 <= 255)) (PreH15 : (0 <= x5)) (PreH16 : (x5 <= 255)) (PreH17 : (0 <= x6)) (PreH18 : (x6 <= 255)) (PreH19 : (0 <= x7)) (PreH20 : (x7 <= 255)) (PreH21 : (0 <= x8)) (PreH22 : (x8 <= 255)) (PreH23 : (0 <= x9)) (PreH24 : (x9 <= 255)) (PreH25 : (0 <= x10)) (PreH26 : (x10 <= 255)) (PreH27 : (0 <= x11)) (PreH28 : (x11 <= 255)) (PreH29 : (0 <= x12)) (PreH30 : (x12 <= 255)) (PreH31 : (0 <= x13)) (PreH32 : (x13 <= 255)) (PreH33 : (0 <= x14)) (PreH34 : (x14 <= 255)) (PreH35 : (0 <= x15)) (PreH36 : (x15 <= 255)) (PreH37 : (0 <= x16)) (PreH38 : (x16 <= 255)) (PreH39 : (0 <= x17)) (PreH40 : (x17 <= 255)) (PreH41 : (0 <= x18)) (PreH42 : (x18 <= 255)) (PreH43 : (0 <= x19)) (PreH44 : (x19 <= 255)) (PreH45 : (0 <= x20)) (PreH46 : (x20 <= 255)) (PreH47 : (0 <= x21)) (PreH48 : (x21 <= 255)) (PreH49 : (0 <= x22)) (PreH50 : (x22 <= 255)) (PreH51 : (0 <= x23)) (PreH52 : (x23 <= 255)) (PreH53 : (0 <= x24)) (PreH54 : (x24 <= 255)) (PreH55 : (0 <= x25)) (PreH56 : (x25 <= 255)) (PreH57 : (0 <= x26)) (PreH58 : (x26 <= 255)) (PreH59 : (0 <= x27)) (PreH60 : (x27 <= 255)) (PreH61 : (0 <= x28)) (PreH62 : (x28 <= 255)) (PreH63 : (0 <= x29)) (PreH64 : (x29 <= 255)) (PreH65 : (0 <= x30)) (PreH66 : (x30 <= 255)) (PreH67 : (0 <= x31)) (PreH68 : (x31 <= 255)) ,
  TT && emp 
|--
  “ ((u8_rvv_prefix (i) ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) = (u8_rvv_prefix (vl_pre) ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))))) ”
  &&  emp
).

Definition qcp_qu_rvv_store32_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (i: Z) (PreH1 : (i >= vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 32)) (PreH5 : (0 <= x0)) (PreH6 : (x0 <= 255)) (PreH7 : (0 <= x1)) (PreH8 : (x1 <= 255)) (PreH9 : (0 <= x2)) (PreH10 : (x2 <= 255)) (PreH11 : (0 <= x3)) (PreH12 : (x3 <= 255)) (PreH13 : (0 <= x4)) (PreH14 : (x4 <= 255)) (PreH15 : (0 <= x5)) (PreH16 : (x5 <= 255)) (PreH17 : (0 <= x6)) (PreH18 : (x6 <= 255)) (PreH19 : (0 <= x7)) (PreH20 : (x7 <= 255)) (PreH21 : (0 <= x8)) (PreH22 : (x8 <= 255)) (PreH23 : (0 <= x9)) (PreH24 : (x9 <= 255)) (PreH25 : (0 <= x10)) (PreH26 : (x10 <= 255)) (PreH27 : (0 <= x11)) (PreH28 : (x11 <= 255)) (PreH29 : (0 <= x12)) (PreH30 : (x12 <= 255)) (PreH31 : (0 <= x13)) (PreH32 : (x13 <= 255)) (PreH33 : (0 <= x14)) (PreH34 : (x14 <= 255)) (PreH35 : (0 <= x15)) (PreH36 : (x15 <= 255)) (PreH37 : (0 <= x16)) (PreH38 : (x16 <= 255)) (PreH39 : (0 <= x17)) (PreH40 : (x17 <= 255)) (PreH41 : (0 <= x18)) (PreH42 : (x18 <= 255)) (PreH43 : (0 <= x19)) (PreH44 : (x19 <= 255)) (PreH45 : (0 <= x20)) (PreH46 : (x20 <= 255)) (PreH47 : (0 <= x21)) (PreH48 : (x21 <= 255)) (PreH49 : (0 <= x22)) (PreH50 : (x22 <= 255)) (PreH51 : (0 <= x23)) (PreH52 : (x23 <= 255)) (PreH53 : (0 <= x24)) (PreH54 : (x24 <= 255)) (PreH55 : (0 <= x25)) (PreH56 : (x25 <= 255)) (PreH57 : (0 <= x26)) (PreH58 : (x26 <= 255)) (PreH59 : (0 <= x27)) (PreH60 : (x27 <= 255)) (PreH61 : (0 <= x28)) (PreH62 : (x28 <= 255)) (PreH63 : (0 <= x29)) (PreH64 : (x29 <= 255)) (PreH65 : (0 <= x30)) (PreH66 : (x30 <= 255)) (PreH67 : (0 <= x31)) (PreH68 : (x31 <= 255)) ,
  ((u8_rvv_prefix (i) ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) = (u8_rvv_prefix (vl_pre) ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))))
.

Definition qcp_qu_rvv_store32_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (i: Z) (PreH1 : (i < vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 32)) (PreH5 : (0 <= x0)) (PreH6 : (x0 <= 255)) (PreH7 : (0 <= x1)) (PreH8 : (x1 <= 255)) (PreH9 : (0 <= x2)) (PreH10 : (x2 <= 255)) (PreH11 : (0 <= x3)) (PreH12 : (x3 <= 255)) (PreH13 : (0 <= x4)) (PreH14 : (x4 <= 255)) (PreH15 : (0 <= x5)) (PreH16 : (x5 <= 255)) (PreH17 : (0 <= x6)) (PreH18 : (x6 <= 255)) (PreH19 : (0 <= x7)) (PreH20 : (x7 <= 255)) (PreH21 : (0 <= x8)) (PreH22 : (x8 <= 255)) (PreH23 : (0 <= x9)) (PreH24 : (x9 <= 255)) (PreH25 : (0 <= x10)) (PreH26 : (x10 <= 255)) (PreH27 : (0 <= x11)) (PreH28 : (x11 <= 255)) (PreH29 : (0 <= x12)) (PreH30 : (x12 <= 255)) (PreH31 : (0 <= x13)) (PreH32 : (x13 <= 255)) (PreH33 : (0 <= x14)) (PreH34 : (x14 <= 255)) (PreH35 : (0 <= x15)) (PreH36 : (x15 <= 255)) (PreH37 : (0 <= x16)) (PreH38 : (x16 <= 255)) (PreH39 : (0 <= x17)) (PreH40 : (x17 <= 255)) (PreH41 : (0 <= x18)) (PreH42 : (x18 <= 255)) (PreH43 : (0 <= x19)) (PreH44 : (x19 <= 255)) (PreH45 : (0 <= x20)) (PreH46 : (x20 <= 255)) (PreH47 : (0 <= x21)) (PreH48 : (x21 <= 255)) (PreH49 : (0 <= x22)) (PreH50 : (x22 <= 255)) (PreH51 : (0 <= x23)) (PreH52 : (x23 <= 255)) (PreH53 : (0 <= x24)) (PreH54 : (x24 <= 255)) (PreH55 : (0 <= x25)) (PreH56 : (x25 <= 255)) (PreH57 : (0 <= x26)) (PreH58 : (x26 <= 255)) (PreH59 : (0 <= x27)) (PreH60 : (x27 <= 255)) (PreH61 : (0 <= x28)) (PreH62 : (x28 <= 255)) (PreH63 : (0 <= x29)) (PreH64 : (x29 <= 255)) (PreH65 : (0 <= x30)) (PreH66 : (x30 <= 255)) (PreH67 : (0 <= x31)) (PreH68 : (x31 <= 255)) ,
  ((( &( "value" ) )) # UChar  |->_)
  **  ((( &( "i" ) )) # UInt64  |-> i)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
  **  (UCharArray.seg p_pre 0 i (u8_rvv_prefix (i) ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )
  **  (UCharArray.undef_seg p_pre i vl_pre )
|--
  “ (0 <= i) ” 
  &&  “ (i < 32) ” 
  &&  “ (0 <= x0) ” 
  &&  “ (x0 <= 255) ” 
  &&  “ (0 <= x1) ” 
  &&  “ (x1 <= 255) ” 
  &&  “ (0 <= x2) ” 
  &&  “ (x2 <= 255) ” 
  &&  “ (0 <= x3) ” 
  &&  “ (x3 <= 255) ” 
  &&  “ (0 <= x4) ” 
  &&  “ (x4 <= 255) ” 
  &&  “ (0 <= x5) ” 
  &&  “ (x5 <= 255) ” 
  &&  “ (0 <= x6) ” 
  &&  “ (x6 <= 255) ” 
  &&  “ (0 <= x7) ” 
  &&  “ (x7 <= 255) ” 
  &&  “ (0 <= x8) ” 
  &&  “ (x8 <= 255) ” 
  &&  “ (0 <= x9) ” 
  &&  “ (x9 <= 255) ” 
  &&  “ (0 <= x10) ” 
  &&  “ (x10 <= 255) ” 
  &&  “ (0 <= x11) ” 
  &&  “ (x11 <= 255) ” 
  &&  “ (0 <= x12) ” 
  &&  “ (x12 <= 255) ” 
  &&  “ (0 <= x13) ” 
  &&  “ (x13 <= 255) ” 
  &&  “ (0 <= x14) ” 
  &&  “ (x14 <= 255) ” 
  &&  “ (0 <= x15) ” 
  &&  “ (x15 <= 255) ” 
  &&  “ (0 <= x16) ” 
  &&  “ (x16 <= 255) ” 
  &&  “ (0 <= x17) ” 
  &&  “ (x17 <= 255) ” 
  &&  “ (0 <= x18) ” 
  &&  “ (x18 <= 255) ” 
  &&  “ (0 <= x19) ” 
  &&  “ (x19 <= 255) ” 
  &&  “ (0 <= x20) ” 
  &&  “ (x20 <= 255) ” 
  &&  “ (0 <= x21) ” 
  &&  “ (x21 <= 255) ” 
  &&  “ (0 <= x22) ” 
  &&  “ (x22 <= 255) ” 
  &&  “ (0 <= x23) ” 
  &&  “ (x23 <= 255) ” 
  &&  “ (0 <= x24) ” 
  &&  “ (x24 <= 255) ” 
  &&  “ (0 <= x25) ” 
  &&  “ (x25 <= 255) ” 
  &&  “ (0 <= x26) ” 
  &&  “ (x26 <= 255) ” 
  &&  “ (0 <= x27) ” 
  &&  “ (x27 <= 255) ” 
  &&  “ (0 <= x28) ” 
  &&  “ (x28 <= 255) ” 
  &&  “ (0 <= x29) ” 
  &&  “ (x29 <= 255) ” 
  &&  “ (0 <= x30) ” 
  &&  “ (x30 <= 255) ” 
  &&  “ (0 <= x31) ” 
  &&  “ (x31 <= 255) ”
.

Definition qcp_qu_rvv_store32_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (i: Z) (PreH1 : (i < vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 32)) (PreH5 : (0 <= x0)) (PreH6 : (x0 <= 255)) (PreH7 : (0 <= x1)) (PreH8 : (x1 <= 255)) (PreH9 : (0 <= x2)) (PreH10 : (x2 <= 255)) (PreH11 : (0 <= x3)) (PreH12 : (x3 <= 255)) (PreH13 : (0 <= x4)) (PreH14 : (x4 <= 255)) (PreH15 : (0 <= x5)) (PreH16 : (x5 <= 255)) (PreH17 : (0 <= x6)) (PreH18 : (x6 <= 255)) (PreH19 : (0 <= x7)) (PreH20 : (x7 <= 255)) (PreH21 : (0 <= x8)) (PreH22 : (x8 <= 255)) (PreH23 : (0 <= x9)) (PreH24 : (x9 <= 255)) (PreH25 : (0 <= x10)) (PreH26 : (x10 <= 255)) (PreH27 : (0 <= x11)) (PreH28 : (x11 <= 255)) (PreH29 : (0 <= x12)) (PreH30 : (x12 <= 255)) (PreH31 : (0 <= x13)) (PreH32 : (x13 <= 255)) (PreH33 : (0 <= x14)) (PreH34 : (x14 <= 255)) (PreH35 : (0 <= x15)) (PreH36 : (x15 <= 255)) (PreH37 : (0 <= x16)) (PreH38 : (x16 <= 255)) (PreH39 : (0 <= x17)) (PreH40 : (x17 <= 255)) (PreH41 : (0 <= x18)) (PreH42 : (x18 <= 255)) (PreH43 : (0 <= x19)) (PreH44 : (x19 <= 255)) (PreH45 : (0 <= x20)) (PreH46 : (x20 <= 255)) (PreH47 : (0 <= x21)) (PreH48 : (x21 <= 255)) (PreH49 : (0 <= x22)) (PreH50 : (x22 <= 255)) (PreH51 : (0 <= x23)) (PreH52 : (x23 <= 255)) (PreH53 : (0 <= x24)) (PreH54 : (x24 <= 255)) (PreH55 : (0 <= x25)) (PreH56 : (x25 <= 255)) (PreH57 : (0 <= x26)) (PreH58 : (x26 <= 255)) (PreH59 : (0 <= x27)) (PreH60 : (x27 <= 255)) (PreH61 : (0 <= x28)) (PreH62 : (x28 <= 255)) (PreH63 : (0 <= x29)) (PreH64 : (x29 <= 255)) (PreH65 : (0 <= x30)) (PreH66 : (x30 <= 255)) (PreH67 : (0 <= x31)) (PreH68 : (x31 <= 255)) ,
  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
  **  (UCharArray.seg p_pre 0 i (u8_rvv_prefix (i) ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )
  **  (UCharArray.undef_seg p_pre i vl_pre )
|--
  “ (0 <= i) ” 
  &&  “ (i < 32) ” 
  &&  “ (0 <= x0) ” 
  &&  “ (x0 <= 255) ” 
  &&  “ (0 <= x1) ” 
  &&  “ (x1 <= 255) ” 
  &&  “ (0 <= x2) ” 
  &&  “ (x2 <= 255) ” 
  &&  “ (0 <= x3) ” 
  &&  “ (x3 <= 255) ” 
  &&  “ (0 <= x4) ” 
  &&  “ (x4 <= 255) ” 
  &&  “ (0 <= x5) ” 
  &&  “ (x5 <= 255) ” 
  &&  “ (0 <= x6) ” 
  &&  “ (x6 <= 255) ” 
  &&  “ (0 <= x7) ” 
  &&  “ (x7 <= 255) ” 
  &&  “ (0 <= x8) ” 
  &&  “ (x8 <= 255) ” 
  &&  “ (0 <= x9) ” 
  &&  “ (x9 <= 255) ” 
  &&  “ (0 <= x10) ” 
  &&  “ (x10 <= 255) ” 
  &&  “ (0 <= x11) ” 
  &&  “ (x11 <= 255) ” 
  &&  “ (0 <= x12) ” 
  &&  “ (x12 <= 255) ” 
  &&  “ (0 <= x13) ” 
  &&  “ (x13 <= 255) ” 
  &&  “ (0 <= x14) ” 
  &&  “ (x14 <= 255) ” 
  &&  “ (0 <= x15) ” 
  &&  “ (x15 <= 255) ” 
  &&  “ (0 <= x16) ” 
  &&  “ (x16 <= 255) ” 
  &&  “ (0 <= x17) ” 
  &&  “ (x17 <= 255) ” 
  &&  “ (0 <= x18) ” 
  &&  “ (x18 <= 255) ” 
  &&  “ (0 <= x19) ” 
  &&  “ (x19 <= 255) ” 
  &&  “ (0 <= x20) ” 
  &&  “ (x20 <= 255) ” 
  &&  “ (0 <= x21) ” 
  &&  “ (x21 <= 255) ” 
  &&  “ (0 <= x22) ” 
  &&  “ (x22 <= 255) ” 
  &&  “ (0 <= x23) ” 
  &&  “ (x23 <= 255) ” 
  &&  “ (0 <= x24) ” 
  &&  “ (x24 <= 255) ” 
  &&  “ (0 <= x25) ” 
  &&  “ (x25 <= 255) ” 
  &&  “ (0 <= x26) ” 
  &&  “ (x26 <= 255) ” 
  &&  “ (0 <= x27) ” 
  &&  “ (x27 <= 255) ” 
  &&  “ (0 <= x28) ” 
  &&  “ (x28 <= 255) ” 
  &&  “ (0 <= x29) ” 
  &&  “ (x29 <= 255) ” 
  &&  “ (0 <= x30) ” 
  &&  “ (x30 <= 255) ” 
  &&  “ (0 <= x31) ” 
  &&  “ (x31 <= 255) ” 
  &&  “ (i < vl_pre) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= x0) ” 
  &&  “ (x0 <= 255) ” 
  &&  “ (0 <= x1) ” 
  &&  “ (x1 <= 255) ” 
  &&  “ (0 <= x2) ” 
  &&  “ (x2 <= 255) ” 
  &&  “ (0 <= x3) ” 
  &&  “ (x3 <= 255) ” 
  &&  “ (0 <= x4) ” 
  &&  “ (x4 <= 255) ” 
  &&  “ (0 <= x5) ” 
  &&  “ (x5 <= 255) ” 
  &&  “ (0 <= x6) ” 
  &&  “ (x6 <= 255) ” 
  &&  “ (0 <= x7) ” 
  &&  “ (x7 <= 255) ” 
  &&  “ (0 <= x8) ” 
  &&  “ (x8 <= 255) ” 
  &&  “ (0 <= x9) ” 
  &&  “ (x9 <= 255) ” 
  &&  “ (0 <= x10) ” 
  &&  “ (x10 <= 255) ” 
  &&  “ (0 <= x11) ” 
  &&  “ (x11 <= 255) ” 
  &&  “ (0 <= x12) ” 
  &&  “ (x12 <= 255) ” 
  &&  “ (0 <= x13) ” 
  &&  “ (x13 <= 255) ” 
  &&  “ (0 <= x14) ” 
  &&  “ (x14 <= 255) ” 
  &&  “ (0 <= x15) ” 
  &&  “ (x15 <= 255) ” 
  &&  “ (0 <= x16) ” 
  &&  “ (x16 <= 255) ” 
  &&  “ (0 <= x17) ” 
  &&  “ (x17 <= 255) ” 
  &&  “ (0 <= x18) ” 
  &&  “ (x18 <= 255) ” 
  &&  “ (0 <= x19) ” 
  &&  “ (x19 <= 255) ” 
  &&  “ (0 <= x20) ” 
  &&  “ (x20 <= 255) ” 
  &&  “ (0 <= x21) ” 
  &&  “ (x21 <= 255) ” 
  &&  “ (0 <= x22) ” 
  &&  “ (x22 <= 255) ” 
  &&  “ (0 <= x23) ” 
  &&  “ (x23 <= 255) ” 
  &&  “ (0 <= x24) ” 
  &&  “ (x24 <= 255) ” 
  &&  “ (0 <= x25) ” 
  &&  “ (x25 <= 255) ” 
  &&  “ (0 <= x26) ” 
  &&  “ (x26 <= 255) ” 
  &&  “ (0 <= x27) ” 
  &&  “ (x27 <= 255) ” 
  &&  “ (0 <= x28) ” 
  &&  “ (x28 <= 255) ” 
  &&  “ (0 <= x29) ” 
  &&  “ (x29 <= 255) ” 
  &&  “ (0 <= x30) ” 
  &&  “ (x30 <= 255) ” 
  &&  “ (0 <= x31) ” 
  &&  “ (x31 <= 255) ”
  &&  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
  **  (UCharArray.seg p_pre 0 i (u8_rvv_prefix (i) ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )
  **  (UCharArray.undef_seg p_pre i vl_pre )
.

Definition qcp_qu_rvv_store32_partial_solve_wit_1 := qcp_qu_rvv_store32_partial_solve_wit_1_pure -> qcp_qu_rvv_store32_partial_solve_wit_1_aux.

Definition qcp_qu_rvv_store32_partial_solve_wit_2_pure := 
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (i: Z) (retval: Z) (PreH1 : (retval = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (i < vl_pre)) (PreH5 : (0 <= i)) (PreH6 : (i <= vl_pre)) (PreH7 : (vl_pre <= 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
  **  ((( &( "value" ) )) # UChar  |-> retval)
  **  ((( &( "i" ) )) # UInt64  |-> i)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  (UCharArray.seg p_pre 0 i (u8_rvv_prefix (i) ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )
  **  (UCharArray.undef_seg p_pre i vl_pre )
|--
  “ (0 <= i) ” 
  &&  “ (i < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ”
.

Definition qcp_qu_rvv_store32_partial_solve_wit_2_aux := 
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (i: Z) (retval: Z) (PreH1 : (retval = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (i < vl_pre)) (PreH5 : (0 <= i)) (PreH6 : (i <= vl_pre)) (PreH7 : (vl_pre <= 32)) (PreH8 : (0 <= x0)) (PreH9 : (x0 <= 255)) (PreH10 : (0 <= x1)) (PreH11 : (x1 <= 255)) (PreH12 : (0 <= x2)) (PreH13 : (x2 <= 255)) (PreH14 : (0 <= x3)) (PreH15 : (x3 <= 255)) (PreH16 : (0 <= x4)) (PreH17 : (x4 <= 255)) (PreH18 : (0 <= x5)) (PreH19 : (x5 <= 255)) (PreH20 : (0 <= x6)) (PreH21 : (x6 <= 255)) (PreH22 : (0 <= x7)) (PreH23 : (x7 <= 255)) (PreH24 : (0 <= x8)) (PreH25 : (x8 <= 255)) (PreH26 : (0 <= x9)) (PreH27 : (x9 <= 255)) (PreH28 : (0 <= x10)) (PreH29 : (x10 <= 255)) (PreH30 : (0 <= x11)) (PreH31 : (x11 <= 255)) (PreH32 : (0 <= x12)) (PreH33 : (x12 <= 255)) (PreH34 : (0 <= x13)) (PreH35 : (x13 <= 255)) (PreH36 : (0 <= x14)) (PreH37 : (x14 <= 255)) (PreH38 : (0 <= x15)) (PreH39 : (x15 <= 255)) (PreH40 : (0 <= x16)) (PreH41 : (x16 <= 255)) (PreH42 : (0 <= x17)) (PreH43 : (x17 <= 255)) (PreH44 : (0 <= x18)) (PreH45 : (x18 <= 255)) (PreH46 : (0 <= x19)) (PreH47 : (x19 <= 255)) (PreH48 : (0 <= x20)) (PreH49 : (x20 <= 255)) (PreH50 : (0 <= x21)) (PreH51 : (x21 <= 255)) (PreH52 : (0 <= x22)) (PreH53 : (x22 <= 255)) (PreH54 : (0 <= x23)) (PreH55 : (x23 <= 255)) (PreH56 : (0 <= x24)) (PreH57 : (x24 <= 255)) (PreH58 : (0 <= x25)) (PreH59 : (x25 <= 255)) (PreH60 : (0 <= x26)) (PreH61 : (x26 <= 255)) (PreH62 : (0 <= x27)) (PreH63 : (x27 <= 255)) (PreH64 : (0 <= x28)) (PreH65 : (x28 <= 255)) (PreH66 : (0 <= x29)) (PreH67 : (x29 <= 255)) (PreH68 : (0 <= x30)) (PreH69 : (x30 <= 255)) (PreH70 : (0 <= x31)) (PreH71 : (x31 <= 255)) ,
  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
  **  (UCharArray.seg p_pre 0 i (u8_rvv_prefix (i) ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )
  **  (UCharArray.undef_seg p_pre i vl_pre )
|--
  “ (0 <= i) ” 
  &&  “ (i < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (retval = (u8_rvv_nth ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (i < vl_pre) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= x0) ” 
  &&  “ (x0 <= 255) ” 
  &&  “ (0 <= x1) ” 
  &&  “ (x1 <= 255) ” 
  &&  “ (0 <= x2) ” 
  &&  “ (x2 <= 255) ” 
  &&  “ (0 <= x3) ” 
  &&  “ (x3 <= 255) ” 
  &&  “ (0 <= x4) ” 
  &&  “ (x4 <= 255) ” 
  &&  “ (0 <= x5) ” 
  &&  “ (x5 <= 255) ” 
  &&  “ (0 <= x6) ” 
  &&  “ (x6 <= 255) ” 
  &&  “ (0 <= x7) ” 
  &&  “ (x7 <= 255) ” 
  &&  “ (0 <= x8) ” 
  &&  “ (x8 <= 255) ” 
  &&  “ (0 <= x9) ” 
  &&  “ (x9 <= 255) ” 
  &&  “ (0 <= x10) ” 
  &&  “ (x10 <= 255) ” 
  &&  “ (0 <= x11) ” 
  &&  “ (x11 <= 255) ” 
  &&  “ (0 <= x12) ” 
  &&  “ (x12 <= 255) ” 
  &&  “ (0 <= x13) ” 
  &&  “ (x13 <= 255) ” 
  &&  “ (0 <= x14) ” 
  &&  “ (x14 <= 255) ” 
  &&  “ (0 <= x15) ” 
  &&  “ (x15 <= 255) ” 
  &&  “ (0 <= x16) ” 
  &&  “ (x16 <= 255) ” 
  &&  “ (0 <= x17) ” 
  &&  “ (x17 <= 255) ” 
  &&  “ (0 <= x18) ” 
  &&  “ (x18 <= 255) ” 
  &&  “ (0 <= x19) ” 
  &&  “ (x19 <= 255) ” 
  &&  “ (0 <= x20) ” 
  &&  “ (x20 <= 255) ” 
  &&  “ (0 <= x21) ” 
  &&  “ (x21 <= 255) ” 
  &&  “ (0 <= x22) ” 
  &&  “ (x22 <= 255) ” 
  &&  “ (0 <= x23) ” 
  &&  “ (x23 <= 255) ” 
  &&  “ (0 <= x24) ” 
  &&  “ (x24 <= 255) ” 
  &&  “ (0 <= x25) ” 
  &&  “ (x25 <= 255) ” 
  &&  “ (0 <= x26) ” 
  &&  “ (x26 <= 255) ” 
  &&  “ (0 <= x27) ” 
  &&  “ (x27 <= 255) ” 
  &&  “ (0 <= x28) ” 
  &&  “ (x28 <= 255) ” 
  &&  “ (0 <= x29) ” 
  &&  “ (x29 <= 255) ” 
  &&  “ (0 <= x30) ” 
  &&  “ (x30 <= 255) ” 
  &&  “ (0 <= x31) ” 
  &&  “ (x31 <= 255) ”
  &&  (UCharArray.seg p_pre 0 i (u8_rvv_prefix (i) ((u8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )
  **  (UCharArray.undef_seg p_pre i vl_pre )
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s15")) # UChar  |-> x15)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s16")) # UChar  |-> x16)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s17")) # UChar  |-> x17)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s18")) # UChar  |-> x18)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s19")) # UChar  |-> x19)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s20")) # UChar  |-> x20)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s21")) # UChar  |-> x21)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s22")) # UChar  |-> x22)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s23")) # UChar  |-> x23)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s24")) # UChar  |-> x24)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s25")) # UChar  |-> x25)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s26")) # UChar  |-> x26)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s27")) # UChar  |-> x27)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s28")) # UChar  |-> x28)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s29")) # UChar  |-> x29)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s30")) # UChar  |-> x30)
  **  ((&((a_pre)  # "vuint8m2_t" ->ₛ "s31")) # UChar  |-> x31)
.

Definition qcp_qu_rvv_store32_partial_solve_wit_2 := qcp_qu_rvv_store32_partial_solve_wit_2_pure -> qcp_qu_rvv_store32_partial_solve_wit_2_aux.

Module Type VC_Correct.

Include u8_arrays_Strategy_Correct.
Include rvv_store_Strategy_Correct.

Axiom proof_of_qcp_qu_rvv_get32_safety_wit_1 : qcp_qu_rvv_get32_safety_wit_1.
Axiom proof_of_qcp_qu_rvv_get32_safety_wit_2 : qcp_qu_rvv_get32_safety_wit_2.
Axiom proof_of_qcp_qu_rvv_get32_safety_wit_3 : qcp_qu_rvv_get32_safety_wit_3.
Axiom proof_of_qcp_qu_rvv_get32_safety_wit_4 : qcp_qu_rvv_get32_safety_wit_4.
Axiom proof_of_qcp_qu_rvv_get32_safety_wit_5 : qcp_qu_rvv_get32_safety_wit_5.
Axiom proof_of_qcp_qu_rvv_get32_safety_wit_6 : qcp_qu_rvv_get32_safety_wit_6.
Axiom proof_of_qcp_qu_rvv_get32_safety_wit_7 : qcp_qu_rvv_get32_safety_wit_7.
Axiom proof_of_qcp_qu_rvv_get32_safety_wit_8 : qcp_qu_rvv_get32_safety_wit_8.
Axiom proof_of_qcp_qu_rvv_get32_safety_wit_9 : qcp_qu_rvv_get32_safety_wit_9.
Axiom proof_of_qcp_qu_rvv_get32_safety_wit_10 : qcp_qu_rvv_get32_safety_wit_10.
Axiom proof_of_qcp_qu_rvv_get32_safety_wit_11 : qcp_qu_rvv_get32_safety_wit_11.
Axiom proof_of_qcp_qu_rvv_get32_safety_wit_12 : qcp_qu_rvv_get32_safety_wit_12.
Axiom proof_of_qcp_qu_rvv_get32_safety_wit_13 : qcp_qu_rvv_get32_safety_wit_13.
Axiom proof_of_qcp_qu_rvv_get32_safety_wit_14 : qcp_qu_rvv_get32_safety_wit_14.
Axiom proof_of_qcp_qu_rvv_get32_safety_wit_15 : qcp_qu_rvv_get32_safety_wit_15.
Axiom proof_of_qcp_qu_rvv_get32_safety_wit_16 : qcp_qu_rvv_get32_safety_wit_16.
Axiom proof_of_qcp_qu_rvv_get32_safety_wit_17 : qcp_qu_rvv_get32_safety_wit_17.
Axiom proof_of_qcp_qu_rvv_get32_safety_wit_18 : qcp_qu_rvv_get32_safety_wit_18.
Axiom proof_of_qcp_qu_rvv_get32_safety_wit_19 : qcp_qu_rvv_get32_safety_wit_19.
Axiom proof_of_qcp_qu_rvv_get32_safety_wit_20 : qcp_qu_rvv_get32_safety_wit_20.
Axiom proof_of_qcp_qu_rvv_get32_safety_wit_21 : qcp_qu_rvv_get32_safety_wit_21.
Axiom proof_of_qcp_qu_rvv_get32_safety_wit_22 : qcp_qu_rvv_get32_safety_wit_22.
Axiom proof_of_qcp_qu_rvv_get32_safety_wit_23 : qcp_qu_rvv_get32_safety_wit_23.
Axiom proof_of_qcp_qu_rvv_get32_safety_wit_24 : qcp_qu_rvv_get32_safety_wit_24.
Axiom proof_of_qcp_qu_rvv_get32_safety_wit_25 : qcp_qu_rvv_get32_safety_wit_25.
Axiom proof_of_qcp_qu_rvv_get32_safety_wit_26 : qcp_qu_rvv_get32_safety_wit_26.
Axiom proof_of_qcp_qu_rvv_get32_safety_wit_27 : qcp_qu_rvv_get32_safety_wit_27.
Axiom proof_of_qcp_qu_rvv_get32_safety_wit_28 : qcp_qu_rvv_get32_safety_wit_28.
Axiom proof_of_qcp_qu_rvv_get32_safety_wit_29 : qcp_qu_rvv_get32_safety_wit_29.
Axiom proof_of_qcp_qu_rvv_get32_safety_wit_30 : qcp_qu_rvv_get32_safety_wit_30.
Axiom proof_of_qcp_qu_rvv_get32_safety_wit_31 : qcp_qu_rvv_get32_safety_wit_31.
Axiom proof_of_qcp_qu_rvv_get32_return_wit_1 : qcp_qu_rvv_get32_return_wit_1.
Axiom proof_of_qcp_qu_rvv_get32_return_wit_2 : qcp_qu_rvv_get32_return_wit_2.
Axiom proof_of_qcp_qu_rvv_get32_return_wit_3 : qcp_qu_rvv_get32_return_wit_3.
Axiom proof_of_qcp_qu_rvv_get32_return_wit_4 : qcp_qu_rvv_get32_return_wit_4.
Axiom proof_of_qcp_qu_rvv_get32_return_wit_5 : qcp_qu_rvv_get32_return_wit_5.
Axiom proof_of_qcp_qu_rvv_get32_return_wit_6 : qcp_qu_rvv_get32_return_wit_6.
Axiom proof_of_qcp_qu_rvv_get32_return_wit_7 : qcp_qu_rvv_get32_return_wit_7.
Axiom proof_of_qcp_qu_rvv_get32_return_wit_8 : qcp_qu_rvv_get32_return_wit_8.
Axiom proof_of_qcp_qu_rvv_get32_return_wit_9 : qcp_qu_rvv_get32_return_wit_9.
Axiom proof_of_qcp_qu_rvv_get32_return_wit_10 : qcp_qu_rvv_get32_return_wit_10.
Axiom proof_of_qcp_qu_rvv_get32_return_wit_11 : qcp_qu_rvv_get32_return_wit_11.
Axiom proof_of_qcp_qu_rvv_get32_return_wit_12 : qcp_qu_rvv_get32_return_wit_12.
Axiom proof_of_qcp_qu_rvv_get32_return_wit_13 : qcp_qu_rvv_get32_return_wit_13.
Axiom proof_of_qcp_qu_rvv_get32_return_wit_14 : qcp_qu_rvv_get32_return_wit_14.
Axiom proof_of_qcp_qu_rvv_get32_return_wit_15 : qcp_qu_rvv_get32_return_wit_15.
Axiom proof_of_qcp_qu_rvv_get32_return_wit_16 : qcp_qu_rvv_get32_return_wit_16.
Axiom proof_of_qcp_qu_rvv_get32_return_wit_17 : qcp_qu_rvv_get32_return_wit_17.
Axiom proof_of_qcp_qu_rvv_get32_return_wit_18 : qcp_qu_rvv_get32_return_wit_18.
Axiom proof_of_qcp_qu_rvv_get32_return_wit_19 : qcp_qu_rvv_get32_return_wit_19.
Axiom proof_of_qcp_qu_rvv_get32_return_wit_20 : qcp_qu_rvv_get32_return_wit_20.
Axiom proof_of_qcp_qu_rvv_get32_return_wit_21 : qcp_qu_rvv_get32_return_wit_21.
Axiom proof_of_qcp_qu_rvv_get32_return_wit_22 : qcp_qu_rvv_get32_return_wit_22.
Axiom proof_of_qcp_qu_rvv_get32_return_wit_23 : qcp_qu_rvv_get32_return_wit_23.
Axiom proof_of_qcp_qu_rvv_get32_return_wit_24 : qcp_qu_rvv_get32_return_wit_24.
Axiom proof_of_qcp_qu_rvv_get32_return_wit_25 : qcp_qu_rvv_get32_return_wit_25.
Axiom proof_of_qcp_qu_rvv_get32_return_wit_26 : qcp_qu_rvv_get32_return_wit_26.
Axiom proof_of_qcp_qu_rvv_get32_return_wit_27 : qcp_qu_rvv_get32_return_wit_27.
Axiom proof_of_qcp_qu_rvv_get32_return_wit_28 : qcp_qu_rvv_get32_return_wit_28.
Axiom proof_of_qcp_qu_rvv_get32_return_wit_29 : qcp_qu_rvv_get32_return_wit_29.
Axiom proof_of_qcp_qu_rvv_get32_return_wit_30 : qcp_qu_rvv_get32_return_wit_30.
Axiom proof_of_qcp_qu_rvv_get32_return_wit_31 : qcp_qu_rvv_get32_return_wit_31.
Axiom proof_of_qcp_qu_rvv_get32_return_wit_32 : qcp_qu_rvv_get32_return_wit_32.
Axiom proof_of_qcp_u8_rvv_store_next_return_wit_1 : qcp_u8_rvv_store_next_return_wit_1.
Axiom proof_of_qcp_u8_rvv_store_next_partial_solve_wit_1 : qcp_u8_rvv_store_next_partial_solve_wit_1.
Axiom proof_of_qcp_qu_rvv_store32_safety_wit_1 : qcp_qu_rvv_store32_safety_wit_1.
Axiom proof_of_qcp_qu_rvv_store32_entail_wit_1 : qcp_qu_rvv_store32_entail_wit_1.
Axiom proof_of_qcp_qu_rvv_store32_entail_wit_2 : qcp_qu_rvv_store32_entail_wit_2.
Axiom proof_of_qcp_qu_rvv_store32_return_wit_1 : qcp_qu_rvv_store32_return_wit_1.
Axiom proof_of_qcp_qu_rvv_store32_partial_solve_wit_1_pure : qcp_qu_rvv_store32_partial_solve_wit_1_pure.
Axiom proof_of_qcp_qu_rvv_store32_partial_solve_wit_1 : qcp_qu_rvv_store32_partial_solve_wit_1.
Axiom proof_of_qcp_qu_rvv_store32_partial_solve_wit_2_pure : qcp_qu_rvv_store32_partial_solve_wit_2_pure.
Axiom proof_of_qcp_qu_rvv_store32_partial_solve_wit_2 : qcp_qu_rvv_store32_partial_solve_wit_2.

End VC_Correct.
