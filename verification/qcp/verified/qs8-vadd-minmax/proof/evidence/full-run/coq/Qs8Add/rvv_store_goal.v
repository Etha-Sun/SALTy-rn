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
Require Import Qs8Add.Model.
Require Import Qs8Add.Types.
Require Import Qs8Add.MemoryModel.
Require Import Qs8Add.RvvMemoryModel.
Local Open Scope sac.
From Qs8Add Require Import s8_arrays_strategy_goal.
From Qs8Add Require Import s8_arrays_strategy_proof.
From Qs8Add Require Import rvv_store_strategy_goal.
From Qs8Add Require Import rvv_store_strategy_proof.

(*----- Function qcp_qa_rvv_get32 -----*)

Definition qcp_qa_rvv_get32_safety_wit_1 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : ((-128) <= x0)) (PreH4 : (x0 <= 127)) (PreH5 : ((-128) <= x1)) (PreH6 : (x1 <= 127)) (PreH7 : ((-128) <= x2)) (PreH8 : (x2 <= 127)) (PreH9 : ((-128) <= x3)) (PreH10 : (x3 <= 127)) (PreH11 : ((-128) <= x4)) (PreH12 : (x4 <= 127)) (PreH13 : ((-128) <= x5)) (PreH14 : (x5 <= 127)) (PreH15 : ((-128) <= x6)) (PreH16 : (x6 <= 127)) (PreH17 : ((-128) <= x7)) (PreH18 : (x7 <= 127)) (PreH19 : ((-128) <= x8)) (PreH20 : (x8 <= 127)) (PreH21 : ((-128) <= x9)) (PreH22 : (x9 <= 127)) (PreH23 : ((-128) <= x10)) (PreH24 : (x10 <= 127)) (PreH25 : ((-128) <= x11)) (PreH26 : (x11 <= 127)) (PreH27 : ((-128) <= x12)) (PreH28 : (x12 <= 127)) (PreH29 : ((-128) <= x13)) (PreH30 : (x13 <= 127)) (PreH31 : ((-128) <= x14)) (PreH32 : (x14 <= 127)) (PreH33 : ((-128) <= x15)) (PreH34 : (x15 <= 127)) (PreH35 : ((-128) <= x16)) (PreH36 : (x16 <= 127)) (PreH37 : ((-128) <= x17)) (PreH38 : (x17 <= 127)) (PreH39 : ((-128) <= x18)) (PreH40 : (x18 <= 127)) (PreH41 : ((-128) <= x19)) (PreH42 : (x19 <= 127)) (PreH43 : ((-128) <= x20)) (PreH44 : (x20 <= 127)) (PreH45 : ((-128) <= x21)) (PreH46 : (x21 <= 127)) (PreH47 : ((-128) <= x22)) (PreH48 : (x22 <= 127)) (PreH49 : ((-128) <= x23)) (PreH50 : (x23 <= 127)) (PreH51 : ((-128) <= x24)) (PreH52 : (x24 <= 127)) (PreH53 : ((-128) <= x25)) (PreH54 : (x25 <= 127)) (PreH55 : ((-128) <= x26)) (PreH56 : (x26 <= 127)) (PreH57 : ((-128) <= x27)) (PreH58 : (x27 <= 127)) (PreH59 : ((-128) <= x28)) (PreH60 : (x28 <= 127)) (PreH61 : ((-128) <= x29)) (PreH62 : (x29 <= 127)) (PreH63 : ((-128) <= x30)) (PreH64 : (x30 <= 127)) (PreH65 : ((-128) <= x31)) (PreH66 : (x31 <= 127)) ,
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

Definition qcp_qa_rvv_get32_safety_wit_2 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 16)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : ((-128) <= x0)) (PreH5 : (x0 <= 127)) (PreH6 : ((-128) <= x1)) (PreH7 : (x1 <= 127)) (PreH8 : ((-128) <= x2)) (PreH9 : (x2 <= 127)) (PreH10 : ((-128) <= x3)) (PreH11 : (x3 <= 127)) (PreH12 : ((-128) <= x4)) (PreH13 : (x4 <= 127)) (PreH14 : ((-128) <= x5)) (PreH15 : (x5 <= 127)) (PreH16 : ((-128) <= x6)) (PreH17 : (x6 <= 127)) (PreH18 : ((-128) <= x7)) (PreH19 : (x7 <= 127)) (PreH20 : ((-128) <= x8)) (PreH21 : (x8 <= 127)) (PreH22 : ((-128) <= x9)) (PreH23 : (x9 <= 127)) (PreH24 : ((-128) <= x10)) (PreH25 : (x10 <= 127)) (PreH26 : ((-128) <= x11)) (PreH27 : (x11 <= 127)) (PreH28 : ((-128) <= x12)) (PreH29 : (x12 <= 127)) (PreH30 : ((-128) <= x13)) (PreH31 : (x13 <= 127)) (PreH32 : ((-128) <= x14)) (PreH33 : (x14 <= 127)) (PreH34 : ((-128) <= x15)) (PreH35 : (x15 <= 127)) (PreH36 : ((-128) <= x16)) (PreH37 : (x16 <= 127)) (PreH38 : ((-128) <= x17)) (PreH39 : (x17 <= 127)) (PreH40 : ((-128) <= x18)) (PreH41 : (x18 <= 127)) (PreH42 : ((-128) <= x19)) (PreH43 : (x19 <= 127)) (PreH44 : ((-128) <= x20)) (PreH45 : (x20 <= 127)) (PreH46 : ((-128) <= x21)) (PreH47 : (x21 <= 127)) (PreH48 : ((-128) <= x22)) (PreH49 : (x22 <= 127)) (PreH50 : ((-128) <= x23)) (PreH51 : (x23 <= 127)) (PreH52 : ((-128) <= x24)) (PreH53 : (x24 <= 127)) (PreH54 : ((-128) <= x25)) (PreH55 : (x25 <= 127)) (PreH56 : ((-128) <= x26)) (PreH57 : (x26 <= 127)) (PreH58 : ((-128) <= x27)) (PreH59 : (x27 <= 127)) (PreH60 : ((-128) <= x28)) (PreH61 : (x28 <= 127)) (PreH62 : ((-128) <= x29)) (PreH63 : (x29 <= 127)) (PreH64 : ((-128) <= x30)) (PreH65 : (x30 <= 127)) (PreH66 : ((-128) <= x31)) (PreH67 : (x31 <= 127)) ,
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

Definition qcp_qa_rvv_get32_safety_wit_3 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 8)) (PreH2 : (i_pre < 16)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : ((-128) <= x0)) (PreH6 : (x0 <= 127)) (PreH7 : ((-128) <= x1)) (PreH8 : (x1 <= 127)) (PreH9 : ((-128) <= x2)) (PreH10 : (x2 <= 127)) (PreH11 : ((-128) <= x3)) (PreH12 : (x3 <= 127)) (PreH13 : ((-128) <= x4)) (PreH14 : (x4 <= 127)) (PreH15 : ((-128) <= x5)) (PreH16 : (x5 <= 127)) (PreH17 : ((-128) <= x6)) (PreH18 : (x6 <= 127)) (PreH19 : ((-128) <= x7)) (PreH20 : (x7 <= 127)) (PreH21 : ((-128) <= x8)) (PreH22 : (x8 <= 127)) (PreH23 : ((-128) <= x9)) (PreH24 : (x9 <= 127)) (PreH25 : ((-128) <= x10)) (PreH26 : (x10 <= 127)) (PreH27 : ((-128) <= x11)) (PreH28 : (x11 <= 127)) (PreH29 : ((-128) <= x12)) (PreH30 : (x12 <= 127)) (PreH31 : ((-128) <= x13)) (PreH32 : (x13 <= 127)) (PreH33 : ((-128) <= x14)) (PreH34 : (x14 <= 127)) (PreH35 : ((-128) <= x15)) (PreH36 : (x15 <= 127)) (PreH37 : ((-128) <= x16)) (PreH38 : (x16 <= 127)) (PreH39 : ((-128) <= x17)) (PreH40 : (x17 <= 127)) (PreH41 : ((-128) <= x18)) (PreH42 : (x18 <= 127)) (PreH43 : ((-128) <= x19)) (PreH44 : (x19 <= 127)) (PreH45 : ((-128) <= x20)) (PreH46 : (x20 <= 127)) (PreH47 : ((-128) <= x21)) (PreH48 : (x21 <= 127)) (PreH49 : ((-128) <= x22)) (PreH50 : (x22 <= 127)) (PreH51 : ((-128) <= x23)) (PreH52 : (x23 <= 127)) (PreH53 : ((-128) <= x24)) (PreH54 : (x24 <= 127)) (PreH55 : ((-128) <= x25)) (PreH56 : (x25 <= 127)) (PreH57 : ((-128) <= x26)) (PreH58 : (x26 <= 127)) (PreH59 : ((-128) <= x27)) (PreH60 : (x27 <= 127)) (PreH61 : ((-128) <= x28)) (PreH62 : (x28 <= 127)) (PreH63 : ((-128) <= x29)) (PreH64 : (x29 <= 127)) (PreH65 : ((-128) <= x30)) (PreH66 : (x30 <= 127)) (PreH67 : ((-128) <= x31)) (PreH68 : (x31 <= 127)) ,
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

Definition qcp_qa_rvv_get32_safety_wit_4 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 4)) (PreH2 : (i_pre < 8)) (PreH3 : (i_pre < 16)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : ((-128) <= x0)) (PreH7 : (x0 <= 127)) (PreH8 : ((-128) <= x1)) (PreH9 : (x1 <= 127)) (PreH10 : ((-128) <= x2)) (PreH11 : (x2 <= 127)) (PreH12 : ((-128) <= x3)) (PreH13 : (x3 <= 127)) (PreH14 : ((-128) <= x4)) (PreH15 : (x4 <= 127)) (PreH16 : ((-128) <= x5)) (PreH17 : (x5 <= 127)) (PreH18 : ((-128) <= x6)) (PreH19 : (x6 <= 127)) (PreH20 : ((-128) <= x7)) (PreH21 : (x7 <= 127)) (PreH22 : ((-128) <= x8)) (PreH23 : (x8 <= 127)) (PreH24 : ((-128) <= x9)) (PreH25 : (x9 <= 127)) (PreH26 : ((-128) <= x10)) (PreH27 : (x10 <= 127)) (PreH28 : ((-128) <= x11)) (PreH29 : (x11 <= 127)) (PreH30 : ((-128) <= x12)) (PreH31 : (x12 <= 127)) (PreH32 : ((-128) <= x13)) (PreH33 : (x13 <= 127)) (PreH34 : ((-128) <= x14)) (PreH35 : (x14 <= 127)) (PreH36 : ((-128) <= x15)) (PreH37 : (x15 <= 127)) (PreH38 : ((-128) <= x16)) (PreH39 : (x16 <= 127)) (PreH40 : ((-128) <= x17)) (PreH41 : (x17 <= 127)) (PreH42 : ((-128) <= x18)) (PreH43 : (x18 <= 127)) (PreH44 : ((-128) <= x19)) (PreH45 : (x19 <= 127)) (PreH46 : ((-128) <= x20)) (PreH47 : (x20 <= 127)) (PreH48 : ((-128) <= x21)) (PreH49 : (x21 <= 127)) (PreH50 : ((-128) <= x22)) (PreH51 : (x22 <= 127)) (PreH52 : ((-128) <= x23)) (PreH53 : (x23 <= 127)) (PreH54 : ((-128) <= x24)) (PreH55 : (x24 <= 127)) (PreH56 : ((-128) <= x25)) (PreH57 : (x25 <= 127)) (PreH58 : ((-128) <= x26)) (PreH59 : (x26 <= 127)) (PreH60 : ((-128) <= x27)) (PreH61 : (x27 <= 127)) (PreH62 : ((-128) <= x28)) (PreH63 : (x28 <= 127)) (PreH64 : ((-128) <= x29)) (PreH65 : (x29 <= 127)) (PreH66 : ((-128) <= x30)) (PreH67 : (x30 <= 127)) (PreH68 : ((-128) <= x31)) (PreH69 : (x31 <= 127)) ,
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

Definition qcp_qa_rvv_get32_safety_wit_5 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 2)) (PreH2 : (i_pre < 4)) (PreH3 : (i_pre < 8)) (PreH4 : (i_pre < 16)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : ((-128) <= x0)) (PreH8 : (x0 <= 127)) (PreH9 : ((-128) <= x1)) (PreH10 : (x1 <= 127)) (PreH11 : ((-128) <= x2)) (PreH12 : (x2 <= 127)) (PreH13 : ((-128) <= x3)) (PreH14 : (x3 <= 127)) (PreH15 : ((-128) <= x4)) (PreH16 : (x4 <= 127)) (PreH17 : ((-128) <= x5)) (PreH18 : (x5 <= 127)) (PreH19 : ((-128) <= x6)) (PreH20 : (x6 <= 127)) (PreH21 : ((-128) <= x7)) (PreH22 : (x7 <= 127)) (PreH23 : ((-128) <= x8)) (PreH24 : (x8 <= 127)) (PreH25 : ((-128) <= x9)) (PreH26 : (x9 <= 127)) (PreH27 : ((-128) <= x10)) (PreH28 : (x10 <= 127)) (PreH29 : ((-128) <= x11)) (PreH30 : (x11 <= 127)) (PreH31 : ((-128) <= x12)) (PreH32 : (x12 <= 127)) (PreH33 : ((-128) <= x13)) (PreH34 : (x13 <= 127)) (PreH35 : ((-128) <= x14)) (PreH36 : (x14 <= 127)) (PreH37 : ((-128) <= x15)) (PreH38 : (x15 <= 127)) (PreH39 : ((-128) <= x16)) (PreH40 : (x16 <= 127)) (PreH41 : ((-128) <= x17)) (PreH42 : (x17 <= 127)) (PreH43 : ((-128) <= x18)) (PreH44 : (x18 <= 127)) (PreH45 : ((-128) <= x19)) (PreH46 : (x19 <= 127)) (PreH47 : ((-128) <= x20)) (PreH48 : (x20 <= 127)) (PreH49 : ((-128) <= x21)) (PreH50 : (x21 <= 127)) (PreH51 : ((-128) <= x22)) (PreH52 : (x22 <= 127)) (PreH53 : ((-128) <= x23)) (PreH54 : (x23 <= 127)) (PreH55 : ((-128) <= x24)) (PreH56 : (x24 <= 127)) (PreH57 : ((-128) <= x25)) (PreH58 : (x25 <= 127)) (PreH59 : ((-128) <= x26)) (PreH60 : (x26 <= 127)) (PreH61 : ((-128) <= x27)) (PreH62 : (x27 <= 127)) (PreH63 : ((-128) <= x28)) (PreH64 : (x28 <= 127)) (PreH65 : ((-128) <= x29)) (PreH66 : (x29 <= 127)) (PreH67 : ((-128) <= x30)) (PreH68 : (x30 <= 127)) (PreH69 : ((-128) <= x31)) (PreH70 : (x31 <= 127)) ,
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

Definition qcp_qa_rvv_get32_safety_wit_6 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 2)) (PreH2 : (i_pre < 4)) (PreH3 : (i_pre < 8)) (PreH4 : (i_pre < 16)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : ((-128) <= x0)) (PreH8 : (x0 <= 127)) (PreH9 : ((-128) <= x1)) (PreH10 : (x1 <= 127)) (PreH11 : ((-128) <= x2)) (PreH12 : (x2 <= 127)) (PreH13 : ((-128) <= x3)) (PreH14 : (x3 <= 127)) (PreH15 : ((-128) <= x4)) (PreH16 : (x4 <= 127)) (PreH17 : ((-128) <= x5)) (PreH18 : (x5 <= 127)) (PreH19 : ((-128) <= x6)) (PreH20 : (x6 <= 127)) (PreH21 : ((-128) <= x7)) (PreH22 : (x7 <= 127)) (PreH23 : ((-128) <= x8)) (PreH24 : (x8 <= 127)) (PreH25 : ((-128) <= x9)) (PreH26 : (x9 <= 127)) (PreH27 : ((-128) <= x10)) (PreH28 : (x10 <= 127)) (PreH29 : ((-128) <= x11)) (PreH30 : (x11 <= 127)) (PreH31 : ((-128) <= x12)) (PreH32 : (x12 <= 127)) (PreH33 : ((-128) <= x13)) (PreH34 : (x13 <= 127)) (PreH35 : ((-128) <= x14)) (PreH36 : (x14 <= 127)) (PreH37 : ((-128) <= x15)) (PreH38 : (x15 <= 127)) (PreH39 : ((-128) <= x16)) (PreH40 : (x16 <= 127)) (PreH41 : ((-128) <= x17)) (PreH42 : (x17 <= 127)) (PreH43 : ((-128) <= x18)) (PreH44 : (x18 <= 127)) (PreH45 : ((-128) <= x19)) (PreH46 : (x19 <= 127)) (PreH47 : ((-128) <= x20)) (PreH48 : (x20 <= 127)) (PreH49 : ((-128) <= x21)) (PreH50 : (x21 <= 127)) (PreH51 : ((-128) <= x22)) (PreH52 : (x22 <= 127)) (PreH53 : ((-128) <= x23)) (PreH54 : (x23 <= 127)) (PreH55 : ((-128) <= x24)) (PreH56 : (x24 <= 127)) (PreH57 : ((-128) <= x25)) (PreH58 : (x25 <= 127)) (PreH59 : ((-128) <= x26)) (PreH60 : (x26 <= 127)) (PreH61 : ((-128) <= x27)) (PreH62 : (x27 <= 127)) (PreH63 : ((-128) <= x28)) (PreH64 : (x28 <= 127)) (PreH65 : ((-128) <= x29)) (PreH66 : (x29 <= 127)) (PreH67 : ((-128) <= x30)) (PreH68 : (x30 <= 127)) (PreH69 : ((-128) <= x31)) (PreH70 : (x31 <= 127)) ,
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

Definition qcp_qa_rvv_get32_safety_wit_7 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 4)) (PreH2 : (i_pre < 8)) (PreH3 : (i_pre < 16)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : ((-128) <= x0)) (PreH7 : (x0 <= 127)) (PreH8 : ((-128) <= x1)) (PreH9 : (x1 <= 127)) (PreH10 : ((-128) <= x2)) (PreH11 : (x2 <= 127)) (PreH12 : ((-128) <= x3)) (PreH13 : (x3 <= 127)) (PreH14 : ((-128) <= x4)) (PreH15 : (x4 <= 127)) (PreH16 : ((-128) <= x5)) (PreH17 : (x5 <= 127)) (PreH18 : ((-128) <= x6)) (PreH19 : (x6 <= 127)) (PreH20 : ((-128) <= x7)) (PreH21 : (x7 <= 127)) (PreH22 : ((-128) <= x8)) (PreH23 : (x8 <= 127)) (PreH24 : ((-128) <= x9)) (PreH25 : (x9 <= 127)) (PreH26 : ((-128) <= x10)) (PreH27 : (x10 <= 127)) (PreH28 : ((-128) <= x11)) (PreH29 : (x11 <= 127)) (PreH30 : ((-128) <= x12)) (PreH31 : (x12 <= 127)) (PreH32 : ((-128) <= x13)) (PreH33 : (x13 <= 127)) (PreH34 : ((-128) <= x14)) (PreH35 : (x14 <= 127)) (PreH36 : ((-128) <= x15)) (PreH37 : (x15 <= 127)) (PreH38 : ((-128) <= x16)) (PreH39 : (x16 <= 127)) (PreH40 : ((-128) <= x17)) (PreH41 : (x17 <= 127)) (PreH42 : ((-128) <= x18)) (PreH43 : (x18 <= 127)) (PreH44 : ((-128) <= x19)) (PreH45 : (x19 <= 127)) (PreH46 : ((-128) <= x20)) (PreH47 : (x20 <= 127)) (PreH48 : ((-128) <= x21)) (PreH49 : (x21 <= 127)) (PreH50 : ((-128) <= x22)) (PreH51 : (x22 <= 127)) (PreH52 : ((-128) <= x23)) (PreH53 : (x23 <= 127)) (PreH54 : ((-128) <= x24)) (PreH55 : (x24 <= 127)) (PreH56 : ((-128) <= x25)) (PreH57 : (x25 <= 127)) (PreH58 : ((-128) <= x26)) (PreH59 : (x26 <= 127)) (PreH60 : ((-128) <= x27)) (PreH61 : (x27 <= 127)) (PreH62 : ((-128) <= x28)) (PreH63 : (x28 <= 127)) (PreH64 : ((-128) <= x29)) (PreH65 : (x29 <= 127)) (PreH66 : ((-128) <= x30)) (PreH67 : (x30 <= 127)) (PreH68 : ((-128) <= x31)) (PreH69 : (x31 <= 127)) ,
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

Definition qcp_qa_rvv_get32_safety_wit_8 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 6)) (PreH2 : (i_pre >= 4)) (PreH3 : (i_pre < 8)) (PreH4 : (i_pre < 16)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : ((-128) <= x0)) (PreH8 : (x0 <= 127)) (PreH9 : ((-128) <= x1)) (PreH10 : (x1 <= 127)) (PreH11 : ((-128) <= x2)) (PreH12 : (x2 <= 127)) (PreH13 : ((-128) <= x3)) (PreH14 : (x3 <= 127)) (PreH15 : ((-128) <= x4)) (PreH16 : (x4 <= 127)) (PreH17 : ((-128) <= x5)) (PreH18 : (x5 <= 127)) (PreH19 : ((-128) <= x6)) (PreH20 : (x6 <= 127)) (PreH21 : ((-128) <= x7)) (PreH22 : (x7 <= 127)) (PreH23 : ((-128) <= x8)) (PreH24 : (x8 <= 127)) (PreH25 : ((-128) <= x9)) (PreH26 : (x9 <= 127)) (PreH27 : ((-128) <= x10)) (PreH28 : (x10 <= 127)) (PreH29 : ((-128) <= x11)) (PreH30 : (x11 <= 127)) (PreH31 : ((-128) <= x12)) (PreH32 : (x12 <= 127)) (PreH33 : ((-128) <= x13)) (PreH34 : (x13 <= 127)) (PreH35 : ((-128) <= x14)) (PreH36 : (x14 <= 127)) (PreH37 : ((-128) <= x15)) (PreH38 : (x15 <= 127)) (PreH39 : ((-128) <= x16)) (PreH40 : (x16 <= 127)) (PreH41 : ((-128) <= x17)) (PreH42 : (x17 <= 127)) (PreH43 : ((-128) <= x18)) (PreH44 : (x18 <= 127)) (PreH45 : ((-128) <= x19)) (PreH46 : (x19 <= 127)) (PreH47 : ((-128) <= x20)) (PreH48 : (x20 <= 127)) (PreH49 : ((-128) <= x21)) (PreH50 : (x21 <= 127)) (PreH51 : ((-128) <= x22)) (PreH52 : (x22 <= 127)) (PreH53 : ((-128) <= x23)) (PreH54 : (x23 <= 127)) (PreH55 : ((-128) <= x24)) (PreH56 : (x24 <= 127)) (PreH57 : ((-128) <= x25)) (PreH58 : (x25 <= 127)) (PreH59 : ((-128) <= x26)) (PreH60 : (x26 <= 127)) (PreH61 : ((-128) <= x27)) (PreH62 : (x27 <= 127)) (PreH63 : ((-128) <= x28)) (PreH64 : (x28 <= 127)) (PreH65 : ((-128) <= x29)) (PreH66 : (x29 <= 127)) (PreH67 : ((-128) <= x30)) (PreH68 : (x30 <= 127)) (PreH69 : ((-128) <= x31)) (PreH70 : (x31 <= 127)) ,
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

Definition qcp_qa_rvv_get32_safety_wit_9 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 6)) (PreH2 : (i_pre >= 4)) (PreH3 : (i_pre < 8)) (PreH4 : (i_pre < 16)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : ((-128) <= x0)) (PreH8 : (x0 <= 127)) (PreH9 : ((-128) <= x1)) (PreH10 : (x1 <= 127)) (PreH11 : ((-128) <= x2)) (PreH12 : (x2 <= 127)) (PreH13 : ((-128) <= x3)) (PreH14 : (x3 <= 127)) (PreH15 : ((-128) <= x4)) (PreH16 : (x4 <= 127)) (PreH17 : ((-128) <= x5)) (PreH18 : (x5 <= 127)) (PreH19 : ((-128) <= x6)) (PreH20 : (x6 <= 127)) (PreH21 : ((-128) <= x7)) (PreH22 : (x7 <= 127)) (PreH23 : ((-128) <= x8)) (PreH24 : (x8 <= 127)) (PreH25 : ((-128) <= x9)) (PreH26 : (x9 <= 127)) (PreH27 : ((-128) <= x10)) (PreH28 : (x10 <= 127)) (PreH29 : ((-128) <= x11)) (PreH30 : (x11 <= 127)) (PreH31 : ((-128) <= x12)) (PreH32 : (x12 <= 127)) (PreH33 : ((-128) <= x13)) (PreH34 : (x13 <= 127)) (PreH35 : ((-128) <= x14)) (PreH36 : (x14 <= 127)) (PreH37 : ((-128) <= x15)) (PreH38 : (x15 <= 127)) (PreH39 : ((-128) <= x16)) (PreH40 : (x16 <= 127)) (PreH41 : ((-128) <= x17)) (PreH42 : (x17 <= 127)) (PreH43 : ((-128) <= x18)) (PreH44 : (x18 <= 127)) (PreH45 : ((-128) <= x19)) (PreH46 : (x19 <= 127)) (PreH47 : ((-128) <= x20)) (PreH48 : (x20 <= 127)) (PreH49 : ((-128) <= x21)) (PreH50 : (x21 <= 127)) (PreH51 : ((-128) <= x22)) (PreH52 : (x22 <= 127)) (PreH53 : ((-128) <= x23)) (PreH54 : (x23 <= 127)) (PreH55 : ((-128) <= x24)) (PreH56 : (x24 <= 127)) (PreH57 : ((-128) <= x25)) (PreH58 : (x25 <= 127)) (PreH59 : ((-128) <= x26)) (PreH60 : (x26 <= 127)) (PreH61 : ((-128) <= x27)) (PreH62 : (x27 <= 127)) (PreH63 : ((-128) <= x28)) (PreH64 : (x28 <= 127)) (PreH65 : ((-128) <= x29)) (PreH66 : (x29 <= 127)) (PreH67 : ((-128) <= x30)) (PreH68 : (x30 <= 127)) (PreH69 : ((-128) <= x31)) (PreH70 : (x31 <= 127)) ,
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

Definition qcp_qa_rvv_get32_safety_wit_10 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 8)) (PreH2 : (i_pre < 16)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : ((-128) <= x0)) (PreH6 : (x0 <= 127)) (PreH7 : ((-128) <= x1)) (PreH8 : (x1 <= 127)) (PreH9 : ((-128) <= x2)) (PreH10 : (x2 <= 127)) (PreH11 : ((-128) <= x3)) (PreH12 : (x3 <= 127)) (PreH13 : ((-128) <= x4)) (PreH14 : (x4 <= 127)) (PreH15 : ((-128) <= x5)) (PreH16 : (x5 <= 127)) (PreH17 : ((-128) <= x6)) (PreH18 : (x6 <= 127)) (PreH19 : ((-128) <= x7)) (PreH20 : (x7 <= 127)) (PreH21 : ((-128) <= x8)) (PreH22 : (x8 <= 127)) (PreH23 : ((-128) <= x9)) (PreH24 : (x9 <= 127)) (PreH25 : ((-128) <= x10)) (PreH26 : (x10 <= 127)) (PreH27 : ((-128) <= x11)) (PreH28 : (x11 <= 127)) (PreH29 : ((-128) <= x12)) (PreH30 : (x12 <= 127)) (PreH31 : ((-128) <= x13)) (PreH32 : (x13 <= 127)) (PreH33 : ((-128) <= x14)) (PreH34 : (x14 <= 127)) (PreH35 : ((-128) <= x15)) (PreH36 : (x15 <= 127)) (PreH37 : ((-128) <= x16)) (PreH38 : (x16 <= 127)) (PreH39 : ((-128) <= x17)) (PreH40 : (x17 <= 127)) (PreH41 : ((-128) <= x18)) (PreH42 : (x18 <= 127)) (PreH43 : ((-128) <= x19)) (PreH44 : (x19 <= 127)) (PreH45 : ((-128) <= x20)) (PreH46 : (x20 <= 127)) (PreH47 : ((-128) <= x21)) (PreH48 : (x21 <= 127)) (PreH49 : ((-128) <= x22)) (PreH50 : (x22 <= 127)) (PreH51 : ((-128) <= x23)) (PreH52 : (x23 <= 127)) (PreH53 : ((-128) <= x24)) (PreH54 : (x24 <= 127)) (PreH55 : ((-128) <= x25)) (PreH56 : (x25 <= 127)) (PreH57 : ((-128) <= x26)) (PreH58 : (x26 <= 127)) (PreH59 : ((-128) <= x27)) (PreH60 : (x27 <= 127)) (PreH61 : ((-128) <= x28)) (PreH62 : (x28 <= 127)) (PreH63 : ((-128) <= x29)) (PreH64 : (x29 <= 127)) (PreH65 : ((-128) <= x30)) (PreH66 : (x30 <= 127)) (PreH67 : ((-128) <= x31)) (PreH68 : (x31 <= 127)) ,
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

Definition qcp_qa_rvv_get32_safety_wit_11 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 12)) (PreH2 : (i_pre >= 8)) (PreH3 : (i_pre < 16)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : ((-128) <= x0)) (PreH7 : (x0 <= 127)) (PreH8 : ((-128) <= x1)) (PreH9 : (x1 <= 127)) (PreH10 : ((-128) <= x2)) (PreH11 : (x2 <= 127)) (PreH12 : ((-128) <= x3)) (PreH13 : (x3 <= 127)) (PreH14 : ((-128) <= x4)) (PreH15 : (x4 <= 127)) (PreH16 : ((-128) <= x5)) (PreH17 : (x5 <= 127)) (PreH18 : ((-128) <= x6)) (PreH19 : (x6 <= 127)) (PreH20 : ((-128) <= x7)) (PreH21 : (x7 <= 127)) (PreH22 : ((-128) <= x8)) (PreH23 : (x8 <= 127)) (PreH24 : ((-128) <= x9)) (PreH25 : (x9 <= 127)) (PreH26 : ((-128) <= x10)) (PreH27 : (x10 <= 127)) (PreH28 : ((-128) <= x11)) (PreH29 : (x11 <= 127)) (PreH30 : ((-128) <= x12)) (PreH31 : (x12 <= 127)) (PreH32 : ((-128) <= x13)) (PreH33 : (x13 <= 127)) (PreH34 : ((-128) <= x14)) (PreH35 : (x14 <= 127)) (PreH36 : ((-128) <= x15)) (PreH37 : (x15 <= 127)) (PreH38 : ((-128) <= x16)) (PreH39 : (x16 <= 127)) (PreH40 : ((-128) <= x17)) (PreH41 : (x17 <= 127)) (PreH42 : ((-128) <= x18)) (PreH43 : (x18 <= 127)) (PreH44 : ((-128) <= x19)) (PreH45 : (x19 <= 127)) (PreH46 : ((-128) <= x20)) (PreH47 : (x20 <= 127)) (PreH48 : ((-128) <= x21)) (PreH49 : (x21 <= 127)) (PreH50 : ((-128) <= x22)) (PreH51 : (x22 <= 127)) (PreH52 : ((-128) <= x23)) (PreH53 : (x23 <= 127)) (PreH54 : ((-128) <= x24)) (PreH55 : (x24 <= 127)) (PreH56 : ((-128) <= x25)) (PreH57 : (x25 <= 127)) (PreH58 : ((-128) <= x26)) (PreH59 : (x26 <= 127)) (PreH60 : ((-128) <= x27)) (PreH61 : (x27 <= 127)) (PreH62 : ((-128) <= x28)) (PreH63 : (x28 <= 127)) (PreH64 : ((-128) <= x29)) (PreH65 : (x29 <= 127)) (PreH66 : ((-128) <= x30)) (PreH67 : (x30 <= 127)) (PreH68 : ((-128) <= x31)) (PreH69 : (x31 <= 127)) ,
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

Definition qcp_qa_rvv_get32_safety_wit_12 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 10)) (PreH2 : (i_pre < 12)) (PreH3 : (i_pre >= 8)) (PreH4 : (i_pre < 16)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : ((-128) <= x0)) (PreH8 : (x0 <= 127)) (PreH9 : ((-128) <= x1)) (PreH10 : (x1 <= 127)) (PreH11 : ((-128) <= x2)) (PreH12 : (x2 <= 127)) (PreH13 : ((-128) <= x3)) (PreH14 : (x3 <= 127)) (PreH15 : ((-128) <= x4)) (PreH16 : (x4 <= 127)) (PreH17 : ((-128) <= x5)) (PreH18 : (x5 <= 127)) (PreH19 : ((-128) <= x6)) (PreH20 : (x6 <= 127)) (PreH21 : ((-128) <= x7)) (PreH22 : (x7 <= 127)) (PreH23 : ((-128) <= x8)) (PreH24 : (x8 <= 127)) (PreH25 : ((-128) <= x9)) (PreH26 : (x9 <= 127)) (PreH27 : ((-128) <= x10)) (PreH28 : (x10 <= 127)) (PreH29 : ((-128) <= x11)) (PreH30 : (x11 <= 127)) (PreH31 : ((-128) <= x12)) (PreH32 : (x12 <= 127)) (PreH33 : ((-128) <= x13)) (PreH34 : (x13 <= 127)) (PreH35 : ((-128) <= x14)) (PreH36 : (x14 <= 127)) (PreH37 : ((-128) <= x15)) (PreH38 : (x15 <= 127)) (PreH39 : ((-128) <= x16)) (PreH40 : (x16 <= 127)) (PreH41 : ((-128) <= x17)) (PreH42 : (x17 <= 127)) (PreH43 : ((-128) <= x18)) (PreH44 : (x18 <= 127)) (PreH45 : ((-128) <= x19)) (PreH46 : (x19 <= 127)) (PreH47 : ((-128) <= x20)) (PreH48 : (x20 <= 127)) (PreH49 : ((-128) <= x21)) (PreH50 : (x21 <= 127)) (PreH51 : ((-128) <= x22)) (PreH52 : (x22 <= 127)) (PreH53 : ((-128) <= x23)) (PreH54 : (x23 <= 127)) (PreH55 : ((-128) <= x24)) (PreH56 : (x24 <= 127)) (PreH57 : ((-128) <= x25)) (PreH58 : (x25 <= 127)) (PreH59 : ((-128) <= x26)) (PreH60 : (x26 <= 127)) (PreH61 : ((-128) <= x27)) (PreH62 : (x27 <= 127)) (PreH63 : ((-128) <= x28)) (PreH64 : (x28 <= 127)) (PreH65 : ((-128) <= x29)) (PreH66 : (x29 <= 127)) (PreH67 : ((-128) <= x30)) (PreH68 : (x30 <= 127)) (PreH69 : ((-128) <= x31)) (PreH70 : (x31 <= 127)) ,
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

Definition qcp_qa_rvv_get32_safety_wit_13 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 10)) (PreH2 : (i_pre < 12)) (PreH3 : (i_pre >= 8)) (PreH4 : (i_pre < 16)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : ((-128) <= x0)) (PreH8 : (x0 <= 127)) (PreH9 : ((-128) <= x1)) (PreH10 : (x1 <= 127)) (PreH11 : ((-128) <= x2)) (PreH12 : (x2 <= 127)) (PreH13 : ((-128) <= x3)) (PreH14 : (x3 <= 127)) (PreH15 : ((-128) <= x4)) (PreH16 : (x4 <= 127)) (PreH17 : ((-128) <= x5)) (PreH18 : (x5 <= 127)) (PreH19 : ((-128) <= x6)) (PreH20 : (x6 <= 127)) (PreH21 : ((-128) <= x7)) (PreH22 : (x7 <= 127)) (PreH23 : ((-128) <= x8)) (PreH24 : (x8 <= 127)) (PreH25 : ((-128) <= x9)) (PreH26 : (x9 <= 127)) (PreH27 : ((-128) <= x10)) (PreH28 : (x10 <= 127)) (PreH29 : ((-128) <= x11)) (PreH30 : (x11 <= 127)) (PreH31 : ((-128) <= x12)) (PreH32 : (x12 <= 127)) (PreH33 : ((-128) <= x13)) (PreH34 : (x13 <= 127)) (PreH35 : ((-128) <= x14)) (PreH36 : (x14 <= 127)) (PreH37 : ((-128) <= x15)) (PreH38 : (x15 <= 127)) (PreH39 : ((-128) <= x16)) (PreH40 : (x16 <= 127)) (PreH41 : ((-128) <= x17)) (PreH42 : (x17 <= 127)) (PreH43 : ((-128) <= x18)) (PreH44 : (x18 <= 127)) (PreH45 : ((-128) <= x19)) (PreH46 : (x19 <= 127)) (PreH47 : ((-128) <= x20)) (PreH48 : (x20 <= 127)) (PreH49 : ((-128) <= x21)) (PreH50 : (x21 <= 127)) (PreH51 : ((-128) <= x22)) (PreH52 : (x22 <= 127)) (PreH53 : ((-128) <= x23)) (PreH54 : (x23 <= 127)) (PreH55 : ((-128) <= x24)) (PreH56 : (x24 <= 127)) (PreH57 : ((-128) <= x25)) (PreH58 : (x25 <= 127)) (PreH59 : ((-128) <= x26)) (PreH60 : (x26 <= 127)) (PreH61 : ((-128) <= x27)) (PreH62 : (x27 <= 127)) (PreH63 : ((-128) <= x28)) (PreH64 : (x28 <= 127)) (PreH65 : ((-128) <= x29)) (PreH66 : (x29 <= 127)) (PreH67 : ((-128) <= x30)) (PreH68 : (x30 <= 127)) (PreH69 : ((-128) <= x31)) (PreH70 : (x31 <= 127)) ,
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

Definition qcp_qa_rvv_get32_safety_wit_14 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 12)) (PreH2 : (i_pre >= 8)) (PreH3 : (i_pre < 16)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : ((-128) <= x0)) (PreH7 : (x0 <= 127)) (PreH8 : ((-128) <= x1)) (PreH9 : (x1 <= 127)) (PreH10 : ((-128) <= x2)) (PreH11 : (x2 <= 127)) (PreH12 : ((-128) <= x3)) (PreH13 : (x3 <= 127)) (PreH14 : ((-128) <= x4)) (PreH15 : (x4 <= 127)) (PreH16 : ((-128) <= x5)) (PreH17 : (x5 <= 127)) (PreH18 : ((-128) <= x6)) (PreH19 : (x6 <= 127)) (PreH20 : ((-128) <= x7)) (PreH21 : (x7 <= 127)) (PreH22 : ((-128) <= x8)) (PreH23 : (x8 <= 127)) (PreH24 : ((-128) <= x9)) (PreH25 : (x9 <= 127)) (PreH26 : ((-128) <= x10)) (PreH27 : (x10 <= 127)) (PreH28 : ((-128) <= x11)) (PreH29 : (x11 <= 127)) (PreH30 : ((-128) <= x12)) (PreH31 : (x12 <= 127)) (PreH32 : ((-128) <= x13)) (PreH33 : (x13 <= 127)) (PreH34 : ((-128) <= x14)) (PreH35 : (x14 <= 127)) (PreH36 : ((-128) <= x15)) (PreH37 : (x15 <= 127)) (PreH38 : ((-128) <= x16)) (PreH39 : (x16 <= 127)) (PreH40 : ((-128) <= x17)) (PreH41 : (x17 <= 127)) (PreH42 : ((-128) <= x18)) (PreH43 : (x18 <= 127)) (PreH44 : ((-128) <= x19)) (PreH45 : (x19 <= 127)) (PreH46 : ((-128) <= x20)) (PreH47 : (x20 <= 127)) (PreH48 : ((-128) <= x21)) (PreH49 : (x21 <= 127)) (PreH50 : ((-128) <= x22)) (PreH51 : (x22 <= 127)) (PreH52 : ((-128) <= x23)) (PreH53 : (x23 <= 127)) (PreH54 : ((-128) <= x24)) (PreH55 : (x24 <= 127)) (PreH56 : ((-128) <= x25)) (PreH57 : (x25 <= 127)) (PreH58 : ((-128) <= x26)) (PreH59 : (x26 <= 127)) (PreH60 : ((-128) <= x27)) (PreH61 : (x27 <= 127)) (PreH62 : ((-128) <= x28)) (PreH63 : (x28 <= 127)) (PreH64 : ((-128) <= x29)) (PreH65 : (x29 <= 127)) (PreH66 : ((-128) <= x30)) (PreH67 : (x30 <= 127)) (PreH68 : ((-128) <= x31)) (PreH69 : (x31 <= 127)) ,
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

Definition qcp_qa_rvv_get32_safety_wit_15 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 14)) (PreH2 : (i_pre >= 12)) (PreH3 : (i_pre >= 8)) (PreH4 : (i_pre < 16)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : ((-128) <= x0)) (PreH8 : (x0 <= 127)) (PreH9 : ((-128) <= x1)) (PreH10 : (x1 <= 127)) (PreH11 : ((-128) <= x2)) (PreH12 : (x2 <= 127)) (PreH13 : ((-128) <= x3)) (PreH14 : (x3 <= 127)) (PreH15 : ((-128) <= x4)) (PreH16 : (x4 <= 127)) (PreH17 : ((-128) <= x5)) (PreH18 : (x5 <= 127)) (PreH19 : ((-128) <= x6)) (PreH20 : (x6 <= 127)) (PreH21 : ((-128) <= x7)) (PreH22 : (x7 <= 127)) (PreH23 : ((-128) <= x8)) (PreH24 : (x8 <= 127)) (PreH25 : ((-128) <= x9)) (PreH26 : (x9 <= 127)) (PreH27 : ((-128) <= x10)) (PreH28 : (x10 <= 127)) (PreH29 : ((-128) <= x11)) (PreH30 : (x11 <= 127)) (PreH31 : ((-128) <= x12)) (PreH32 : (x12 <= 127)) (PreH33 : ((-128) <= x13)) (PreH34 : (x13 <= 127)) (PreH35 : ((-128) <= x14)) (PreH36 : (x14 <= 127)) (PreH37 : ((-128) <= x15)) (PreH38 : (x15 <= 127)) (PreH39 : ((-128) <= x16)) (PreH40 : (x16 <= 127)) (PreH41 : ((-128) <= x17)) (PreH42 : (x17 <= 127)) (PreH43 : ((-128) <= x18)) (PreH44 : (x18 <= 127)) (PreH45 : ((-128) <= x19)) (PreH46 : (x19 <= 127)) (PreH47 : ((-128) <= x20)) (PreH48 : (x20 <= 127)) (PreH49 : ((-128) <= x21)) (PreH50 : (x21 <= 127)) (PreH51 : ((-128) <= x22)) (PreH52 : (x22 <= 127)) (PreH53 : ((-128) <= x23)) (PreH54 : (x23 <= 127)) (PreH55 : ((-128) <= x24)) (PreH56 : (x24 <= 127)) (PreH57 : ((-128) <= x25)) (PreH58 : (x25 <= 127)) (PreH59 : ((-128) <= x26)) (PreH60 : (x26 <= 127)) (PreH61 : ((-128) <= x27)) (PreH62 : (x27 <= 127)) (PreH63 : ((-128) <= x28)) (PreH64 : (x28 <= 127)) (PreH65 : ((-128) <= x29)) (PreH66 : (x29 <= 127)) (PreH67 : ((-128) <= x30)) (PreH68 : (x30 <= 127)) (PreH69 : ((-128) <= x31)) (PreH70 : (x31 <= 127)) ,
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

Definition qcp_qa_rvv_get32_safety_wit_16 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 14)) (PreH2 : (i_pre >= 12)) (PreH3 : (i_pre >= 8)) (PreH4 : (i_pre < 16)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : ((-128) <= x0)) (PreH8 : (x0 <= 127)) (PreH9 : ((-128) <= x1)) (PreH10 : (x1 <= 127)) (PreH11 : ((-128) <= x2)) (PreH12 : (x2 <= 127)) (PreH13 : ((-128) <= x3)) (PreH14 : (x3 <= 127)) (PreH15 : ((-128) <= x4)) (PreH16 : (x4 <= 127)) (PreH17 : ((-128) <= x5)) (PreH18 : (x5 <= 127)) (PreH19 : ((-128) <= x6)) (PreH20 : (x6 <= 127)) (PreH21 : ((-128) <= x7)) (PreH22 : (x7 <= 127)) (PreH23 : ((-128) <= x8)) (PreH24 : (x8 <= 127)) (PreH25 : ((-128) <= x9)) (PreH26 : (x9 <= 127)) (PreH27 : ((-128) <= x10)) (PreH28 : (x10 <= 127)) (PreH29 : ((-128) <= x11)) (PreH30 : (x11 <= 127)) (PreH31 : ((-128) <= x12)) (PreH32 : (x12 <= 127)) (PreH33 : ((-128) <= x13)) (PreH34 : (x13 <= 127)) (PreH35 : ((-128) <= x14)) (PreH36 : (x14 <= 127)) (PreH37 : ((-128) <= x15)) (PreH38 : (x15 <= 127)) (PreH39 : ((-128) <= x16)) (PreH40 : (x16 <= 127)) (PreH41 : ((-128) <= x17)) (PreH42 : (x17 <= 127)) (PreH43 : ((-128) <= x18)) (PreH44 : (x18 <= 127)) (PreH45 : ((-128) <= x19)) (PreH46 : (x19 <= 127)) (PreH47 : ((-128) <= x20)) (PreH48 : (x20 <= 127)) (PreH49 : ((-128) <= x21)) (PreH50 : (x21 <= 127)) (PreH51 : ((-128) <= x22)) (PreH52 : (x22 <= 127)) (PreH53 : ((-128) <= x23)) (PreH54 : (x23 <= 127)) (PreH55 : ((-128) <= x24)) (PreH56 : (x24 <= 127)) (PreH57 : ((-128) <= x25)) (PreH58 : (x25 <= 127)) (PreH59 : ((-128) <= x26)) (PreH60 : (x26 <= 127)) (PreH61 : ((-128) <= x27)) (PreH62 : (x27 <= 127)) (PreH63 : ((-128) <= x28)) (PreH64 : (x28 <= 127)) (PreH65 : ((-128) <= x29)) (PreH66 : (x29 <= 127)) (PreH67 : ((-128) <= x30)) (PreH68 : (x30 <= 127)) (PreH69 : ((-128) <= x31)) (PreH70 : (x31 <= 127)) ,
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

Definition qcp_qa_rvv_get32_safety_wit_17 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 16)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : ((-128) <= x0)) (PreH5 : (x0 <= 127)) (PreH6 : ((-128) <= x1)) (PreH7 : (x1 <= 127)) (PreH8 : ((-128) <= x2)) (PreH9 : (x2 <= 127)) (PreH10 : ((-128) <= x3)) (PreH11 : (x3 <= 127)) (PreH12 : ((-128) <= x4)) (PreH13 : (x4 <= 127)) (PreH14 : ((-128) <= x5)) (PreH15 : (x5 <= 127)) (PreH16 : ((-128) <= x6)) (PreH17 : (x6 <= 127)) (PreH18 : ((-128) <= x7)) (PreH19 : (x7 <= 127)) (PreH20 : ((-128) <= x8)) (PreH21 : (x8 <= 127)) (PreH22 : ((-128) <= x9)) (PreH23 : (x9 <= 127)) (PreH24 : ((-128) <= x10)) (PreH25 : (x10 <= 127)) (PreH26 : ((-128) <= x11)) (PreH27 : (x11 <= 127)) (PreH28 : ((-128) <= x12)) (PreH29 : (x12 <= 127)) (PreH30 : ((-128) <= x13)) (PreH31 : (x13 <= 127)) (PreH32 : ((-128) <= x14)) (PreH33 : (x14 <= 127)) (PreH34 : ((-128) <= x15)) (PreH35 : (x15 <= 127)) (PreH36 : ((-128) <= x16)) (PreH37 : (x16 <= 127)) (PreH38 : ((-128) <= x17)) (PreH39 : (x17 <= 127)) (PreH40 : ((-128) <= x18)) (PreH41 : (x18 <= 127)) (PreH42 : ((-128) <= x19)) (PreH43 : (x19 <= 127)) (PreH44 : ((-128) <= x20)) (PreH45 : (x20 <= 127)) (PreH46 : ((-128) <= x21)) (PreH47 : (x21 <= 127)) (PreH48 : ((-128) <= x22)) (PreH49 : (x22 <= 127)) (PreH50 : ((-128) <= x23)) (PreH51 : (x23 <= 127)) (PreH52 : ((-128) <= x24)) (PreH53 : (x24 <= 127)) (PreH54 : ((-128) <= x25)) (PreH55 : (x25 <= 127)) (PreH56 : ((-128) <= x26)) (PreH57 : (x26 <= 127)) (PreH58 : ((-128) <= x27)) (PreH59 : (x27 <= 127)) (PreH60 : ((-128) <= x28)) (PreH61 : (x28 <= 127)) (PreH62 : ((-128) <= x29)) (PreH63 : (x29 <= 127)) (PreH64 : ((-128) <= x30)) (PreH65 : (x30 <= 127)) (PreH66 : ((-128) <= x31)) (PreH67 : (x31 <= 127)) ,
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

Definition qcp_qa_rvv_get32_safety_wit_18 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 24)) (PreH2 : (i_pre >= 16)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : ((-128) <= x0)) (PreH6 : (x0 <= 127)) (PreH7 : ((-128) <= x1)) (PreH8 : (x1 <= 127)) (PreH9 : ((-128) <= x2)) (PreH10 : (x2 <= 127)) (PreH11 : ((-128) <= x3)) (PreH12 : (x3 <= 127)) (PreH13 : ((-128) <= x4)) (PreH14 : (x4 <= 127)) (PreH15 : ((-128) <= x5)) (PreH16 : (x5 <= 127)) (PreH17 : ((-128) <= x6)) (PreH18 : (x6 <= 127)) (PreH19 : ((-128) <= x7)) (PreH20 : (x7 <= 127)) (PreH21 : ((-128) <= x8)) (PreH22 : (x8 <= 127)) (PreH23 : ((-128) <= x9)) (PreH24 : (x9 <= 127)) (PreH25 : ((-128) <= x10)) (PreH26 : (x10 <= 127)) (PreH27 : ((-128) <= x11)) (PreH28 : (x11 <= 127)) (PreH29 : ((-128) <= x12)) (PreH30 : (x12 <= 127)) (PreH31 : ((-128) <= x13)) (PreH32 : (x13 <= 127)) (PreH33 : ((-128) <= x14)) (PreH34 : (x14 <= 127)) (PreH35 : ((-128) <= x15)) (PreH36 : (x15 <= 127)) (PreH37 : ((-128) <= x16)) (PreH38 : (x16 <= 127)) (PreH39 : ((-128) <= x17)) (PreH40 : (x17 <= 127)) (PreH41 : ((-128) <= x18)) (PreH42 : (x18 <= 127)) (PreH43 : ((-128) <= x19)) (PreH44 : (x19 <= 127)) (PreH45 : ((-128) <= x20)) (PreH46 : (x20 <= 127)) (PreH47 : ((-128) <= x21)) (PreH48 : (x21 <= 127)) (PreH49 : ((-128) <= x22)) (PreH50 : (x22 <= 127)) (PreH51 : ((-128) <= x23)) (PreH52 : (x23 <= 127)) (PreH53 : ((-128) <= x24)) (PreH54 : (x24 <= 127)) (PreH55 : ((-128) <= x25)) (PreH56 : (x25 <= 127)) (PreH57 : ((-128) <= x26)) (PreH58 : (x26 <= 127)) (PreH59 : ((-128) <= x27)) (PreH60 : (x27 <= 127)) (PreH61 : ((-128) <= x28)) (PreH62 : (x28 <= 127)) (PreH63 : ((-128) <= x29)) (PreH64 : (x29 <= 127)) (PreH65 : ((-128) <= x30)) (PreH66 : (x30 <= 127)) (PreH67 : ((-128) <= x31)) (PreH68 : (x31 <= 127)) ,
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

Definition qcp_qa_rvv_get32_safety_wit_19 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 20)) (PreH2 : (i_pre < 24)) (PreH3 : (i_pre >= 16)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : ((-128) <= x0)) (PreH7 : (x0 <= 127)) (PreH8 : ((-128) <= x1)) (PreH9 : (x1 <= 127)) (PreH10 : ((-128) <= x2)) (PreH11 : (x2 <= 127)) (PreH12 : ((-128) <= x3)) (PreH13 : (x3 <= 127)) (PreH14 : ((-128) <= x4)) (PreH15 : (x4 <= 127)) (PreH16 : ((-128) <= x5)) (PreH17 : (x5 <= 127)) (PreH18 : ((-128) <= x6)) (PreH19 : (x6 <= 127)) (PreH20 : ((-128) <= x7)) (PreH21 : (x7 <= 127)) (PreH22 : ((-128) <= x8)) (PreH23 : (x8 <= 127)) (PreH24 : ((-128) <= x9)) (PreH25 : (x9 <= 127)) (PreH26 : ((-128) <= x10)) (PreH27 : (x10 <= 127)) (PreH28 : ((-128) <= x11)) (PreH29 : (x11 <= 127)) (PreH30 : ((-128) <= x12)) (PreH31 : (x12 <= 127)) (PreH32 : ((-128) <= x13)) (PreH33 : (x13 <= 127)) (PreH34 : ((-128) <= x14)) (PreH35 : (x14 <= 127)) (PreH36 : ((-128) <= x15)) (PreH37 : (x15 <= 127)) (PreH38 : ((-128) <= x16)) (PreH39 : (x16 <= 127)) (PreH40 : ((-128) <= x17)) (PreH41 : (x17 <= 127)) (PreH42 : ((-128) <= x18)) (PreH43 : (x18 <= 127)) (PreH44 : ((-128) <= x19)) (PreH45 : (x19 <= 127)) (PreH46 : ((-128) <= x20)) (PreH47 : (x20 <= 127)) (PreH48 : ((-128) <= x21)) (PreH49 : (x21 <= 127)) (PreH50 : ((-128) <= x22)) (PreH51 : (x22 <= 127)) (PreH52 : ((-128) <= x23)) (PreH53 : (x23 <= 127)) (PreH54 : ((-128) <= x24)) (PreH55 : (x24 <= 127)) (PreH56 : ((-128) <= x25)) (PreH57 : (x25 <= 127)) (PreH58 : ((-128) <= x26)) (PreH59 : (x26 <= 127)) (PreH60 : ((-128) <= x27)) (PreH61 : (x27 <= 127)) (PreH62 : ((-128) <= x28)) (PreH63 : (x28 <= 127)) (PreH64 : ((-128) <= x29)) (PreH65 : (x29 <= 127)) (PreH66 : ((-128) <= x30)) (PreH67 : (x30 <= 127)) (PreH68 : ((-128) <= x31)) (PreH69 : (x31 <= 127)) ,
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

Definition qcp_qa_rvv_get32_safety_wit_20 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 18)) (PreH2 : (i_pre < 20)) (PreH3 : (i_pre < 24)) (PreH4 : (i_pre >= 16)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : ((-128) <= x0)) (PreH8 : (x0 <= 127)) (PreH9 : ((-128) <= x1)) (PreH10 : (x1 <= 127)) (PreH11 : ((-128) <= x2)) (PreH12 : (x2 <= 127)) (PreH13 : ((-128) <= x3)) (PreH14 : (x3 <= 127)) (PreH15 : ((-128) <= x4)) (PreH16 : (x4 <= 127)) (PreH17 : ((-128) <= x5)) (PreH18 : (x5 <= 127)) (PreH19 : ((-128) <= x6)) (PreH20 : (x6 <= 127)) (PreH21 : ((-128) <= x7)) (PreH22 : (x7 <= 127)) (PreH23 : ((-128) <= x8)) (PreH24 : (x8 <= 127)) (PreH25 : ((-128) <= x9)) (PreH26 : (x9 <= 127)) (PreH27 : ((-128) <= x10)) (PreH28 : (x10 <= 127)) (PreH29 : ((-128) <= x11)) (PreH30 : (x11 <= 127)) (PreH31 : ((-128) <= x12)) (PreH32 : (x12 <= 127)) (PreH33 : ((-128) <= x13)) (PreH34 : (x13 <= 127)) (PreH35 : ((-128) <= x14)) (PreH36 : (x14 <= 127)) (PreH37 : ((-128) <= x15)) (PreH38 : (x15 <= 127)) (PreH39 : ((-128) <= x16)) (PreH40 : (x16 <= 127)) (PreH41 : ((-128) <= x17)) (PreH42 : (x17 <= 127)) (PreH43 : ((-128) <= x18)) (PreH44 : (x18 <= 127)) (PreH45 : ((-128) <= x19)) (PreH46 : (x19 <= 127)) (PreH47 : ((-128) <= x20)) (PreH48 : (x20 <= 127)) (PreH49 : ((-128) <= x21)) (PreH50 : (x21 <= 127)) (PreH51 : ((-128) <= x22)) (PreH52 : (x22 <= 127)) (PreH53 : ((-128) <= x23)) (PreH54 : (x23 <= 127)) (PreH55 : ((-128) <= x24)) (PreH56 : (x24 <= 127)) (PreH57 : ((-128) <= x25)) (PreH58 : (x25 <= 127)) (PreH59 : ((-128) <= x26)) (PreH60 : (x26 <= 127)) (PreH61 : ((-128) <= x27)) (PreH62 : (x27 <= 127)) (PreH63 : ((-128) <= x28)) (PreH64 : (x28 <= 127)) (PreH65 : ((-128) <= x29)) (PreH66 : (x29 <= 127)) (PreH67 : ((-128) <= x30)) (PreH68 : (x30 <= 127)) (PreH69 : ((-128) <= x31)) (PreH70 : (x31 <= 127)) ,
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

Definition qcp_qa_rvv_get32_safety_wit_21 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 18)) (PreH2 : (i_pre < 20)) (PreH3 : (i_pre < 24)) (PreH4 : (i_pre >= 16)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : ((-128) <= x0)) (PreH8 : (x0 <= 127)) (PreH9 : ((-128) <= x1)) (PreH10 : (x1 <= 127)) (PreH11 : ((-128) <= x2)) (PreH12 : (x2 <= 127)) (PreH13 : ((-128) <= x3)) (PreH14 : (x3 <= 127)) (PreH15 : ((-128) <= x4)) (PreH16 : (x4 <= 127)) (PreH17 : ((-128) <= x5)) (PreH18 : (x5 <= 127)) (PreH19 : ((-128) <= x6)) (PreH20 : (x6 <= 127)) (PreH21 : ((-128) <= x7)) (PreH22 : (x7 <= 127)) (PreH23 : ((-128) <= x8)) (PreH24 : (x8 <= 127)) (PreH25 : ((-128) <= x9)) (PreH26 : (x9 <= 127)) (PreH27 : ((-128) <= x10)) (PreH28 : (x10 <= 127)) (PreH29 : ((-128) <= x11)) (PreH30 : (x11 <= 127)) (PreH31 : ((-128) <= x12)) (PreH32 : (x12 <= 127)) (PreH33 : ((-128) <= x13)) (PreH34 : (x13 <= 127)) (PreH35 : ((-128) <= x14)) (PreH36 : (x14 <= 127)) (PreH37 : ((-128) <= x15)) (PreH38 : (x15 <= 127)) (PreH39 : ((-128) <= x16)) (PreH40 : (x16 <= 127)) (PreH41 : ((-128) <= x17)) (PreH42 : (x17 <= 127)) (PreH43 : ((-128) <= x18)) (PreH44 : (x18 <= 127)) (PreH45 : ((-128) <= x19)) (PreH46 : (x19 <= 127)) (PreH47 : ((-128) <= x20)) (PreH48 : (x20 <= 127)) (PreH49 : ((-128) <= x21)) (PreH50 : (x21 <= 127)) (PreH51 : ((-128) <= x22)) (PreH52 : (x22 <= 127)) (PreH53 : ((-128) <= x23)) (PreH54 : (x23 <= 127)) (PreH55 : ((-128) <= x24)) (PreH56 : (x24 <= 127)) (PreH57 : ((-128) <= x25)) (PreH58 : (x25 <= 127)) (PreH59 : ((-128) <= x26)) (PreH60 : (x26 <= 127)) (PreH61 : ((-128) <= x27)) (PreH62 : (x27 <= 127)) (PreH63 : ((-128) <= x28)) (PreH64 : (x28 <= 127)) (PreH65 : ((-128) <= x29)) (PreH66 : (x29 <= 127)) (PreH67 : ((-128) <= x30)) (PreH68 : (x30 <= 127)) (PreH69 : ((-128) <= x31)) (PreH70 : (x31 <= 127)) ,
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

Definition qcp_qa_rvv_get32_safety_wit_22 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 20)) (PreH2 : (i_pre < 24)) (PreH3 : (i_pre >= 16)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : ((-128) <= x0)) (PreH7 : (x0 <= 127)) (PreH8 : ((-128) <= x1)) (PreH9 : (x1 <= 127)) (PreH10 : ((-128) <= x2)) (PreH11 : (x2 <= 127)) (PreH12 : ((-128) <= x3)) (PreH13 : (x3 <= 127)) (PreH14 : ((-128) <= x4)) (PreH15 : (x4 <= 127)) (PreH16 : ((-128) <= x5)) (PreH17 : (x5 <= 127)) (PreH18 : ((-128) <= x6)) (PreH19 : (x6 <= 127)) (PreH20 : ((-128) <= x7)) (PreH21 : (x7 <= 127)) (PreH22 : ((-128) <= x8)) (PreH23 : (x8 <= 127)) (PreH24 : ((-128) <= x9)) (PreH25 : (x9 <= 127)) (PreH26 : ((-128) <= x10)) (PreH27 : (x10 <= 127)) (PreH28 : ((-128) <= x11)) (PreH29 : (x11 <= 127)) (PreH30 : ((-128) <= x12)) (PreH31 : (x12 <= 127)) (PreH32 : ((-128) <= x13)) (PreH33 : (x13 <= 127)) (PreH34 : ((-128) <= x14)) (PreH35 : (x14 <= 127)) (PreH36 : ((-128) <= x15)) (PreH37 : (x15 <= 127)) (PreH38 : ((-128) <= x16)) (PreH39 : (x16 <= 127)) (PreH40 : ((-128) <= x17)) (PreH41 : (x17 <= 127)) (PreH42 : ((-128) <= x18)) (PreH43 : (x18 <= 127)) (PreH44 : ((-128) <= x19)) (PreH45 : (x19 <= 127)) (PreH46 : ((-128) <= x20)) (PreH47 : (x20 <= 127)) (PreH48 : ((-128) <= x21)) (PreH49 : (x21 <= 127)) (PreH50 : ((-128) <= x22)) (PreH51 : (x22 <= 127)) (PreH52 : ((-128) <= x23)) (PreH53 : (x23 <= 127)) (PreH54 : ((-128) <= x24)) (PreH55 : (x24 <= 127)) (PreH56 : ((-128) <= x25)) (PreH57 : (x25 <= 127)) (PreH58 : ((-128) <= x26)) (PreH59 : (x26 <= 127)) (PreH60 : ((-128) <= x27)) (PreH61 : (x27 <= 127)) (PreH62 : ((-128) <= x28)) (PreH63 : (x28 <= 127)) (PreH64 : ((-128) <= x29)) (PreH65 : (x29 <= 127)) (PreH66 : ((-128) <= x30)) (PreH67 : (x30 <= 127)) (PreH68 : ((-128) <= x31)) (PreH69 : (x31 <= 127)) ,
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

Definition qcp_qa_rvv_get32_safety_wit_23 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 22)) (PreH2 : (i_pre >= 20)) (PreH3 : (i_pre < 24)) (PreH4 : (i_pre >= 16)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : ((-128) <= x0)) (PreH8 : (x0 <= 127)) (PreH9 : ((-128) <= x1)) (PreH10 : (x1 <= 127)) (PreH11 : ((-128) <= x2)) (PreH12 : (x2 <= 127)) (PreH13 : ((-128) <= x3)) (PreH14 : (x3 <= 127)) (PreH15 : ((-128) <= x4)) (PreH16 : (x4 <= 127)) (PreH17 : ((-128) <= x5)) (PreH18 : (x5 <= 127)) (PreH19 : ((-128) <= x6)) (PreH20 : (x6 <= 127)) (PreH21 : ((-128) <= x7)) (PreH22 : (x7 <= 127)) (PreH23 : ((-128) <= x8)) (PreH24 : (x8 <= 127)) (PreH25 : ((-128) <= x9)) (PreH26 : (x9 <= 127)) (PreH27 : ((-128) <= x10)) (PreH28 : (x10 <= 127)) (PreH29 : ((-128) <= x11)) (PreH30 : (x11 <= 127)) (PreH31 : ((-128) <= x12)) (PreH32 : (x12 <= 127)) (PreH33 : ((-128) <= x13)) (PreH34 : (x13 <= 127)) (PreH35 : ((-128) <= x14)) (PreH36 : (x14 <= 127)) (PreH37 : ((-128) <= x15)) (PreH38 : (x15 <= 127)) (PreH39 : ((-128) <= x16)) (PreH40 : (x16 <= 127)) (PreH41 : ((-128) <= x17)) (PreH42 : (x17 <= 127)) (PreH43 : ((-128) <= x18)) (PreH44 : (x18 <= 127)) (PreH45 : ((-128) <= x19)) (PreH46 : (x19 <= 127)) (PreH47 : ((-128) <= x20)) (PreH48 : (x20 <= 127)) (PreH49 : ((-128) <= x21)) (PreH50 : (x21 <= 127)) (PreH51 : ((-128) <= x22)) (PreH52 : (x22 <= 127)) (PreH53 : ((-128) <= x23)) (PreH54 : (x23 <= 127)) (PreH55 : ((-128) <= x24)) (PreH56 : (x24 <= 127)) (PreH57 : ((-128) <= x25)) (PreH58 : (x25 <= 127)) (PreH59 : ((-128) <= x26)) (PreH60 : (x26 <= 127)) (PreH61 : ((-128) <= x27)) (PreH62 : (x27 <= 127)) (PreH63 : ((-128) <= x28)) (PreH64 : (x28 <= 127)) (PreH65 : ((-128) <= x29)) (PreH66 : (x29 <= 127)) (PreH67 : ((-128) <= x30)) (PreH68 : (x30 <= 127)) (PreH69 : ((-128) <= x31)) (PreH70 : (x31 <= 127)) ,
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

Definition qcp_qa_rvv_get32_safety_wit_24 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 22)) (PreH2 : (i_pre >= 20)) (PreH3 : (i_pre < 24)) (PreH4 : (i_pre >= 16)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : ((-128) <= x0)) (PreH8 : (x0 <= 127)) (PreH9 : ((-128) <= x1)) (PreH10 : (x1 <= 127)) (PreH11 : ((-128) <= x2)) (PreH12 : (x2 <= 127)) (PreH13 : ((-128) <= x3)) (PreH14 : (x3 <= 127)) (PreH15 : ((-128) <= x4)) (PreH16 : (x4 <= 127)) (PreH17 : ((-128) <= x5)) (PreH18 : (x5 <= 127)) (PreH19 : ((-128) <= x6)) (PreH20 : (x6 <= 127)) (PreH21 : ((-128) <= x7)) (PreH22 : (x7 <= 127)) (PreH23 : ((-128) <= x8)) (PreH24 : (x8 <= 127)) (PreH25 : ((-128) <= x9)) (PreH26 : (x9 <= 127)) (PreH27 : ((-128) <= x10)) (PreH28 : (x10 <= 127)) (PreH29 : ((-128) <= x11)) (PreH30 : (x11 <= 127)) (PreH31 : ((-128) <= x12)) (PreH32 : (x12 <= 127)) (PreH33 : ((-128) <= x13)) (PreH34 : (x13 <= 127)) (PreH35 : ((-128) <= x14)) (PreH36 : (x14 <= 127)) (PreH37 : ((-128) <= x15)) (PreH38 : (x15 <= 127)) (PreH39 : ((-128) <= x16)) (PreH40 : (x16 <= 127)) (PreH41 : ((-128) <= x17)) (PreH42 : (x17 <= 127)) (PreH43 : ((-128) <= x18)) (PreH44 : (x18 <= 127)) (PreH45 : ((-128) <= x19)) (PreH46 : (x19 <= 127)) (PreH47 : ((-128) <= x20)) (PreH48 : (x20 <= 127)) (PreH49 : ((-128) <= x21)) (PreH50 : (x21 <= 127)) (PreH51 : ((-128) <= x22)) (PreH52 : (x22 <= 127)) (PreH53 : ((-128) <= x23)) (PreH54 : (x23 <= 127)) (PreH55 : ((-128) <= x24)) (PreH56 : (x24 <= 127)) (PreH57 : ((-128) <= x25)) (PreH58 : (x25 <= 127)) (PreH59 : ((-128) <= x26)) (PreH60 : (x26 <= 127)) (PreH61 : ((-128) <= x27)) (PreH62 : (x27 <= 127)) (PreH63 : ((-128) <= x28)) (PreH64 : (x28 <= 127)) (PreH65 : ((-128) <= x29)) (PreH66 : (x29 <= 127)) (PreH67 : ((-128) <= x30)) (PreH68 : (x30 <= 127)) (PreH69 : ((-128) <= x31)) (PreH70 : (x31 <= 127)) ,
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

Definition qcp_qa_rvv_get32_safety_wit_25 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 24)) (PreH2 : (i_pre >= 16)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : ((-128) <= x0)) (PreH6 : (x0 <= 127)) (PreH7 : ((-128) <= x1)) (PreH8 : (x1 <= 127)) (PreH9 : ((-128) <= x2)) (PreH10 : (x2 <= 127)) (PreH11 : ((-128) <= x3)) (PreH12 : (x3 <= 127)) (PreH13 : ((-128) <= x4)) (PreH14 : (x4 <= 127)) (PreH15 : ((-128) <= x5)) (PreH16 : (x5 <= 127)) (PreH17 : ((-128) <= x6)) (PreH18 : (x6 <= 127)) (PreH19 : ((-128) <= x7)) (PreH20 : (x7 <= 127)) (PreH21 : ((-128) <= x8)) (PreH22 : (x8 <= 127)) (PreH23 : ((-128) <= x9)) (PreH24 : (x9 <= 127)) (PreH25 : ((-128) <= x10)) (PreH26 : (x10 <= 127)) (PreH27 : ((-128) <= x11)) (PreH28 : (x11 <= 127)) (PreH29 : ((-128) <= x12)) (PreH30 : (x12 <= 127)) (PreH31 : ((-128) <= x13)) (PreH32 : (x13 <= 127)) (PreH33 : ((-128) <= x14)) (PreH34 : (x14 <= 127)) (PreH35 : ((-128) <= x15)) (PreH36 : (x15 <= 127)) (PreH37 : ((-128) <= x16)) (PreH38 : (x16 <= 127)) (PreH39 : ((-128) <= x17)) (PreH40 : (x17 <= 127)) (PreH41 : ((-128) <= x18)) (PreH42 : (x18 <= 127)) (PreH43 : ((-128) <= x19)) (PreH44 : (x19 <= 127)) (PreH45 : ((-128) <= x20)) (PreH46 : (x20 <= 127)) (PreH47 : ((-128) <= x21)) (PreH48 : (x21 <= 127)) (PreH49 : ((-128) <= x22)) (PreH50 : (x22 <= 127)) (PreH51 : ((-128) <= x23)) (PreH52 : (x23 <= 127)) (PreH53 : ((-128) <= x24)) (PreH54 : (x24 <= 127)) (PreH55 : ((-128) <= x25)) (PreH56 : (x25 <= 127)) (PreH57 : ((-128) <= x26)) (PreH58 : (x26 <= 127)) (PreH59 : ((-128) <= x27)) (PreH60 : (x27 <= 127)) (PreH61 : ((-128) <= x28)) (PreH62 : (x28 <= 127)) (PreH63 : ((-128) <= x29)) (PreH64 : (x29 <= 127)) (PreH65 : ((-128) <= x30)) (PreH66 : (x30 <= 127)) (PreH67 : ((-128) <= x31)) (PreH68 : (x31 <= 127)) ,
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

Definition qcp_qa_rvv_get32_safety_wit_26 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 28)) (PreH2 : (i_pre >= 24)) (PreH3 : (i_pre >= 16)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : ((-128) <= x0)) (PreH7 : (x0 <= 127)) (PreH8 : ((-128) <= x1)) (PreH9 : (x1 <= 127)) (PreH10 : ((-128) <= x2)) (PreH11 : (x2 <= 127)) (PreH12 : ((-128) <= x3)) (PreH13 : (x3 <= 127)) (PreH14 : ((-128) <= x4)) (PreH15 : (x4 <= 127)) (PreH16 : ((-128) <= x5)) (PreH17 : (x5 <= 127)) (PreH18 : ((-128) <= x6)) (PreH19 : (x6 <= 127)) (PreH20 : ((-128) <= x7)) (PreH21 : (x7 <= 127)) (PreH22 : ((-128) <= x8)) (PreH23 : (x8 <= 127)) (PreH24 : ((-128) <= x9)) (PreH25 : (x9 <= 127)) (PreH26 : ((-128) <= x10)) (PreH27 : (x10 <= 127)) (PreH28 : ((-128) <= x11)) (PreH29 : (x11 <= 127)) (PreH30 : ((-128) <= x12)) (PreH31 : (x12 <= 127)) (PreH32 : ((-128) <= x13)) (PreH33 : (x13 <= 127)) (PreH34 : ((-128) <= x14)) (PreH35 : (x14 <= 127)) (PreH36 : ((-128) <= x15)) (PreH37 : (x15 <= 127)) (PreH38 : ((-128) <= x16)) (PreH39 : (x16 <= 127)) (PreH40 : ((-128) <= x17)) (PreH41 : (x17 <= 127)) (PreH42 : ((-128) <= x18)) (PreH43 : (x18 <= 127)) (PreH44 : ((-128) <= x19)) (PreH45 : (x19 <= 127)) (PreH46 : ((-128) <= x20)) (PreH47 : (x20 <= 127)) (PreH48 : ((-128) <= x21)) (PreH49 : (x21 <= 127)) (PreH50 : ((-128) <= x22)) (PreH51 : (x22 <= 127)) (PreH52 : ((-128) <= x23)) (PreH53 : (x23 <= 127)) (PreH54 : ((-128) <= x24)) (PreH55 : (x24 <= 127)) (PreH56 : ((-128) <= x25)) (PreH57 : (x25 <= 127)) (PreH58 : ((-128) <= x26)) (PreH59 : (x26 <= 127)) (PreH60 : ((-128) <= x27)) (PreH61 : (x27 <= 127)) (PreH62 : ((-128) <= x28)) (PreH63 : (x28 <= 127)) (PreH64 : ((-128) <= x29)) (PreH65 : (x29 <= 127)) (PreH66 : ((-128) <= x30)) (PreH67 : (x30 <= 127)) (PreH68 : ((-128) <= x31)) (PreH69 : (x31 <= 127)) ,
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

Definition qcp_qa_rvv_get32_safety_wit_27 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 26)) (PreH2 : (i_pre < 28)) (PreH3 : (i_pre >= 24)) (PreH4 : (i_pre >= 16)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : ((-128) <= x0)) (PreH8 : (x0 <= 127)) (PreH9 : ((-128) <= x1)) (PreH10 : (x1 <= 127)) (PreH11 : ((-128) <= x2)) (PreH12 : (x2 <= 127)) (PreH13 : ((-128) <= x3)) (PreH14 : (x3 <= 127)) (PreH15 : ((-128) <= x4)) (PreH16 : (x4 <= 127)) (PreH17 : ((-128) <= x5)) (PreH18 : (x5 <= 127)) (PreH19 : ((-128) <= x6)) (PreH20 : (x6 <= 127)) (PreH21 : ((-128) <= x7)) (PreH22 : (x7 <= 127)) (PreH23 : ((-128) <= x8)) (PreH24 : (x8 <= 127)) (PreH25 : ((-128) <= x9)) (PreH26 : (x9 <= 127)) (PreH27 : ((-128) <= x10)) (PreH28 : (x10 <= 127)) (PreH29 : ((-128) <= x11)) (PreH30 : (x11 <= 127)) (PreH31 : ((-128) <= x12)) (PreH32 : (x12 <= 127)) (PreH33 : ((-128) <= x13)) (PreH34 : (x13 <= 127)) (PreH35 : ((-128) <= x14)) (PreH36 : (x14 <= 127)) (PreH37 : ((-128) <= x15)) (PreH38 : (x15 <= 127)) (PreH39 : ((-128) <= x16)) (PreH40 : (x16 <= 127)) (PreH41 : ((-128) <= x17)) (PreH42 : (x17 <= 127)) (PreH43 : ((-128) <= x18)) (PreH44 : (x18 <= 127)) (PreH45 : ((-128) <= x19)) (PreH46 : (x19 <= 127)) (PreH47 : ((-128) <= x20)) (PreH48 : (x20 <= 127)) (PreH49 : ((-128) <= x21)) (PreH50 : (x21 <= 127)) (PreH51 : ((-128) <= x22)) (PreH52 : (x22 <= 127)) (PreH53 : ((-128) <= x23)) (PreH54 : (x23 <= 127)) (PreH55 : ((-128) <= x24)) (PreH56 : (x24 <= 127)) (PreH57 : ((-128) <= x25)) (PreH58 : (x25 <= 127)) (PreH59 : ((-128) <= x26)) (PreH60 : (x26 <= 127)) (PreH61 : ((-128) <= x27)) (PreH62 : (x27 <= 127)) (PreH63 : ((-128) <= x28)) (PreH64 : (x28 <= 127)) (PreH65 : ((-128) <= x29)) (PreH66 : (x29 <= 127)) (PreH67 : ((-128) <= x30)) (PreH68 : (x30 <= 127)) (PreH69 : ((-128) <= x31)) (PreH70 : (x31 <= 127)) ,
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

Definition qcp_qa_rvv_get32_safety_wit_28 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 26)) (PreH2 : (i_pre < 28)) (PreH3 : (i_pre >= 24)) (PreH4 : (i_pre >= 16)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : ((-128) <= x0)) (PreH8 : (x0 <= 127)) (PreH9 : ((-128) <= x1)) (PreH10 : (x1 <= 127)) (PreH11 : ((-128) <= x2)) (PreH12 : (x2 <= 127)) (PreH13 : ((-128) <= x3)) (PreH14 : (x3 <= 127)) (PreH15 : ((-128) <= x4)) (PreH16 : (x4 <= 127)) (PreH17 : ((-128) <= x5)) (PreH18 : (x5 <= 127)) (PreH19 : ((-128) <= x6)) (PreH20 : (x6 <= 127)) (PreH21 : ((-128) <= x7)) (PreH22 : (x7 <= 127)) (PreH23 : ((-128) <= x8)) (PreH24 : (x8 <= 127)) (PreH25 : ((-128) <= x9)) (PreH26 : (x9 <= 127)) (PreH27 : ((-128) <= x10)) (PreH28 : (x10 <= 127)) (PreH29 : ((-128) <= x11)) (PreH30 : (x11 <= 127)) (PreH31 : ((-128) <= x12)) (PreH32 : (x12 <= 127)) (PreH33 : ((-128) <= x13)) (PreH34 : (x13 <= 127)) (PreH35 : ((-128) <= x14)) (PreH36 : (x14 <= 127)) (PreH37 : ((-128) <= x15)) (PreH38 : (x15 <= 127)) (PreH39 : ((-128) <= x16)) (PreH40 : (x16 <= 127)) (PreH41 : ((-128) <= x17)) (PreH42 : (x17 <= 127)) (PreH43 : ((-128) <= x18)) (PreH44 : (x18 <= 127)) (PreH45 : ((-128) <= x19)) (PreH46 : (x19 <= 127)) (PreH47 : ((-128) <= x20)) (PreH48 : (x20 <= 127)) (PreH49 : ((-128) <= x21)) (PreH50 : (x21 <= 127)) (PreH51 : ((-128) <= x22)) (PreH52 : (x22 <= 127)) (PreH53 : ((-128) <= x23)) (PreH54 : (x23 <= 127)) (PreH55 : ((-128) <= x24)) (PreH56 : (x24 <= 127)) (PreH57 : ((-128) <= x25)) (PreH58 : (x25 <= 127)) (PreH59 : ((-128) <= x26)) (PreH60 : (x26 <= 127)) (PreH61 : ((-128) <= x27)) (PreH62 : (x27 <= 127)) (PreH63 : ((-128) <= x28)) (PreH64 : (x28 <= 127)) (PreH65 : ((-128) <= x29)) (PreH66 : (x29 <= 127)) (PreH67 : ((-128) <= x30)) (PreH68 : (x30 <= 127)) (PreH69 : ((-128) <= x31)) (PreH70 : (x31 <= 127)) ,
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

Definition qcp_qa_rvv_get32_safety_wit_29 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 28)) (PreH2 : (i_pre >= 24)) (PreH3 : (i_pre >= 16)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : ((-128) <= x0)) (PreH7 : (x0 <= 127)) (PreH8 : ((-128) <= x1)) (PreH9 : (x1 <= 127)) (PreH10 : ((-128) <= x2)) (PreH11 : (x2 <= 127)) (PreH12 : ((-128) <= x3)) (PreH13 : (x3 <= 127)) (PreH14 : ((-128) <= x4)) (PreH15 : (x4 <= 127)) (PreH16 : ((-128) <= x5)) (PreH17 : (x5 <= 127)) (PreH18 : ((-128) <= x6)) (PreH19 : (x6 <= 127)) (PreH20 : ((-128) <= x7)) (PreH21 : (x7 <= 127)) (PreH22 : ((-128) <= x8)) (PreH23 : (x8 <= 127)) (PreH24 : ((-128) <= x9)) (PreH25 : (x9 <= 127)) (PreH26 : ((-128) <= x10)) (PreH27 : (x10 <= 127)) (PreH28 : ((-128) <= x11)) (PreH29 : (x11 <= 127)) (PreH30 : ((-128) <= x12)) (PreH31 : (x12 <= 127)) (PreH32 : ((-128) <= x13)) (PreH33 : (x13 <= 127)) (PreH34 : ((-128) <= x14)) (PreH35 : (x14 <= 127)) (PreH36 : ((-128) <= x15)) (PreH37 : (x15 <= 127)) (PreH38 : ((-128) <= x16)) (PreH39 : (x16 <= 127)) (PreH40 : ((-128) <= x17)) (PreH41 : (x17 <= 127)) (PreH42 : ((-128) <= x18)) (PreH43 : (x18 <= 127)) (PreH44 : ((-128) <= x19)) (PreH45 : (x19 <= 127)) (PreH46 : ((-128) <= x20)) (PreH47 : (x20 <= 127)) (PreH48 : ((-128) <= x21)) (PreH49 : (x21 <= 127)) (PreH50 : ((-128) <= x22)) (PreH51 : (x22 <= 127)) (PreH52 : ((-128) <= x23)) (PreH53 : (x23 <= 127)) (PreH54 : ((-128) <= x24)) (PreH55 : (x24 <= 127)) (PreH56 : ((-128) <= x25)) (PreH57 : (x25 <= 127)) (PreH58 : ((-128) <= x26)) (PreH59 : (x26 <= 127)) (PreH60 : ((-128) <= x27)) (PreH61 : (x27 <= 127)) (PreH62 : ((-128) <= x28)) (PreH63 : (x28 <= 127)) (PreH64 : ((-128) <= x29)) (PreH65 : (x29 <= 127)) (PreH66 : ((-128) <= x30)) (PreH67 : (x30 <= 127)) (PreH68 : ((-128) <= x31)) (PreH69 : (x31 <= 127)) ,
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

Definition qcp_qa_rvv_get32_safety_wit_30 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 30)) (PreH2 : (i_pre >= 28)) (PreH3 : (i_pre >= 24)) (PreH4 : (i_pre >= 16)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : ((-128) <= x0)) (PreH8 : (x0 <= 127)) (PreH9 : ((-128) <= x1)) (PreH10 : (x1 <= 127)) (PreH11 : ((-128) <= x2)) (PreH12 : (x2 <= 127)) (PreH13 : ((-128) <= x3)) (PreH14 : (x3 <= 127)) (PreH15 : ((-128) <= x4)) (PreH16 : (x4 <= 127)) (PreH17 : ((-128) <= x5)) (PreH18 : (x5 <= 127)) (PreH19 : ((-128) <= x6)) (PreH20 : (x6 <= 127)) (PreH21 : ((-128) <= x7)) (PreH22 : (x7 <= 127)) (PreH23 : ((-128) <= x8)) (PreH24 : (x8 <= 127)) (PreH25 : ((-128) <= x9)) (PreH26 : (x9 <= 127)) (PreH27 : ((-128) <= x10)) (PreH28 : (x10 <= 127)) (PreH29 : ((-128) <= x11)) (PreH30 : (x11 <= 127)) (PreH31 : ((-128) <= x12)) (PreH32 : (x12 <= 127)) (PreH33 : ((-128) <= x13)) (PreH34 : (x13 <= 127)) (PreH35 : ((-128) <= x14)) (PreH36 : (x14 <= 127)) (PreH37 : ((-128) <= x15)) (PreH38 : (x15 <= 127)) (PreH39 : ((-128) <= x16)) (PreH40 : (x16 <= 127)) (PreH41 : ((-128) <= x17)) (PreH42 : (x17 <= 127)) (PreH43 : ((-128) <= x18)) (PreH44 : (x18 <= 127)) (PreH45 : ((-128) <= x19)) (PreH46 : (x19 <= 127)) (PreH47 : ((-128) <= x20)) (PreH48 : (x20 <= 127)) (PreH49 : ((-128) <= x21)) (PreH50 : (x21 <= 127)) (PreH51 : ((-128) <= x22)) (PreH52 : (x22 <= 127)) (PreH53 : ((-128) <= x23)) (PreH54 : (x23 <= 127)) (PreH55 : ((-128) <= x24)) (PreH56 : (x24 <= 127)) (PreH57 : ((-128) <= x25)) (PreH58 : (x25 <= 127)) (PreH59 : ((-128) <= x26)) (PreH60 : (x26 <= 127)) (PreH61 : ((-128) <= x27)) (PreH62 : (x27 <= 127)) (PreH63 : ((-128) <= x28)) (PreH64 : (x28 <= 127)) (PreH65 : ((-128) <= x29)) (PreH66 : (x29 <= 127)) (PreH67 : ((-128) <= x30)) (PreH68 : (x30 <= 127)) (PreH69 : ((-128) <= x31)) (PreH70 : (x31 <= 127)) ,
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

Definition qcp_qa_rvv_get32_safety_wit_31 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 30)) (PreH2 : (i_pre >= 28)) (PreH3 : (i_pre >= 24)) (PreH4 : (i_pre >= 16)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) (PreH7 : ((-128) <= x0)) (PreH8 : (x0 <= 127)) (PreH9 : ((-128) <= x1)) (PreH10 : (x1 <= 127)) (PreH11 : ((-128) <= x2)) (PreH12 : (x2 <= 127)) (PreH13 : ((-128) <= x3)) (PreH14 : (x3 <= 127)) (PreH15 : ((-128) <= x4)) (PreH16 : (x4 <= 127)) (PreH17 : ((-128) <= x5)) (PreH18 : (x5 <= 127)) (PreH19 : ((-128) <= x6)) (PreH20 : (x6 <= 127)) (PreH21 : ((-128) <= x7)) (PreH22 : (x7 <= 127)) (PreH23 : ((-128) <= x8)) (PreH24 : (x8 <= 127)) (PreH25 : ((-128) <= x9)) (PreH26 : (x9 <= 127)) (PreH27 : ((-128) <= x10)) (PreH28 : (x10 <= 127)) (PreH29 : ((-128) <= x11)) (PreH30 : (x11 <= 127)) (PreH31 : ((-128) <= x12)) (PreH32 : (x12 <= 127)) (PreH33 : ((-128) <= x13)) (PreH34 : (x13 <= 127)) (PreH35 : ((-128) <= x14)) (PreH36 : (x14 <= 127)) (PreH37 : ((-128) <= x15)) (PreH38 : (x15 <= 127)) (PreH39 : ((-128) <= x16)) (PreH40 : (x16 <= 127)) (PreH41 : ((-128) <= x17)) (PreH42 : (x17 <= 127)) (PreH43 : ((-128) <= x18)) (PreH44 : (x18 <= 127)) (PreH45 : ((-128) <= x19)) (PreH46 : (x19 <= 127)) (PreH47 : ((-128) <= x20)) (PreH48 : (x20 <= 127)) (PreH49 : ((-128) <= x21)) (PreH50 : (x21 <= 127)) (PreH51 : ((-128) <= x22)) (PreH52 : (x22 <= 127)) (PreH53 : ((-128) <= x23)) (PreH54 : (x23 <= 127)) (PreH55 : ((-128) <= x24)) (PreH56 : (x24 <= 127)) (PreH57 : ((-128) <= x25)) (PreH58 : (x25 <= 127)) (PreH59 : ((-128) <= x26)) (PreH60 : (x26 <= 127)) (PreH61 : ((-128) <= x27)) (PreH62 : (x27 <= 127)) (PreH63 : ((-128) <= x28)) (PreH64 : (x28 <= 127)) (PreH65 : ((-128) <= x29)) (PreH66 : (x29 <= 127)) (PreH67 : ((-128) <= x30)) (PreH68 : (x30 <= 127)) (PreH69 : ((-128) <= x31)) (PreH70 : (x31 <= 127)) ,
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
  “ (31 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 31) ”
.

Definition qcp_qa_rvv_get32_return_wit_1 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 31)) (PreH2 : (i_pre >= 30)) (PreH3 : (i_pre >= 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
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
  “ (x31 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ ((-128) <= x31) ” 
  &&  “ (x31 <= 127) ”
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
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 31)) (PreH2 : (i_pre >= 30)) (PreH3 : (i_pre >= 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  TT && emp 
|--
  “ (x31 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qa_rvv_get32_return_wit_1_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 31)) (PreH2 : (i_pre >= 30)) (PreH3 : (i_pre >= 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  (x31 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qa_rvv_get32_return_wit_2 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 31)) (PreH2 : (i_pre >= 30)) (PreH3 : (i_pre >= 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
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
  “ (x30 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ ((-128) <= x30) ” 
  &&  “ (x30 <= 127) ”
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
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 31)) (PreH2 : (i_pre >= 30)) (PreH3 : (i_pre >= 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  TT && emp 
|--
  “ (x30 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qa_rvv_get32_return_wit_2_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 31)) (PreH2 : (i_pre >= 30)) (PreH3 : (i_pre >= 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  (x30 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qa_rvv_get32_return_wit_3 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 29)) (PreH2 : (i_pre < 30)) (PreH3 : (i_pre >= 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
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
  “ (x29 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ ((-128) <= x29) ” 
  &&  “ (x29 <= 127) ”
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
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 29)) (PreH2 : (i_pre < 30)) (PreH3 : (i_pre >= 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  TT && emp 
|--
  “ (x29 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qa_rvv_get32_return_wit_3_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 29)) (PreH2 : (i_pre < 30)) (PreH3 : (i_pre >= 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  (x29 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qa_rvv_get32_return_wit_4 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 29)) (PreH2 : (i_pre < 30)) (PreH3 : (i_pre >= 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
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
  “ (x28 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ ((-128) <= x28) ” 
  &&  “ (x28 <= 127) ”
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
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 29)) (PreH2 : (i_pre < 30)) (PreH3 : (i_pre >= 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  TT && emp 
|--
  “ (x28 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qa_rvv_get32_return_wit_4_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 29)) (PreH2 : (i_pre < 30)) (PreH3 : (i_pre >= 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  (x28 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qa_rvv_get32_return_wit_5 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 27)) (PreH2 : (i_pre >= 26)) (PreH3 : (i_pre < 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
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
  “ (x27 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ ((-128) <= x27) ” 
  &&  “ (x27 <= 127) ”
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
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 27)) (PreH2 : (i_pre >= 26)) (PreH3 : (i_pre < 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  TT && emp 
|--
  “ (x27 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qa_rvv_get32_return_wit_5_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 27)) (PreH2 : (i_pre >= 26)) (PreH3 : (i_pre < 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  (x27 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qa_rvv_get32_return_wit_6 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 27)) (PreH2 : (i_pre >= 26)) (PreH3 : (i_pre < 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
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
  “ (x26 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ ((-128) <= x26) ” 
  &&  “ (x26 <= 127) ”
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
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 27)) (PreH2 : (i_pre >= 26)) (PreH3 : (i_pre < 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  TT && emp 
|--
  “ (x26 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qa_rvv_get32_return_wit_6_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 27)) (PreH2 : (i_pre >= 26)) (PreH3 : (i_pre < 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  (x26 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qa_rvv_get32_return_wit_7 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 25)) (PreH2 : (i_pre < 26)) (PreH3 : (i_pre < 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
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
  “ (x25 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ ((-128) <= x25) ” 
  &&  “ (x25 <= 127) ”
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
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 25)) (PreH2 : (i_pre < 26)) (PreH3 : (i_pre < 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  TT && emp 
|--
  “ (x25 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qa_rvv_get32_return_wit_7_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 25)) (PreH2 : (i_pre < 26)) (PreH3 : (i_pre < 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  (x25 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qa_rvv_get32_return_wit_8 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 25)) (PreH2 : (i_pre < 26)) (PreH3 : (i_pre < 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
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
  “ (x24 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ ((-128) <= x24) ” 
  &&  “ (x24 <= 127) ”
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
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 25)) (PreH2 : (i_pre < 26)) (PreH3 : (i_pre < 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  TT && emp 
|--
  “ (x24 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qa_rvv_get32_return_wit_8_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 25)) (PreH2 : (i_pre < 26)) (PreH3 : (i_pre < 28)) (PreH4 : (i_pre >= 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  (x24 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qa_rvv_get32_return_wit_9 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 23)) (PreH2 : (i_pre >= 22)) (PreH3 : (i_pre >= 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
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
  “ (x23 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ ((-128) <= x23) ” 
  &&  “ (x23 <= 127) ”
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
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 23)) (PreH2 : (i_pre >= 22)) (PreH3 : (i_pre >= 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  TT && emp 
|--
  “ (x23 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qa_rvv_get32_return_wit_9_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 23)) (PreH2 : (i_pre >= 22)) (PreH3 : (i_pre >= 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  (x23 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qa_rvv_get32_return_wit_10 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 23)) (PreH2 : (i_pre >= 22)) (PreH3 : (i_pre >= 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
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
  “ (x22 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ ((-128) <= x22) ” 
  &&  “ (x22 <= 127) ”
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
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 23)) (PreH2 : (i_pre >= 22)) (PreH3 : (i_pre >= 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  TT && emp 
|--
  “ (x22 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qa_rvv_get32_return_wit_10_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 23)) (PreH2 : (i_pre >= 22)) (PreH3 : (i_pre >= 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  (x22 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qa_rvv_get32_return_wit_11 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 21)) (PreH2 : (i_pre < 22)) (PreH3 : (i_pre >= 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
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
  “ (x21 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ ((-128) <= x21) ” 
  &&  “ (x21 <= 127) ”
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
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 21)) (PreH2 : (i_pre < 22)) (PreH3 : (i_pre >= 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  TT && emp 
|--
  “ (x21 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qa_rvv_get32_return_wit_11_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 21)) (PreH2 : (i_pre < 22)) (PreH3 : (i_pre >= 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  (x21 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qa_rvv_get32_return_wit_12 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 21)) (PreH2 : (i_pre < 22)) (PreH3 : (i_pre >= 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
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
  “ (x20 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ ((-128) <= x20) ” 
  &&  “ (x20 <= 127) ”
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
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 21)) (PreH2 : (i_pre < 22)) (PreH3 : (i_pre >= 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  TT && emp 
|--
  “ (x20 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qa_rvv_get32_return_wit_12_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 21)) (PreH2 : (i_pre < 22)) (PreH3 : (i_pre >= 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  (x20 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qa_rvv_get32_return_wit_13 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 19)) (PreH2 : (i_pre >= 18)) (PreH3 : (i_pre < 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
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
  “ (x19 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ ((-128) <= x19) ” 
  &&  “ (x19 <= 127) ”
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
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 19)) (PreH2 : (i_pre >= 18)) (PreH3 : (i_pre < 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  TT && emp 
|--
  “ (x19 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qa_rvv_get32_return_wit_13_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 19)) (PreH2 : (i_pre >= 18)) (PreH3 : (i_pre < 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  (x19 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qa_rvv_get32_return_wit_14 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 19)) (PreH2 : (i_pre >= 18)) (PreH3 : (i_pre < 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
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
  “ (x18 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ ((-128) <= x18) ” 
  &&  “ (x18 <= 127) ”
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
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 19)) (PreH2 : (i_pre >= 18)) (PreH3 : (i_pre < 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  TT && emp 
|--
  “ (x18 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qa_rvv_get32_return_wit_14_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 19)) (PreH2 : (i_pre >= 18)) (PreH3 : (i_pre < 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  (x18 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qa_rvv_get32_return_wit_15 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 17)) (PreH2 : (i_pre < 18)) (PreH3 : (i_pre < 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
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
  “ (x17 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ ((-128) <= x17) ” 
  &&  “ (x17 <= 127) ”
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
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 17)) (PreH2 : (i_pre < 18)) (PreH3 : (i_pre < 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  TT && emp 
|--
  “ (x17 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qa_rvv_get32_return_wit_15_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 17)) (PreH2 : (i_pre < 18)) (PreH3 : (i_pre < 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  (x17 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qa_rvv_get32_return_wit_16 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 17)) (PreH2 : (i_pre < 18)) (PreH3 : (i_pre < 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
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
  “ (x16 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ ((-128) <= x16) ” 
  &&  “ (x16 <= 127) ”
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
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 17)) (PreH2 : (i_pre < 18)) (PreH3 : (i_pre < 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  TT && emp 
|--
  “ (x16 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qa_rvv_get32_return_wit_16_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 17)) (PreH2 : (i_pre < 18)) (PreH3 : (i_pre < 20)) (PreH4 : (i_pre < 24)) (PreH5 : (i_pre >= 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  (x16 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qa_rvv_get32_return_wit_17 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 15)) (PreH2 : (i_pre >= 14)) (PreH3 : (i_pre >= 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
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
  “ (x15 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ ((-128) <= x15) ” 
  &&  “ (x15 <= 127) ”
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
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 15)) (PreH2 : (i_pre >= 14)) (PreH3 : (i_pre >= 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  TT && emp 
|--
  “ (x15 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qa_rvv_get32_return_wit_17_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 15)) (PreH2 : (i_pre >= 14)) (PreH3 : (i_pre >= 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  (x15 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qa_rvv_get32_return_wit_18 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 15)) (PreH2 : (i_pre >= 14)) (PreH3 : (i_pre >= 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
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
  “ (x14 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ ((-128) <= x14) ” 
  &&  “ (x14 <= 127) ”
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
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 15)) (PreH2 : (i_pre >= 14)) (PreH3 : (i_pre >= 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  TT && emp 
|--
  “ (x14 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qa_rvv_get32_return_wit_18_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 15)) (PreH2 : (i_pre >= 14)) (PreH3 : (i_pre >= 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  (x14 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qa_rvv_get32_return_wit_19 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 13)) (PreH2 : (i_pre < 14)) (PreH3 : (i_pre >= 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
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
  “ (x13 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ ((-128) <= x13) ” 
  &&  “ (x13 <= 127) ”
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
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 13)) (PreH2 : (i_pre < 14)) (PreH3 : (i_pre >= 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  TT && emp 
|--
  “ (x13 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qa_rvv_get32_return_wit_19_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 13)) (PreH2 : (i_pre < 14)) (PreH3 : (i_pre >= 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  (x13 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qa_rvv_get32_return_wit_20 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 13)) (PreH2 : (i_pre < 14)) (PreH3 : (i_pre >= 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
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
  “ (x12 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ ((-128) <= x12) ” 
  &&  “ (x12 <= 127) ”
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
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 13)) (PreH2 : (i_pre < 14)) (PreH3 : (i_pre >= 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  TT && emp 
|--
  “ (x12 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qa_rvv_get32_return_wit_20_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 13)) (PreH2 : (i_pre < 14)) (PreH3 : (i_pre >= 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  (x12 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qa_rvv_get32_return_wit_21 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 11)) (PreH2 : (i_pre >= 10)) (PreH3 : (i_pre < 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
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
  “ (x11 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ ((-128) <= x11) ” 
  &&  “ (x11 <= 127) ”
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
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 11)) (PreH2 : (i_pre >= 10)) (PreH3 : (i_pre < 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  TT && emp 
|--
  “ (x11 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qa_rvv_get32_return_wit_21_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 11)) (PreH2 : (i_pre >= 10)) (PreH3 : (i_pre < 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  (x11 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qa_rvv_get32_return_wit_22 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 11)) (PreH2 : (i_pre >= 10)) (PreH3 : (i_pre < 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
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
  “ (x10 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ ((-128) <= x10) ” 
  &&  “ (x10 <= 127) ”
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
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 11)) (PreH2 : (i_pre >= 10)) (PreH3 : (i_pre < 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  TT && emp 
|--
  “ (x10 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qa_rvv_get32_return_wit_22_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 11)) (PreH2 : (i_pre >= 10)) (PreH3 : (i_pre < 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  (x10 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qa_rvv_get32_return_wit_23 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 9)) (PreH2 : (i_pre < 10)) (PreH3 : (i_pre < 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
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
  “ (x9 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ ((-128) <= x9) ” 
  &&  “ (x9 <= 127) ”
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
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 9)) (PreH2 : (i_pre < 10)) (PreH3 : (i_pre < 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  TT && emp 
|--
  “ (x9 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qa_rvv_get32_return_wit_23_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 9)) (PreH2 : (i_pre < 10)) (PreH3 : (i_pre < 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  (x9 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qa_rvv_get32_return_wit_24 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 9)) (PreH2 : (i_pre < 10)) (PreH3 : (i_pre < 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
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
  “ (x8 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ ((-128) <= x8) ” 
  &&  “ (x8 <= 127) ”
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
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 9)) (PreH2 : (i_pre < 10)) (PreH3 : (i_pre < 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  TT && emp 
|--
  “ (x8 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qa_rvv_get32_return_wit_24_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 9)) (PreH2 : (i_pre < 10)) (PreH3 : (i_pre < 12)) (PreH4 : (i_pre >= 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  (x8 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qa_rvv_get32_return_wit_25 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 7)) (PreH2 : (i_pre >= 6)) (PreH3 : (i_pre >= 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
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
  “ (x7 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ ((-128) <= x7) ” 
  &&  “ (x7 <= 127) ”
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
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 7)) (PreH2 : (i_pre >= 6)) (PreH3 : (i_pre >= 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  TT && emp 
|--
  “ (x7 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qa_rvv_get32_return_wit_25_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 7)) (PreH2 : (i_pre >= 6)) (PreH3 : (i_pre >= 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  (x7 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qa_rvv_get32_return_wit_26 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 7)) (PreH2 : (i_pre >= 6)) (PreH3 : (i_pre >= 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
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
  “ (x6 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ ((-128) <= x6) ” 
  &&  “ (x6 <= 127) ”
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
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 7)) (PreH2 : (i_pre >= 6)) (PreH3 : (i_pre >= 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  TT && emp 
|--
  “ (x6 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qa_rvv_get32_return_wit_26_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 7)) (PreH2 : (i_pre >= 6)) (PreH3 : (i_pre >= 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  (x6 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qa_rvv_get32_return_wit_27 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 5)) (PreH2 : (i_pre < 6)) (PreH3 : (i_pre >= 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
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
  “ (x5 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ ((-128) <= x5) ” 
  &&  “ (x5 <= 127) ”
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
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 5)) (PreH2 : (i_pre < 6)) (PreH3 : (i_pre >= 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  TT && emp 
|--
  “ (x5 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qa_rvv_get32_return_wit_27_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 5)) (PreH2 : (i_pre < 6)) (PreH3 : (i_pre >= 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  (x5 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qa_rvv_get32_return_wit_28 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 5)) (PreH2 : (i_pre < 6)) (PreH3 : (i_pre >= 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
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
  “ (x4 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ ((-128) <= x4) ” 
  &&  “ (x4 <= 127) ”
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
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 5)) (PreH2 : (i_pre < 6)) (PreH3 : (i_pre >= 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  TT && emp 
|--
  “ (x4 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qa_rvv_get32_return_wit_28_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 5)) (PreH2 : (i_pre < 6)) (PreH3 : (i_pre >= 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  (x4 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qa_rvv_get32_return_wit_29 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 3)) (PreH2 : (i_pre >= 2)) (PreH3 : (i_pre < 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
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
  “ (x3 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ ((-128) <= x3) ” 
  &&  “ (x3 <= 127) ”
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
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 3)) (PreH2 : (i_pre >= 2)) (PreH3 : (i_pre < 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  TT && emp 
|--
  “ (x3 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qa_rvv_get32_return_wit_29_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 3)) (PreH2 : (i_pre >= 2)) (PreH3 : (i_pre < 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  (x3 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qa_rvv_get32_return_wit_30 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 3)) (PreH2 : (i_pre >= 2)) (PreH3 : (i_pre < 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
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
  “ (x2 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ ((-128) <= x2) ” 
  &&  “ (x2 <= 127) ”
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
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 3)) (PreH2 : (i_pre >= 2)) (PreH3 : (i_pre < 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  TT && emp 
|--
  “ (x2 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qa_rvv_get32_return_wit_30_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 3)) (PreH2 : (i_pre >= 2)) (PreH3 : (i_pre < 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  (x2 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qa_rvv_get32_return_wit_31 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 1)) (PreH2 : (i_pre < 2)) (PreH3 : (i_pre < 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
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
  “ (x1 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ ((-128) <= x1) ” 
  &&  “ (x1 <= 127) ”
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
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 1)) (PreH2 : (i_pre < 2)) (PreH3 : (i_pre < 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  TT && emp 
|--
  “ (x1 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qa_rvv_get32_return_wit_31_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre >= 1)) (PreH2 : (i_pre < 2)) (PreH3 : (i_pre < 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  (x1 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

Definition qcp_qa_rvv_get32_return_wit_32 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 1)) (PreH2 : (i_pre < 2)) (PreH3 : (i_pre < 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
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
  “ (x0 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ” 
  &&  “ ((-128) <= x0) ” 
  &&  “ (x0 <= 127) ”
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
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 1)) (PreH2 : (i_pre < 2)) (PreH3 : (i_pre < 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  TT && emp 
|--
  “ (x0 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre))) ”
  &&  emp
).

Definition qcp_qa_rvv_get32_return_wit_32_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre < 1)) (PreH2 : (i_pre < 2)) (PreH3 : (i_pre < 4)) (PreH4 : (i_pre < 8)) (PreH5 : (i_pre < 16)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  (x0 = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i_pre)))
.

(*----- Function qcp_s8_rvv_store_next -----*)

Definition qcp_s8_rvv_store_next_return_wit_1 := 
(
forall (value_pre: Z) (i_pre: Z) (vl_pre: Z) (p_pre: Z) (P: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < vl_pre)) (PreH3 : (vl_pre <= 32)) (PreH4 : ((-128) <= value_pre)) (PreH5 : (value_pre <= 127)) ,
  (CharArray.seg p_pre 0 (i_pre + 1 ) (app (P) ((cons (value_pre) ((@nil Z))))) )
  **  (CharArray.undef_seg p_pre (i_pre + 1 ) vl_pre )
|--
  (CharArray.seg p_pre 0 (i_pre + 1 ) (s8_rvv_snoc (P) (value_pre)) )
  **  (CharArray.undef_seg p_pre (i_pre + 1 ) vl_pre )
) \/
(
forall (value_pre: Z) (i_pre: Z) (vl_pre: Z) (P: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < vl_pre)) (PreH3 : (vl_pre <= 32)) (PreH4 : ((-128) <= value_pre)) (PreH5 : (value_pre <= 127)) ,
  TT && emp 
|--
  “ ((app (P) ((cons (value_pre) ((@nil Z))))) = (s8_rvv_snoc (P) (value_pre))) ”
  &&  emp
).

Definition qcp_s8_rvv_store_next_return_wit_1_split_goal_1 := 
forall (value_pre: Z) (i_pre: Z) (vl_pre: Z) (P: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < vl_pre)) (PreH3 : (vl_pre <= 32)) (PreH4 : ((-128) <= value_pre)) (PreH5 : (value_pre <= 127)) ,
  ((app (P) ((cons (value_pre) ((@nil Z))))) = (s8_rvv_snoc (P) (value_pre)))
.

Definition qcp_s8_rvv_store_next_partial_solve_wit_1 := 
forall (value_pre: Z) (i_pre: Z) (vl_pre: Z) (p_pre: Z) (P: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < vl_pre)) (PreH3 : (vl_pre <= 32)) (PreH4 : ((-128) <= value_pre)) (PreH5 : (value_pre <= 127)) ,
  (CharArray.seg p_pre 0 i_pre P )
  **  (CharArray.undef_seg p_pre i_pre vl_pre )
|--
  “ (0 <= i_pre) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((-128) <= value_pre) ” 
  &&  “ (value_pre <= 127) ”
  &&  (((p_pre + (i_pre * sizeof(CHAR)))) # Char  |->_)
  **  (CharArray.undef_seg p_pre (i_pre + 1 ) vl_pre )
  **  (CharArray.seg p_pre 0 i_pre P )
.

(*----- Function qcp_qa_rvv_store32 -----*)

Definition qcp_qa_rvv_store32_safety_wit_1 := 
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : ((-128) <= x0)) (PreH4 : (x0 <= 127)) (PreH5 : ((-128) <= x1)) (PreH6 : (x1 <= 127)) (PreH7 : ((-128) <= x2)) (PreH8 : (x2 <= 127)) (PreH9 : ((-128) <= x3)) (PreH10 : (x3 <= 127)) (PreH11 : ((-128) <= x4)) (PreH12 : (x4 <= 127)) (PreH13 : ((-128) <= x5)) (PreH14 : (x5 <= 127)) (PreH15 : ((-128) <= x6)) (PreH16 : (x6 <= 127)) (PreH17 : ((-128) <= x7)) (PreH18 : (x7 <= 127)) (PreH19 : ((-128) <= x8)) (PreH20 : (x8 <= 127)) (PreH21 : ((-128) <= x9)) (PreH22 : (x9 <= 127)) (PreH23 : ((-128) <= x10)) (PreH24 : (x10 <= 127)) (PreH25 : ((-128) <= x11)) (PreH26 : (x11 <= 127)) (PreH27 : ((-128) <= x12)) (PreH28 : (x12 <= 127)) (PreH29 : ((-128) <= x13)) (PreH30 : (x13 <= 127)) (PreH31 : ((-128) <= x14)) (PreH32 : (x14 <= 127)) (PreH33 : ((-128) <= x15)) (PreH34 : (x15 <= 127)) (PreH35 : ((-128) <= x16)) (PreH36 : (x16 <= 127)) (PreH37 : ((-128) <= x17)) (PreH38 : (x17 <= 127)) (PreH39 : ((-128) <= x18)) (PreH40 : (x18 <= 127)) (PreH41 : ((-128) <= x19)) (PreH42 : (x19 <= 127)) (PreH43 : ((-128) <= x20)) (PreH44 : (x20 <= 127)) (PreH45 : ((-128) <= x21)) (PreH46 : (x21 <= 127)) (PreH47 : ((-128) <= x22)) (PreH48 : (x22 <= 127)) (PreH49 : ((-128) <= x23)) (PreH50 : (x23 <= 127)) (PreH51 : ((-128) <= x24)) (PreH52 : (x24 <= 127)) (PreH53 : ((-128) <= x25)) (PreH54 : (x25 <= 127)) (PreH55 : ((-128) <= x26)) (PreH56 : (x26 <= 127)) (PreH57 : ((-128) <= x27)) (PreH58 : (x27 <= 127)) (PreH59 : ((-128) <= x28)) (PreH60 : (x28 <= 127)) (PreH61 : ((-128) <= x29)) (PreH62 : (x29 <= 127)) (PreH63 : ((-128) <= x30)) (PreH64 : (x30 <= 127)) (PreH65 : ((-128) <= x31)) (PreH66 : (x31 <= 127)) ,
  ((( &( "i" ) )) # UInt64  |->_)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
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
  **  (CharArray.undef_seg p_pre 0 vl_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_qa_rvv_store32_entail_wit_1 := 
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : ((-128) <= x0)) (PreH4 : (x0 <= 127)) (PreH5 : ((-128) <= x1)) (PreH6 : (x1 <= 127)) (PreH7 : ((-128) <= x2)) (PreH8 : (x2 <= 127)) (PreH9 : ((-128) <= x3)) (PreH10 : (x3 <= 127)) (PreH11 : ((-128) <= x4)) (PreH12 : (x4 <= 127)) (PreH13 : ((-128) <= x5)) (PreH14 : (x5 <= 127)) (PreH15 : ((-128) <= x6)) (PreH16 : (x6 <= 127)) (PreH17 : ((-128) <= x7)) (PreH18 : (x7 <= 127)) (PreH19 : ((-128) <= x8)) (PreH20 : (x8 <= 127)) (PreH21 : ((-128) <= x9)) (PreH22 : (x9 <= 127)) (PreH23 : ((-128) <= x10)) (PreH24 : (x10 <= 127)) (PreH25 : ((-128) <= x11)) (PreH26 : (x11 <= 127)) (PreH27 : ((-128) <= x12)) (PreH28 : (x12 <= 127)) (PreH29 : ((-128) <= x13)) (PreH30 : (x13 <= 127)) (PreH31 : ((-128) <= x14)) (PreH32 : (x14 <= 127)) (PreH33 : ((-128) <= x15)) (PreH34 : (x15 <= 127)) (PreH35 : ((-128) <= x16)) (PreH36 : (x16 <= 127)) (PreH37 : ((-128) <= x17)) (PreH38 : (x17 <= 127)) (PreH39 : ((-128) <= x18)) (PreH40 : (x18 <= 127)) (PreH41 : ((-128) <= x19)) (PreH42 : (x19 <= 127)) (PreH43 : ((-128) <= x20)) (PreH44 : (x20 <= 127)) (PreH45 : ((-128) <= x21)) (PreH46 : (x21 <= 127)) (PreH47 : ((-128) <= x22)) (PreH48 : (x22 <= 127)) (PreH49 : ((-128) <= x23)) (PreH50 : (x23 <= 127)) (PreH51 : ((-128) <= x24)) (PreH52 : (x24 <= 127)) (PreH53 : ((-128) <= x25)) (PreH54 : (x25 <= 127)) (PreH55 : ((-128) <= x26)) (PreH56 : (x26 <= 127)) (PreH57 : ((-128) <= x27)) (PreH58 : (x27 <= 127)) (PreH59 : ((-128) <= x28)) (PreH60 : (x28 <= 127)) (PreH61 : ((-128) <= x29)) (PreH62 : (x29 <= 127)) (PreH63 : ((-128) <= x30)) (PreH64 : (x30 <= 127)) (PreH65 : ((-128) <= x31)) (PreH66 : (x31 <= 127)) ,
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
  **  (CharArray.undef_seg p_pre 0 vl_pre )
|--
  “ (0 <= 0) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((-128) <= x0) ” 
  &&  “ (x0 <= 127) ” 
  &&  “ ((-128) <= x1) ” 
  &&  “ (x1 <= 127) ” 
  &&  “ ((-128) <= x2) ” 
  &&  “ (x2 <= 127) ” 
  &&  “ ((-128) <= x3) ” 
  &&  “ (x3 <= 127) ” 
  &&  “ ((-128) <= x4) ” 
  &&  “ (x4 <= 127) ” 
  &&  “ ((-128) <= x5) ” 
  &&  “ (x5 <= 127) ” 
  &&  “ ((-128) <= x6) ” 
  &&  “ (x6 <= 127) ” 
  &&  “ ((-128) <= x7) ” 
  &&  “ (x7 <= 127) ” 
  &&  “ ((-128) <= x8) ” 
  &&  “ (x8 <= 127) ” 
  &&  “ ((-128) <= x9) ” 
  &&  “ (x9 <= 127) ” 
  &&  “ ((-128) <= x10) ” 
  &&  “ (x10 <= 127) ” 
  &&  “ ((-128) <= x11) ” 
  &&  “ (x11 <= 127) ” 
  &&  “ ((-128) <= x12) ” 
  &&  “ (x12 <= 127) ” 
  &&  “ ((-128) <= x13) ” 
  &&  “ (x13 <= 127) ” 
  &&  “ ((-128) <= x14) ” 
  &&  “ (x14 <= 127) ” 
  &&  “ ((-128) <= x15) ” 
  &&  “ (x15 <= 127) ” 
  &&  “ ((-128) <= x16) ” 
  &&  “ (x16 <= 127) ” 
  &&  “ ((-128) <= x17) ” 
  &&  “ (x17 <= 127) ” 
  &&  “ ((-128) <= x18) ” 
  &&  “ (x18 <= 127) ” 
  &&  “ ((-128) <= x19) ” 
  &&  “ (x19 <= 127) ” 
  &&  “ ((-128) <= x20) ” 
  &&  “ (x20 <= 127) ” 
  &&  “ ((-128) <= x21) ” 
  &&  “ (x21 <= 127) ” 
  &&  “ ((-128) <= x22) ” 
  &&  “ (x22 <= 127) ” 
  &&  “ ((-128) <= x23) ” 
  &&  “ (x23 <= 127) ” 
  &&  “ ((-128) <= x24) ” 
  &&  “ (x24 <= 127) ” 
  &&  “ ((-128) <= x25) ” 
  &&  “ (x25 <= 127) ” 
  &&  “ ((-128) <= x26) ” 
  &&  “ (x26 <= 127) ” 
  &&  “ ((-128) <= x27) ” 
  &&  “ (x27 <= 127) ” 
  &&  “ ((-128) <= x28) ” 
  &&  “ (x28 <= 127) ” 
  &&  “ ((-128) <= x29) ” 
  &&  “ (x29 <= 127) ” 
  &&  “ ((-128) <= x30) ” 
  &&  “ (x30 <= 127) ” 
  &&  “ ((-128) <= x31) ” 
  &&  “ (x31 <= 127) ”
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
  **  (CharArray.seg p_pre 0 0 (s8_rvv_prefix (0) ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )
  **  (CharArray.undef_seg p_pre 0 vl_pre )
.

Definition qcp_qa_rvv_store32_entail_wit_2 := 
(
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (i: Z) (retval: Z) (PreH1 : (retval = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i)))) (PreH2 : ((-128) <= retval)) (PreH3 : (retval <= 127)) (PreH4 : (i < vl_pre)) (PreH5 : (0 <= i)) (PreH6 : (i <= vl_pre)) (PreH7 : (vl_pre <= 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  (CharArray.seg p_pre 0 (i + 1 ) (s8_rvv_snoc ((s8_rvv_prefix (i) ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))))) (retval)) )
  **  (CharArray.undef_seg p_pre (i + 1 ) vl_pre )
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
  &&  “ ((-128) <= x0) ” 
  &&  “ (x0 <= 127) ” 
  &&  “ ((-128) <= x1) ” 
  &&  “ (x1 <= 127) ” 
  &&  “ ((-128) <= x2) ” 
  &&  “ (x2 <= 127) ” 
  &&  “ ((-128) <= x3) ” 
  &&  “ (x3 <= 127) ” 
  &&  “ ((-128) <= x4) ” 
  &&  “ (x4 <= 127) ” 
  &&  “ ((-128) <= x5) ” 
  &&  “ (x5 <= 127) ” 
  &&  “ ((-128) <= x6) ” 
  &&  “ (x6 <= 127) ” 
  &&  “ ((-128) <= x7) ” 
  &&  “ (x7 <= 127) ” 
  &&  “ ((-128) <= x8) ” 
  &&  “ (x8 <= 127) ” 
  &&  “ ((-128) <= x9) ” 
  &&  “ (x9 <= 127) ” 
  &&  “ ((-128) <= x10) ” 
  &&  “ (x10 <= 127) ” 
  &&  “ ((-128) <= x11) ” 
  &&  “ (x11 <= 127) ” 
  &&  “ ((-128) <= x12) ” 
  &&  “ (x12 <= 127) ” 
  &&  “ ((-128) <= x13) ” 
  &&  “ (x13 <= 127) ” 
  &&  “ ((-128) <= x14) ” 
  &&  “ (x14 <= 127) ” 
  &&  “ ((-128) <= x15) ” 
  &&  “ (x15 <= 127) ” 
  &&  “ ((-128) <= x16) ” 
  &&  “ (x16 <= 127) ” 
  &&  “ ((-128) <= x17) ” 
  &&  “ (x17 <= 127) ” 
  &&  “ ((-128) <= x18) ” 
  &&  “ (x18 <= 127) ” 
  &&  “ ((-128) <= x19) ” 
  &&  “ (x19 <= 127) ” 
  &&  “ ((-128) <= x20) ” 
  &&  “ (x20 <= 127) ” 
  &&  “ ((-128) <= x21) ” 
  &&  “ (x21 <= 127) ” 
  &&  “ ((-128) <= x22) ” 
  &&  “ (x22 <= 127) ” 
  &&  “ ((-128) <= x23) ” 
  &&  “ (x23 <= 127) ” 
  &&  “ ((-128) <= x24) ” 
  &&  “ (x24 <= 127) ” 
  &&  “ ((-128) <= x25) ” 
  &&  “ (x25 <= 127) ” 
  &&  “ ((-128) <= x26) ” 
  &&  “ (x26 <= 127) ” 
  &&  “ ((-128) <= x27) ” 
  &&  “ (x27 <= 127) ” 
  &&  “ ((-128) <= x28) ” 
  &&  “ (x28 <= 127) ” 
  &&  “ ((-128) <= x29) ” 
  &&  “ (x29 <= 127) ” 
  &&  “ ((-128) <= x30) ” 
  &&  “ (x30 <= 127) ” 
  &&  “ ((-128) <= x31) ” 
  &&  “ (x31 <= 127) ”
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
  **  (CharArray.seg p_pre 0 (i + 1 ) (s8_rvv_prefix ((i + 1 )) ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )
  **  (CharArray.undef_seg p_pre (i + 1 ) vl_pre )
) \/
(
forall (vl_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (i: Z) (retval: Z) (PreH1 : (retval = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i)))) (PreH2 : ((-128) <= retval)) (PreH3 : (retval <= 127)) (PreH4 : (i < vl_pre)) (PreH5 : (0 <= i)) (PreH6 : (i <= vl_pre)) (PreH7 : (vl_pre <= 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  TT && emp 
|--
  “ ((s8_rvv_snoc ((s8_rvv_prefix (i) ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))))) (retval)) = (s8_rvv_prefix ((i + 1 )) ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))))) ”
  &&  emp
).

Definition qcp_qa_rvv_store32_entail_wit_2_split_goal_1 := 
forall (vl_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (i: Z) (retval: Z) (PreH1 : (retval = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i)))) (PreH2 : ((-128) <= retval)) (PreH3 : (retval <= 127)) (PreH4 : (i < vl_pre)) (PreH5 : (0 <= i)) (PreH6 : (i <= vl_pre)) (PreH7 : (vl_pre <= 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
  ((s8_rvv_snoc ((s8_rvv_prefix (i) ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))))) (retval)) = (s8_rvv_prefix ((i + 1 )) ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))))
.

Definition qcp_qa_rvv_store32_return_wit_1 := 
(
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (i: Z) (PreH1 : (i >= vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 32)) (PreH5 : ((-128) <= x0)) (PreH6 : (x0 <= 127)) (PreH7 : ((-128) <= x1)) (PreH8 : (x1 <= 127)) (PreH9 : ((-128) <= x2)) (PreH10 : (x2 <= 127)) (PreH11 : ((-128) <= x3)) (PreH12 : (x3 <= 127)) (PreH13 : ((-128) <= x4)) (PreH14 : (x4 <= 127)) (PreH15 : ((-128) <= x5)) (PreH16 : (x5 <= 127)) (PreH17 : ((-128) <= x6)) (PreH18 : (x6 <= 127)) (PreH19 : ((-128) <= x7)) (PreH20 : (x7 <= 127)) (PreH21 : ((-128) <= x8)) (PreH22 : (x8 <= 127)) (PreH23 : ((-128) <= x9)) (PreH24 : (x9 <= 127)) (PreH25 : ((-128) <= x10)) (PreH26 : (x10 <= 127)) (PreH27 : ((-128) <= x11)) (PreH28 : (x11 <= 127)) (PreH29 : ((-128) <= x12)) (PreH30 : (x12 <= 127)) (PreH31 : ((-128) <= x13)) (PreH32 : (x13 <= 127)) (PreH33 : ((-128) <= x14)) (PreH34 : (x14 <= 127)) (PreH35 : ((-128) <= x15)) (PreH36 : (x15 <= 127)) (PreH37 : ((-128) <= x16)) (PreH38 : (x16 <= 127)) (PreH39 : ((-128) <= x17)) (PreH40 : (x17 <= 127)) (PreH41 : ((-128) <= x18)) (PreH42 : (x18 <= 127)) (PreH43 : ((-128) <= x19)) (PreH44 : (x19 <= 127)) (PreH45 : ((-128) <= x20)) (PreH46 : (x20 <= 127)) (PreH47 : ((-128) <= x21)) (PreH48 : (x21 <= 127)) (PreH49 : ((-128) <= x22)) (PreH50 : (x22 <= 127)) (PreH51 : ((-128) <= x23)) (PreH52 : (x23 <= 127)) (PreH53 : ((-128) <= x24)) (PreH54 : (x24 <= 127)) (PreH55 : ((-128) <= x25)) (PreH56 : (x25 <= 127)) (PreH57 : ((-128) <= x26)) (PreH58 : (x26 <= 127)) (PreH59 : ((-128) <= x27)) (PreH60 : (x27 <= 127)) (PreH61 : ((-128) <= x28)) (PreH62 : (x28 <= 127)) (PreH63 : ((-128) <= x29)) (PreH64 : (x29 <= 127)) (PreH65 : ((-128) <= x30)) (PreH66 : (x30 <= 127)) (PreH67 : ((-128) <= x31)) (PreH68 : (x31 <= 127)) ,
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
  **  (CharArray.seg p_pre 0 i (s8_rvv_prefix (i) ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )
  **  (CharArray.undef_seg p_pre i vl_pre )
|--
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
  **  (CharArray.seg p_pre 0 vl_pre (s8_rvv_prefix (vl_pre) ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )
) \/
(
forall (vl_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (i: Z) (PreH1 : (i >= vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 32)) (PreH5 : ((-128) <= x0)) (PreH6 : (x0 <= 127)) (PreH7 : ((-128) <= x1)) (PreH8 : (x1 <= 127)) (PreH9 : ((-128) <= x2)) (PreH10 : (x2 <= 127)) (PreH11 : ((-128) <= x3)) (PreH12 : (x3 <= 127)) (PreH13 : ((-128) <= x4)) (PreH14 : (x4 <= 127)) (PreH15 : ((-128) <= x5)) (PreH16 : (x5 <= 127)) (PreH17 : ((-128) <= x6)) (PreH18 : (x6 <= 127)) (PreH19 : ((-128) <= x7)) (PreH20 : (x7 <= 127)) (PreH21 : ((-128) <= x8)) (PreH22 : (x8 <= 127)) (PreH23 : ((-128) <= x9)) (PreH24 : (x9 <= 127)) (PreH25 : ((-128) <= x10)) (PreH26 : (x10 <= 127)) (PreH27 : ((-128) <= x11)) (PreH28 : (x11 <= 127)) (PreH29 : ((-128) <= x12)) (PreH30 : (x12 <= 127)) (PreH31 : ((-128) <= x13)) (PreH32 : (x13 <= 127)) (PreH33 : ((-128) <= x14)) (PreH34 : (x14 <= 127)) (PreH35 : ((-128) <= x15)) (PreH36 : (x15 <= 127)) (PreH37 : ((-128) <= x16)) (PreH38 : (x16 <= 127)) (PreH39 : ((-128) <= x17)) (PreH40 : (x17 <= 127)) (PreH41 : ((-128) <= x18)) (PreH42 : (x18 <= 127)) (PreH43 : ((-128) <= x19)) (PreH44 : (x19 <= 127)) (PreH45 : ((-128) <= x20)) (PreH46 : (x20 <= 127)) (PreH47 : ((-128) <= x21)) (PreH48 : (x21 <= 127)) (PreH49 : ((-128) <= x22)) (PreH50 : (x22 <= 127)) (PreH51 : ((-128) <= x23)) (PreH52 : (x23 <= 127)) (PreH53 : ((-128) <= x24)) (PreH54 : (x24 <= 127)) (PreH55 : ((-128) <= x25)) (PreH56 : (x25 <= 127)) (PreH57 : ((-128) <= x26)) (PreH58 : (x26 <= 127)) (PreH59 : ((-128) <= x27)) (PreH60 : (x27 <= 127)) (PreH61 : ((-128) <= x28)) (PreH62 : (x28 <= 127)) (PreH63 : ((-128) <= x29)) (PreH64 : (x29 <= 127)) (PreH65 : ((-128) <= x30)) (PreH66 : (x30 <= 127)) (PreH67 : ((-128) <= x31)) (PreH68 : (x31 <= 127)) ,
  TT && emp 
|--
  “ ((s8_rvv_prefix (i) ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) = (s8_rvv_prefix (vl_pre) ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))))) ”
  &&  emp
).

Definition qcp_qa_rvv_store32_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (i: Z) (PreH1 : (i >= vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 32)) (PreH5 : ((-128) <= x0)) (PreH6 : (x0 <= 127)) (PreH7 : ((-128) <= x1)) (PreH8 : (x1 <= 127)) (PreH9 : ((-128) <= x2)) (PreH10 : (x2 <= 127)) (PreH11 : ((-128) <= x3)) (PreH12 : (x3 <= 127)) (PreH13 : ((-128) <= x4)) (PreH14 : (x4 <= 127)) (PreH15 : ((-128) <= x5)) (PreH16 : (x5 <= 127)) (PreH17 : ((-128) <= x6)) (PreH18 : (x6 <= 127)) (PreH19 : ((-128) <= x7)) (PreH20 : (x7 <= 127)) (PreH21 : ((-128) <= x8)) (PreH22 : (x8 <= 127)) (PreH23 : ((-128) <= x9)) (PreH24 : (x9 <= 127)) (PreH25 : ((-128) <= x10)) (PreH26 : (x10 <= 127)) (PreH27 : ((-128) <= x11)) (PreH28 : (x11 <= 127)) (PreH29 : ((-128) <= x12)) (PreH30 : (x12 <= 127)) (PreH31 : ((-128) <= x13)) (PreH32 : (x13 <= 127)) (PreH33 : ((-128) <= x14)) (PreH34 : (x14 <= 127)) (PreH35 : ((-128) <= x15)) (PreH36 : (x15 <= 127)) (PreH37 : ((-128) <= x16)) (PreH38 : (x16 <= 127)) (PreH39 : ((-128) <= x17)) (PreH40 : (x17 <= 127)) (PreH41 : ((-128) <= x18)) (PreH42 : (x18 <= 127)) (PreH43 : ((-128) <= x19)) (PreH44 : (x19 <= 127)) (PreH45 : ((-128) <= x20)) (PreH46 : (x20 <= 127)) (PreH47 : ((-128) <= x21)) (PreH48 : (x21 <= 127)) (PreH49 : ((-128) <= x22)) (PreH50 : (x22 <= 127)) (PreH51 : ((-128) <= x23)) (PreH52 : (x23 <= 127)) (PreH53 : ((-128) <= x24)) (PreH54 : (x24 <= 127)) (PreH55 : ((-128) <= x25)) (PreH56 : (x25 <= 127)) (PreH57 : ((-128) <= x26)) (PreH58 : (x26 <= 127)) (PreH59 : ((-128) <= x27)) (PreH60 : (x27 <= 127)) (PreH61 : ((-128) <= x28)) (PreH62 : (x28 <= 127)) (PreH63 : ((-128) <= x29)) (PreH64 : (x29 <= 127)) (PreH65 : ((-128) <= x30)) (PreH66 : (x30 <= 127)) (PreH67 : ((-128) <= x31)) (PreH68 : (x31 <= 127)) ,
  ((s8_rvv_prefix (i) ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) = (s8_rvv_prefix (vl_pre) ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))))
.

Definition qcp_qa_rvv_store32_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (i: Z) (PreH1 : (i < vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 32)) (PreH5 : ((-128) <= x0)) (PreH6 : (x0 <= 127)) (PreH7 : ((-128) <= x1)) (PreH8 : (x1 <= 127)) (PreH9 : ((-128) <= x2)) (PreH10 : (x2 <= 127)) (PreH11 : ((-128) <= x3)) (PreH12 : (x3 <= 127)) (PreH13 : ((-128) <= x4)) (PreH14 : (x4 <= 127)) (PreH15 : ((-128) <= x5)) (PreH16 : (x5 <= 127)) (PreH17 : ((-128) <= x6)) (PreH18 : (x6 <= 127)) (PreH19 : ((-128) <= x7)) (PreH20 : (x7 <= 127)) (PreH21 : ((-128) <= x8)) (PreH22 : (x8 <= 127)) (PreH23 : ((-128) <= x9)) (PreH24 : (x9 <= 127)) (PreH25 : ((-128) <= x10)) (PreH26 : (x10 <= 127)) (PreH27 : ((-128) <= x11)) (PreH28 : (x11 <= 127)) (PreH29 : ((-128) <= x12)) (PreH30 : (x12 <= 127)) (PreH31 : ((-128) <= x13)) (PreH32 : (x13 <= 127)) (PreH33 : ((-128) <= x14)) (PreH34 : (x14 <= 127)) (PreH35 : ((-128) <= x15)) (PreH36 : (x15 <= 127)) (PreH37 : ((-128) <= x16)) (PreH38 : (x16 <= 127)) (PreH39 : ((-128) <= x17)) (PreH40 : (x17 <= 127)) (PreH41 : ((-128) <= x18)) (PreH42 : (x18 <= 127)) (PreH43 : ((-128) <= x19)) (PreH44 : (x19 <= 127)) (PreH45 : ((-128) <= x20)) (PreH46 : (x20 <= 127)) (PreH47 : ((-128) <= x21)) (PreH48 : (x21 <= 127)) (PreH49 : ((-128) <= x22)) (PreH50 : (x22 <= 127)) (PreH51 : ((-128) <= x23)) (PreH52 : (x23 <= 127)) (PreH53 : ((-128) <= x24)) (PreH54 : (x24 <= 127)) (PreH55 : ((-128) <= x25)) (PreH56 : (x25 <= 127)) (PreH57 : ((-128) <= x26)) (PreH58 : (x26 <= 127)) (PreH59 : ((-128) <= x27)) (PreH60 : (x27 <= 127)) (PreH61 : ((-128) <= x28)) (PreH62 : (x28 <= 127)) (PreH63 : ((-128) <= x29)) (PreH64 : (x29 <= 127)) (PreH65 : ((-128) <= x30)) (PreH66 : (x30 <= 127)) (PreH67 : ((-128) <= x31)) (PreH68 : (x31 <= 127)) ,
  ((( &( "value" ) )) # Char  |->_)
  **  ((( &( "i" ) )) # UInt64  |-> i)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
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
  **  (CharArray.seg p_pre 0 i (s8_rvv_prefix (i) ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )
  **  (CharArray.undef_seg p_pre i vl_pre )
|--
  “ (0 <= i) ” 
  &&  “ (i < 32) ” 
  &&  “ ((-128) <= x0) ” 
  &&  “ (x0 <= 127) ” 
  &&  “ ((-128) <= x1) ” 
  &&  “ (x1 <= 127) ” 
  &&  “ ((-128) <= x2) ” 
  &&  “ (x2 <= 127) ” 
  &&  “ ((-128) <= x3) ” 
  &&  “ (x3 <= 127) ” 
  &&  “ ((-128) <= x4) ” 
  &&  “ (x4 <= 127) ” 
  &&  “ ((-128) <= x5) ” 
  &&  “ (x5 <= 127) ” 
  &&  “ ((-128) <= x6) ” 
  &&  “ (x6 <= 127) ” 
  &&  “ ((-128) <= x7) ” 
  &&  “ (x7 <= 127) ” 
  &&  “ ((-128) <= x8) ” 
  &&  “ (x8 <= 127) ” 
  &&  “ ((-128) <= x9) ” 
  &&  “ (x9 <= 127) ” 
  &&  “ ((-128) <= x10) ” 
  &&  “ (x10 <= 127) ” 
  &&  “ ((-128) <= x11) ” 
  &&  “ (x11 <= 127) ” 
  &&  “ ((-128) <= x12) ” 
  &&  “ (x12 <= 127) ” 
  &&  “ ((-128) <= x13) ” 
  &&  “ (x13 <= 127) ” 
  &&  “ ((-128) <= x14) ” 
  &&  “ (x14 <= 127) ” 
  &&  “ ((-128) <= x15) ” 
  &&  “ (x15 <= 127) ” 
  &&  “ ((-128) <= x16) ” 
  &&  “ (x16 <= 127) ” 
  &&  “ ((-128) <= x17) ” 
  &&  “ (x17 <= 127) ” 
  &&  “ ((-128) <= x18) ” 
  &&  “ (x18 <= 127) ” 
  &&  “ ((-128) <= x19) ” 
  &&  “ (x19 <= 127) ” 
  &&  “ ((-128) <= x20) ” 
  &&  “ (x20 <= 127) ” 
  &&  “ ((-128) <= x21) ” 
  &&  “ (x21 <= 127) ” 
  &&  “ ((-128) <= x22) ” 
  &&  “ (x22 <= 127) ” 
  &&  “ ((-128) <= x23) ” 
  &&  “ (x23 <= 127) ” 
  &&  “ ((-128) <= x24) ” 
  &&  “ (x24 <= 127) ” 
  &&  “ ((-128) <= x25) ” 
  &&  “ (x25 <= 127) ” 
  &&  “ ((-128) <= x26) ” 
  &&  “ (x26 <= 127) ” 
  &&  “ ((-128) <= x27) ” 
  &&  “ (x27 <= 127) ” 
  &&  “ ((-128) <= x28) ” 
  &&  “ (x28 <= 127) ” 
  &&  “ ((-128) <= x29) ” 
  &&  “ (x29 <= 127) ” 
  &&  “ ((-128) <= x30) ” 
  &&  “ (x30 <= 127) ” 
  &&  “ ((-128) <= x31) ” 
  &&  “ (x31 <= 127) ”
.

Definition qcp_qa_rvv_store32_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (i: Z) (PreH1 : (i < vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 32)) (PreH5 : ((-128) <= x0)) (PreH6 : (x0 <= 127)) (PreH7 : ((-128) <= x1)) (PreH8 : (x1 <= 127)) (PreH9 : ((-128) <= x2)) (PreH10 : (x2 <= 127)) (PreH11 : ((-128) <= x3)) (PreH12 : (x3 <= 127)) (PreH13 : ((-128) <= x4)) (PreH14 : (x4 <= 127)) (PreH15 : ((-128) <= x5)) (PreH16 : (x5 <= 127)) (PreH17 : ((-128) <= x6)) (PreH18 : (x6 <= 127)) (PreH19 : ((-128) <= x7)) (PreH20 : (x7 <= 127)) (PreH21 : ((-128) <= x8)) (PreH22 : (x8 <= 127)) (PreH23 : ((-128) <= x9)) (PreH24 : (x9 <= 127)) (PreH25 : ((-128) <= x10)) (PreH26 : (x10 <= 127)) (PreH27 : ((-128) <= x11)) (PreH28 : (x11 <= 127)) (PreH29 : ((-128) <= x12)) (PreH30 : (x12 <= 127)) (PreH31 : ((-128) <= x13)) (PreH32 : (x13 <= 127)) (PreH33 : ((-128) <= x14)) (PreH34 : (x14 <= 127)) (PreH35 : ((-128) <= x15)) (PreH36 : (x15 <= 127)) (PreH37 : ((-128) <= x16)) (PreH38 : (x16 <= 127)) (PreH39 : ((-128) <= x17)) (PreH40 : (x17 <= 127)) (PreH41 : ((-128) <= x18)) (PreH42 : (x18 <= 127)) (PreH43 : ((-128) <= x19)) (PreH44 : (x19 <= 127)) (PreH45 : ((-128) <= x20)) (PreH46 : (x20 <= 127)) (PreH47 : ((-128) <= x21)) (PreH48 : (x21 <= 127)) (PreH49 : ((-128) <= x22)) (PreH50 : (x22 <= 127)) (PreH51 : ((-128) <= x23)) (PreH52 : (x23 <= 127)) (PreH53 : ((-128) <= x24)) (PreH54 : (x24 <= 127)) (PreH55 : ((-128) <= x25)) (PreH56 : (x25 <= 127)) (PreH57 : ((-128) <= x26)) (PreH58 : (x26 <= 127)) (PreH59 : ((-128) <= x27)) (PreH60 : (x27 <= 127)) (PreH61 : ((-128) <= x28)) (PreH62 : (x28 <= 127)) (PreH63 : ((-128) <= x29)) (PreH64 : (x29 <= 127)) (PreH65 : ((-128) <= x30)) (PreH66 : (x30 <= 127)) (PreH67 : ((-128) <= x31)) (PreH68 : (x31 <= 127)) ,
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
  **  (CharArray.seg p_pre 0 i (s8_rvv_prefix (i) ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )
  **  (CharArray.undef_seg p_pre i vl_pre )
|--
  “ (0 <= i) ” 
  &&  “ (i < 32) ” 
  &&  “ ((-128) <= x0) ” 
  &&  “ (x0 <= 127) ” 
  &&  “ ((-128) <= x1) ” 
  &&  “ (x1 <= 127) ” 
  &&  “ ((-128) <= x2) ” 
  &&  “ (x2 <= 127) ” 
  &&  “ ((-128) <= x3) ” 
  &&  “ (x3 <= 127) ” 
  &&  “ ((-128) <= x4) ” 
  &&  “ (x4 <= 127) ” 
  &&  “ ((-128) <= x5) ” 
  &&  “ (x5 <= 127) ” 
  &&  “ ((-128) <= x6) ” 
  &&  “ (x6 <= 127) ” 
  &&  “ ((-128) <= x7) ” 
  &&  “ (x7 <= 127) ” 
  &&  “ ((-128) <= x8) ” 
  &&  “ (x8 <= 127) ” 
  &&  “ ((-128) <= x9) ” 
  &&  “ (x9 <= 127) ” 
  &&  “ ((-128) <= x10) ” 
  &&  “ (x10 <= 127) ” 
  &&  “ ((-128) <= x11) ” 
  &&  “ (x11 <= 127) ” 
  &&  “ ((-128) <= x12) ” 
  &&  “ (x12 <= 127) ” 
  &&  “ ((-128) <= x13) ” 
  &&  “ (x13 <= 127) ” 
  &&  “ ((-128) <= x14) ” 
  &&  “ (x14 <= 127) ” 
  &&  “ ((-128) <= x15) ” 
  &&  “ (x15 <= 127) ” 
  &&  “ ((-128) <= x16) ” 
  &&  “ (x16 <= 127) ” 
  &&  “ ((-128) <= x17) ” 
  &&  “ (x17 <= 127) ” 
  &&  “ ((-128) <= x18) ” 
  &&  “ (x18 <= 127) ” 
  &&  “ ((-128) <= x19) ” 
  &&  “ (x19 <= 127) ” 
  &&  “ ((-128) <= x20) ” 
  &&  “ (x20 <= 127) ” 
  &&  “ ((-128) <= x21) ” 
  &&  “ (x21 <= 127) ” 
  &&  “ ((-128) <= x22) ” 
  &&  “ (x22 <= 127) ” 
  &&  “ ((-128) <= x23) ” 
  &&  “ (x23 <= 127) ” 
  &&  “ ((-128) <= x24) ” 
  &&  “ (x24 <= 127) ” 
  &&  “ ((-128) <= x25) ” 
  &&  “ (x25 <= 127) ” 
  &&  “ ((-128) <= x26) ” 
  &&  “ (x26 <= 127) ” 
  &&  “ ((-128) <= x27) ” 
  &&  “ (x27 <= 127) ” 
  &&  “ ((-128) <= x28) ” 
  &&  “ (x28 <= 127) ” 
  &&  “ ((-128) <= x29) ” 
  &&  “ (x29 <= 127) ” 
  &&  “ ((-128) <= x30) ” 
  &&  “ (x30 <= 127) ” 
  &&  “ ((-128) <= x31) ” 
  &&  “ (x31 <= 127) ” 
  &&  “ (i < vl_pre) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((-128) <= x0) ” 
  &&  “ (x0 <= 127) ” 
  &&  “ ((-128) <= x1) ” 
  &&  “ (x1 <= 127) ” 
  &&  “ ((-128) <= x2) ” 
  &&  “ (x2 <= 127) ” 
  &&  “ ((-128) <= x3) ” 
  &&  “ (x3 <= 127) ” 
  &&  “ ((-128) <= x4) ” 
  &&  “ (x4 <= 127) ” 
  &&  “ ((-128) <= x5) ” 
  &&  “ (x5 <= 127) ” 
  &&  “ ((-128) <= x6) ” 
  &&  “ (x6 <= 127) ” 
  &&  “ ((-128) <= x7) ” 
  &&  “ (x7 <= 127) ” 
  &&  “ ((-128) <= x8) ” 
  &&  “ (x8 <= 127) ” 
  &&  “ ((-128) <= x9) ” 
  &&  “ (x9 <= 127) ” 
  &&  “ ((-128) <= x10) ” 
  &&  “ (x10 <= 127) ” 
  &&  “ ((-128) <= x11) ” 
  &&  “ (x11 <= 127) ” 
  &&  “ ((-128) <= x12) ” 
  &&  “ (x12 <= 127) ” 
  &&  “ ((-128) <= x13) ” 
  &&  “ (x13 <= 127) ” 
  &&  “ ((-128) <= x14) ” 
  &&  “ (x14 <= 127) ” 
  &&  “ ((-128) <= x15) ” 
  &&  “ (x15 <= 127) ” 
  &&  “ ((-128) <= x16) ” 
  &&  “ (x16 <= 127) ” 
  &&  “ ((-128) <= x17) ” 
  &&  “ (x17 <= 127) ” 
  &&  “ ((-128) <= x18) ” 
  &&  “ (x18 <= 127) ” 
  &&  “ ((-128) <= x19) ” 
  &&  “ (x19 <= 127) ” 
  &&  “ ((-128) <= x20) ” 
  &&  “ (x20 <= 127) ” 
  &&  “ ((-128) <= x21) ” 
  &&  “ (x21 <= 127) ” 
  &&  “ ((-128) <= x22) ” 
  &&  “ (x22 <= 127) ” 
  &&  “ ((-128) <= x23) ” 
  &&  “ (x23 <= 127) ” 
  &&  “ ((-128) <= x24) ” 
  &&  “ (x24 <= 127) ” 
  &&  “ ((-128) <= x25) ” 
  &&  “ (x25 <= 127) ” 
  &&  “ ((-128) <= x26) ” 
  &&  “ (x26 <= 127) ” 
  &&  “ ((-128) <= x27) ” 
  &&  “ (x27 <= 127) ” 
  &&  “ ((-128) <= x28) ” 
  &&  “ (x28 <= 127) ” 
  &&  “ ((-128) <= x29) ” 
  &&  “ (x29 <= 127) ” 
  &&  “ ((-128) <= x30) ” 
  &&  “ (x30 <= 127) ” 
  &&  “ ((-128) <= x31) ” 
  &&  “ (x31 <= 127) ”
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
  **  (CharArray.seg p_pre 0 i (s8_rvv_prefix (i) ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )
  **  (CharArray.undef_seg p_pre i vl_pre )
.

Definition qcp_qa_rvv_store32_partial_solve_wit_1 := qcp_qa_rvv_store32_partial_solve_wit_1_pure -> qcp_qa_rvv_store32_partial_solve_wit_1_aux.

Definition qcp_qa_rvv_store32_partial_solve_wit_2_pure := 
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (i: Z) (retval: Z) (PreH1 : (retval = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i)))) (PreH2 : ((-128) <= retval)) (PreH3 : (retval <= 127)) (PreH4 : (i < vl_pre)) (PreH5 : (0 <= i)) (PreH6 : (i <= vl_pre)) (PreH7 : (vl_pre <= 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
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
  **  ((( &( "value" ) )) # Char  |-> retval)
  **  ((( &( "i" ) )) # UInt64  |-> i)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  (CharArray.seg p_pre 0 i (s8_rvv_prefix (i) ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )
  **  (CharArray.undef_seg p_pre i vl_pre )
|--
  “ (0 <= i) ” 
  &&  “ (i < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((-128) <= retval) ” 
  &&  “ (retval <= 127) ”
.

Definition qcp_qa_rvv_store32_partial_solve_wit_2_aux := 
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (i: Z) (retval: Z) (PreH1 : (retval = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i)))) (PreH2 : ((-128) <= retval)) (PreH3 : (retval <= 127)) (PreH4 : (i < vl_pre)) (PreH5 : (0 <= i)) (PreH6 : (i <= vl_pre)) (PreH7 : (vl_pre <= 32)) (PreH8 : ((-128) <= x0)) (PreH9 : (x0 <= 127)) (PreH10 : ((-128) <= x1)) (PreH11 : (x1 <= 127)) (PreH12 : ((-128) <= x2)) (PreH13 : (x2 <= 127)) (PreH14 : ((-128) <= x3)) (PreH15 : (x3 <= 127)) (PreH16 : ((-128) <= x4)) (PreH17 : (x4 <= 127)) (PreH18 : ((-128) <= x5)) (PreH19 : (x5 <= 127)) (PreH20 : ((-128) <= x6)) (PreH21 : (x6 <= 127)) (PreH22 : ((-128) <= x7)) (PreH23 : (x7 <= 127)) (PreH24 : ((-128) <= x8)) (PreH25 : (x8 <= 127)) (PreH26 : ((-128) <= x9)) (PreH27 : (x9 <= 127)) (PreH28 : ((-128) <= x10)) (PreH29 : (x10 <= 127)) (PreH30 : ((-128) <= x11)) (PreH31 : (x11 <= 127)) (PreH32 : ((-128) <= x12)) (PreH33 : (x12 <= 127)) (PreH34 : ((-128) <= x13)) (PreH35 : (x13 <= 127)) (PreH36 : ((-128) <= x14)) (PreH37 : (x14 <= 127)) (PreH38 : ((-128) <= x15)) (PreH39 : (x15 <= 127)) (PreH40 : ((-128) <= x16)) (PreH41 : (x16 <= 127)) (PreH42 : ((-128) <= x17)) (PreH43 : (x17 <= 127)) (PreH44 : ((-128) <= x18)) (PreH45 : (x18 <= 127)) (PreH46 : ((-128) <= x19)) (PreH47 : (x19 <= 127)) (PreH48 : ((-128) <= x20)) (PreH49 : (x20 <= 127)) (PreH50 : ((-128) <= x21)) (PreH51 : (x21 <= 127)) (PreH52 : ((-128) <= x22)) (PreH53 : (x22 <= 127)) (PreH54 : ((-128) <= x23)) (PreH55 : (x23 <= 127)) (PreH56 : ((-128) <= x24)) (PreH57 : (x24 <= 127)) (PreH58 : ((-128) <= x25)) (PreH59 : (x25 <= 127)) (PreH60 : ((-128) <= x26)) (PreH61 : (x26 <= 127)) (PreH62 : ((-128) <= x27)) (PreH63 : (x27 <= 127)) (PreH64 : ((-128) <= x28)) (PreH65 : (x28 <= 127)) (PreH66 : ((-128) <= x29)) (PreH67 : (x29 <= 127)) (PreH68 : ((-128) <= x30)) (PreH69 : (x30 <= 127)) (PreH70 : ((-128) <= x31)) (PreH71 : (x31 <= 127)) ,
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
  **  (CharArray.seg p_pre 0 i (s8_rvv_prefix (i) ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )
  **  (CharArray.undef_seg p_pre i vl_pre )
|--
  “ (0 <= i) ” 
  &&  “ (i < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((-128) <= retval) ” 
  &&  “ (retval <= 127) ” 
  &&  “ (retval = (s8_rvv_nth ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) (i))) ” 
  &&  “ ((-128) <= retval) ” 
  &&  “ (retval <= 127) ” 
  &&  “ (i < vl_pre) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((-128) <= x0) ” 
  &&  “ (x0 <= 127) ” 
  &&  “ ((-128) <= x1) ” 
  &&  “ (x1 <= 127) ” 
  &&  “ ((-128) <= x2) ” 
  &&  “ (x2 <= 127) ” 
  &&  “ ((-128) <= x3) ” 
  &&  “ (x3 <= 127) ” 
  &&  “ ((-128) <= x4) ” 
  &&  “ (x4 <= 127) ” 
  &&  “ ((-128) <= x5) ” 
  &&  “ (x5 <= 127) ” 
  &&  “ ((-128) <= x6) ” 
  &&  “ (x6 <= 127) ” 
  &&  “ ((-128) <= x7) ” 
  &&  “ (x7 <= 127) ” 
  &&  “ ((-128) <= x8) ” 
  &&  “ (x8 <= 127) ” 
  &&  “ ((-128) <= x9) ” 
  &&  “ (x9 <= 127) ” 
  &&  “ ((-128) <= x10) ” 
  &&  “ (x10 <= 127) ” 
  &&  “ ((-128) <= x11) ” 
  &&  “ (x11 <= 127) ” 
  &&  “ ((-128) <= x12) ” 
  &&  “ (x12 <= 127) ” 
  &&  “ ((-128) <= x13) ” 
  &&  “ (x13 <= 127) ” 
  &&  “ ((-128) <= x14) ” 
  &&  “ (x14 <= 127) ” 
  &&  “ ((-128) <= x15) ” 
  &&  “ (x15 <= 127) ” 
  &&  “ ((-128) <= x16) ” 
  &&  “ (x16 <= 127) ” 
  &&  “ ((-128) <= x17) ” 
  &&  “ (x17 <= 127) ” 
  &&  “ ((-128) <= x18) ” 
  &&  “ (x18 <= 127) ” 
  &&  “ ((-128) <= x19) ” 
  &&  “ (x19 <= 127) ” 
  &&  “ ((-128) <= x20) ” 
  &&  “ (x20 <= 127) ” 
  &&  “ ((-128) <= x21) ” 
  &&  “ (x21 <= 127) ” 
  &&  “ ((-128) <= x22) ” 
  &&  “ (x22 <= 127) ” 
  &&  “ ((-128) <= x23) ” 
  &&  “ (x23 <= 127) ” 
  &&  “ ((-128) <= x24) ” 
  &&  “ (x24 <= 127) ” 
  &&  “ ((-128) <= x25) ” 
  &&  “ (x25 <= 127) ” 
  &&  “ ((-128) <= x26) ” 
  &&  “ (x26 <= 127) ” 
  &&  “ ((-128) <= x27) ” 
  &&  “ (x27 <= 127) ” 
  &&  “ ((-128) <= x28) ” 
  &&  “ (x28 <= 127) ” 
  &&  “ ((-128) <= x29) ” 
  &&  “ (x29 <= 127) ” 
  &&  “ ((-128) <= x30) ” 
  &&  “ (x30 <= 127) ” 
  &&  “ ((-128) <= x31) ” 
  &&  “ (x31 <= 127) ”
  &&  (CharArray.seg p_pre 0 i (s8_rvv_prefix (i) ((s8_rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )
  **  (CharArray.undef_seg p_pre i vl_pre )
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

Definition qcp_qa_rvv_store32_partial_solve_wit_2 := qcp_qa_rvv_store32_partial_solve_wit_2_pure -> qcp_qa_rvv_store32_partial_solve_wit_2_aux.

Module Type VC_Correct.

Include s8_arrays_Strategy_Correct.
Include rvv_store_Strategy_Correct.

Axiom proof_of_qcp_qa_rvv_get32_safety_wit_1 : qcp_qa_rvv_get32_safety_wit_1.
Axiom proof_of_qcp_qa_rvv_get32_safety_wit_2 : qcp_qa_rvv_get32_safety_wit_2.
Axiom proof_of_qcp_qa_rvv_get32_safety_wit_3 : qcp_qa_rvv_get32_safety_wit_3.
Axiom proof_of_qcp_qa_rvv_get32_safety_wit_4 : qcp_qa_rvv_get32_safety_wit_4.
Axiom proof_of_qcp_qa_rvv_get32_safety_wit_5 : qcp_qa_rvv_get32_safety_wit_5.
Axiom proof_of_qcp_qa_rvv_get32_safety_wit_6 : qcp_qa_rvv_get32_safety_wit_6.
Axiom proof_of_qcp_qa_rvv_get32_safety_wit_7 : qcp_qa_rvv_get32_safety_wit_7.
Axiom proof_of_qcp_qa_rvv_get32_safety_wit_8 : qcp_qa_rvv_get32_safety_wit_8.
Axiom proof_of_qcp_qa_rvv_get32_safety_wit_9 : qcp_qa_rvv_get32_safety_wit_9.
Axiom proof_of_qcp_qa_rvv_get32_safety_wit_10 : qcp_qa_rvv_get32_safety_wit_10.
Axiom proof_of_qcp_qa_rvv_get32_safety_wit_11 : qcp_qa_rvv_get32_safety_wit_11.
Axiom proof_of_qcp_qa_rvv_get32_safety_wit_12 : qcp_qa_rvv_get32_safety_wit_12.
Axiom proof_of_qcp_qa_rvv_get32_safety_wit_13 : qcp_qa_rvv_get32_safety_wit_13.
Axiom proof_of_qcp_qa_rvv_get32_safety_wit_14 : qcp_qa_rvv_get32_safety_wit_14.
Axiom proof_of_qcp_qa_rvv_get32_safety_wit_15 : qcp_qa_rvv_get32_safety_wit_15.
Axiom proof_of_qcp_qa_rvv_get32_safety_wit_16 : qcp_qa_rvv_get32_safety_wit_16.
Axiom proof_of_qcp_qa_rvv_get32_safety_wit_17 : qcp_qa_rvv_get32_safety_wit_17.
Axiom proof_of_qcp_qa_rvv_get32_safety_wit_18 : qcp_qa_rvv_get32_safety_wit_18.
Axiom proof_of_qcp_qa_rvv_get32_safety_wit_19 : qcp_qa_rvv_get32_safety_wit_19.
Axiom proof_of_qcp_qa_rvv_get32_safety_wit_20 : qcp_qa_rvv_get32_safety_wit_20.
Axiom proof_of_qcp_qa_rvv_get32_safety_wit_21 : qcp_qa_rvv_get32_safety_wit_21.
Axiom proof_of_qcp_qa_rvv_get32_safety_wit_22 : qcp_qa_rvv_get32_safety_wit_22.
Axiom proof_of_qcp_qa_rvv_get32_safety_wit_23 : qcp_qa_rvv_get32_safety_wit_23.
Axiom proof_of_qcp_qa_rvv_get32_safety_wit_24 : qcp_qa_rvv_get32_safety_wit_24.
Axiom proof_of_qcp_qa_rvv_get32_safety_wit_25 : qcp_qa_rvv_get32_safety_wit_25.
Axiom proof_of_qcp_qa_rvv_get32_safety_wit_26 : qcp_qa_rvv_get32_safety_wit_26.
Axiom proof_of_qcp_qa_rvv_get32_safety_wit_27 : qcp_qa_rvv_get32_safety_wit_27.
Axiom proof_of_qcp_qa_rvv_get32_safety_wit_28 : qcp_qa_rvv_get32_safety_wit_28.
Axiom proof_of_qcp_qa_rvv_get32_safety_wit_29 : qcp_qa_rvv_get32_safety_wit_29.
Axiom proof_of_qcp_qa_rvv_get32_safety_wit_30 : qcp_qa_rvv_get32_safety_wit_30.
Axiom proof_of_qcp_qa_rvv_get32_safety_wit_31 : qcp_qa_rvv_get32_safety_wit_31.
Axiom proof_of_qcp_qa_rvv_get32_return_wit_1 : qcp_qa_rvv_get32_return_wit_1.
Axiom proof_of_qcp_qa_rvv_get32_return_wit_2 : qcp_qa_rvv_get32_return_wit_2.
Axiom proof_of_qcp_qa_rvv_get32_return_wit_3 : qcp_qa_rvv_get32_return_wit_3.
Axiom proof_of_qcp_qa_rvv_get32_return_wit_4 : qcp_qa_rvv_get32_return_wit_4.
Axiom proof_of_qcp_qa_rvv_get32_return_wit_5 : qcp_qa_rvv_get32_return_wit_5.
Axiom proof_of_qcp_qa_rvv_get32_return_wit_6 : qcp_qa_rvv_get32_return_wit_6.
Axiom proof_of_qcp_qa_rvv_get32_return_wit_7 : qcp_qa_rvv_get32_return_wit_7.
Axiom proof_of_qcp_qa_rvv_get32_return_wit_8 : qcp_qa_rvv_get32_return_wit_8.
Axiom proof_of_qcp_qa_rvv_get32_return_wit_9 : qcp_qa_rvv_get32_return_wit_9.
Axiom proof_of_qcp_qa_rvv_get32_return_wit_10 : qcp_qa_rvv_get32_return_wit_10.
Axiom proof_of_qcp_qa_rvv_get32_return_wit_11 : qcp_qa_rvv_get32_return_wit_11.
Axiom proof_of_qcp_qa_rvv_get32_return_wit_12 : qcp_qa_rvv_get32_return_wit_12.
Axiom proof_of_qcp_qa_rvv_get32_return_wit_13 : qcp_qa_rvv_get32_return_wit_13.
Axiom proof_of_qcp_qa_rvv_get32_return_wit_14 : qcp_qa_rvv_get32_return_wit_14.
Axiom proof_of_qcp_qa_rvv_get32_return_wit_15 : qcp_qa_rvv_get32_return_wit_15.
Axiom proof_of_qcp_qa_rvv_get32_return_wit_16 : qcp_qa_rvv_get32_return_wit_16.
Axiom proof_of_qcp_qa_rvv_get32_return_wit_17 : qcp_qa_rvv_get32_return_wit_17.
Axiom proof_of_qcp_qa_rvv_get32_return_wit_18 : qcp_qa_rvv_get32_return_wit_18.
Axiom proof_of_qcp_qa_rvv_get32_return_wit_19 : qcp_qa_rvv_get32_return_wit_19.
Axiom proof_of_qcp_qa_rvv_get32_return_wit_20 : qcp_qa_rvv_get32_return_wit_20.
Axiom proof_of_qcp_qa_rvv_get32_return_wit_21 : qcp_qa_rvv_get32_return_wit_21.
Axiom proof_of_qcp_qa_rvv_get32_return_wit_22 : qcp_qa_rvv_get32_return_wit_22.
Axiom proof_of_qcp_qa_rvv_get32_return_wit_23 : qcp_qa_rvv_get32_return_wit_23.
Axiom proof_of_qcp_qa_rvv_get32_return_wit_24 : qcp_qa_rvv_get32_return_wit_24.
Axiom proof_of_qcp_qa_rvv_get32_return_wit_25 : qcp_qa_rvv_get32_return_wit_25.
Axiom proof_of_qcp_qa_rvv_get32_return_wit_26 : qcp_qa_rvv_get32_return_wit_26.
Axiom proof_of_qcp_qa_rvv_get32_return_wit_27 : qcp_qa_rvv_get32_return_wit_27.
Axiom proof_of_qcp_qa_rvv_get32_return_wit_28 : qcp_qa_rvv_get32_return_wit_28.
Axiom proof_of_qcp_qa_rvv_get32_return_wit_29 : qcp_qa_rvv_get32_return_wit_29.
Axiom proof_of_qcp_qa_rvv_get32_return_wit_30 : qcp_qa_rvv_get32_return_wit_30.
Axiom proof_of_qcp_qa_rvv_get32_return_wit_31 : qcp_qa_rvv_get32_return_wit_31.
Axiom proof_of_qcp_qa_rvv_get32_return_wit_32 : qcp_qa_rvv_get32_return_wit_32.
Axiom proof_of_qcp_s8_rvv_store_next_return_wit_1 : qcp_s8_rvv_store_next_return_wit_1.
Axiom proof_of_qcp_s8_rvv_store_next_partial_solve_wit_1 : qcp_s8_rvv_store_next_partial_solve_wit_1.
Axiom proof_of_qcp_qa_rvv_store32_safety_wit_1 : qcp_qa_rvv_store32_safety_wit_1.
Axiom proof_of_qcp_qa_rvv_store32_entail_wit_1 : qcp_qa_rvv_store32_entail_wit_1.
Axiom proof_of_qcp_qa_rvv_store32_entail_wit_2 : qcp_qa_rvv_store32_entail_wit_2.
Axiom proof_of_qcp_qa_rvv_store32_return_wit_1 : qcp_qa_rvv_store32_return_wit_1.
Axiom proof_of_qcp_qa_rvv_store32_partial_solve_wit_1_pure : qcp_qa_rvv_store32_partial_solve_wit_1_pure.
Axiom proof_of_qcp_qa_rvv_store32_partial_solve_wit_1 : qcp_qa_rvv_store32_partial_solve_wit_1.
Axiom proof_of_qcp_qa_rvv_store32_partial_solve_wit_2_pure : qcp_qa_rvv_store32_partial_solve_wit_2_pure.
Axiom proof_of_qcp_qa_rvv_store32_partial_solve_wit_2 : qcp_qa_rvv_store32_partial_solve_wit_2.

End VC_Correct.
