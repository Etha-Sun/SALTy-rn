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
Require Import Rndne.Types.
Require Import QcpVadd.VaddBits.
Require Import QcpNeonLoop.InvariantFacts.
Require Import QcpNeon.NeonBridge.
Require Import QcpNeonLoop.NeonLoopBridge.
Require Import QcpRvv32.RvvLogic.
Require Import QcpRvv32.RvvStoreModel.
Require Import QcpRvv32.RvvLoopModel.
Require Import Rndne.ProgramModel.
Require Import QcpVadd.VaddBits.
Require Import QcpRvv32.RvvLogic.
Require Import QcpRvv32.RvvStoreModel.
Require Import QcpRvv32.RvvLoopModel.
Local Open Scope sac.
From QcpVadd Require Import float_array_strategy_goal.
From QcpVadd Require Import float_array_strategy_proof.
From QcpNeon Require Import neon_bridge_strategy_goal.
From QcpNeon Require Import neon_bridge_strategy_proof.
From QcpNeonLoop Require Import neon_tail_strategy_goal.
From QcpNeonLoop Require Import neon_tail_strategy_proof.
From QcpRvv32 Require Import rvv_arrays_strategy_goal.
From QcpRvv32 Require Import rvv_arrays_strategy_proof.
From QcpRvv32 Require Import rvv_store_strategy_goal.
From QcpRvv32 Require Import rvv_store_strategy_proof.
From QcpRvv32 Require Import rvv_loop_strategy_goal.
From QcpRvv32 Require Import rvv_loop_strategy_proof.
From Rndne Require Import rndne_memory_strategy_goal.
From Rndne Require Import rndne_memory_strategy_proof.

(*----- Function qcp_rvv_get32 -----*)

Definition qcp_rvv_get32_safety_wit_1 := 
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_rvv_get32_safety_wit_2 := 
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_rvv_get32_safety_wit_3 := 
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition qcp_rvv_get32_safety_wit_4 := 
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition qcp_rvv_get32_safety_wit_5 := 
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition qcp_rvv_get32_safety_wit_6 := 
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 5) ”
.

Definition qcp_rvv_get32_safety_wit_7 := 
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 6) ”
.

Definition qcp_rvv_get32_safety_wit_8 := 
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 7) ”
.

Definition qcp_rvv_get32_safety_wit_9 := 
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition qcp_rvv_get32_safety_wit_10 := 
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 9) ”
.

Definition qcp_rvv_get32_safety_wit_11 := 
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 10) ”
.

Definition qcp_rvv_get32_safety_wit_12 := 
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 11) ”
.

Definition qcp_rvv_get32_safety_wit_13 := 
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 12) ”
.

Definition qcp_rvv_get32_safety_wit_14 := 
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 13) ”
.

Definition qcp_rvv_get32_safety_wit_15 := 
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 14) ”
.

Definition qcp_rvv_get32_safety_wit_16 := 
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 15) ”
.

Definition qcp_rvv_get32_safety_wit_17 := 
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition qcp_rvv_get32_safety_wit_18 := 
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (17 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 17) ”
.

Definition qcp_rvv_get32_safety_wit_19 := 
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (18 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 18) ”
.

Definition qcp_rvv_get32_safety_wit_20 := 
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (19 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 19) ”
.

Definition qcp_rvv_get32_safety_wit_21 := 
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (20 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 20) ”
.

Definition qcp_rvv_get32_safety_wit_22 := 
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (21 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 21) ”
.

Definition qcp_rvv_get32_safety_wit_23 := 
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (22 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 22) ”
.

Definition qcp_rvv_get32_safety_wit_24 := 
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (23 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 23) ”
.

Definition qcp_rvv_get32_safety_wit_25 := 
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (24 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 24) ”
.

Definition qcp_rvv_get32_safety_wit_26 := 
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (25 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 25) ”
.

Definition qcp_rvv_get32_safety_wit_27 := 
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (26 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 26) ”
.

Definition qcp_rvv_get32_safety_wit_28 := 
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (27 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 27) ”
.

Definition qcp_rvv_get32_safety_wit_29 := 
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) (PreH31 : (27 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (28 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 28) ”
.

Definition qcp_rvv_get32_safety_wit_30 := 
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) (PreH31 : (27 <> i_pre)) (PreH32 : (28 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (29 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 29) ”
.

Definition qcp_rvv_get32_safety_wit_31 := 
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) (PreH31 : (27 <> i_pre)) (PreH32 : (28 <> i_pre)) (PreH33 : (29 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (30 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 30) ”
.

Definition qcp_rvv_get32_safety_wit_32 := 
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) (PreH31 : (27 <> i_pre)) (PreH32 : (28 <> i_pre)) (PreH33 : (29 <> i_pre)) (PreH34 : (30 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (31 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 31) ”
.

Definition qcp_rvv_get32_safety_wit_33 := 
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) (PreH31 : (27 <> i_pre)) (PreH32 : (28 <> i_pre)) (PreH33 : (29 <> i_pre)) (PreH34 : (30 <> i_pre)) (PreH35 : (31 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ False ”
.

Definition qcp_rvv_get32_return_wit_1 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) (PreH31 : (27 <> i_pre)) (PreH32 : (28 <> i_pre)) (PreH33 : (29 <> i_pre)) (PreH34 : (30 <> i_pre)) (PreH35 : (31 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (fp32_bits_equal x31 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
) \/
(
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) (PreH31 : (27 <> i_pre)) (PreH32 : (28 <> i_pre)) (PreH33 : (29 <> i_pre)) (PreH34 : (30 <> i_pre)) (PreH35 : (31 = i_pre)) ,
  TT && emp 
|--
  “ (fp32_bits_equal x31 (rvv_get (31) (L)) ) ”
  &&  emp
).

Definition qcp_rvv_get32_return_wit_1_split_goal_1 := 
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) (PreH31 : (27 <> i_pre)) (PreH32 : (28 <> i_pre)) (PreH33 : (29 <> i_pre)) (PreH34 : (30 <> i_pre)) (PreH35 : (31 = i_pre)) ,
  (fp32_bits_equal x31 (rvv_get (31) (L)) )
.

Definition qcp_rvv_get32_return_wit_2 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) (PreH31 : (27 <> i_pre)) (PreH32 : (28 <> i_pre)) (PreH33 : (29 <> i_pre)) (PreH34 : (30 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (fp32_bits_equal x30 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
) \/
(
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) (PreH31 : (27 <> i_pre)) (PreH32 : (28 <> i_pre)) (PreH33 : (29 <> i_pre)) (PreH34 : (30 = i_pre)) ,
  TT && emp 
|--
  “ (fp32_bits_equal x30 (rvv_get (30) (L)) ) ”
  &&  emp
).

Definition qcp_rvv_get32_return_wit_2_split_goal_1 := 
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) (PreH31 : (27 <> i_pre)) (PreH32 : (28 <> i_pre)) (PreH33 : (29 <> i_pre)) (PreH34 : (30 = i_pre)) ,
  (fp32_bits_equal x30 (rvv_get (30) (L)) )
.

Definition qcp_rvv_get32_return_wit_3 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) (PreH31 : (27 <> i_pre)) (PreH32 : (28 <> i_pre)) (PreH33 : (29 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (fp32_bits_equal x29 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
) \/
(
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) (PreH31 : (27 <> i_pre)) (PreH32 : (28 <> i_pre)) (PreH33 : (29 = i_pre)) ,
  TT && emp 
|--
  “ (fp32_bits_equal x29 (rvv_get (29) (L)) ) ”
  &&  emp
).

Definition qcp_rvv_get32_return_wit_3_split_goal_1 := 
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) (PreH31 : (27 <> i_pre)) (PreH32 : (28 <> i_pre)) (PreH33 : (29 = i_pre)) ,
  (fp32_bits_equal x29 (rvv_get (29) (L)) )
.

Definition qcp_rvv_get32_return_wit_4 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) (PreH31 : (27 <> i_pre)) (PreH32 : (28 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (fp32_bits_equal x28 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
) \/
(
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) (PreH31 : (27 <> i_pre)) (PreH32 : (28 = i_pre)) ,
  TT && emp 
|--
  “ (fp32_bits_equal x28 (rvv_get (28) (L)) ) ”
  &&  emp
).

Definition qcp_rvv_get32_return_wit_4_split_goal_1 := 
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) (PreH31 : (27 <> i_pre)) (PreH32 : (28 = i_pre)) ,
  (fp32_bits_equal x28 (rvv_get (28) (L)) )
.

Definition qcp_rvv_get32_return_wit_5 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) (PreH31 : (27 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (fp32_bits_equal x27 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
) \/
(
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) (PreH31 : (27 = i_pre)) ,
  TT && emp 
|--
  “ (fp32_bits_equal x27 (rvv_get (27) (L)) ) ”
  &&  emp
).

Definition qcp_rvv_get32_return_wit_5_split_goal_1 := 
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) (PreH31 : (27 = i_pre)) ,
  (fp32_bits_equal x27 (rvv_get (27) (L)) )
.

Definition qcp_rvv_get32_return_wit_6 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (fp32_bits_equal x26 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
) \/
(
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 = i_pre)) ,
  TT && emp 
|--
  “ (fp32_bits_equal x26 (rvv_get (26) (L)) ) ”
  &&  emp
).

Definition qcp_rvv_get32_return_wit_6_split_goal_1 := 
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 = i_pre)) ,
  (fp32_bits_equal x26 (rvv_get (26) (L)) )
.

Definition qcp_rvv_get32_return_wit_7 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (fp32_bits_equal x25 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
) \/
(
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 = i_pre)) ,
  TT && emp 
|--
  “ (fp32_bits_equal x25 (rvv_get (25) (L)) ) ”
  &&  emp
).

Definition qcp_rvv_get32_return_wit_7_split_goal_1 := 
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 = i_pre)) ,
  (fp32_bits_equal x25 (rvv_get (25) (L)) )
.

Definition qcp_rvv_get32_return_wit_8 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (fp32_bits_equal x24 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
) \/
(
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 = i_pre)) ,
  TT && emp 
|--
  “ (fp32_bits_equal x24 (rvv_get (24) (L)) ) ”
  &&  emp
).

Definition qcp_rvv_get32_return_wit_8_split_goal_1 := 
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 = i_pre)) ,
  (fp32_bits_equal x24 (rvv_get (24) (L)) )
.

Definition qcp_rvv_get32_return_wit_9 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (fp32_bits_equal x23 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
) \/
(
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 = i_pre)) ,
  TT && emp 
|--
  “ (fp32_bits_equal x23 (rvv_get (23) (L)) ) ”
  &&  emp
).

Definition qcp_rvv_get32_return_wit_9_split_goal_1 := 
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 = i_pre)) ,
  (fp32_bits_equal x23 (rvv_get (23) (L)) )
.

Definition qcp_rvv_get32_return_wit_10 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (fp32_bits_equal x22 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
) \/
(
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 = i_pre)) ,
  TT && emp 
|--
  “ (fp32_bits_equal x22 (rvv_get (22) (L)) ) ”
  &&  emp
).

Definition qcp_rvv_get32_return_wit_10_split_goal_1 := 
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 = i_pre)) ,
  (fp32_bits_equal x22 (rvv_get (22) (L)) )
.

Definition qcp_rvv_get32_return_wit_11 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (fp32_bits_equal x21 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
) \/
(
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 = i_pre)) ,
  TT && emp 
|--
  “ (fp32_bits_equal x21 (rvv_get (21) (L)) ) ”
  &&  emp
).

Definition qcp_rvv_get32_return_wit_11_split_goal_1 := 
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 = i_pre)) ,
  (fp32_bits_equal x21 (rvv_get (21) (L)) )
.

Definition qcp_rvv_get32_return_wit_12 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (fp32_bits_equal x20 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
) \/
(
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 = i_pre)) ,
  TT && emp 
|--
  “ (fp32_bits_equal x20 (rvv_get (20) (L)) ) ”
  &&  emp
).

Definition qcp_rvv_get32_return_wit_12_split_goal_1 := 
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 = i_pre)) ,
  (fp32_bits_equal x20 (rvv_get (20) (L)) )
.

Definition qcp_rvv_get32_return_wit_13 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (fp32_bits_equal x19 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
) \/
(
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 = i_pre)) ,
  TT && emp 
|--
  “ (fp32_bits_equal x19 (rvv_get (19) (L)) ) ”
  &&  emp
).

Definition qcp_rvv_get32_return_wit_13_split_goal_1 := 
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 = i_pre)) ,
  (fp32_bits_equal x19 (rvv_get (19) (L)) )
.

Definition qcp_rvv_get32_return_wit_14 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (fp32_bits_equal x18 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
) \/
(
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 = i_pre)) ,
  TT && emp 
|--
  “ (fp32_bits_equal x18 (rvv_get (18) (L)) ) ”
  &&  emp
).

Definition qcp_rvv_get32_return_wit_14_split_goal_1 := 
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 = i_pre)) ,
  (fp32_bits_equal x18 (rvv_get (18) (L)) )
.

Definition qcp_rvv_get32_return_wit_15 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (fp32_bits_equal x17 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
) \/
(
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 = i_pre)) ,
  TT && emp 
|--
  “ (fp32_bits_equal x17 (rvv_get (17) (L)) ) ”
  &&  emp
).

Definition qcp_rvv_get32_return_wit_15_split_goal_1 := 
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 = i_pre)) ,
  (fp32_bits_equal x17 (rvv_get (17) (L)) )
.

Definition qcp_rvv_get32_return_wit_16 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (fp32_bits_equal x16 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
) \/
(
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 = i_pre)) ,
  TT && emp 
|--
  “ (fp32_bits_equal x16 (rvv_get (16) (L)) ) ”
  &&  emp
).

Definition qcp_rvv_get32_return_wit_16_split_goal_1 := 
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 = i_pre)) ,
  (fp32_bits_equal x16 (rvv_get (16) (L)) )
.

Definition qcp_rvv_get32_return_wit_17 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (fp32_bits_equal x15 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
) \/
(
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 = i_pre)) ,
  TT && emp 
|--
  “ (fp32_bits_equal x15 (rvv_get (15) (L)) ) ”
  &&  emp
).

Definition qcp_rvv_get32_return_wit_17_split_goal_1 := 
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 = i_pre)) ,
  (fp32_bits_equal x15 (rvv_get (15) (L)) )
.

Definition qcp_rvv_get32_return_wit_18 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (fp32_bits_equal x14 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
) \/
(
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 = i_pre)) ,
  TT && emp 
|--
  “ (fp32_bits_equal x14 (rvv_get (14) (L)) ) ”
  &&  emp
).

Definition qcp_rvv_get32_return_wit_18_split_goal_1 := 
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 = i_pre)) ,
  (fp32_bits_equal x14 (rvv_get (14) (L)) )
.

Definition qcp_rvv_get32_return_wit_19 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (fp32_bits_equal x13 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
) \/
(
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 = i_pre)) ,
  TT && emp 
|--
  “ (fp32_bits_equal x13 (rvv_get (13) (L)) ) ”
  &&  emp
).

Definition qcp_rvv_get32_return_wit_19_split_goal_1 := 
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 = i_pre)) ,
  (fp32_bits_equal x13 (rvv_get (13) (L)) )
.

Definition qcp_rvv_get32_return_wit_20 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (fp32_bits_equal x12 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
) \/
(
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 = i_pre)) ,
  TT && emp 
|--
  “ (fp32_bits_equal x12 (rvv_get (12) (L)) ) ”
  &&  emp
).

Definition qcp_rvv_get32_return_wit_20_split_goal_1 := 
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 = i_pre)) ,
  (fp32_bits_equal x12 (rvv_get (12) (L)) )
.

Definition qcp_rvv_get32_return_wit_21 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (fp32_bits_equal x11 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
) \/
(
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 = i_pre)) ,
  TT && emp 
|--
  “ (fp32_bits_equal x11 (rvv_get (11) (L)) ) ”
  &&  emp
).

Definition qcp_rvv_get32_return_wit_21_split_goal_1 := 
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 = i_pre)) ,
  (fp32_bits_equal x11 (rvv_get (11) (L)) )
.

Definition qcp_rvv_get32_return_wit_22 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (fp32_bits_equal x10 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
) \/
(
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 = i_pre)) ,
  TT && emp 
|--
  “ (fp32_bits_equal x10 (rvv_get (10) (L)) ) ”
  &&  emp
).

Definition qcp_rvv_get32_return_wit_22_split_goal_1 := 
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 = i_pre)) ,
  (fp32_bits_equal x10 (rvv_get (10) (L)) )
.

Definition qcp_rvv_get32_return_wit_23 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (fp32_bits_equal x9 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
) \/
(
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 = i_pre)) ,
  TT && emp 
|--
  “ (fp32_bits_equal x9 (rvv_get (9) (L)) ) ”
  &&  emp
).

Definition qcp_rvv_get32_return_wit_23_split_goal_1 := 
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 = i_pre)) ,
  (fp32_bits_equal x9 (rvv_get (9) (L)) )
.

Definition qcp_rvv_get32_return_wit_24 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (fp32_bits_equal x8 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
) \/
(
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 = i_pre)) ,
  TT && emp 
|--
  “ (fp32_bits_equal x8 (rvv_get (8) (L)) ) ”
  &&  emp
).

Definition qcp_rvv_get32_return_wit_24_split_goal_1 := 
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 = i_pre)) ,
  (fp32_bits_equal x8 (rvv_get (8) (L)) )
.

Definition qcp_rvv_get32_return_wit_25 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (fp32_bits_equal x7 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
) \/
(
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 = i_pre)) ,
  TT && emp 
|--
  “ (fp32_bits_equal x7 (rvv_get (7) (L)) ) ”
  &&  emp
).

Definition qcp_rvv_get32_return_wit_25_split_goal_1 := 
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 = i_pre)) ,
  (fp32_bits_equal x7 (rvv_get (7) (L)) )
.

Definition qcp_rvv_get32_return_wit_26 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (fp32_bits_equal x6 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
) \/
(
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 = i_pre)) ,
  TT && emp 
|--
  “ (fp32_bits_equal x6 (rvv_get (6) (L)) ) ”
  &&  emp
).

Definition qcp_rvv_get32_return_wit_26_split_goal_1 := 
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 = i_pre)) ,
  (fp32_bits_equal x6 (rvv_get (6) (L)) )
.

Definition qcp_rvv_get32_return_wit_27 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (fp32_bits_equal x5 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
) \/
(
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 = i_pre)) ,
  TT && emp 
|--
  “ (fp32_bits_equal x5 (rvv_get (5) (L)) ) ”
  &&  emp
).

Definition qcp_rvv_get32_return_wit_27_split_goal_1 := 
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 = i_pre)) ,
  (fp32_bits_equal x5 (rvv_get (5) (L)) )
.

Definition qcp_rvv_get32_return_wit_28 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (fp32_bits_equal x4 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
) \/
(
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 = i_pre)) ,
  TT && emp 
|--
  “ (fp32_bits_equal x4 (rvv_get (4) (L)) ) ”
  &&  emp
).

Definition qcp_rvv_get32_return_wit_28_split_goal_1 := 
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 = i_pre)) ,
  (fp32_bits_equal x4 (rvv_get (4) (L)) )
.

Definition qcp_rvv_get32_return_wit_29 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (fp32_bits_equal x3 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
) \/
(
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 = i_pre)) ,
  TT && emp 
|--
  “ (fp32_bits_equal x3 (rvv_get (3) (L)) ) ”
  &&  emp
).

Definition qcp_rvv_get32_return_wit_29_split_goal_1 := 
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 = i_pre)) ,
  (fp32_bits_equal x3 (rvv_get (3) (L)) )
.

Definition qcp_rvv_get32_return_wit_30 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (fp32_bits_equal x2 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
) \/
(
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 = i_pre)) ,
  TT && emp 
|--
  “ (fp32_bits_equal x2 (rvv_get (2) (L)) ) ”
  &&  emp
).

Definition qcp_rvv_get32_return_wit_30_split_goal_1 := 
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 = i_pre)) ,
  (fp32_bits_equal x2 (rvv_get (2) (L)) )
.

Definition qcp_rvv_get32_return_wit_31 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (fp32_bits_equal x1 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
) \/
(
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 = i_pre)) ,
  TT && emp 
|--
  “ (fp32_bits_equal x1 (rvv_get (1) (L)) ) ”
  &&  emp
).

Definition qcp_rvv_get32_return_wit_31_split_goal_1 := 
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 = i_pre)) ,
  (fp32_bits_equal x1 (rvv_get (1) (L)) )
.

Definition qcp_rvv_get32_return_wit_32 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (fp32_bits_equal x0 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
) \/
(
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 = i_pre)) ,
  TT && emp 
|--
  “ (fp32_bits_equal x0 (rvv_get (0) (L)) ) ”
  &&  emp
).

Definition qcp_rvv_get32_return_wit_32_split_goal_1 := 
forall (i_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 = i_pre)) ,
  (fp32_bits_equal x0 (rvv_get (0) (L)) )
.

(*----- Function qcp_rvv_store_next -----*)

Definition qcp_rvv_store_next_return_wit_1 := 
(
forall (value_pre: fp32) (i_pre: Z) (vl_pre: Z) (p_pre: Z) (P: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < vl_pre)) (PreH3 : (vl_pre <= 32)) ,
  (((p_pre + (i_pre * sizeof(FLOAT)))) # Float  |-> value_pre)
  **  (FloatArray.undef_seg p_pre (i_pre + 1 ) vl_pre )
  **  (FloatArray.seg p_pre 0 i_pre P )
|--
  (FloatArray.seg p_pre 0 (i_pre + 1 ) (rvv_snoc (P) (value_pre)) )
  **  (FloatArray.undef_seg p_pre (i_pre + 1 ) vl_pre )
) \/
(
forall (value_pre: fp32) (i_pre: Z) (vl_pre: Z) (p_pre: Z) (P: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < vl_pre)) (PreH3 : (vl_pre <= 32)) ,
  (((p_pre + (i_pre * sizeof(FLOAT)))) # Float  |-> value_pre)
  **  (FloatArray.seg p_pre 0 i_pre P )
|--
  (FloatArray.seg p_pre 0 (i_pre + 1 ) (rvv_snoc (P) (value_pre)) )
).

Definition qcp_rvv_store_next_return_wit_1_split_goal_spatial := 
forall (value_pre: fp32) (i_pre: Z) (vl_pre: Z) (p_pre: Z) (P: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < vl_pre)) (PreH3 : (vl_pre <= 32)) ,
  (((p_pre + (i_pre * sizeof(FLOAT)))) # Float  |-> value_pre)
  **  (FloatArray.seg p_pre 0 i_pre P )
|--
  (FloatArray.seg p_pre 0 (i_pre + 1 ) (rvv_snoc (P) (value_pre)) )
.

Definition qcp_rvv_store_next_partial_solve_wit_1 := 
forall (i_pre: Z) (vl_pre: Z) (p_pre: Z) (P: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < vl_pre)) (PreH3 : (vl_pre <= 32)) ,
  (FloatArray.seg p_pre 0 i_pre P )
  **  (FloatArray.undef_seg p_pre i_pre vl_pre )
|--
  “ (0 <= i_pre) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  (((p_pre + (i_pre * sizeof(FLOAT)))) # Float  |->_)
  **  (FloatArray.undef_seg p_pre (i_pre + 1 ) vl_pre )
  **  (FloatArray.seg p_pre 0 i_pre P )
.

(*----- Function __riscv_vse32_v_f32m8 -----*)

Definition __riscv_vse32_v_f32m8_safety_wit_1 := 
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) ,
  ((( &( "i" ) )) # UInt64  |->_)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
  **  (FloatArray.undef_full p_pre vl_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition __riscv_vse32_v_f32m8_entail_wit_1 := 
(
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) ,
  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
  **  (FloatArray.undef_full p_pre vl_pre )
|--
  “ (0 <= 0) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) ” 
  &&  “ ((rvv_length (L)) = 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) ”
  &&  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
  **  (FloatArray.seg p_pre 0 0 (rvv_take (0) (L)) )
  **  (FloatArray.undef_seg p_pre 0 vl_pre )
) \/
(
forall (vl_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) ,
  TT && emp 
|--
  “ ((rvv_length (L)) = 32) ”
  &&  emp
).

Definition __riscv_vse32_v_f32m8_entail_wit_1_split_goal_1 := 
forall (vl_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) ,
  ((rvv_length (L)) = 32)
.

Definition __riscv_vse32_v_f32m8_entail_wit_2 := 
(
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (i: Z) (retval: fp32) (PreH1 : (fp32_bits_equal retval (rvv_get (i) ((rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )) (PreH2 : (i < vl_pre)) (PreH3 : (0 <= i)) (PreH4 : (i <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH7 : ((rvv_length (L)) = 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) (PreH10 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) ,
  (FloatArray.seg p_pre 0 (i + 1 ) (rvv_snoc ((rvv_take (i) (L))) (retval)) )
  **  (FloatArray.undef_seg p_pre (i + 1 ) vl_pre )
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
|--
  “ (0 <= (i + 1 )) ” 
  &&  “ ((i + 1 ) <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) ” 
  &&  “ ((rvv_length (L)) = 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) ”
  &&  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
  **  (FloatArray.seg p_pre 0 (i + 1 ) (rvv_take ((i + 1 )) (L)) )
  **  (FloatArray.undef_seg p_pre (i + 1 ) vl_pre )
) \/
(
forall (vl_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (i: Z) (retval: fp32) (PreH1 : (fp32_bits_equal retval (rvv_get (i) ((rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )) (PreH2 : (i < vl_pre)) (PreH3 : (0 <= i)) (PreH4 : (i <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH7 : ((rvv_length (L)) = 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) (PreH10 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) ,
  TT && emp 
|--
  “ ((rvv_snoc ((rvv_take (i) (L))) (retval)) = (rvv_take ((i + 1 )) (L))) ”
  &&  emp
).

Definition __riscv_vse32_v_f32m8_entail_wit_2_split_goal_1 := 
forall (vl_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (i: Z) (retval: fp32) (PreH1 : (fp32_bits_equal retval (rvv_get (i) ((rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )) (PreH2 : (i < vl_pre)) (PreH3 : (0 <= i)) (PreH4 : (i <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH7 : ((rvv_length (L)) = 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) (PreH10 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) ,
  ((rvv_snoc ((rvv_take (i) (L))) (retval)) = (rvv_take ((i + 1 )) (L)))
.

Definition __riscv_vse32_v_f32m8_return_wit_1 := 
(
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (i: Z) (PreH1 : (i >= vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 32)) (PreH5 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH6 : ((rvv_length (L)) = 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) ,
  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
  **  (FloatArray.seg p_pre 0 i (rvv_take (i) (L)) )
  **  (FloatArray.undef_seg p_pre i vl_pre )
|--
  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
  **  (FloatArray.full p_pre vl_pre (rvv_take (vl_pre) (L)) )
) \/
(
forall (vl_pre: Z) (p_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (i: Z) (PreH1 : (i >= vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 32)) (PreH5 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH6 : ((rvv_length (L)) = 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) ,
  (FloatArray.seg p_pre 0 i (rvv_take (i) (L)) )
  **  (FloatArray.undef_seg p_pre i vl_pre )
|--
  (FloatArray.full p_pre vl_pre (rvv_take (vl_pre) (L)) )
).

Definition __riscv_vse32_v_f32m8_return_wit_1_split_goal_spatial := 
forall (vl_pre: Z) (p_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (i: Z) (PreH1 : (i >= vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 32)) (PreH5 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH6 : ((rvv_length (L)) = 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) ,
  (FloatArray.seg p_pre 0 i (rvv_take (i) (L)) )
  **  (FloatArray.undef_seg p_pre i vl_pre )
|--
  (FloatArray.full p_pre vl_pre (rvv_take (vl_pre) (L)) )
.

Definition __riscv_vse32_v_f32m8_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (i: Z) (PreH1 : (i < vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 32)) (PreH5 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH6 : ((rvv_length (L)) = 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) ,
  ((( &( "value" ) )) # Float  |->_)
  **  ((( &( "i" ) )) # UInt64  |-> i)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
  **  (FloatArray.seg p_pre 0 i (rvv_take (i) (L)) )
  **  (FloatArray.undef_seg p_pre i vl_pre )
|--
  “ (0 <= i) ” 
  &&  “ (i < 32) ” 
  &&  “ ((rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)) = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) ”
.

Definition __riscv_vse32_v_f32m8_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (i: Z) (PreH1 : (i < vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 32)) (PreH5 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH6 : ((rvv_length (L)) = 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) ,
  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
  **  (FloatArray.seg p_pre 0 i (rvv_take (i) (L)) )
  **  (FloatArray.undef_seg p_pre i vl_pre )
|--
  “ (0 <= i) ” 
  &&  “ (i < 32) ” 
  &&  “ ((rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)) = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) ” 
  &&  “ (i < vl_pre) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) ” 
  &&  “ ((rvv_length (L)) = 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) ”
  &&  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
  **  (FloatArray.seg p_pre 0 i (rvv_take (i) (L)) )
  **  (FloatArray.undef_seg p_pre i vl_pre )
.

Definition __riscv_vse32_v_f32m8_partial_solve_wit_1 := __riscv_vse32_v_f32m8_partial_solve_wit_1_pure -> __riscv_vse32_v_f32m8_partial_solve_wit_1_aux.

Definition __riscv_vse32_v_f32m8_partial_solve_wit_2_pure := 
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (i: Z) (retval: fp32) (PreH1 : (fp32_bits_equal retval (rvv_get (i) ((rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )) (PreH2 : (i < vl_pre)) (PreH3 : (0 <= i)) (PreH4 : (i <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH7 : ((rvv_length (L)) = 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) (PreH10 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) ,
  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
  **  ((( &( "value" ) )) # Float  |-> retval)
  **  ((( &( "i" ) )) # UInt64  |-> i)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  (FloatArray.seg p_pre 0 i (rvv_take (i) (L)) )
  **  (FloatArray.undef_seg p_pre i vl_pre )
|--
  “ (0 <= i) ” 
  &&  “ (i < vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition __riscv_vse32_v_f32m8_partial_solve_wit_2_aux := 
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (x31: fp32) (x30: fp32) (x29: fp32) (x28: fp32) (x27: fp32) (x26: fp32) (x25: fp32) (x24: fp32) (x23: fp32) (x22: fp32) (x21: fp32) (x20: fp32) (x19: fp32) (x18: fp32) (x17: fp32) (x16: fp32) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (i: Z) (retval: fp32) (PreH1 : (fp32_bits_equal retval (rvv_get (i) ((rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )) (PreH2 : (i < vl_pre)) (PreH3 : (0 <= i)) (PreH4 : (i <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH7 : ((rvv_length (L)) = 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) (PreH10 : (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) ,
  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
  **  (FloatArray.seg p_pre 0 i (rvv_take (i) (L)) )
  **  (FloatArray.undef_seg p_pre i vl_pre )
|--
  “ (0 <= i) ” 
  &&  “ (i < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (fp32_bits_equal retval (rvv_get (i) ((rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) ) ” 
  &&  “ (i < vl_pre) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) ” 
  &&  “ ((rvv_length (L)) = 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (L = (rvv_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) ”
  &&  (FloatArray.seg p_pre 0 i (rvv_take (i) (L)) )
  **  (FloatArray.undef_seg p_pre i vl_pre )
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> x16)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> x17)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> x18)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> x19)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> x20)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> x21)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> x22)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> x23)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> x24)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> x25)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> x26)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> x27)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> x28)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> x29)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> x30)
  **  ((&((a_pre)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> x31)
.

Definition __riscv_vse32_v_f32m8_partial_solve_wit_2 := __riscv_vse32_v_f32m8_partial_solve_wit_2_pure -> __riscv_vse32_v_f32m8_partial_solve_wit_2_aux.

Module Type VC_Correct.

Include float_array_Strategy_Correct.
Include neon_bridge_Strategy_Correct.
Include neon_tail_Strategy_Correct.
Include rvv_arrays_Strategy_Correct.
Include rvv_store_Strategy_Correct.
Include rvv_loop_Strategy_Correct.
Include rndne_memory_Strategy_Correct.

Axiom proof_of_qcp_rvv_get32_safety_wit_1 : qcp_rvv_get32_safety_wit_1.
Axiom proof_of_qcp_rvv_get32_safety_wit_2 : qcp_rvv_get32_safety_wit_2.
Axiom proof_of_qcp_rvv_get32_safety_wit_3 : qcp_rvv_get32_safety_wit_3.
Axiom proof_of_qcp_rvv_get32_safety_wit_4 : qcp_rvv_get32_safety_wit_4.
Axiom proof_of_qcp_rvv_get32_safety_wit_5 : qcp_rvv_get32_safety_wit_5.
Axiom proof_of_qcp_rvv_get32_safety_wit_6 : qcp_rvv_get32_safety_wit_6.
Axiom proof_of_qcp_rvv_get32_safety_wit_7 : qcp_rvv_get32_safety_wit_7.
Axiom proof_of_qcp_rvv_get32_safety_wit_8 : qcp_rvv_get32_safety_wit_8.
Axiom proof_of_qcp_rvv_get32_safety_wit_9 : qcp_rvv_get32_safety_wit_9.
Axiom proof_of_qcp_rvv_get32_safety_wit_10 : qcp_rvv_get32_safety_wit_10.
Axiom proof_of_qcp_rvv_get32_safety_wit_11 : qcp_rvv_get32_safety_wit_11.
Axiom proof_of_qcp_rvv_get32_safety_wit_12 : qcp_rvv_get32_safety_wit_12.
Axiom proof_of_qcp_rvv_get32_safety_wit_13 : qcp_rvv_get32_safety_wit_13.
Axiom proof_of_qcp_rvv_get32_safety_wit_14 : qcp_rvv_get32_safety_wit_14.
Axiom proof_of_qcp_rvv_get32_safety_wit_15 : qcp_rvv_get32_safety_wit_15.
Axiom proof_of_qcp_rvv_get32_safety_wit_16 : qcp_rvv_get32_safety_wit_16.
Axiom proof_of_qcp_rvv_get32_safety_wit_17 : qcp_rvv_get32_safety_wit_17.
Axiom proof_of_qcp_rvv_get32_safety_wit_18 : qcp_rvv_get32_safety_wit_18.
Axiom proof_of_qcp_rvv_get32_safety_wit_19 : qcp_rvv_get32_safety_wit_19.
Axiom proof_of_qcp_rvv_get32_safety_wit_20 : qcp_rvv_get32_safety_wit_20.
Axiom proof_of_qcp_rvv_get32_safety_wit_21 : qcp_rvv_get32_safety_wit_21.
Axiom proof_of_qcp_rvv_get32_safety_wit_22 : qcp_rvv_get32_safety_wit_22.
Axiom proof_of_qcp_rvv_get32_safety_wit_23 : qcp_rvv_get32_safety_wit_23.
Axiom proof_of_qcp_rvv_get32_safety_wit_24 : qcp_rvv_get32_safety_wit_24.
Axiom proof_of_qcp_rvv_get32_safety_wit_25 : qcp_rvv_get32_safety_wit_25.
Axiom proof_of_qcp_rvv_get32_safety_wit_26 : qcp_rvv_get32_safety_wit_26.
Axiom proof_of_qcp_rvv_get32_safety_wit_27 : qcp_rvv_get32_safety_wit_27.
Axiom proof_of_qcp_rvv_get32_safety_wit_28 : qcp_rvv_get32_safety_wit_28.
Axiom proof_of_qcp_rvv_get32_safety_wit_29 : qcp_rvv_get32_safety_wit_29.
Axiom proof_of_qcp_rvv_get32_safety_wit_30 : qcp_rvv_get32_safety_wit_30.
Axiom proof_of_qcp_rvv_get32_safety_wit_31 : qcp_rvv_get32_safety_wit_31.
Axiom proof_of_qcp_rvv_get32_safety_wit_32 : qcp_rvv_get32_safety_wit_32.
Axiom proof_of_qcp_rvv_get32_safety_wit_33 : qcp_rvv_get32_safety_wit_33.
Axiom proof_of_qcp_rvv_get32_return_wit_1 : qcp_rvv_get32_return_wit_1.
Axiom proof_of_qcp_rvv_get32_return_wit_2 : qcp_rvv_get32_return_wit_2.
Axiom proof_of_qcp_rvv_get32_return_wit_3 : qcp_rvv_get32_return_wit_3.
Axiom proof_of_qcp_rvv_get32_return_wit_4 : qcp_rvv_get32_return_wit_4.
Axiom proof_of_qcp_rvv_get32_return_wit_5 : qcp_rvv_get32_return_wit_5.
Axiom proof_of_qcp_rvv_get32_return_wit_6 : qcp_rvv_get32_return_wit_6.
Axiom proof_of_qcp_rvv_get32_return_wit_7 : qcp_rvv_get32_return_wit_7.
Axiom proof_of_qcp_rvv_get32_return_wit_8 : qcp_rvv_get32_return_wit_8.
Axiom proof_of_qcp_rvv_get32_return_wit_9 : qcp_rvv_get32_return_wit_9.
Axiom proof_of_qcp_rvv_get32_return_wit_10 : qcp_rvv_get32_return_wit_10.
Axiom proof_of_qcp_rvv_get32_return_wit_11 : qcp_rvv_get32_return_wit_11.
Axiom proof_of_qcp_rvv_get32_return_wit_12 : qcp_rvv_get32_return_wit_12.
Axiom proof_of_qcp_rvv_get32_return_wit_13 : qcp_rvv_get32_return_wit_13.
Axiom proof_of_qcp_rvv_get32_return_wit_14 : qcp_rvv_get32_return_wit_14.
Axiom proof_of_qcp_rvv_get32_return_wit_15 : qcp_rvv_get32_return_wit_15.
Axiom proof_of_qcp_rvv_get32_return_wit_16 : qcp_rvv_get32_return_wit_16.
Axiom proof_of_qcp_rvv_get32_return_wit_17 : qcp_rvv_get32_return_wit_17.
Axiom proof_of_qcp_rvv_get32_return_wit_18 : qcp_rvv_get32_return_wit_18.
Axiom proof_of_qcp_rvv_get32_return_wit_19 : qcp_rvv_get32_return_wit_19.
Axiom proof_of_qcp_rvv_get32_return_wit_20 : qcp_rvv_get32_return_wit_20.
Axiom proof_of_qcp_rvv_get32_return_wit_21 : qcp_rvv_get32_return_wit_21.
Axiom proof_of_qcp_rvv_get32_return_wit_22 : qcp_rvv_get32_return_wit_22.
Axiom proof_of_qcp_rvv_get32_return_wit_23 : qcp_rvv_get32_return_wit_23.
Axiom proof_of_qcp_rvv_get32_return_wit_24 : qcp_rvv_get32_return_wit_24.
Axiom proof_of_qcp_rvv_get32_return_wit_25 : qcp_rvv_get32_return_wit_25.
Axiom proof_of_qcp_rvv_get32_return_wit_26 : qcp_rvv_get32_return_wit_26.
Axiom proof_of_qcp_rvv_get32_return_wit_27 : qcp_rvv_get32_return_wit_27.
Axiom proof_of_qcp_rvv_get32_return_wit_28 : qcp_rvv_get32_return_wit_28.
Axiom proof_of_qcp_rvv_get32_return_wit_29 : qcp_rvv_get32_return_wit_29.
Axiom proof_of_qcp_rvv_get32_return_wit_30 : qcp_rvv_get32_return_wit_30.
Axiom proof_of_qcp_rvv_get32_return_wit_31 : qcp_rvv_get32_return_wit_31.
Axiom proof_of_qcp_rvv_get32_return_wit_32 : qcp_rvv_get32_return_wit_32.
Axiom proof_of_qcp_rvv_store_next_return_wit_1 : qcp_rvv_store_next_return_wit_1.
Axiom proof_of_qcp_rvv_store_next_partial_solve_wit_1 : qcp_rvv_store_next_partial_solve_wit_1.
Axiom proof_of___riscv_vse32_v_f32m8_safety_wit_1 : __riscv_vse32_v_f32m8_safety_wit_1.
Axiom proof_of___riscv_vse32_v_f32m8_entail_wit_1 : __riscv_vse32_v_f32m8_entail_wit_1.
Axiom proof_of___riscv_vse32_v_f32m8_entail_wit_2 : __riscv_vse32_v_f32m8_entail_wit_2.
Axiom proof_of___riscv_vse32_v_f32m8_return_wit_1 : __riscv_vse32_v_f32m8_return_wit_1.
Axiom proof_of___riscv_vse32_v_f32m8_partial_solve_wit_1_pure : __riscv_vse32_v_f32m8_partial_solve_wit_1_pure.
Axiom proof_of___riscv_vse32_v_f32m8_partial_solve_wit_1 : __riscv_vse32_v_f32m8_partial_solve_wit_1.
Axiom proof_of___riscv_vse32_v_f32m8_partial_solve_wit_2_pure : __riscv_vse32_v_f32m8_partial_solve_wit_2_pure.
Axiom proof_of___riscv_vse32_v_f32m8_partial_solve_wit_2 : __riscv_vse32_v_f32m8_partial_solve_wit_2.

End VC_Correct.
