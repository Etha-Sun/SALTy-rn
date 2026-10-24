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
Require Import Qu8Add.UnsignedScalarModel.
Require Import Qu8Add.RvvActiveModel.
Local Open Scope sac.

(*----- Function __riscv_vreinterpret_v_i16m4_u16m4 -----*)

Definition __riscv_vreinterpret_v_i16m4_u16m4_return_wit_1 := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (retval_31: Z) (retval_32: Z) (record_return: Z) (PreH1 : (retval_32 = (qu_u16 (a31)))) (PreH2 : (0 <= retval_32)) (PreH3 : (retval_32 <= 65535)) (PreH4 : (retval_31 = (qu_u16 (a30)))) (PreH5 : (0 <= retval_31)) (PreH6 : (retval_31 <= 65535)) (PreH7 : (retval_30 = (qu_u16 (a29)))) (PreH8 : (0 <= retval_30)) (PreH9 : (retval_30 <= 65535)) (PreH10 : (retval_29 = (qu_u16 (a28)))) (PreH11 : (0 <= retval_29)) (PreH12 : (retval_29 <= 65535)) (PreH13 : (retval_28 = (qu_u16 (a27)))) (PreH14 : (0 <= retval_28)) (PreH15 : (retval_28 <= 65535)) (PreH16 : (retval_27 = (qu_u16 (a26)))) (PreH17 : (0 <= retval_27)) (PreH18 : (retval_27 <= 65535)) (PreH19 : (retval_26 = (qu_u16 (a25)))) (PreH20 : (0 <= retval_26)) (PreH21 : (retval_26 <= 65535)) (PreH22 : (retval_25 = (qu_u16 (a24)))) (PreH23 : (0 <= retval_25)) (PreH24 : (retval_25 <= 65535)) (PreH25 : (retval_24 = (qu_u16 (a23)))) (PreH26 : (0 <= retval_24)) (PreH27 : (retval_24 <= 65535)) (PreH28 : (retval_23 = (qu_u16 (a22)))) (PreH29 : (0 <= retval_23)) (PreH30 : (retval_23 <= 65535)) (PreH31 : (retval_22 = (qu_u16 (a21)))) (PreH32 : (0 <= retval_22)) (PreH33 : (retval_22 <= 65535)) (PreH34 : (retval_21 = (qu_u16 (a20)))) (PreH35 : (0 <= retval_21)) (PreH36 : (retval_21 <= 65535)) (PreH37 : (retval_20 = (qu_u16 (a19)))) (PreH38 : (0 <= retval_20)) (PreH39 : (retval_20 <= 65535)) (PreH40 : (retval_19 = (qu_u16 (a18)))) (PreH41 : (0 <= retval_19)) (PreH42 : (retval_19 <= 65535)) (PreH43 : (retval_18 = (qu_u16 (a17)))) (PreH44 : (0 <= retval_18)) (PreH45 : (retval_18 <= 65535)) (PreH46 : (retval_17 = (qu_u16 (a16)))) (PreH47 : (0 <= retval_17)) (PreH48 : (retval_17 <= 65535)) (PreH49 : (retval_16 = (qu_u16 (a15)))) (PreH50 : (0 <= retval_16)) (PreH51 : (retval_16 <= 65535)) (PreH52 : (retval_15 = (qu_u16 (a14)))) (PreH53 : (0 <= retval_15)) (PreH54 : (retval_15 <= 65535)) (PreH55 : (retval_14 = (qu_u16 (a13)))) (PreH56 : (0 <= retval_14)) (PreH57 : (retval_14 <= 65535)) (PreH58 : (retval_13 = (qu_u16 (a12)))) (PreH59 : (0 <= retval_13)) (PreH60 : (retval_13 <= 65535)) (PreH61 : (retval_12 = (qu_u16 (a11)))) (PreH62 : (0 <= retval_12)) (PreH63 : (retval_12 <= 65535)) (PreH64 : (retval_11 = (qu_u16 (a10)))) (PreH65 : (0 <= retval_11)) (PreH66 : (retval_11 <= 65535)) (PreH67 : (retval_10 = (qu_u16 (a9)))) (PreH68 : (0 <= retval_10)) (PreH69 : (retval_10 <= 65535)) (PreH70 : (retval_9 = (qu_u16 (a8)))) (PreH71 : (0 <= retval_9)) (PreH72 : (retval_9 <= 65535)) (PreH73 : (retval_8 = (qu_u16 (a7)))) (PreH74 : (0 <= retval_8)) (PreH75 : (retval_8 <= 65535)) (PreH76 : (retval_7 = (qu_u16 (a6)))) (PreH77 : (0 <= retval_7)) (PreH78 : (retval_7 <= 65535)) (PreH79 : (retval_6 = (qu_u16 (a5)))) (PreH80 : (0 <= retval_6)) (PreH81 : (retval_6 <= 65535)) (PreH82 : (retval_5 = (qu_u16 (a4)))) (PreH83 : (0 <= retval_5)) (PreH84 : (retval_5 <= 65535)) (PreH85 : (retval_4 = (qu_u16 (a3)))) (PreH86 : (0 <= retval_4)) (PreH87 : (retval_4 <= 65535)) (PreH88 : (retval_3 = (qu_u16 (a2)))) (PreH89 : (0 <= retval_3)) (PreH90 : (retval_3 <= 65535)) (PreH91 : (retval_2 = (qu_u16 (a1)))) (PreH92 : (0 <= retval_2)) (PreH93 : (retval_2 <= 65535)) (PreH94 : (retval = (qu_u16 (a0)))) (PreH95 : (0 <= retval)) (PreH96 : (retval <= 65535)) (PreH97 : ((-32768) <= a0)) (PreH98 : (a0 <= 32767)) (PreH99 : ((-32768) <= a1)) (PreH100 : (a1 <= 32767)) (PreH101 : ((-32768) <= a2)) (PreH102 : (a2 <= 32767)) (PreH103 : ((-32768) <= a3)) (PreH104 : (a3 <= 32767)) (PreH105 : ((-32768) <= a4)) (PreH106 : (a4 <= 32767)) (PreH107 : ((-32768) <= a5)) (PreH108 : (a5 <= 32767)) (PreH109 : ((-32768) <= a6)) (PreH110 : (a6 <= 32767)) (PreH111 : ((-32768) <= a7)) (PreH112 : (a7 <= 32767)) (PreH113 : ((-32768) <= a8)) (PreH114 : (a8 <= 32767)) (PreH115 : ((-32768) <= a9)) (PreH116 : (a9 <= 32767)) (PreH117 : ((-32768) <= a10)) (PreH118 : (a10 <= 32767)) (PreH119 : ((-32768) <= a11)) (PreH120 : (a11 <= 32767)) (PreH121 : ((-32768) <= a12)) (PreH122 : (a12 <= 32767)) (PreH123 : ((-32768) <= a13)) (PreH124 : (a13 <= 32767)) (PreH125 : ((-32768) <= a14)) (PreH126 : (a14 <= 32767)) (PreH127 : ((-32768) <= a15)) (PreH128 : (a15 <= 32767)) (PreH129 : ((-32768) <= a16)) (PreH130 : (a16 <= 32767)) (PreH131 : ((-32768) <= a17)) (PreH132 : (a17 <= 32767)) (PreH133 : ((-32768) <= a18)) (PreH134 : (a18 <= 32767)) (PreH135 : ((-32768) <= a19)) (PreH136 : (a19 <= 32767)) (PreH137 : ((-32768) <= a20)) (PreH138 : (a20 <= 32767)) (PreH139 : ((-32768) <= a21)) (PreH140 : (a21 <= 32767)) (PreH141 : ((-32768) <= a22)) (PreH142 : (a22 <= 32767)) (PreH143 : ((-32768) <= a23)) (PreH144 : (a23 <= 32767)) (PreH145 : ((-32768) <= a24)) (PreH146 : (a24 <= 32767)) (PreH147 : ((-32768) <= a25)) (PreH148 : (a25 <= 32767)) (PreH149 : ((-32768) <= a26)) (PreH150 : (a26 <= 32767)) (PreH151 : ((-32768) <= a27)) (PreH152 : (a27 <= 32767)) (PreH153 : ((-32768) <= a28)) (PreH154 : (a28 <= 32767)) (PreH155 : ((-32768) <= a29)) (PreH156 : (a29 <= 32767)) (PreH157 : ((-32768) <= a30)) (PreH158 : (a30 <= 32767)) (PreH159 : ((-32768) <= a31)) (PreH160 : (a31 <= 32767)) ,
  ((&((record_return)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> retval_32)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> retval_31)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> retval_30)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> retval_29)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> retval_28)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> retval_27)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> retval_26)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> retval_25)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> retval_24)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> retval_23)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> retval_22)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> retval_21)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> retval_20)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> retval)
|--
  ((&((record_return)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> (qu_u16 (a0)))
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> (qu_u16 (a1)))
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> (qu_u16 (a2)))
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> (qu_u16 (a3)))
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> (qu_u16 (a4)))
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> (qu_u16 (a5)))
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> (qu_u16 (a6)))
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> (qu_u16 (a7)))
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> (qu_u16 (a8)))
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> (qu_u16 (a9)))
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> (qu_u16 (a10)))
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> (qu_u16 (a11)))
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> (qu_u16 (a12)))
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> (qu_u16 (a13)))
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> (qu_u16 (a14)))
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> (qu_u16 (a15)))
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> (qu_u16 (a16)))
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> (qu_u16 (a17)))
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> (qu_u16 (a18)))
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> (qu_u16 (a19)))
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> (qu_u16 (a20)))
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> (qu_u16 (a21)))
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> (qu_u16 (a22)))
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> (qu_u16 (a23)))
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> (qu_u16 (a24)))
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> (qu_u16 (a25)))
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> (qu_u16 (a26)))
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> (qu_u16 (a27)))
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> (qu_u16 (a28)))
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> (qu_u16 (a29)))
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> (qu_u16 (a30)))
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> (qu_u16 (a31)))
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_1_pure := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : ((-32768) <= a8)) (PreH18 : (a8 <= 32767)) (PreH19 : ((-32768) <= a9)) (PreH20 : (a9 <= 32767)) (PreH21 : ((-32768) <= a10)) (PreH22 : (a10 <= 32767)) (PreH23 : ((-32768) <= a11)) (PreH24 : (a11 <= 32767)) (PreH25 : ((-32768) <= a12)) (PreH26 : (a12 <= 32767)) (PreH27 : ((-32768) <= a13)) (PreH28 : (a13 <= 32767)) (PreH29 : ((-32768) <= a14)) (PreH30 : (a14 <= 32767)) (PreH31 : ((-32768) <= a15)) (PreH32 : (a15 <= 32767)) (PreH33 : ((-32768) <= a16)) (PreH34 : (a16 <= 32767)) (PreH35 : ((-32768) <= a17)) (PreH36 : (a17 <= 32767)) (PreH37 : ((-32768) <= a18)) (PreH38 : (a18 <= 32767)) (PreH39 : ((-32768) <= a19)) (PreH40 : (a19 <= 32767)) (PreH41 : ((-32768) <= a20)) (PreH42 : (a20 <= 32767)) (PreH43 : ((-32768) <= a21)) (PreH44 : (a21 <= 32767)) (PreH45 : ((-32768) <= a22)) (PreH46 : (a22 <= 32767)) (PreH47 : ((-32768) <= a23)) (PreH48 : (a23 <= 32767)) (PreH49 : ((-32768) <= a24)) (PreH50 : (a24 <= 32767)) (PreH51 : ((-32768) <= a25)) (PreH52 : (a25 <= 32767)) (PreH53 : ((-32768) <= a26)) (PreH54 : (a26 <= 32767)) (PreH55 : ((-32768) <= a27)) (PreH56 : (a27 <= 32767)) (PreH57 : ((-32768) <= a28)) (PreH58 : (a28 <= 32767)) (PreH59 : ((-32768) <= a29)) (PreH60 : (a29 <= 32767)) (PreH61 : ((-32768) <= a30)) (PreH62 : (a30 <= 32767)) (PreH63 : ((-32768) <= a31)) (PreH64 : (a31 <= 32767)) ,
  (UndefStructPredvuint16m4_t ( &( "r" ) ) )
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ”
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_1_aux := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) (PreH17 : ((-32768) <= a8)) (PreH18 : (a8 <= 32767)) (PreH19 : ((-32768) <= a9)) (PreH20 : (a9 <= 32767)) (PreH21 : ((-32768) <= a10)) (PreH22 : (a10 <= 32767)) (PreH23 : ((-32768) <= a11)) (PreH24 : (a11 <= 32767)) (PreH25 : ((-32768) <= a12)) (PreH26 : (a12 <= 32767)) (PreH27 : ((-32768) <= a13)) (PreH28 : (a13 <= 32767)) (PreH29 : ((-32768) <= a14)) (PreH30 : (a14 <= 32767)) (PreH31 : ((-32768) <= a15)) (PreH32 : (a15 <= 32767)) (PreH33 : ((-32768) <= a16)) (PreH34 : (a16 <= 32767)) (PreH35 : ((-32768) <= a17)) (PreH36 : (a17 <= 32767)) (PreH37 : ((-32768) <= a18)) (PreH38 : (a18 <= 32767)) (PreH39 : ((-32768) <= a19)) (PreH40 : (a19 <= 32767)) (PreH41 : ((-32768) <= a20)) (PreH42 : (a20 <= 32767)) (PreH43 : ((-32768) <= a21)) (PreH44 : (a21 <= 32767)) (PreH45 : ((-32768) <= a22)) (PreH46 : (a22 <= 32767)) (PreH47 : ((-32768) <= a23)) (PreH48 : (a23 <= 32767)) (PreH49 : ((-32768) <= a24)) (PreH50 : (a24 <= 32767)) (PreH51 : ((-32768) <= a25)) (PreH52 : (a25 <= 32767)) (PreH53 : ((-32768) <= a26)) (PreH54 : (a26 <= 32767)) (PreH55 : ((-32768) <= a27)) (PreH56 : (a27 <= 32767)) (PreH57 : ((-32768) <= a28)) (PreH58 : (a28 <= 32767)) (PreH59 : ((-32768) <= a29)) (PreH60 : (a29 <= 32767)) (PreH61 : ((-32768) <= a30)) (PreH62 : (a30 <= 32767)) (PreH63 : ((-32768) <= a31)) (PreH64 : (a31 <= 32767)) ,
  (UndefStructPredvuint16m4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= a8) ” 
  &&  “ (a8 <= 32767) ” 
  &&  “ ((-32768) <= a9) ” 
  &&  “ (a9 <= 32767) ” 
  &&  “ ((-32768) <= a10) ” 
  &&  “ (a10 <= 32767) ” 
  &&  “ ((-32768) <= a11) ” 
  &&  “ (a11 <= 32767) ” 
  &&  “ ((-32768) <= a12) ” 
  &&  “ (a12 <= 32767) ” 
  &&  “ ((-32768) <= a13) ” 
  &&  “ (a13 <= 32767) ” 
  &&  “ ((-32768) <= a14) ” 
  &&  “ (a14 <= 32767) ” 
  &&  “ ((-32768) <= a15) ” 
  &&  “ (a15 <= 32767) ” 
  &&  “ ((-32768) <= a16) ” 
  &&  “ (a16 <= 32767) ” 
  &&  “ ((-32768) <= a17) ” 
  &&  “ (a17 <= 32767) ” 
  &&  “ ((-32768) <= a18) ” 
  &&  “ (a18 <= 32767) ” 
  &&  “ ((-32768) <= a19) ” 
  &&  “ (a19 <= 32767) ” 
  &&  “ ((-32768) <= a20) ” 
  &&  “ (a20 <= 32767) ” 
  &&  “ ((-32768) <= a21) ” 
  &&  “ (a21 <= 32767) ” 
  &&  “ ((-32768) <= a22) ” 
  &&  “ (a22 <= 32767) ” 
  &&  “ ((-32768) <= a23) ” 
  &&  “ (a23 <= 32767) ” 
  &&  “ ((-32768) <= a24) ” 
  &&  “ (a24 <= 32767) ” 
  &&  “ ((-32768) <= a25) ” 
  &&  “ (a25 <= 32767) ” 
  &&  “ ((-32768) <= a26) ” 
  &&  “ (a26 <= 32767) ” 
  &&  “ ((-32768) <= a27) ” 
  &&  “ (a27 <= 32767) ” 
  &&  “ ((-32768) <= a28) ” 
  &&  “ (a28 <= 32767) ” 
  &&  “ ((-32768) <= a29) ” 
  &&  “ (a29 <= 32767) ” 
  &&  “ ((-32768) <= a30) ” 
  &&  “ (a30 <= 32767) ” 
  &&  “ ((-32768) <= a31) ” 
  &&  “ (a31 <= 32767) ”
  &&  (UndefStructPredvuint16m4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_1 := __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_1_pure -> __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_1_aux.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_2_pure := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = (qu_u16 (a0)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 65535)) (PreH4 : ((-32768) <= a0)) (PreH5 : (a0 <= 32767)) (PreH6 : ((-32768) <= a1)) (PreH7 : (a1 <= 32767)) (PreH8 : ((-32768) <= a2)) (PreH9 : (a2 <= 32767)) (PreH10 : ((-32768) <= a3)) (PreH11 : (a3 <= 32767)) (PreH12 : ((-32768) <= a4)) (PreH13 : (a4 <= 32767)) (PreH14 : ((-32768) <= a5)) (PreH15 : (a5 <= 32767)) (PreH16 : ((-32768) <= a6)) (PreH17 : (a6 <= 32767)) (PreH18 : ((-32768) <= a7)) (PreH19 : (a7 <= 32767)) (PreH20 : ((-32768) <= a8)) (PreH21 : (a8 <= 32767)) (PreH22 : ((-32768) <= a9)) (PreH23 : (a9 <= 32767)) (PreH24 : ((-32768) <= a10)) (PreH25 : (a10 <= 32767)) (PreH26 : ((-32768) <= a11)) (PreH27 : (a11 <= 32767)) (PreH28 : ((-32768) <= a12)) (PreH29 : (a12 <= 32767)) (PreH30 : ((-32768) <= a13)) (PreH31 : (a13 <= 32767)) (PreH32 : ((-32768) <= a14)) (PreH33 : (a14 <= 32767)) (PreH34 : ((-32768) <= a15)) (PreH35 : (a15 <= 32767)) (PreH36 : ((-32768) <= a16)) (PreH37 : (a16 <= 32767)) (PreH38 : ((-32768) <= a17)) (PreH39 : (a17 <= 32767)) (PreH40 : ((-32768) <= a18)) (PreH41 : (a18 <= 32767)) (PreH42 : ((-32768) <= a19)) (PreH43 : (a19 <= 32767)) (PreH44 : ((-32768) <= a20)) (PreH45 : (a20 <= 32767)) (PreH46 : ((-32768) <= a21)) (PreH47 : (a21 <= 32767)) (PreH48 : ((-32768) <= a22)) (PreH49 : (a22 <= 32767)) (PreH50 : ((-32768) <= a23)) (PreH51 : (a23 <= 32767)) (PreH52 : ((-32768) <= a24)) (PreH53 : (a24 <= 32767)) (PreH54 : ((-32768) <= a25)) (PreH55 : (a25 <= 32767)) (PreH56 : ((-32768) <= a26)) (PreH57 : (a26 <= 32767)) (PreH58 : ((-32768) <= a27)) (PreH59 : (a27 <= 32767)) (PreH60 : ((-32768) <= a28)) (PreH61 : (a28 <= 32767)) (PreH62 : ((-32768) <= a29)) (PreH63 : (a29 <= 32767)) (PreH64 : ((-32768) <= a30)) (PreH65 : (a30 <= 32767)) (PreH66 : ((-32768) <= a31)) (PreH67 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ”
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_2_aux := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = (qu_u16 (a0)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 65535)) (PreH4 : ((-32768) <= a0)) (PreH5 : (a0 <= 32767)) (PreH6 : ((-32768) <= a1)) (PreH7 : (a1 <= 32767)) (PreH8 : ((-32768) <= a2)) (PreH9 : (a2 <= 32767)) (PreH10 : ((-32768) <= a3)) (PreH11 : (a3 <= 32767)) (PreH12 : ((-32768) <= a4)) (PreH13 : (a4 <= 32767)) (PreH14 : ((-32768) <= a5)) (PreH15 : (a5 <= 32767)) (PreH16 : ((-32768) <= a6)) (PreH17 : (a6 <= 32767)) (PreH18 : ((-32768) <= a7)) (PreH19 : (a7 <= 32767)) (PreH20 : ((-32768) <= a8)) (PreH21 : (a8 <= 32767)) (PreH22 : ((-32768) <= a9)) (PreH23 : (a9 <= 32767)) (PreH24 : ((-32768) <= a10)) (PreH25 : (a10 <= 32767)) (PreH26 : ((-32768) <= a11)) (PreH27 : (a11 <= 32767)) (PreH28 : ((-32768) <= a12)) (PreH29 : (a12 <= 32767)) (PreH30 : ((-32768) <= a13)) (PreH31 : (a13 <= 32767)) (PreH32 : ((-32768) <= a14)) (PreH33 : (a14 <= 32767)) (PreH34 : ((-32768) <= a15)) (PreH35 : (a15 <= 32767)) (PreH36 : ((-32768) <= a16)) (PreH37 : (a16 <= 32767)) (PreH38 : ((-32768) <= a17)) (PreH39 : (a17 <= 32767)) (PreH40 : ((-32768) <= a18)) (PreH41 : (a18 <= 32767)) (PreH42 : ((-32768) <= a19)) (PreH43 : (a19 <= 32767)) (PreH44 : ((-32768) <= a20)) (PreH45 : (a20 <= 32767)) (PreH46 : ((-32768) <= a21)) (PreH47 : (a21 <= 32767)) (PreH48 : ((-32768) <= a22)) (PreH49 : (a22 <= 32767)) (PreH50 : ((-32768) <= a23)) (PreH51 : (a23 <= 32767)) (PreH52 : ((-32768) <= a24)) (PreH53 : (a24 <= 32767)) (PreH54 : ((-32768) <= a25)) (PreH55 : (a25 <= 32767)) (PreH56 : ((-32768) <= a26)) (PreH57 : (a26 <= 32767)) (PreH58 : ((-32768) <= a27)) (PreH59 : (a27 <= 32767)) (PreH60 : ((-32768) <= a28)) (PreH61 : (a28 <= 32767)) (PreH62 : ((-32768) <= a29)) (PreH63 : (a29 <= 32767)) (PreH64 : ((-32768) <= a30)) (PreH65 : (a30 <= 32767)) (PreH66 : ((-32768) <= a31)) (PreH67 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ (retval = (qu_u16 (a0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= a8) ” 
  &&  “ (a8 <= 32767) ” 
  &&  “ ((-32768) <= a9) ” 
  &&  “ (a9 <= 32767) ” 
  &&  “ ((-32768) <= a10) ” 
  &&  “ (a10 <= 32767) ” 
  &&  “ ((-32768) <= a11) ” 
  &&  “ (a11 <= 32767) ” 
  &&  “ ((-32768) <= a12) ” 
  &&  “ (a12 <= 32767) ” 
  &&  “ ((-32768) <= a13) ” 
  &&  “ (a13 <= 32767) ” 
  &&  “ ((-32768) <= a14) ” 
  &&  “ (a14 <= 32767) ” 
  &&  “ ((-32768) <= a15) ” 
  &&  “ (a15 <= 32767) ” 
  &&  “ ((-32768) <= a16) ” 
  &&  “ (a16 <= 32767) ” 
  &&  “ ((-32768) <= a17) ” 
  &&  “ (a17 <= 32767) ” 
  &&  “ ((-32768) <= a18) ” 
  &&  “ (a18 <= 32767) ” 
  &&  “ ((-32768) <= a19) ” 
  &&  “ (a19 <= 32767) ” 
  &&  “ ((-32768) <= a20) ” 
  &&  “ (a20 <= 32767) ” 
  &&  “ ((-32768) <= a21) ” 
  &&  “ (a21 <= 32767) ” 
  &&  “ ((-32768) <= a22) ” 
  &&  “ (a22 <= 32767) ” 
  &&  “ ((-32768) <= a23) ” 
  &&  “ (a23 <= 32767) ” 
  &&  “ ((-32768) <= a24) ” 
  &&  “ (a24 <= 32767) ” 
  &&  “ ((-32768) <= a25) ” 
  &&  “ (a25 <= 32767) ” 
  &&  “ ((-32768) <= a26) ” 
  &&  “ (a26 <= 32767) ” 
  &&  “ ((-32768) <= a27) ” 
  &&  “ (a27 <= 32767) ” 
  &&  “ ((-32768) <= a28) ” 
  &&  “ (a28 <= 32767) ” 
  &&  “ ((-32768) <= a29) ” 
  &&  “ (a29 <= 32767) ” 
  &&  “ ((-32768) <= a30) ” 
  &&  “ (a30 <= 32767) ” 
  &&  “ ((-32768) <= a31) ” 
  &&  “ (a31 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_2 := __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_2_pure -> __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_2_aux.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_3_pure := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (qu_u16 (a1)))) (PreH2 : (0 <= retval_2)) (PreH3 : (retval_2 <= 65535)) (PreH4 : (retval = (qu_u16 (a0)))) (PreH5 : (0 <= retval)) (PreH6 : (retval <= 65535)) (PreH7 : ((-32768) <= a0)) (PreH8 : (a0 <= 32767)) (PreH9 : ((-32768) <= a1)) (PreH10 : (a1 <= 32767)) (PreH11 : ((-32768) <= a2)) (PreH12 : (a2 <= 32767)) (PreH13 : ((-32768) <= a3)) (PreH14 : (a3 <= 32767)) (PreH15 : ((-32768) <= a4)) (PreH16 : (a4 <= 32767)) (PreH17 : ((-32768) <= a5)) (PreH18 : (a5 <= 32767)) (PreH19 : ((-32768) <= a6)) (PreH20 : (a6 <= 32767)) (PreH21 : ((-32768) <= a7)) (PreH22 : (a7 <= 32767)) (PreH23 : ((-32768) <= a8)) (PreH24 : (a8 <= 32767)) (PreH25 : ((-32768) <= a9)) (PreH26 : (a9 <= 32767)) (PreH27 : ((-32768) <= a10)) (PreH28 : (a10 <= 32767)) (PreH29 : ((-32768) <= a11)) (PreH30 : (a11 <= 32767)) (PreH31 : ((-32768) <= a12)) (PreH32 : (a12 <= 32767)) (PreH33 : ((-32768) <= a13)) (PreH34 : (a13 <= 32767)) (PreH35 : ((-32768) <= a14)) (PreH36 : (a14 <= 32767)) (PreH37 : ((-32768) <= a15)) (PreH38 : (a15 <= 32767)) (PreH39 : ((-32768) <= a16)) (PreH40 : (a16 <= 32767)) (PreH41 : ((-32768) <= a17)) (PreH42 : (a17 <= 32767)) (PreH43 : ((-32768) <= a18)) (PreH44 : (a18 <= 32767)) (PreH45 : ((-32768) <= a19)) (PreH46 : (a19 <= 32767)) (PreH47 : ((-32768) <= a20)) (PreH48 : (a20 <= 32767)) (PreH49 : ((-32768) <= a21)) (PreH50 : (a21 <= 32767)) (PreH51 : ((-32768) <= a22)) (PreH52 : (a22 <= 32767)) (PreH53 : ((-32768) <= a23)) (PreH54 : (a23 <= 32767)) (PreH55 : ((-32768) <= a24)) (PreH56 : (a24 <= 32767)) (PreH57 : ((-32768) <= a25)) (PreH58 : (a25 <= 32767)) (PreH59 : ((-32768) <= a26)) (PreH60 : (a26 <= 32767)) (PreH61 : ((-32768) <= a27)) (PreH62 : (a27 <= 32767)) (PreH63 : ((-32768) <= a28)) (PreH64 : (a28 <= 32767)) (PreH65 : ((-32768) <= a29)) (PreH66 : (a29 <= 32767)) (PreH67 : ((-32768) <= a30)) (PreH68 : (a30 <= 32767)) (PreH69 : ((-32768) <= a31)) (PreH70 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ”
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_3_aux := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (qu_u16 (a1)))) (PreH2 : (0 <= retval_2)) (PreH3 : (retval_2 <= 65535)) (PreH4 : (retval = (qu_u16 (a0)))) (PreH5 : (0 <= retval)) (PreH6 : (retval <= 65535)) (PreH7 : ((-32768) <= a0)) (PreH8 : (a0 <= 32767)) (PreH9 : ((-32768) <= a1)) (PreH10 : (a1 <= 32767)) (PreH11 : ((-32768) <= a2)) (PreH12 : (a2 <= 32767)) (PreH13 : ((-32768) <= a3)) (PreH14 : (a3 <= 32767)) (PreH15 : ((-32768) <= a4)) (PreH16 : (a4 <= 32767)) (PreH17 : ((-32768) <= a5)) (PreH18 : (a5 <= 32767)) (PreH19 : ((-32768) <= a6)) (PreH20 : (a6 <= 32767)) (PreH21 : ((-32768) <= a7)) (PreH22 : (a7 <= 32767)) (PreH23 : ((-32768) <= a8)) (PreH24 : (a8 <= 32767)) (PreH25 : ((-32768) <= a9)) (PreH26 : (a9 <= 32767)) (PreH27 : ((-32768) <= a10)) (PreH28 : (a10 <= 32767)) (PreH29 : ((-32768) <= a11)) (PreH30 : (a11 <= 32767)) (PreH31 : ((-32768) <= a12)) (PreH32 : (a12 <= 32767)) (PreH33 : ((-32768) <= a13)) (PreH34 : (a13 <= 32767)) (PreH35 : ((-32768) <= a14)) (PreH36 : (a14 <= 32767)) (PreH37 : ((-32768) <= a15)) (PreH38 : (a15 <= 32767)) (PreH39 : ((-32768) <= a16)) (PreH40 : (a16 <= 32767)) (PreH41 : ((-32768) <= a17)) (PreH42 : (a17 <= 32767)) (PreH43 : ((-32768) <= a18)) (PreH44 : (a18 <= 32767)) (PreH45 : ((-32768) <= a19)) (PreH46 : (a19 <= 32767)) (PreH47 : ((-32768) <= a20)) (PreH48 : (a20 <= 32767)) (PreH49 : ((-32768) <= a21)) (PreH50 : (a21 <= 32767)) (PreH51 : ((-32768) <= a22)) (PreH52 : (a22 <= 32767)) (PreH53 : ((-32768) <= a23)) (PreH54 : (a23 <= 32767)) (PreH55 : ((-32768) <= a24)) (PreH56 : (a24 <= 32767)) (PreH57 : ((-32768) <= a25)) (PreH58 : (a25 <= 32767)) (PreH59 : ((-32768) <= a26)) (PreH60 : (a26 <= 32767)) (PreH61 : ((-32768) <= a27)) (PreH62 : (a27 <= 32767)) (PreH63 : ((-32768) <= a28)) (PreH64 : (a28 <= 32767)) (PreH65 : ((-32768) <= a29)) (PreH66 : (a29 <= 32767)) (PreH67 : ((-32768) <= a30)) (PreH68 : (a30 <= 32767)) (PreH69 : ((-32768) <= a31)) (PreH70 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ (retval_2 = (qu_u16 (a1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (qu_u16 (a0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= a8) ” 
  &&  “ (a8 <= 32767) ” 
  &&  “ ((-32768) <= a9) ” 
  &&  “ (a9 <= 32767) ” 
  &&  “ ((-32768) <= a10) ” 
  &&  “ (a10 <= 32767) ” 
  &&  “ ((-32768) <= a11) ” 
  &&  “ (a11 <= 32767) ” 
  &&  “ ((-32768) <= a12) ” 
  &&  “ (a12 <= 32767) ” 
  &&  “ ((-32768) <= a13) ” 
  &&  “ (a13 <= 32767) ” 
  &&  “ ((-32768) <= a14) ” 
  &&  “ (a14 <= 32767) ” 
  &&  “ ((-32768) <= a15) ” 
  &&  “ (a15 <= 32767) ” 
  &&  “ ((-32768) <= a16) ” 
  &&  “ (a16 <= 32767) ” 
  &&  “ ((-32768) <= a17) ” 
  &&  “ (a17 <= 32767) ” 
  &&  “ ((-32768) <= a18) ” 
  &&  “ (a18 <= 32767) ” 
  &&  “ ((-32768) <= a19) ” 
  &&  “ (a19 <= 32767) ” 
  &&  “ ((-32768) <= a20) ” 
  &&  “ (a20 <= 32767) ” 
  &&  “ ((-32768) <= a21) ” 
  &&  “ (a21 <= 32767) ” 
  &&  “ ((-32768) <= a22) ” 
  &&  “ (a22 <= 32767) ” 
  &&  “ ((-32768) <= a23) ” 
  &&  “ (a23 <= 32767) ” 
  &&  “ ((-32768) <= a24) ” 
  &&  “ (a24 <= 32767) ” 
  &&  “ ((-32768) <= a25) ” 
  &&  “ (a25 <= 32767) ” 
  &&  “ ((-32768) <= a26) ” 
  &&  “ (a26 <= 32767) ” 
  &&  “ ((-32768) <= a27) ” 
  &&  “ (a27 <= 32767) ” 
  &&  “ ((-32768) <= a28) ” 
  &&  “ (a28 <= 32767) ” 
  &&  “ ((-32768) <= a29) ” 
  &&  “ (a29 <= 32767) ” 
  &&  “ ((-32768) <= a30) ” 
  &&  “ (a30 <= 32767) ” 
  &&  “ ((-32768) <= a31) ” 
  &&  “ (a31 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_3 := __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_3_pure -> __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_3_aux.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_4_pure := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (qu_u16 (a2)))) (PreH2 : (0 <= retval_3)) (PreH3 : (retval_3 <= 65535)) (PreH4 : (retval_2 = (qu_u16 (a1)))) (PreH5 : (0 <= retval_2)) (PreH6 : (retval_2 <= 65535)) (PreH7 : (retval = (qu_u16 (a0)))) (PreH8 : (0 <= retval)) (PreH9 : (retval <= 65535)) (PreH10 : ((-32768) <= a0)) (PreH11 : (a0 <= 32767)) (PreH12 : ((-32768) <= a1)) (PreH13 : (a1 <= 32767)) (PreH14 : ((-32768) <= a2)) (PreH15 : (a2 <= 32767)) (PreH16 : ((-32768) <= a3)) (PreH17 : (a3 <= 32767)) (PreH18 : ((-32768) <= a4)) (PreH19 : (a4 <= 32767)) (PreH20 : ((-32768) <= a5)) (PreH21 : (a5 <= 32767)) (PreH22 : ((-32768) <= a6)) (PreH23 : (a6 <= 32767)) (PreH24 : ((-32768) <= a7)) (PreH25 : (a7 <= 32767)) (PreH26 : ((-32768) <= a8)) (PreH27 : (a8 <= 32767)) (PreH28 : ((-32768) <= a9)) (PreH29 : (a9 <= 32767)) (PreH30 : ((-32768) <= a10)) (PreH31 : (a10 <= 32767)) (PreH32 : ((-32768) <= a11)) (PreH33 : (a11 <= 32767)) (PreH34 : ((-32768) <= a12)) (PreH35 : (a12 <= 32767)) (PreH36 : ((-32768) <= a13)) (PreH37 : (a13 <= 32767)) (PreH38 : ((-32768) <= a14)) (PreH39 : (a14 <= 32767)) (PreH40 : ((-32768) <= a15)) (PreH41 : (a15 <= 32767)) (PreH42 : ((-32768) <= a16)) (PreH43 : (a16 <= 32767)) (PreH44 : ((-32768) <= a17)) (PreH45 : (a17 <= 32767)) (PreH46 : ((-32768) <= a18)) (PreH47 : (a18 <= 32767)) (PreH48 : ((-32768) <= a19)) (PreH49 : (a19 <= 32767)) (PreH50 : ((-32768) <= a20)) (PreH51 : (a20 <= 32767)) (PreH52 : ((-32768) <= a21)) (PreH53 : (a21 <= 32767)) (PreH54 : ((-32768) <= a22)) (PreH55 : (a22 <= 32767)) (PreH56 : ((-32768) <= a23)) (PreH57 : (a23 <= 32767)) (PreH58 : ((-32768) <= a24)) (PreH59 : (a24 <= 32767)) (PreH60 : ((-32768) <= a25)) (PreH61 : (a25 <= 32767)) (PreH62 : ((-32768) <= a26)) (PreH63 : (a26 <= 32767)) (PreH64 : ((-32768) <= a27)) (PreH65 : (a27 <= 32767)) (PreH66 : ((-32768) <= a28)) (PreH67 : (a28 <= 32767)) (PreH68 : ((-32768) <= a29)) (PreH69 : (a29 <= 32767)) (PreH70 : ((-32768) <= a30)) (PreH71 : (a30 <= 32767)) (PreH72 : ((-32768) <= a31)) (PreH73 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ”
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_4_aux := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (qu_u16 (a2)))) (PreH2 : (0 <= retval_3)) (PreH3 : (retval_3 <= 65535)) (PreH4 : (retval_2 = (qu_u16 (a1)))) (PreH5 : (0 <= retval_2)) (PreH6 : (retval_2 <= 65535)) (PreH7 : (retval = (qu_u16 (a0)))) (PreH8 : (0 <= retval)) (PreH9 : (retval <= 65535)) (PreH10 : ((-32768) <= a0)) (PreH11 : (a0 <= 32767)) (PreH12 : ((-32768) <= a1)) (PreH13 : (a1 <= 32767)) (PreH14 : ((-32768) <= a2)) (PreH15 : (a2 <= 32767)) (PreH16 : ((-32768) <= a3)) (PreH17 : (a3 <= 32767)) (PreH18 : ((-32768) <= a4)) (PreH19 : (a4 <= 32767)) (PreH20 : ((-32768) <= a5)) (PreH21 : (a5 <= 32767)) (PreH22 : ((-32768) <= a6)) (PreH23 : (a6 <= 32767)) (PreH24 : ((-32768) <= a7)) (PreH25 : (a7 <= 32767)) (PreH26 : ((-32768) <= a8)) (PreH27 : (a8 <= 32767)) (PreH28 : ((-32768) <= a9)) (PreH29 : (a9 <= 32767)) (PreH30 : ((-32768) <= a10)) (PreH31 : (a10 <= 32767)) (PreH32 : ((-32768) <= a11)) (PreH33 : (a11 <= 32767)) (PreH34 : ((-32768) <= a12)) (PreH35 : (a12 <= 32767)) (PreH36 : ((-32768) <= a13)) (PreH37 : (a13 <= 32767)) (PreH38 : ((-32768) <= a14)) (PreH39 : (a14 <= 32767)) (PreH40 : ((-32768) <= a15)) (PreH41 : (a15 <= 32767)) (PreH42 : ((-32768) <= a16)) (PreH43 : (a16 <= 32767)) (PreH44 : ((-32768) <= a17)) (PreH45 : (a17 <= 32767)) (PreH46 : ((-32768) <= a18)) (PreH47 : (a18 <= 32767)) (PreH48 : ((-32768) <= a19)) (PreH49 : (a19 <= 32767)) (PreH50 : ((-32768) <= a20)) (PreH51 : (a20 <= 32767)) (PreH52 : ((-32768) <= a21)) (PreH53 : (a21 <= 32767)) (PreH54 : ((-32768) <= a22)) (PreH55 : (a22 <= 32767)) (PreH56 : ((-32768) <= a23)) (PreH57 : (a23 <= 32767)) (PreH58 : ((-32768) <= a24)) (PreH59 : (a24 <= 32767)) (PreH60 : ((-32768) <= a25)) (PreH61 : (a25 <= 32767)) (PreH62 : ((-32768) <= a26)) (PreH63 : (a26 <= 32767)) (PreH64 : ((-32768) <= a27)) (PreH65 : (a27 <= 32767)) (PreH66 : ((-32768) <= a28)) (PreH67 : (a28 <= 32767)) (PreH68 : ((-32768) <= a29)) (PreH69 : (a29 <= 32767)) (PreH70 : ((-32768) <= a30)) (PreH71 : (a30 <= 32767)) (PreH72 : ((-32768) <= a31)) (PreH73 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ (retval_3 = (qu_u16 (a2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (qu_u16 (a1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (qu_u16 (a0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= a8) ” 
  &&  “ (a8 <= 32767) ” 
  &&  “ ((-32768) <= a9) ” 
  &&  “ (a9 <= 32767) ” 
  &&  “ ((-32768) <= a10) ” 
  &&  “ (a10 <= 32767) ” 
  &&  “ ((-32768) <= a11) ” 
  &&  “ (a11 <= 32767) ” 
  &&  “ ((-32768) <= a12) ” 
  &&  “ (a12 <= 32767) ” 
  &&  “ ((-32768) <= a13) ” 
  &&  “ (a13 <= 32767) ” 
  &&  “ ((-32768) <= a14) ” 
  &&  “ (a14 <= 32767) ” 
  &&  “ ((-32768) <= a15) ” 
  &&  “ (a15 <= 32767) ” 
  &&  “ ((-32768) <= a16) ” 
  &&  “ (a16 <= 32767) ” 
  &&  “ ((-32768) <= a17) ” 
  &&  “ (a17 <= 32767) ” 
  &&  “ ((-32768) <= a18) ” 
  &&  “ (a18 <= 32767) ” 
  &&  “ ((-32768) <= a19) ” 
  &&  “ (a19 <= 32767) ” 
  &&  “ ((-32768) <= a20) ” 
  &&  “ (a20 <= 32767) ” 
  &&  “ ((-32768) <= a21) ” 
  &&  “ (a21 <= 32767) ” 
  &&  “ ((-32768) <= a22) ” 
  &&  “ (a22 <= 32767) ” 
  &&  “ ((-32768) <= a23) ” 
  &&  “ (a23 <= 32767) ” 
  &&  “ ((-32768) <= a24) ” 
  &&  “ (a24 <= 32767) ” 
  &&  “ ((-32768) <= a25) ” 
  &&  “ (a25 <= 32767) ” 
  &&  “ ((-32768) <= a26) ” 
  &&  “ (a26 <= 32767) ” 
  &&  “ ((-32768) <= a27) ” 
  &&  “ (a27 <= 32767) ” 
  &&  “ ((-32768) <= a28) ” 
  &&  “ (a28 <= 32767) ” 
  &&  “ ((-32768) <= a29) ” 
  &&  “ (a29 <= 32767) ” 
  &&  “ ((-32768) <= a30) ” 
  &&  “ (a30 <= 32767) ” 
  &&  “ ((-32768) <= a31) ” 
  &&  “ (a31 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_4 := __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_4_pure -> __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_4_aux.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_5_pure := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (qu_u16 (a3)))) (PreH2 : (0 <= retval_4)) (PreH3 : (retval_4 <= 65535)) (PreH4 : (retval_3 = (qu_u16 (a2)))) (PreH5 : (0 <= retval_3)) (PreH6 : (retval_3 <= 65535)) (PreH7 : (retval_2 = (qu_u16 (a1)))) (PreH8 : (0 <= retval_2)) (PreH9 : (retval_2 <= 65535)) (PreH10 : (retval = (qu_u16 (a0)))) (PreH11 : (0 <= retval)) (PreH12 : (retval <= 65535)) (PreH13 : ((-32768) <= a0)) (PreH14 : (a0 <= 32767)) (PreH15 : ((-32768) <= a1)) (PreH16 : (a1 <= 32767)) (PreH17 : ((-32768) <= a2)) (PreH18 : (a2 <= 32767)) (PreH19 : ((-32768) <= a3)) (PreH20 : (a3 <= 32767)) (PreH21 : ((-32768) <= a4)) (PreH22 : (a4 <= 32767)) (PreH23 : ((-32768) <= a5)) (PreH24 : (a5 <= 32767)) (PreH25 : ((-32768) <= a6)) (PreH26 : (a6 <= 32767)) (PreH27 : ((-32768) <= a7)) (PreH28 : (a7 <= 32767)) (PreH29 : ((-32768) <= a8)) (PreH30 : (a8 <= 32767)) (PreH31 : ((-32768) <= a9)) (PreH32 : (a9 <= 32767)) (PreH33 : ((-32768) <= a10)) (PreH34 : (a10 <= 32767)) (PreH35 : ((-32768) <= a11)) (PreH36 : (a11 <= 32767)) (PreH37 : ((-32768) <= a12)) (PreH38 : (a12 <= 32767)) (PreH39 : ((-32768) <= a13)) (PreH40 : (a13 <= 32767)) (PreH41 : ((-32768) <= a14)) (PreH42 : (a14 <= 32767)) (PreH43 : ((-32768) <= a15)) (PreH44 : (a15 <= 32767)) (PreH45 : ((-32768) <= a16)) (PreH46 : (a16 <= 32767)) (PreH47 : ((-32768) <= a17)) (PreH48 : (a17 <= 32767)) (PreH49 : ((-32768) <= a18)) (PreH50 : (a18 <= 32767)) (PreH51 : ((-32768) <= a19)) (PreH52 : (a19 <= 32767)) (PreH53 : ((-32768) <= a20)) (PreH54 : (a20 <= 32767)) (PreH55 : ((-32768) <= a21)) (PreH56 : (a21 <= 32767)) (PreH57 : ((-32768) <= a22)) (PreH58 : (a22 <= 32767)) (PreH59 : ((-32768) <= a23)) (PreH60 : (a23 <= 32767)) (PreH61 : ((-32768) <= a24)) (PreH62 : (a24 <= 32767)) (PreH63 : ((-32768) <= a25)) (PreH64 : (a25 <= 32767)) (PreH65 : ((-32768) <= a26)) (PreH66 : (a26 <= 32767)) (PreH67 : ((-32768) <= a27)) (PreH68 : (a27 <= 32767)) (PreH69 : ((-32768) <= a28)) (PreH70 : (a28 <= 32767)) (PreH71 : ((-32768) <= a29)) (PreH72 : (a29 <= 32767)) (PreH73 : ((-32768) <= a30)) (PreH74 : (a30 <= 32767)) (PreH75 : ((-32768) <= a31)) (PreH76 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a4) ” 
  &&  “ (a4 <= INT_MAX) ”
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_5_aux := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (qu_u16 (a3)))) (PreH2 : (0 <= retval_4)) (PreH3 : (retval_4 <= 65535)) (PreH4 : (retval_3 = (qu_u16 (a2)))) (PreH5 : (0 <= retval_3)) (PreH6 : (retval_3 <= 65535)) (PreH7 : (retval_2 = (qu_u16 (a1)))) (PreH8 : (0 <= retval_2)) (PreH9 : (retval_2 <= 65535)) (PreH10 : (retval = (qu_u16 (a0)))) (PreH11 : (0 <= retval)) (PreH12 : (retval <= 65535)) (PreH13 : ((-32768) <= a0)) (PreH14 : (a0 <= 32767)) (PreH15 : ((-32768) <= a1)) (PreH16 : (a1 <= 32767)) (PreH17 : ((-32768) <= a2)) (PreH18 : (a2 <= 32767)) (PreH19 : ((-32768) <= a3)) (PreH20 : (a3 <= 32767)) (PreH21 : ((-32768) <= a4)) (PreH22 : (a4 <= 32767)) (PreH23 : ((-32768) <= a5)) (PreH24 : (a5 <= 32767)) (PreH25 : ((-32768) <= a6)) (PreH26 : (a6 <= 32767)) (PreH27 : ((-32768) <= a7)) (PreH28 : (a7 <= 32767)) (PreH29 : ((-32768) <= a8)) (PreH30 : (a8 <= 32767)) (PreH31 : ((-32768) <= a9)) (PreH32 : (a9 <= 32767)) (PreH33 : ((-32768) <= a10)) (PreH34 : (a10 <= 32767)) (PreH35 : ((-32768) <= a11)) (PreH36 : (a11 <= 32767)) (PreH37 : ((-32768) <= a12)) (PreH38 : (a12 <= 32767)) (PreH39 : ((-32768) <= a13)) (PreH40 : (a13 <= 32767)) (PreH41 : ((-32768) <= a14)) (PreH42 : (a14 <= 32767)) (PreH43 : ((-32768) <= a15)) (PreH44 : (a15 <= 32767)) (PreH45 : ((-32768) <= a16)) (PreH46 : (a16 <= 32767)) (PreH47 : ((-32768) <= a17)) (PreH48 : (a17 <= 32767)) (PreH49 : ((-32768) <= a18)) (PreH50 : (a18 <= 32767)) (PreH51 : ((-32768) <= a19)) (PreH52 : (a19 <= 32767)) (PreH53 : ((-32768) <= a20)) (PreH54 : (a20 <= 32767)) (PreH55 : ((-32768) <= a21)) (PreH56 : (a21 <= 32767)) (PreH57 : ((-32768) <= a22)) (PreH58 : (a22 <= 32767)) (PreH59 : ((-32768) <= a23)) (PreH60 : (a23 <= 32767)) (PreH61 : ((-32768) <= a24)) (PreH62 : (a24 <= 32767)) (PreH63 : ((-32768) <= a25)) (PreH64 : (a25 <= 32767)) (PreH65 : ((-32768) <= a26)) (PreH66 : (a26 <= 32767)) (PreH67 : ((-32768) <= a27)) (PreH68 : (a27 <= 32767)) (PreH69 : ((-32768) <= a28)) (PreH70 : (a28 <= 32767)) (PreH71 : ((-32768) <= a29)) (PreH72 : (a29 <= 32767)) (PreH73 : ((-32768) <= a30)) (PreH74 : (a30 <= 32767)) (PreH75 : ((-32768) <= a31)) (PreH76 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a4) ” 
  &&  “ (a4 <= INT_MAX) ” 
  &&  “ (retval_4 = (qu_u16 (a3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 65535) ” 
  &&  “ (retval_3 = (qu_u16 (a2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (qu_u16 (a1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (qu_u16 (a0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= a8) ” 
  &&  “ (a8 <= 32767) ” 
  &&  “ ((-32768) <= a9) ” 
  &&  “ (a9 <= 32767) ” 
  &&  “ ((-32768) <= a10) ” 
  &&  “ (a10 <= 32767) ” 
  &&  “ ((-32768) <= a11) ” 
  &&  “ (a11 <= 32767) ” 
  &&  “ ((-32768) <= a12) ” 
  &&  “ (a12 <= 32767) ” 
  &&  “ ((-32768) <= a13) ” 
  &&  “ (a13 <= 32767) ” 
  &&  “ ((-32768) <= a14) ” 
  &&  “ (a14 <= 32767) ” 
  &&  “ ((-32768) <= a15) ” 
  &&  “ (a15 <= 32767) ” 
  &&  “ ((-32768) <= a16) ” 
  &&  “ (a16 <= 32767) ” 
  &&  “ ((-32768) <= a17) ” 
  &&  “ (a17 <= 32767) ” 
  &&  “ ((-32768) <= a18) ” 
  &&  “ (a18 <= 32767) ” 
  &&  “ ((-32768) <= a19) ” 
  &&  “ (a19 <= 32767) ” 
  &&  “ ((-32768) <= a20) ” 
  &&  “ (a20 <= 32767) ” 
  &&  “ ((-32768) <= a21) ” 
  &&  “ (a21 <= 32767) ” 
  &&  “ ((-32768) <= a22) ” 
  &&  “ (a22 <= 32767) ” 
  &&  “ ((-32768) <= a23) ” 
  &&  “ (a23 <= 32767) ” 
  &&  “ ((-32768) <= a24) ” 
  &&  “ (a24 <= 32767) ” 
  &&  “ ((-32768) <= a25) ” 
  &&  “ (a25 <= 32767) ” 
  &&  “ ((-32768) <= a26) ” 
  &&  “ (a26 <= 32767) ” 
  &&  “ ((-32768) <= a27) ” 
  &&  “ (a27 <= 32767) ” 
  &&  “ ((-32768) <= a28) ” 
  &&  “ (a28 <= 32767) ” 
  &&  “ ((-32768) <= a29) ” 
  &&  “ (a29 <= 32767) ” 
  &&  “ ((-32768) <= a30) ” 
  &&  “ (a30 <= 32767) ” 
  &&  “ ((-32768) <= a31) ” 
  &&  “ (a31 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_5 := __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_5_pure -> __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_5_aux.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_6_pure := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (qu_u16 (a4)))) (PreH2 : (0 <= retval_5)) (PreH3 : (retval_5 <= 65535)) (PreH4 : (retval_4 = (qu_u16 (a3)))) (PreH5 : (0 <= retval_4)) (PreH6 : (retval_4 <= 65535)) (PreH7 : (retval_3 = (qu_u16 (a2)))) (PreH8 : (0 <= retval_3)) (PreH9 : (retval_3 <= 65535)) (PreH10 : (retval_2 = (qu_u16 (a1)))) (PreH11 : (0 <= retval_2)) (PreH12 : (retval_2 <= 65535)) (PreH13 : (retval = (qu_u16 (a0)))) (PreH14 : (0 <= retval)) (PreH15 : (retval <= 65535)) (PreH16 : ((-32768) <= a0)) (PreH17 : (a0 <= 32767)) (PreH18 : ((-32768) <= a1)) (PreH19 : (a1 <= 32767)) (PreH20 : ((-32768) <= a2)) (PreH21 : (a2 <= 32767)) (PreH22 : ((-32768) <= a3)) (PreH23 : (a3 <= 32767)) (PreH24 : ((-32768) <= a4)) (PreH25 : (a4 <= 32767)) (PreH26 : ((-32768) <= a5)) (PreH27 : (a5 <= 32767)) (PreH28 : ((-32768) <= a6)) (PreH29 : (a6 <= 32767)) (PreH30 : ((-32768) <= a7)) (PreH31 : (a7 <= 32767)) (PreH32 : ((-32768) <= a8)) (PreH33 : (a8 <= 32767)) (PreH34 : ((-32768) <= a9)) (PreH35 : (a9 <= 32767)) (PreH36 : ((-32768) <= a10)) (PreH37 : (a10 <= 32767)) (PreH38 : ((-32768) <= a11)) (PreH39 : (a11 <= 32767)) (PreH40 : ((-32768) <= a12)) (PreH41 : (a12 <= 32767)) (PreH42 : ((-32768) <= a13)) (PreH43 : (a13 <= 32767)) (PreH44 : ((-32768) <= a14)) (PreH45 : (a14 <= 32767)) (PreH46 : ((-32768) <= a15)) (PreH47 : (a15 <= 32767)) (PreH48 : ((-32768) <= a16)) (PreH49 : (a16 <= 32767)) (PreH50 : ((-32768) <= a17)) (PreH51 : (a17 <= 32767)) (PreH52 : ((-32768) <= a18)) (PreH53 : (a18 <= 32767)) (PreH54 : ((-32768) <= a19)) (PreH55 : (a19 <= 32767)) (PreH56 : ((-32768) <= a20)) (PreH57 : (a20 <= 32767)) (PreH58 : ((-32768) <= a21)) (PreH59 : (a21 <= 32767)) (PreH60 : ((-32768) <= a22)) (PreH61 : (a22 <= 32767)) (PreH62 : ((-32768) <= a23)) (PreH63 : (a23 <= 32767)) (PreH64 : ((-32768) <= a24)) (PreH65 : (a24 <= 32767)) (PreH66 : ((-32768) <= a25)) (PreH67 : (a25 <= 32767)) (PreH68 : ((-32768) <= a26)) (PreH69 : (a26 <= 32767)) (PreH70 : ((-32768) <= a27)) (PreH71 : (a27 <= 32767)) (PreH72 : ((-32768) <= a28)) (PreH73 : (a28 <= 32767)) (PreH74 : ((-32768) <= a29)) (PreH75 : (a29 <= 32767)) (PreH76 : ((-32768) <= a30)) (PreH77 : (a30 <= 32767)) (PreH78 : ((-32768) <= a31)) (PreH79 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a5) ” 
  &&  “ (a5 <= INT_MAX) ”
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_6_aux := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (qu_u16 (a4)))) (PreH2 : (0 <= retval_5)) (PreH3 : (retval_5 <= 65535)) (PreH4 : (retval_4 = (qu_u16 (a3)))) (PreH5 : (0 <= retval_4)) (PreH6 : (retval_4 <= 65535)) (PreH7 : (retval_3 = (qu_u16 (a2)))) (PreH8 : (0 <= retval_3)) (PreH9 : (retval_3 <= 65535)) (PreH10 : (retval_2 = (qu_u16 (a1)))) (PreH11 : (0 <= retval_2)) (PreH12 : (retval_2 <= 65535)) (PreH13 : (retval = (qu_u16 (a0)))) (PreH14 : (0 <= retval)) (PreH15 : (retval <= 65535)) (PreH16 : ((-32768) <= a0)) (PreH17 : (a0 <= 32767)) (PreH18 : ((-32768) <= a1)) (PreH19 : (a1 <= 32767)) (PreH20 : ((-32768) <= a2)) (PreH21 : (a2 <= 32767)) (PreH22 : ((-32768) <= a3)) (PreH23 : (a3 <= 32767)) (PreH24 : ((-32768) <= a4)) (PreH25 : (a4 <= 32767)) (PreH26 : ((-32768) <= a5)) (PreH27 : (a5 <= 32767)) (PreH28 : ((-32768) <= a6)) (PreH29 : (a6 <= 32767)) (PreH30 : ((-32768) <= a7)) (PreH31 : (a7 <= 32767)) (PreH32 : ((-32768) <= a8)) (PreH33 : (a8 <= 32767)) (PreH34 : ((-32768) <= a9)) (PreH35 : (a9 <= 32767)) (PreH36 : ((-32768) <= a10)) (PreH37 : (a10 <= 32767)) (PreH38 : ((-32768) <= a11)) (PreH39 : (a11 <= 32767)) (PreH40 : ((-32768) <= a12)) (PreH41 : (a12 <= 32767)) (PreH42 : ((-32768) <= a13)) (PreH43 : (a13 <= 32767)) (PreH44 : ((-32768) <= a14)) (PreH45 : (a14 <= 32767)) (PreH46 : ((-32768) <= a15)) (PreH47 : (a15 <= 32767)) (PreH48 : ((-32768) <= a16)) (PreH49 : (a16 <= 32767)) (PreH50 : ((-32768) <= a17)) (PreH51 : (a17 <= 32767)) (PreH52 : ((-32768) <= a18)) (PreH53 : (a18 <= 32767)) (PreH54 : ((-32768) <= a19)) (PreH55 : (a19 <= 32767)) (PreH56 : ((-32768) <= a20)) (PreH57 : (a20 <= 32767)) (PreH58 : ((-32768) <= a21)) (PreH59 : (a21 <= 32767)) (PreH60 : ((-32768) <= a22)) (PreH61 : (a22 <= 32767)) (PreH62 : ((-32768) <= a23)) (PreH63 : (a23 <= 32767)) (PreH64 : ((-32768) <= a24)) (PreH65 : (a24 <= 32767)) (PreH66 : ((-32768) <= a25)) (PreH67 : (a25 <= 32767)) (PreH68 : ((-32768) <= a26)) (PreH69 : (a26 <= 32767)) (PreH70 : ((-32768) <= a27)) (PreH71 : (a27 <= 32767)) (PreH72 : ((-32768) <= a28)) (PreH73 : (a28 <= 32767)) (PreH74 : ((-32768) <= a29)) (PreH75 : (a29 <= 32767)) (PreH76 : ((-32768) <= a30)) (PreH77 : (a30 <= 32767)) (PreH78 : ((-32768) <= a31)) (PreH79 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a5) ” 
  &&  “ (a5 <= INT_MAX) ” 
  &&  “ (retval_5 = (qu_u16 (a4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 65535) ” 
  &&  “ (retval_4 = (qu_u16 (a3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 65535) ” 
  &&  “ (retval_3 = (qu_u16 (a2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (qu_u16 (a1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (qu_u16 (a0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= a8) ” 
  &&  “ (a8 <= 32767) ” 
  &&  “ ((-32768) <= a9) ” 
  &&  “ (a9 <= 32767) ” 
  &&  “ ((-32768) <= a10) ” 
  &&  “ (a10 <= 32767) ” 
  &&  “ ((-32768) <= a11) ” 
  &&  “ (a11 <= 32767) ” 
  &&  “ ((-32768) <= a12) ” 
  &&  “ (a12 <= 32767) ” 
  &&  “ ((-32768) <= a13) ” 
  &&  “ (a13 <= 32767) ” 
  &&  “ ((-32768) <= a14) ” 
  &&  “ (a14 <= 32767) ” 
  &&  “ ((-32768) <= a15) ” 
  &&  “ (a15 <= 32767) ” 
  &&  “ ((-32768) <= a16) ” 
  &&  “ (a16 <= 32767) ” 
  &&  “ ((-32768) <= a17) ” 
  &&  “ (a17 <= 32767) ” 
  &&  “ ((-32768) <= a18) ” 
  &&  “ (a18 <= 32767) ” 
  &&  “ ((-32768) <= a19) ” 
  &&  “ (a19 <= 32767) ” 
  &&  “ ((-32768) <= a20) ” 
  &&  “ (a20 <= 32767) ” 
  &&  “ ((-32768) <= a21) ” 
  &&  “ (a21 <= 32767) ” 
  &&  “ ((-32768) <= a22) ” 
  &&  “ (a22 <= 32767) ” 
  &&  “ ((-32768) <= a23) ” 
  &&  “ (a23 <= 32767) ” 
  &&  “ ((-32768) <= a24) ” 
  &&  “ (a24 <= 32767) ” 
  &&  “ ((-32768) <= a25) ” 
  &&  “ (a25 <= 32767) ” 
  &&  “ ((-32768) <= a26) ” 
  &&  “ (a26 <= 32767) ” 
  &&  “ ((-32768) <= a27) ” 
  &&  “ (a27 <= 32767) ” 
  &&  “ ((-32768) <= a28) ” 
  &&  “ (a28 <= 32767) ” 
  &&  “ ((-32768) <= a29) ” 
  &&  “ (a29 <= 32767) ” 
  &&  “ ((-32768) <= a30) ” 
  &&  “ (a30 <= 32767) ” 
  &&  “ ((-32768) <= a31) ” 
  &&  “ (a31 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_6 := __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_6_pure -> __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_6_aux.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_7_pure := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (qu_u16 (a5)))) (PreH2 : (0 <= retval_6)) (PreH3 : (retval_6 <= 65535)) (PreH4 : (retval_5 = (qu_u16 (a4)))) (PreH5 : (0 <= retval_5)) (PreH6 : (retval_5 <= 65535)) (PreH7 : (retval_4 = (qu_u16 (a3)))) (PreH8 : (0 <= retval_4)) (PreH9 : (retval_4 <= 65535)) (PreH10 : (retval_3 = (qu_u16 (a2)))) (PreH11 : (0 <= retval_3)) (PreH12 : (retval_3 <= 65535)) (PreH13 : (retval_2 = (qu_u16 (a1)))) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 65535)) (PreH16 : (retval = (qu_u16 (a0)))) (PreH17 : (0 <= retval)) (PreH18 : (retval <= 65535)) (PreH19 : ((-32768) <= a0)) (PreH20 : (a0 <= 32767)) (PreH21 : ((-32768) <= a1)) (PreH22 : (a1 <= 32767)) (PreH23 : ((-32768) <= a2)) (PreH24 : (a2 <= 32767)) (PreH25 : ((-32768) <= a3)) (PreH26 : (a3 <= 32767)) (PreH27 : ((-32768) <= a4)) (PreH28 : (a4 <= 32767)) (PreH29 : ((-32768) <= a5)) (PreH30 : (a5 <= 32767)) (PreH31 : ((-32768) <= a6)) (PreH32 : (a6 <= 32767)) (PreH33 : ((-32768) <= a7)) (PreH34 : (a7 <= 32767)) (PreH35 : ((-32768) <= a8)) (PreH36 : (a8 <= 32767)) (PreH37 : ((-32768) <= a9)) (PreH38 : (a9 <= 32767)) (PreH39 : ((-32768) <= a10)) (PreH40 : (a10 <= 32767)) (PreH41 : ((-32768) <= a11)) (PreH42 : (a11 <= 32767)) (PreH43 : ((-32768) <= a12)) (PreH44 : (a12 <= 32767)) (PreH45 : ((-32768) <= a13)) (PreH46 : (a13 <= 32767)) (PreH47 : ((-32768) <= a14)) (PreH48 : (a14 <= 32767)) (PreH49 : ((-32768) <= a15)) (PreH50 : (a15 <= 32767)) (PreH51 : ((-32768) <= a16)) (PreH52 : (a16 <= 32767)) (PreH53 : ((-32768) <= a17)) (PreH54 : (a17 <= 32767)) (PreH55 : ((-32768) <= a18)) (PreH56 : (a18 <= 32767)) (PreH57 : ((-32768) <= a19)) (PreH58 : (a19 <= 32767)) (PreH59 : ((-32768) <= a20)) (PreH60 : (a20 <= 32767)) (PreH61 : ((-32768) <= a21)) (PreH62 : (a21 <= 32767)) (PreH63 : ((-32768) <= a22)) (PreH64 : (a22 <= 32767)) (PreH65 : ((-32768) <= a23)) (PreH66 : (a23 <= 32767)) (PreH67 : ((-32768) <= a24)) (PreH68 : (a24 <= 32767)) (PreH69 : ((-32768) <= a25)) (PreH70 : (a25 <= 32767)) (PreH71 : ((-32768) <= a26)) (PreH72 : (a26 <= 32767)) (PreH73 : ((-32768) <= a27)) (PreH74 : (a27 <= 32767)) (PreH75 : ((-32768) <= a28)) (PreH76 : (a28 <= 32767)) (PreH77 : ((-32768) <= a29)) (PreH78 : (a29 <= 32767)) (PreH79 : ((-32768) <= a30)) (PreH80 : (a30 <= 32767)) (PreH81 : ((-32768) <= a31)) (PreH82 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a6) ” 
  &&  “ (a6 <= INT_MAX) ”
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_7_aux := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (qu_u16 (a5)))) (PreH2 : (0 <= retval_6)) (PreH3 : (retval_6 <= 65535)) (PreH4 : (retval_5 = (qu_u16 (a4)))) (PreH5 : (0 <= retval_5)) (PreH6 : (retval_5 <= 65535)) (PreH7 : (retval_4 = (qu_u16 (a3)))) (PreH8 : (0 <= retval_4)) (PreH9 : (retval_4 <= 65535)) (PreH10 : (retval_3 = (qu_u16 (a2)))) (PreH11 : (0 <= retval_3)) (PreH12 : (retval_3 <= 65535)) (PreH13 : (retval_2 = (qu_u16 (a1)))) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 65535)) (PreH16 : (retval = (qu_u16 (a0)))) (PreH17 : (0 <= retval)) (PreH18 : (retval <= 65535)) (PreH19 : ((-32768) <= a0)) (PreH20 : (a0 <= 32767)) (PreH21 : ((-32768) <= a1)) (PreH22 : (a1 <= 32767)) (PreH23 : ((-32768) <= a2)) (PreH24 : (a2 <= 32767)) (PreH25 : ((-32768) <= a3)) (PreH26 : (a3 <= 32767)) (PreH27 : ((-32768) <= a4)) (PreH28 : (a4 <= 32767)) (PreH29 : ((-32768) <= a5)) (PreH30 : (a5 <= 32767)) (PreH31 : ((-32768) <= a6)) (PreH32 : (a6 <= 32767)) (PreH33 : ((-32768) <= a7)) (PreH34 : (a7 <= 32767)) (PreH35 : ((-32768) <= a8)) (PreH36 : (a8 <= 32767)) (PreH37 : ((-32768) <= a9)) (PreH38 : (a9 <= 32767)) (PreH39 : ((-32768) <= a10)) (PreH40 : (a10 <= 32767)) (PreH41 : ((-32768) <= a11)) (PreH42 : (a11 <= 32767)) (PreH43 : ((-32768) <= a12)) (PreH44 : (a12 <= 32767)) (PreH45 : ((-32768) <= a13)) (PreH46 : (a13 <= 32767)) (PreH47 : ((-32768) <= a14)) (PreH48 : (a14 <= 32767)) (PreH49 : ((-32768) <= a15)) (PreH50 : (a15 <= 32767)) (PreH51 : ((-32768) <= a16)) (PreH52 : (a16 <= 32767)) (PreH53 : ((-32768) <= a17)) (PreH54 : (a17 <= 32767)) (PreH55 : ((-32768) <= a18)) (PreH56 : (a18 <= 32767)) (PreH57 : ((-32768) <= a19)) (PreH58 : (a19 <= 32767)) (PreH59 : ((-32768) <= a20)) (PreH60 : (a20 <= 32767)) (PreH61 : ((-32768) <= a21)) (PreH62 : (a21 <= 32767)) (PreH63 : ((-32768) <= a22)) (PreH64 : (a22 <= 32767)) (PreH65 : ((-32768) <= a23)) (PreH66 : (a23 <= 32767)) (PreH67 : ((-32768) <= a24)) (PreH68 : (a24 <= 32767)) (PreH69 : ((-32768) <= a25)) (PreH70 : (a25 <= 32767)) (PreH71 : ((-32768) <= a26)) (PreH72 : (a26 <= 32767)) (PreH73 : ((-32768) <= a27)) (PreH74 : (a27 <= 32767)) (PreH75 : ((-32768) <= a28)) (PreH76 : (a28 <= 32767)) (PreH77 : ((-32768) <= a29)) (PreH78 : (a29 <= 32767)) (PreH79 : ((-32768) <= a30)) (PreH80 : (a30 <= 32767)) (PreH81 : ((-32768) <= a31)) (PreH82 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a6) ” 
  &&  “ (a6 <= INT_MAX) ” 
  &&  “ (retval_6 = (qu_u16 (a5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 65535) ” 
  &&  “ (retval_5 = (qu_u16 (a4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 65535) ” 
  &&  “ (retval_4 = (qu_u16 (a3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 65535) ” 
  &&  “ (retval_3 = (qu_u16 (a2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (qu_u16 (a1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (qu_u16 (a0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= a8) ” 
  &&  “ (a8 <= 32767) ” 
  &&  “ ((-32768) <= a9) ” 
  &&  “ (a9 <= 32767) ” 
  &&  “ ((-32768) <= a10) ” 
  &&  “ (a10 <= 32767) ” 
  &&  “ ((-32768) <= a11) ” 
  &&  “ (a11 <= 32767) ” 
  &&  “ ((-32768) <= a12) ” 
  &&  “ (a12 <= 32767) ” 
  &&  “ ((-32768) <= a13) ” 
  &&  “ (a13 <= 32767) ” 
  &&  “ ((-32768) <= a14) ” 
  &&  “ (a14 <= 32767) ” 
  &&  “ ((-32768) <= a15) ” 
  &&  “ (a15 <= 32767) ” 
  &&  “ ((-32768) <= a16) ” 
  &&  “ (a16 <= 32767) ” 
  &&  “ ((-32768) <= a17) ” 
  &&  “ (a17 <= 32767) ” 
  &&  “ ((-32768) <= a18) ” 
  &&  “ (a18 <= 32767) ” 
  &&  “ ((-32768) <= a19) ” 
  &&  “ (a19 <= 32767) ” 
  &&  “ ((-32768) <= a20) ” 
  &&  “ (a20 <= 32767) ” 
  &&  “ ((-32768) <= a21) ” 
  &&  “ (a21 <= 32767) ” 
  &&  “ ((-32768) <= a22) ” 
  &&  “ (a22 <= 32767) ” 
  &&  “ ((-32768) <= a23) ” 
  &&  “ (a23 <= 32767) ” 
  &&  “ ((-32768) <= a24) ” 
  &&  “ (a24 <= 32767) ” 
  &&  “ ((-32768) <= a25) ” 
  &&  “ (a25 <= 32767) ” 
  &&  “ ((-32768) <= a26) ” 
  &&  “ (a26 <= 32767) ” 
  &&  “ ((-32768) <= a27) ” 
  &&  “ (a27 <= 32767) ” 
  &&  “ ((-32768) <= a28) ” 
  &&  “ (a28 <= 32767) ” 
  &&  “ ((-32768) <= a29) ” 
  &&  “ (a29 <= 32767) ” 
  &&  “ ((-32768) <= a30) ” 
  &&  “ (a30 <= 32767) ” 
  &&  “ ((-32768) <= a31) ” 
  &&  “ (a31 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_7 := __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_7_pure -> __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_7_aux.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_8_pure := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (qu_u16 (a6)))) (PreH2 : (0 <= retval_7)) (PreH3 : (retval_7 <= 65535)) (PreH4 : (retval_6 = (qu_u16 (a5)))) (PreH5 : (0 <= retval_6)) (PreH6 : (retval_6 <= 65535)) (PreH7 : (retval_5 = (qu_u16 (a4)))) (PreH8 : (0 <= retval_5)) (PreH9 : (retval_5 <= 65535)) (PreH10 : (retval_4 = (qu_u16 (a3)))) (PreH11 : (0 <= retval_4)) (PreH12 : (retval_4 <= 65535)) (PreH13 : (retval_3 = (qu_u16 (a2)))) (PreH14 : (0 <= retval_3)) (PreH15 : (retval_3 <= 65535)) (PreH16 : (retval_2 = (qu_u16 (a1)))) (PreH17 : (0 <= retval_2)) (PreH18 : (retval_2 <= 65535)) (PreH19 : (retval = (qu_u16 (a0)))) (PreH20 : (0 <= retval)) (PreH21 : (retval <= 65535)) (PreH22 : ((-32768) <= a0)) (PreH23 : (a0 <= 32767)) (PreH24 : ((-32768) <= a1)) (PreH25 : (a1 <= 32767)) (PreH26 : ((-32768) <= a2)) (PreH27 : (a2 <= 32767)) (PreH28 : ((-32768) <= a3)) (PreH29 : (a3 <= 32767)) (PreH30 : ((-32768) <= a4)) (PreH31 : (a4 <= 32767)) (PreH32 : ((-32768) <= a5)) (PreH33 : (a5 <= 32767)) (PreH34 : ((-32768) <= a6)) (PreH35 : (a6 <= 32767)) (PreH36 : ((-32768) <= a7)) (PreH37 : (a7 <= 32767)) (PreH38 : ((-32768) <= a8)) (PreH39 : (a8 <= 32767)) (PreH40 : ((-32768) <= a9)) (PreH41 : (a9 <= 32767)) (PreH42 : ((-32768) <= a10)) (PreH43 : (a10 <= 32767)) (PreH44 : ((-32768) <= a11)) (PreH45 : (a11 <= 32767)) (PreH46 : ((-32768) <= a12)) (PreH47 : (a12 <= 32767)) (PreH48 : ((-32768) <= a13)) (PreH49 : (a13 <= 32767)) (PreH50 : ((-32768) <= a14)) (PreH51 : (a14 <= 32767)) (PreH52 : ((-32768) <= a15)) (PreH53 : (a15 <= 32767)) (PreH54 : ((-32768) <= a16)) (PreH55 : (a16 <= 32767)) (PreH56 : ((-32768) <= a17)) (PreH57 : (a17 <= 32767)) (PreH58 : ((-32768) <= a18)) (PreH59 : (a18 <= 32767)) (PreH60 : ((-32768) <= a19)) (PreH61 : (a19 <= 32767)) (PreH62 : ((-32768) <= a20)) (PreH63 : (a20 <= 32767)) (PreH64 : ((-32768) <= a21)) (PreH65 : (a21 <= 32767)) (PreH66 : ((-32768) <= a22)) (PreH67 : (a22 <= 32767)) (PreH68 : ((-32768) <= a23)) (PreH69 : (a23 <= 32767)) (PreH70 : ((-32768) <= a24)) (PreH71 : (a24 <= 32767)) (PreH72 : ((-32768) <= a25)) (PreH73 : (a25 <= 32767)) (PreH74 : ((-32768) <= a26)) (PreH75 : (a26 <= 32767)) (PreH76 : ((-32768) <= a27)) (PreH77 : (a27 <= 32767)) (PreH78 : ((-32768) <= a28)) (PreH79 : (a28 <= 32767)) (PreH80 : ((-32768) <= a29)) (PreH81 : (a29 <= 32767)) (PreH82 : ((-32768) <= a30)) (PreH83 : (a30 <= 32767)) (PreH84 : ((-32768) <= a31)) (PreH85 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a7) ” 
  &&  “ (a7 <= INT_MAX) ”
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_8_aux := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (qu_u16 (a6)))) (PreH2 : (0 <= retval_7)) (PreH3 : (retval_7 <= 65535)) (PreH4 : (retval_6 = (qu_u16 (a5)))) (PreH5 : (0 <= retval_6)) (PreH6 : (retval_6 <= 65535)) (PreH7 : (retval_5 = (qu_u16 (a4)))) (PreH8 : (0 <= retval_5)) (PreH9 : (retval_5 <= 65535)) (PreH10 : (retval_4 = (qu_u16 (a3)))) (PreH11 : (0 <= retval_4)) (PreH12 : (retval_4 <= 65535)) (PreH13 : (retval_3 = (qu_u16 (a2)))) (PreH14 : (0 <= retval_3)) (PreH15 : (retval_3 <= 65535)) (PreH16 : (retval_2 = (qu_u16 (a1)))) (PreH17 : (0 <= retval_2)) (PreH18 : (retval_2 <= 65535)) (PreH19 : (retval = (qu_u16 (a0)))) (PreH20 : (0 <= retval)) (PreH21 : (retval <= 65535)) (PreH22 : ((-32768) <= a0)) (PreH23 : (a0 <= 32767)) (PreH24 : ((-32768) <= a1)) (PreH25 : (a1 <= 32767)) (PreH26 : ((-32768) <= a2)) (PreH27 : (a2 <= 32767)) (PreH28 : ((-32768) <= a3)) (PreH29 : (a3 <= 32767)) (PreH30 : ((-32768) <= a4)) (PreH31 : (a4 <= 32767)) (PreH32 : ((-32768) <= a5)) (PreH33 : (a5 <= 32767)) (PreH34 : ((-32768) <= a6)) (PreH35 : (a6 <= 32767)) (PreH36 : ((-32768) <= a7)) (PreH37 : (a7 <= 32767)) (PreH38 : ((-32768) <= a8)) (PreH39 : (a8 <= 32767)) (PreH40 : ((-32768) <= a9)) (PreH41 : (a9 <= 32767)) (PreH42 : ((-32768) <= a10)) (PreH43 : (a10 <= 32767)) (PreH44 : ((-32768) <= a11)) (PreH45 : (a11 <= 32767)) (PreH46 : ((-32768) <= a12)) (PreH47 : (a12 <= 32767)) (PreH48 : ((-32768) <= a13)) (PreH49 : (a13 <= 32767)) (PreH50 : ((-32768) <= a14)) (PreH51 : (a14 <= 32767)) (PreH52 : ((-32768) <= a15)) (PreH53 : (a15 <= 32767)) (PreH54 : ((-32768) <= a16)) (PreH55 : (a16 <= 32767)) (PreH56 : ((-32768) <= a17)) (PreH57 : (a17 <= 32767)) (PreH58 : ((-32768) <= a18)) (PreH59 : (a18 <= 32767)) (PreH60 : ((-32768) <= a19)) (PreH61 : (a19 <= 32767)) (PreH62 : ((-32768) <= a20)) (PreH63 : (a20 <= 32767)) (PreH64 : ((-32768) <= a21)) (PreH65 : (a21 <= 32767)) (PreH66 : ((-32768) <= a22)) (PreH67 : (a22 <= 32767)) (PreH68 : ((-32768) <= a23)) (PreH69 : (a23 <= 32767)) (PreH70 : ((-32768) <= a24)) (PreH71 : (a24 <= 32767)) (PreH72 : ((-32768) <= a25)) (PreH73 : (a25 <= 32767)) (PreH74 : ((-32768) <= a26)) (PreH75 : (a26 <= 32767)) (PreH76 : ((-32768) <= a27)) (PreH77 : (a27 <= 32767)) (PreH78 : ((-32768) <= a28)) (PreH79 : (a28 <= 32767)) (PreH80 : ((-32768) <= a29)) (PreH81 : (a29 <= 32767)) (PreH82 : ((-32768) <= a30)) (PreH83 : (a30 <= 32767)) (PreH84 : ((-32768) <= a31)) (PreH85 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a7) ” 
  &&  “ (a7 <= INT_MAX) ” 
  &&  “ (retval_7 = (qu_u16 (a6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 65535) ” 
  &&  “ (retval_6 = (qu_u16 (a5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 65535) ” 
  &&  “ (retval_5 = (qu_u16 (a4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 65535) ” 
  &&  “ (retval_4 = (qu_u16 (a3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 65535) ” 
  &&  “ (retval_3 = (qu_u16 (a2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (qu_u16 (a1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (qu_u16 (a0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= a8) ” 
  &&  “ (a8 <= 32767) ” 
  &&  “ ((-32768) <= a9) ” 
  &&  “ (a9 <= 32767) ” 
  &&  “ ((-32768) <= a10) ” 
  &&  “ (a10 <= 32767) ” 
  &&  “ ((-32768) <= a11) ” 
  &&  “ (a11 <= 32767) ” 
  &&  “ ((-32768) <= a12) ” 
  &&  “ (a12 <= 32767) ” 
  &&  “ ((-32768) <= a13) ” 
  &&  “ (a13 <= 32767) ” 
  &&  “ ((-32768) <= a14) ” 
  &&  “ (a14 <= 32767) ” 
  &&  “ ((-32768) <= a15) ” 
  &&  “ (a15 <= 32767) ” 
  &&  “ ((-32768) <= a16) ” 
  &&  “ (a16 <= 32767) ” 
  &&  “ ((-32768) <= a17) ” 
  &&  “ (a17 <= 32767) ” 
  &&  “ ((-32768) <= a18) ” 
  &&  “ (a18 <= 32767) ” 
  &&  “ ((-32768) <= a19) ” 
  &&  “ (a19 <= 32767) ” 
  &&  “ ((-32768) <= a20) ” 
  &&  “ (a20 <= 32767) ” 
  &&  “ ((-32768) <= a21) ” 
  &&  “ (a21 <= 32767) ” 
  &&  “ ((-32768) <= a22) ” 
  &&  “ (a22 <= 32767) ” 
  &&  “ ((-32768) <= a23) ” 
  &&  “ (a23 <= 32767) ” 
  &&  “ ((-32768) <= a24) ” 
  &&  “ (a24 <= 32767) ” 
  &&  “ ((-32768) <= a25) ” 
  &&  “ (a25 <= 32767) ” 
  &&  “ ((-32768) <= a26) ” 
  &&  “ (a26 <= 32767) ” 
  &&  “ ((-32768) <= a27) ” 
  &&  “ (a27 <= 32767) ” 
  &&  “ ((-32768) <= a28) ” 
  &&  “ (a28 <= 32767) ” 
  &&  “ ((-32768) <= a29) ” 
  &&  “ (a29 <= 32767) ” 
  &&  “ ((-32768) <= a30) ” 
  &&  “ (a30 <= 32767) ” 
  &&  “ ((-32768) <= a31) ” 
  &&  “ (a31 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_8 := __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_8_pure -> __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_8_aux.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_9_pure := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (PreH1 : (retval_8 = (qu_u16 (a7)))) (PreH2 : (0 <= retval_8)) (PreH3 : (retval_8 <= 65535)) (PreH4 : (retval_7 = (qu_u16 (a6)))) (PreH5 : (0 <= retval_7)) (PreH6 : (retval_7 <= 65535)) (PreH7 : (retval_6 = (qu_u16 (a5)))) (PreH8 : (0 <= retval_6)) (PreH9 : (retval_6 <= 65535)) (PreH10 : (retval_5 = (qu_u16 (a4)))) (PreH11 : (0 <= retval_5)) (PreH12 : (retval_5 <= 65535)) (PreH13 : (retval_4 = (qu_u16 (a3)))) (PreH14 : (0 <= retval_4)) (PreH15 : (retval_4 <= 65535)) (PreH16 : (retval_3 = (qu_u16 (a2)))) (PreH17 : (0 <= retval_3)) (PreH18 : (retval_3 <= 65535)) (PreH19 : (retval_2 = (qu_u16 (a1)))) (PreH20 : (0 <= retval_2)) (PreH21 : (retval_2 <= 65535)) (PreH22 : (retval = (qu_u16 (a0)))) (PreH23 : (0 <= retval)) (PreH24 : (retval <= 65535)) (PreH25 : ((-32768) <= a0)) (PreH26 : (a0 <= 32767)) (PreH27 : ((-32768) <= a1)) (PreH28 : (a1 <= 32767)) (PreH29 : ((-32768) <= a2)) (PreH30 : (a2 <= 32767)) (PreH31 : ((-32768) <= a3)) (PreH32 : (a3 <= 32767)) (PreH33 : ((-32768) <= a4)) (PreH34 : (a4 <= 32767)) (PreH35 : ((-32768) <= a5)) (PreH36 : (a5 <= 32767)) (PreH37 : ((-32768) <= a6)) (PreH38 : (a6 <= 32767)) (PreH39 : ((-32768) <= a7)) (PreH40 : (a7 <= 32767)) (PreH41 : ((-32768) <= a8)) (PreH42 : (a8 <= 32767)) (PreH43 : ((-32768) <= a9)) (PreH44 : (a9 <= 32767)) (PreH45 : ((-32768) <= a10)) (PreH46 : (a10 <= 32767)) (PreH47 : ((-32768) <= a11)) (PreH48 : (a11 <= 32767)) (PreH49 : ((-32768) <= a12)) (PreH50 : (a12 <= 32767)) (PreH51 : ((-32768) <= a13)) (PreH52 : (a13 <= 32767)) (PreH53 : ((-32768) <= a14)) (PreH54 : (a14 <= 32767)) (PreH55 : ((-32768) <= a15)) (PreH56 : (a15 <= 32767)) (PreH57 : ((-32768) <= a16)) (PreH58 : (a16 <= 32767)) (PreH59 : ((-32768) <= a17)) (PreH60 : (a17 <= 32767)) (PreH61 : ((-32768) <= a18)) (PreH62 : (a18 <= 32767)) (PreH63 : ((-32768) <= a19)) (PreH64 : (a19 <= 32767)) (PreH65 : ((-32768) <= a20)) (PreH66 : (a20 <= 32767)) (PreH67 : ((-32768) <= a21)) (PreH68 : (a21 <= 32767)) (PreH69 : ((-32768) <= a22)) (PreH70 : (a22 <= 32767)) (PreH71 : ((-32768) <= a23)) (PreH72 : (a23 <= 32767)) (PreH73 : ((-32768) <= a24)) (PreH74 : (a24 <= 32767)) (PreH75 : ((-32768) <= a25)) (PreH76 : (a25 <= 32767)) (PreH77 : ((-32768) <= a26)) (PreH78 : (a26 <= 32767)) (PreH79 : ((-32768) <= a27)) (PreH80 : (a27 <= 32767)) (PreH81 : ((-32768) <= a28)) (PreH82 : (a28 <= 32767)) (PreH83 : ((-32768) <= a29)) (PreH84 : (a29 <= 32767)) (PreH85 : ((-32768) <= a30)) (PreH86 : (a30 <= 32767)) (PreH87 : ((-32768) <= a31)) (PreH88 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a8) ” 
  &&  “ (a8 <= INT_MAX) ”
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_9_aux := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (PreH1 : (retval_8 = (qu_u16 (a7)))) (PreH2 : (0 <= retval_8)) (PreH3 : (retval_8 <= 65535)) (PreH4 : (retval_7 = (qu_u16 (a6)))) (PreH5 : (0 <= retval_7)) (PreH6 : (retval_7 <= 65535)) (PreH7 : (retval_6 = (qu_u16 (a5)))) (PreH8 : (0 <= retval_6)) (PreH9 : (retval_6 <= 65535)) (PreH10 : (retval_5 = (qu_u16 (a4)))) (PreH11 : (0 <= retval_5)) (PreH12 : (retval_5 <= 65535)) (PreH13 : (retval_4 = (qu_u16 (a3)))) (PreH14 : (0 <= retval_4)) (PreH15 : (retval_4 <= 65535)) (PreH16 : (retval_3 = (qu_u16 (a2)))) (PreH17 : (0 <= retval_3)) (PreH18 : (retval_3 <= 65535)) (PreH19 : (retval_2 = (qu_u16 (a1)))) (PreH20 : (0 <= retval_2)) (PreH21 : (retval_2 <= 65535)) (PreH22 : (retval = (qu_u16 (a0)))) (PreH23 : (0 <= retval)) (PreH24 : (retval <= 65535)) (PreH25 : ((-32768) <= a0)) (PreH26 : (a0 <= 32767)) (PreH27 : ((-32768) <= a1)) (PreH28 : (a1 <= 32767)) (PreH29 : ((-32768) <= a2)) (PreH30 : (a2 <= 32767)) (PreH31 : ((-32768) <= a3)) (PreH32 : (a3 <= 32767)) (PreH33 : ((-32768) <= a4)) (PreH34 : (a4 <= 32767)) (PreH35 : ((-32768) <= a5)) (PreH36 : (a5 <= 32767)) (PreH37 : ((-32768) <= a6)) (PreH38 : (a6 <= 32767)) (PreH39 : ((-32768) <= a7)) (PreH40 : (a7 <= 32767)) (PreH41 : ((-32768) <= a8)) (PreH42 : (a8 <= 32767)) (PreH43 : ((-32768) <= a9)) (PreH44 : (a9 <= 32767)) (PreH45 : ((-32768) <= a10)) (PreH46 : (a10 <= 32767)) (PreH47 : ((-32768) <= a11)) (PreH48 : (a11 <= 32767)) (PreH49 : ((-32768) <= a12)) (PreH50 : (a12 <= 32767)) (PreH51 : ((-32768) <= a13)) (PreH52 : (a13 <= 32767)) (PreH53 : ((-32768) <= a14)) (PreH54 : (a14 <= 32767)) (PreH55 : ((-32768) <= a15)) (PreH56 : (a15 <= 32767)) (PreH57 : ((-32768) <= a16)) (PreH58 : (a16 <= 32767)) (PreH59 : ((-32768) <= a17)) (PreH60 : (a17 <= 32767)) (PreH61 : ((-32768) <= a18)) (PreH62 : (a18 <= 32767)) (PreH63 : ((-32768) <= a19)) (PreH64 : (a19 <= 32767)) (PreH65 : ((-32768) <= a20)) (PreH66 : (a20 <= 32767)) (PreH67 : ((-32768) <= a21)) (PreH68 : (a21 <= 32767)) (PreH69 : ((-32768) <= a22)) (PreH70 : (a22 <= 32767)) (PreH71 : ((-32768) <= a23)) (PreH72 : (a23 <= 32767)) (PreH73 : ((-32768) <= a24)) (PreH74 : (a24 <= 32767)) (PreH75 : ((-32768) <= a25)) (PreH76 : (a25 <= 32767)) (PreH77 : ((-32768) <= a26)) (PreH78 : (a26 <= 32767)) (PreH79 : ((-32768) <= a27)) (PreH80 : (a27 <= 32767)) (PreH81 : ((-32768) <= a28)) (PreH82 : (a28 <= 32767)) (PreH83 : ((-32768) <= a29)) (PreH84 : (a29 <= 32767)) (PreH85 : ((-32768) <= a30)) (PreH86 : (a30 <= 32767)) (PreH87 : ((-32768) <= a31)) (PreH88 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a8) ” 
  &&  “ (a8 <= INT_MAX) ” 
  &&  “ (retval_8 = (qu_u16 (a7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= 65535) ” 
  &&  “ (retval_7 = (qu_u16 (a6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 65535) ” 
  &&  “ (retval_6 = (qu_u16 (a5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 65535) ” 
  &&  “ (retval_5 = (qu_u16 (a4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 65535) ” 
  &&  “ (retval_4 = (qu_u16 (a3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 65535) ” 
  &&  “ (retval_3 = (qu_u16 (a2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (qu_u16 (a1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (qu_u16 (a0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= a8) ” 
  &&  “ (a8 <= 32767) ” 
  &&  “ ((-32768) <= a9) ” 
  &&  “ (a9 <= 32767) ” 
  &&  “ ((-32768) <= a10) ” 
  &&  “ (a10 <= 32767) ” 
  &&  “ ((-32768) <= a11) ” 
  &&  “ (a11 <= 32767) ” 
  &&  “ ((-32768) <= a12) ” 
  &&  “ (a12 <= 32767) ” 
  &&  “ ((-32768) <= a13) ” 
  &&  “ (a13 <= 32767) ” 
  &&  “ ((-32768) <= a14) ” 
  &&  “ (a14 <= 32767) ” 
  &&  “ ((-32768) <= a15) ” 
  &&  “ (a15 <= 32767) ” 
  &&  “ ((-32768) <= a16) ” 
  &&  “ (a16 <= 32767) ” 
  &&  “ ((-32768) <= a17) ” 
  &&  “ (a17 <= 32767) ” 
  &&  “ ((-32768) <= a18) ” 
  &&  “ (a18 <= 32767) ” 
  &&  “ ((-32768) <= a19) ” 
  &&  “ (a19 <= 32767) ” 
  &&  “ ((-32768) <= a20) ” 
  &&  “ (a20 <= 32767) ” 
  &&  “ ((-32768) <= a21) ” 
  &&  “ (a21 <= 32767) ” 
  &&  “ ((-32768) <= a22) ” 
  &&  “ (a22 <= 32767) ” 
  &&  “ ((-32768) <= a23) ” 
  &&  “ (a23 <= 32767) ” 
  &&  “ ((-32768) <= a24) ” 
  &&  “ (a24 <= 32767) ” 
  &&  “ ((-32768) <= a25) ” 
  &&  “ (a25 <= 32767) ” 
  &&  “ ((-32768) <= a26) ” 
  &&  “ (a26 <= 32767) ” 
  &&  “ ((-32768) <= a27) ” 
  &&  “ (a27 <= 32767) ” 
  &&  “ ((-32768) <= a28) ” 
  &&  “ (a28 <= 32767) ” 
  &&  “ ((-32768) <= a29) ” 
  &&  “ (a29 <= 32767) ” 
  &&  “ ((-32768) <= a30) ” 
  &&  “ (a30 <= 32767) ” 
  &&  “ ((-32768) <= a31) ” 
  &&  “ (a31 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_9 := __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_9_pure -> __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_9_aux.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_10_pure := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (PreH1 : (retval_9 = (qu_u16 (a8)))) (PreH2 : (0 <= retval_9)) (PreH3 : (retval_9 <= 65535)) (PreH4 : (retval_8 = (qu_u16 (a7)))) (PreH5 : (0 <= retval_8)) (PreH6 : (retval_8 <= 65535)) (PreH7 : (retval_7 = (qu_u16 (a6)))) (PreH8 : (0 <= retval_7)) (PreH9 : (retval_7 <= 65535)) (PreH10 : (retval_6 = (qu_u16 (a5)))) (PreH11 : (0 <= retval_6)) (PreH12 : (retval_6 <= 65535)) (PreH13 : (retval_5 = (qu_u16 (a4)))) (PreH14 : (0 <= retval_5)) (PreH15 : (retval_5 <= 65535)) (PreH16 : (retval_4 = (qu_u16 (a3)))) (PreH17 : (0 <= retval_4)) (PreH18 : (retval_4 <= 65535)) (PreH19 : (retval_3 = (qu_u16 (a2)))) (PreH20 : (0 <= retval_3)) (PreH21 : (retval_3 <= 65535)) (PreH22 : (retval_2 = (qu_u16 (a1)))) (PreH23 : (0 <= retval_2)) (PreH24 : (retval_2 <= 65535)) (PreH25 : (retval = (qu_u16 (a0)))) (PreH26 : (0 <= retval)) (PreH27 : (retval <= 65535)) (PreH28 : ((-32768) <= a0)) (PreH29 : (a0 <= 32767)) (PreH30 : ((-32768) <= a1)) (PreH31 : (a1 <= 32767)) (PreH32 : ((-32768) <= a2)) (PreH33 : (a2 <= 32767)) (PreH34 : ((-32768) <= a3)) (PreH35 : (a3 <= 32767)) (PreH36 : ((-32768) <= a4)) (PreH37 : (a4 <= 32767)) (PreH38 : ((-32768) <= a5)) (PreH39 : (a5 <= 32767)) (PreH40 : ((-32768) <= a6)) (PreH41 : (a6 <= 32767)) (PreH42 : ((-32768) <= a7)) (PreH43 : (a7 <= 32767)) (PreH44 : ((-32768) <= a8)) (PreH45 : (a8 <= 32767)) (PreH46 : ((-32768) <= a9)) (PreH47 : (a9 <= 32767)) (PreH48 : ((-32768) <= a10)) (PreH49 : (a10 <= 32767)) (PreH50 : ((-32768) <= a11)) (PreH51 : (a11 <= 32767)) (PreH52 : ((-32768) <= a12)) (PreH53 : (a12 <= 32767)) (PreH54 : ((-32768) <= a13)) (PreH55 : (a13 <= 32767)) (PreH56 : ((-32768) <= a14)) (PreH57 : (a14 <= 32767)) (PreH58 : ((-32768) <= a15)) (PreH59 : (a15 <= 32767)) (PreH60 : ((-32768) <= a16)) (PreH61 : (a16 <= 32767)) (PreH62 : ((-32768) <= a17)) (PreH63 : (a17 <= 32767)) (PreH64 : ((-32768) <= a18)) (PreH65 : (a18 <= 32767)) (PreH66 : ((-32768) <= a19)) (PreH67 : (a19 <= 32767)) (PreH68 : ((-32768) <= a20)) (PreH69 : (a20 <= 32767)) (PreH70 : ((-32768) <= a21)) (PreH71 : (a21 <= 32767)) (PreH72 : ((-32768) <= a22)) (PreH73 : (a22 <= 32767)) (PreH74 : ((-32768) <= a23)) (PreH75 : (a23 <= 32767)) (PreH76 : ((-32768) <= a24)) (PreH77 : (a24 <= 32767)) (PreH78 : ((-32768) <= a25)) (PreH79 : (a25 <= 32767)) (PreH80 : ((-32768) <= a26)) (PreH81 : (a26 <= 32767)) (PreH82 : ((-32768) <= a27)) (PreH83 : (a27 <= 32767)) (PreH84 : ((-32768) <= a28)) (PreH85 : (a28 <= 32767)) (PreH86 : ((-32768) <= a29)) (PreH87 : (a29 <= 32767)) (PreH88 : ((-32768) <= a30)) (PreH89 : (a30 <= 32767)) (PreH90 : ((-32768) <= a31)) (PreH91 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a9) ” 
  &&  “ (a9 <= INT_MAX) ”
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_10_aux := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (PreH1 : (retval_9 = (qu_u16 (a8)))) (PreH2 : (0 <= retval_9)) (PreH3 : (retval_9 <= 65535)) (PreH4 : (retval_8 = (qu_u16 (a7)))) (PreH5 : (0 <= retval_8)) (PreH6 : (retval_8 <= 65535)) (PreH7 : (retval_7 = (qu_u16 (a6)))) (PreH8 : (0 <= retval_7)) (PreH9 : (retval_7 <= 65535)) (PreH10 : (retval_6 = (qu_u16 (a5)))) (PreH11 : (0 <= retval_6)) (PreH12 : (retval_6 <= 65535)) (PreH13 : (retval_5 = (qu_u16 (a4)))) (PreH14 : (0 <= retval_5)) (PreH15 : (retval_5 <= 65535)) (PreH16 : (retval_4 = (qu_u16 (a3)))) (PreH17 : (0 <= retval_4)) (PreH18 : (retval_4 <= 65535)) (PreH19 : (retval_3 = (qu_u16 (a2)))) (PreH20 : (0 <= retval_3)) (PreH21 : (retval_3 <= 65535)) (PreH22 : (retval_2 = (qu_u16 (a1)))) (PreH23 : (0 <= retval_2)) (PreH24 : (retval_2 <= 65535)) (PreH25 : (retval = (qu_u16 (a0)))) (PreH26 : (0 <= retval)) (PreH27 : (retval <= 65535)) (PreH28 : ((-32768) <= a0)) (PreH29 : (a0 <= 32767)) (PreH30 : ((-32768) <= a1)) (PreH31 : (a1 <= 32767)) (PreH32 : ((-32768) <= a2)) (PreH33 : (a2 <= 32767)) (PreH34 : ((-32768) <= a3)) (PreH35 : (a3 <= 32767)) (PreH36 : ((-32768) <= a4)) (PreH37 : (a4 <= 32767)) (PreH38 : ((-32768) <= a5)) (PreH39 : (a5 <= 32767)) (PreH40 : ((-32768) <= a6)) (PreH41 : (a6 <= 32767)) (PreH42 : ((-32768) <= a7)) (PreH43 : (a7 <= 32767)) (PreH44 : ((-32768) <= a8)) (PreH45 : (a8 <= 32767)) (PreH46 : ((-32768) <= a9)) (PreH47 : (a9 <= 32767)) (PreH48 : ((-32768) <= a10)) (PreH49 : (a10 <= 32767)) (PreH50 : ((-32768) <= a11)) (PreH51 : (a11 <= 32767)) (PreH52 : ((-32768) <= a12)) (PreH53 : (a12 <= 32767)) (PreH54 : ((-32768) <= a13)) (PreH55 : (a13 <= 32767)) (PreH56 : ((-32768) <= a14)) (PreH57 : (a14 <= 32767)) (PreH58 : ((-32768) <= a15)) (PreH59 : (a15 <= 32767)) (PreH60 : ((-32768) <= a16)) (PreH61 : (a16 <= 32767)) (PreH62 : ((-32768) <= a17)) (PreH63 : (a17 <= 32767)) (PreH64 : ((-32768) <= a18)) (PreH65 : (a18 <= 32767)) (PreH66 : ((-32768) <= a19)) (PreH67 : (a19 <= 32767)) (PreH68 : ((-32768) <= a20)) (PreH69 : (a20 <= 32767)) (PreH70 : ((-32768) <= a21)) (PreH71 : (a21 <= 32767)) (PreH72 : ((-32768) <= a22)) (PreH73 : (a22 <= 32767)) (PreH74 : ((-32768) <= a23)) (PreH75 : (a23 <= 32767)) (PreH76 : ((-32768) <= a24)) (PreH77 : (a24 <= 32767)) (PreH78 : ((-32768) <= a25)) (PreH79 : (a25 <= 32767)) (PreH80 : ((-32768) <= a26)) (PreH81 : (a26 <= 32767)) (PreH82 : ((-32768) <= a27)) (PreH83 : (a27 <= 32767)) (PreH84 : ((-32768) <= a28)) (PreH85 : (a28 <= 32767)) (PreH86 : ((-32768) <= a29)) (PreH87 : (a29 <= 32767)) (PreH88 : ((-32768) <= a30)) (PreH89 : (a30 <= 32767)) (PreH90 : ((-32768) <= a31)) (PreH91 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a9) ” 
  &&  “ (a9 <= INT_MAX) ” 
  &&  “ (retval_9 = (qu_u16 (a8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= 65535) ” 
  &&  “ (retval_8 = (qu_u16 (a7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= 65535) ” 
  &&  “ (retval_7 = (qu_u16 (a6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 65535) ” 
  &&  “ (retval_6 = (qu_u16 (a5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 65535) ” 
  &&  “ (retval_5 = (qu_u16 (a4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 65535) ” 
  &&  “ (retval_4 = (qu_u16 (a3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 65535) ” 
  &&  “ (retval_3 = (qu_u16 (a2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (qu_u16 (a1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (qu_u16 (a0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= a8) ” 
  &&  “ (a8 <= 32767) ” 
  &&  “ ((-32768) <= a9) ” 
  &&  “ (a9 <= 32767) ” 
  &&  “ ((-32768) <= a10) ” 
  &&  “ (a10 <= 32767) ” 
  &&  “ ((-32768) <= a11) ” 
  &&  “ (a11 <= 32767) ” 
  &&  “ ((-32768) <= a12) ” 
  &&  “ (a12 <= 32767) ” 
  &&  “ ((-32768) <= a13) ” 
  &&  “ (a13 <= 32767) ” 
  &&  “ ((-32768) <= a14) ” 
  &&  “ (a14 <= 32767) ” 
  &&  “ ((-32768) <= a15) ” 
  &&  “ (a15 <= 32767) ” 
  &&  “ ((-32768) <= a16) ” 
  &&  “ (a16 <= 32767) ” 
  &&  “ ((-32768) <= a17) ” 
  &&  “ (a17 <= 32767) ” 
  &&  “ ((-32768) <= a18) ” 
  &&  “ (a18 <= 32767) ” 
  &&  “ ((-32768) <= a19) ” 
  &&  “ (a19 <= 32767) ” 
  &&  “ ((-32768) <= a20) ” 
  &&  “ (a20 <= 32767) ” 
  &&  “ ((-32768) <= a21) ” 
  &&  “ (a21 <= 32767) ” 
  &&  “ ((-32768) <= a22) ” 
  &&  “ (a22 <= 32767) ” 
  &&  “ ((-32768) <= a23) ” 
  &&  “ (a23 <= 32767) ” 
  &&  “ ((-32768) <= a24) ” 
  &&  “ (a24 <= 32767) ” 
  &&  “ ((-32768) <= a25) ” 
  &&  “ (a25 <= 32767) ” 
  &&  “ ((-32768) <= a26) ” 
  &&  “ (a26 <= 32767) ” 
  &&  “ ((-32768) <= a27) ” 
  &&  “ (a27 <= 32767) ” 
  &&  “ ((-32768) <= a28) ” 
  &&  “ (a28 <= 32767) ” 
  &&  “ ((-32768) <= a29) ” 
  &&  “ (a29 <= 32767) ” 
  &&  “ ((-32768) <= a30) ” 
  &&  “ (a30 <= 32767) ” 
  &&  “ ((-32768) <= a31) ” 
  &&  “ (a31 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_10 := __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_10_pure -> __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_10_aux.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_11_pure := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (PreH1 : (retval_10 = (qu_u16 (a9)))) (PreH2 : (0 <= retval_10)) (PreH3 : (retval_10 <= 65535)) (PreH4 : (retval_9 = (qu_u16 (a8)))) (PreH5 : (0 <= retval_9)) (PreH6 : (retval_9 <= 65535)) (PreH7 : (retval_8 = (qu_u16 (a7)))) (PreH8 : (0 <= retval_8)) (PreH9 : (retval_8 <= 65535)) (PreH10 : (retval_7 = (qu_u16 (a6)))) (PreH11 : (0 <= retval_7)) (PreH12 : (retval_7 <= 65535)) (PreH13 : (retval_6 = (qu_u16 (a5)))) (PreH14 : (0 <= retval_6)) (PreH15 : (retval_6 <= 65535)) (PreH16 : (retval_5 = (qu_u16 (a4)))) (PreH17 : (0 <= retval_5)) (PreH18 : (retval_5 <= 65535)) (PreH19 : (retval_4 = (qu_u16 (a3)))) (PreH20 : (0 <= retval_4)) (PreH21 : (retval_4 <= 65535)) (PreH22 : (retval_3 = (qu_u16 (a2)))) (PreH23 : (0 <= retval_3)) (PreH24 : (retval_3 <= 65535)) (PreH25 : (retval_2 = (qu_u16 (a1)))) (PreH26 : (0 <= retval_2)) (PreH27 : (retval_2 <= 65535)) (PreH28 : (retval = (qu_u16 (a0)))) (PreH29 : (0 <= retval)) (PreH30 : (retval <= 65535)) (PreH31 : ((-32768) <= a0)) (PreH32 : (a0 <= 32767)) (PreH33 : ((-32768) <= a1)) (PreH34 : (a1 <= 32767)) (PreH35 : ((-32768) <= a2)) (PreH36 : (a2 <= 32767)) (PreH37 : ((-32768) <= a3)) (PreH38 : (a3 <= 32767)) (PreH39 : ((-32768) <= a4)) (PreH40 : (a4 <= 32767)) (PreH41 : ((-32768) <= a5)) (PreH42 : (a5 <= 32767)) (PreH43 : ((-32768) <= a6)) (PreH44 : (a6 <= 32767)) (PreH45 : ((-32768) <= a7)) (PreH46 : (a7 <= 32767)) (PreH47 : ((-32768) <= a8)) (PreH48 : (a8 <= 32767)) (PreH49 : ((-32768) <= a9)) (PreH50 : (a9 <= 32767)) (PreH51 : ((-32768) <= a10)) (PreH52 : (a10 <= 32767)) (PreH53 : ((-32768) <= a11)) (PreH54 : (a11 <= 32767)) (PreH55 : ((-32768) <= a12)) (PreH56 : (a12 <= 32767)) (PreH57 : ((-32768) <= a13)) (PreH58 : (a13 <= 32767)) (PreH59 : ((-32768) <= a14)) (PreH60 : (a14 <= 32767)) (PreH61 : ((-32768) <= a15)) (PreH62 : (a15 <= 32767)) (PreH63 : ((-32768) <= a16)) (PreH64 : (a16 <= 32767)) (PreH65 : ((-32768) <= a17)) (PreH66 : (a17 <= 32767)) (PreH67 : ((-32768) <= a18)) (PreH68 : (a18 <= 32767)) (PreH69 : ((-32768) <= a19)) (PreH70 : (a19 <= 32767)) (PreH71 : ((-32768) <= a20)) (PreH72 : (a20 <= 32767)) (PreH73 : ((-32768) <= a21)) (PreH74 : (a21 <= 32767)) (PreH75 : ((-32768) <= a22)) (PreH76 : (a22 <= 32767)) (PreH77 : ((-32768) <= a23)) (PreH78 : (a23 <= 32767)) (PreH79 : ((-32768) <= a24)) (PreH80 : (a24 <= 32767)) (PreH81 : ((-32768) <= a25)) (PreH82 : (a25 <= 32767)) (PreH83 : ((-32768) <= a26)) (PreH84 : (a26 <= 32767)) (PreH85 : ((-32768) <= a27)) (PreH86 : (a27 <= 32767)) (PreH87 : ((-32768) <= a28)) (PreH88 : (a28 <= 32767)) (PreH89 : ((-32768) <= a29)) (PreH90 : (a29 <= 32767)) (PreH91 : ((-32768) <= a30)) (PreH92 : (a30 <= 32767)) (PreH93 : ((-32768) <= a31)) (PreH94 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a10) ” 
  &&  “ (a10 <= INT_MAX) ”
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_11_aux := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (PreH1 : (retval_10 = (qu_u16 (a9)))) (PreH2 : (0 <= retval_10)) (PreH3 : (retval_10 <= 65535)) (PreH4 : (retval_9 = (qu_u16 (a8)))) (PreH5 : (0 <= retval_9)) (PreH6 : (retval_9 <= 65535)) (PreH7 : (retval_8 = (qu_u16 (a7)))) (PreH8 : (0 <= retval_8)) (PreH9 : (retval_8 <= 65535)) (PreH10 : (retval_7 = (qu_u16 (a6)))) (PreH11 : (0 <= retval_7)) (PreH12 : (retval_7 <= 65535)) (PreH13 : (retval_6 = (qu_u16 (a5)))) (PreH14 : (0 <= retval_6)) (PreH15 : (retval_6 <= 65535)) (PreH16 : (retval_5 = (qu_u16 (a4)))) (PreH17 : (0 <= retval_5)) (PreH18 : (retval_5 <= 65535)) (PreH19 : (retval_4 = (qu_u16 (a3)))) (PreH20 : (0 <= retval_4)) (PreH21 : (retval_4 <= 65535)) (PreH22 : (retval_3 = (qu_u16 (a2)))) (PreH23 : (0 <= retval_3)) (PreH24 : (retval_3 <= 65535)) (PreH25 : (retval_2 = (qu_u16 (a1)))) (PreH26 : (0 <= retval_2)) (PreH27 : (retval_2 <= 65535)) (PreH28 : (retval = (qu_u16 (a0)))) (PreH29 : (0 <= retval)) (PreH30 : (retval <= 65535)) (PreH31 : ((-32768) <= a0)) (PreH32 : (a0 <= 32767)) (PreH33 : ((-32768) <= a1)) (PreH34 : (a1 <= 32767)) (PreH35 : ((-32768) <= a2)) (PreH36 : (a2 <= 32767)) (PreH37 : ((-32768) <= a3)) (PreH38 : (a3 <= 32767)) (PreH39 : ((-32768) <= a4)) (PreH40 : (a4 <= 32767)) (PreH41 : ((-32768) <= a5)) (PreH42 : (a5 <= 32767)) (PreH43 : ((-32768) <= a6)) (PreH44 : (a6 <= 32767)) (PreH45 : ((-32768) <= a7)) (PreH46 : (a7 <= 32767)) (PreH47 : ((-32768) <= a8)) (PreH48 : (a8 <= 32767)) (PreH49 : ((-32768) <= a9)) (PreH50 : (a9 <= 32767)) (PreH51 : ((-32768) <= a10)) (PreH52 : (a10 <= 32767)) (PreH53 : ((-32768) <= a11)) (PreH54 : (a11 <= 32767)) (PreH55 : ((-32768) <= a12)) (PreH56 : (a12 <= 32767)) (PreH57 : ((-32768) <= a13)) (PreH58 : (a13 <= 32767)) (PreH59 : ((-32768) <= a14)) (PreH60 : (a14 <= 32767)) (PreH61 : ((-32768) <= a15)) (PreH62 : (a15 <= 32767)) (PreH63 : ((-32768) <= a16)) (PreH64 : (a16 <= 32767)) (PreH65 : ((-32768) <= a17)) (PreH66 : (a17 <= 32767)) (PreH67 : ((-32768) <= a18)) (PreH68 : (a18 <= 32767)) (PreH69 : ((-32768) <= a19)) (PreH70 : (a19 <= 32767)) (PreH71 : ((-32768) <= a20)) (PreH72 : (a20 <= 32767)) (PreH73 : ((-32768) <= a21)) (PreH74 : (a21 <= 32767)) (PreH75 : ((-32768) <= a22)) (PreH76 : (a22 <= 32767)) (PreH77 : ((-32768) <= a23)) (PreH78 : (a23 <= 32767)) (PreH79 : ((-32768) <= a24)) (PreH80 : (a24 <= 32767)) (PreH81 : ((-32768) <= a25)) (PreH82 : (a25 <= 32767)) (PreH83 : ((-32768) <= a26)) (PreH84 : (a26 <= 32767)) (PreH85 : ((-32768) <= a27)) (PreH86 : (a27 <= 32767)) (PreH87 : ((-32768) <= a28)) (PreH88 : (a28 <= 32767)) (PreH89 : ((-32768) <= a29)) (PreH90 : (a29 <= 32767)) (PreH91 : ((-32768) <= a30)) (PreH92 : (a30 <= 32767)) (PreH93 : ((-32768) <= a31)) (PreH94 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a10) ” 
  &&  “ (a10 <= INT_MAX) ” 
  &&  “ (retval_10 = (qu_u16 (a9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= 65535) ” 
  &&  “ (retval_9 = (qu_u16 (a8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= 65535) ” 
  &&  “ (retval_8 = (qu_u16 (a7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= 65535) ” 
  &&  “ (retval_7 = (qu_u16 (a6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 65535) ” 
  &&  “ (retval_6 = (qu_u16 (a5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 65535) ” 
  &&  “ (retval_5 = (qu_u16 (a4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 65535) ” 
  &&  “ (retval_4 = (qu_u16 (a3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 65535) ” 
  &&  “ (retval_3 = (qu_u16 (a2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (qu_u16 (a1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (qu_u16 (a0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= a8) ” 
  &&  “ (a8 <= 32767) ” 
  &&  “ ((-32768) <= a9) ” 
  &&  “ (a9 <= 32767) ” 
  &&  “ ((-32768) <= a10) ” 
  &&  “ (a10 <= 32767) ” 
  &&  “ ((-32768) <= a11) ” 
  &&  “ (a11 <= 32767) ” 
  &&  “ ((-32768) <= a12) ” 
  &&  “ (a12 <= 32767) ” 
  &&  “ ((-32768) <= a13) ” 
  &&  “ (a13 <= 32767) ” 
  &&  “ ((-32768) <= a14) ” 
  &&  “ (a14 <= 32767) ” 
  &&  “ ((-32768) <= a15) ” 
  &&  “ (a15 <= 32767) ” 
  &&  “ ((-32768) <= a16) ” 
  &&  “ (a16 <= 32767) ” 
  &&  “ ((-32768) <= a17) ” 
  &&  “ (a17 <= 32767) ” 
  &&  “ ((-32768) <= a18) ” 
  &&  “ (a18 <= 32767) ” 
  &&  “ ((-32768) <= a19) ” 
  &&  “ (a19 <= 32767) ” 
  &&  “ ((-32768) <= a20) ” 
  &&  “ (a20 <= 32767) ” 
  &&  “ ((-32768) <= a21) ” 
  &&  “ (a21 <= 32767) ” 
  &&  “ ((-32768) <= a22) ” 
  &&  “ (a22 <= 32767) ” 
  &&  “ ((-32768) <= a23) ” 
  &&  “ (a23 <= 32767) ” 
  &&  “ ((-32768) <= a24) ” 
  &&  “ (a24 <= 32767) ” 
  &&  “ ((-32768) <= a25) ” 
  &&  “ (a25 <= 32767) ” 
  &&  “ ((-32768) <= a26) ” 
  &&  “ (a26 <= 32767) ” 
  &&  “ ((-32768) <= a27) ” 
  &&  “ (a27 <= 32767) ” 
  &&  “ ((-32768) <= a28) ” 
  &&  “ (a28 <= 32767) ” 
  &&  “ ((-32768) <= a29) ” 
  &&  “ (a29 <= 32767) ” 
  &&  “ ((-32768) <= a30) ” 
  &&  “ (a30 <= 32767) ” 
  &&  “ ((-32768) <= a31) ” 
  &&  “ (a31 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_11 := __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_11_pure -> __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_11_aux.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_12_pure := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (PreH1 : (retval_11 = (qu_u16 (a10)))) (PreH2 : (0 <= retval_11)) (PreH3 : (retval_11 <= 65535)) (PreH4 : (retval_10 = (qu_u16 (a9)))) (PreH5 : (0 <= retval_10)) (PreH6 : (retval_10 <= 65535)) (PreH7 : (retval_9 = (qu_u16 (a8)))) (PreH8 : (0 <= retval_9)) (PreH9 : (retval_9 <= 65535)) (PreH10 : (retval_8 = (qu_u16 (a7)))) (PreH11 : (0 <= retval_8)) (PreH12 : (retval_8 <= 65535)) (PreH13 : (retval_7 = (qu_u16 (a6)))) (PreH14 : (0 <= retval_7)) (PreH15 : (retval_7 <= 65535)) (PreH16 : (retval_6 = (qu_u16 (a5)))) (PreH17 : (0 <= retval_6)) (PreH18 : (retval_6 <= 65535)) (PreH19 : (retval_5 = (qu_u16 (a4)))) (PreH20 : (0 <= retval_5)) (PreH21 : (retval_5 <= 65535)) (PreH22 : (retval_4 = (qu_u16 (a3)))) (PreH23 : (0 <= retval_4)) (PreH24 : (retval_4 <= 65535)) (PreH25 : (retval_3 = (qu_u16 (a2)))) (PreH26 : (0 <= retval_3)) (PreH27 : (retval_3 <= 65535)) (PreH28 : (retval_2 = (qu_u16 (a1)))) (PreH29 : (0 <= retval_2)) (PreH30 : (retval_2 <= 65535)) (PreH31 : (retval = (qu_u16 (a0)))) (PreH32 : (0 <= retval)) (PreH33 : (retval <= 65535)) (PreH34 : ((-32768) <= a0)) (PreH35 : (a0 <= 32767)) (PreH36 : ((-32768) <= a1)) (PreH37 : (a1 <= 32767)) (PreH38 : ((-32768) <= a2)) (PreH39 : (a2 <= 32767)) (PreH40 : ((-32768) <= a3)) (PreH41 : (a3 <= 32767)) (PreH42 : ((-32768) <= a4)) (PreH43 : (a4 <= 32767)) (PreH44 : ((-32768) <= a5)) (PreH45 : (a5 <= 32767)) (PreH46 : ((-32768) <= a6)) (PreH47 : (a6 <= 32767)) (PreH48 : ((-32768) <= a7)) (PreH49 : (a7 <= 32767)) (PreH50 : ((-32768) <= a8)) (PreH51 : (a8 <= 32767)) (PreH52 : ((-32768) <= a9)) (PreH53 : (a9 <= 32767)) (PreH54 : ((-32768) <= a10)) (PreH55 : (a10 <= 32767)) (PreH56 : ((-32768) <= a11)) (PreH57 : (a11 <= 32767)) (PreH58 : ((-32768) <= a12)) (PreH59 : (a12 <= 32767)) (PreH60 : ((-32768) <= a13)) (PreH61 : (a13 <= 32767)) (PreH62 : ((-32768) <= a14)) (PreH63 : (a14 <= 32767)) (PreH64 : ((-32768) <= a15)) (PreH65 : (a15 <= 32767)) (PreH66 : ((-32768) <= a16)) (PreH67 : (a16 <= 32767)) (PreH68 : ((-32768) <= a17)) (PreH69 : (a17 <= 32767)) (PreH70 : ((-32768) <= a18)) (PreH71 : (a18 <= 32767)) (PreH72 : ((-32768) <= a19)) (PreH73 : (a19 <= 32767)) (PreH74 : ((-32768) <= a20)) (PreH75 : (a20 <= 32767)) (PreH76 : ((-32768) <= a21)) (PreH77 : (a21 <= 32767)) (PreH78 : ((-32768) <= a22)) (PreH79 : (a22 <= 32767)) (PreH80 : ((-32768) <= a23)) (PreH81 : (a23 <= 32767)) (PreH82 : ((-32768) <= a24)) (PreH83 : (a24 <= 32767)) (PreH84 : ((-32768) <= a25)) (PreH85 : (a25 <= 32767)) (PreH86 : ((-32768) <= a26)) (PreH87 : (a26 <= 32767)) (PreH88 : ((-32768) <= a27)) (PreH89 : (a27 <= 32767)) (PreH90 : ((-32768) <= a28)) (PreH91 : (a28 <= 32767)) (PreH92 : ((-32768) <= a29)) (PreH93 : (a29 <= 32767)) (PreH94 : ((-32768) <= a30)) (PreH95 : (a30 <= 32767)) (PreH96 : ((-32768) <= a31)) (PreH97 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a11) ” 
  &&  “ (a11 <= INT_MAX) ”
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_12_aux := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (PreH1 : (retval_11 = (qu_u16 (a10)))) (PreH2 : (0 <= retval_11)) (PreH3 : (retval_11 <= 65535)) (PreH4 : (retval_10 = (qu_u16 (a9)))) (PreH5 : (0 <= retval_10)) (PreH6 : (retval_10 <= 65535)) (PreH7 : (retval_9 = (qu_u16 (a8)))) (PreH8 : (0 <= retval_9)) (PreH9 : (retval_9 <= 65535)) (PreH10 : (retval_8 = (qu_u16 (a7)))) (PreH11 : (0 <= retval_8)) (PreH12 : (retval_8 <= 65535)) (PreH13 : (retval_7 = (qu_u16 (a6)))) (PreH14 : (0 <= retval_7)) (PreH15 : (retval_7 <= 65535)) (PreH16 : (retval_6 = (qu_u16 (a5)))) (PreH17 : (0 <= retval_6)) (PreH18 : (retval_6 <= 65535)) (PreH19 : (retval_5 = (qu_u16 (a4)))) (PreH20 : (0 <= retval_5)) (PreH21 : (retval_5 <= 65535)) (PreH22 : (retval_4 = (qu_u16 (a3)))) (PreH23 : (0 <= retval_4)) (PreH24 : (retval_4 <= 65535)) (PreH25 : (retval_3 = (qu_u16 (a2)))) (PreH26 : (0 <= retval_3)) (PreH27 : (retval_3 <= 65535)) (PreH28 : (retval_2 = (qu_u16 (a1)))) (PreH29 : (0 <= retval_2)) (PreH30 : (retval_2 <= 65535)) (PreH31 : (retval = (qu_u16 (a0)))) (PreH32 : (0 <= retval)) (PreH33 : (retval <= 65535)) (PreH34 : ((-32768) <= a0)) (PreH35 : (a0 <= 32767)) (PreH36 : ((-32768) <= a1)) (PreH37 : (a1 <= 32767)) (PreH38 : ((-32768) <= a2)) (PreH39 : (a2 <= 32767)) (PreH40 : ((-32768) <= a3)) (PreH41 : (a3 <= 32767)) (PreH42 : ((-32768) <= a4)) (PreH43 : (a4 <= 32767)) (PreH44 : ((-32768) <= a5)) (PreH45 : (a5 <= 32767)) (PreH46 : ((-32768) <= a6)) (PreH47 : (a6 <= 32767)) (PreH48 : ((-32768) <= a7)) (PreH49 : (a7 <= 32767)) (PreH50 : ((-32768) <= a8)) (PreH51 : (a8 <= 32767)) (PreH52 : ((-32768) <= a9)) (PreH53 : (a9 <= 32767)) (PreH54 : ((-32768) <= a10)) (PreH55 : (a10 <= 32767)) (PreH56 : ((-32768) <= a11)) (PreH57 : (a11 <= 32767)) (PreH58 : ((-32768) <= a12)) (PreH59 : (a12 <= 32767)) (PreH60 : ((-32768) <= a13)) (PreH61 : (a13 <= 32767)) (PreH62 : ((-32768) <= a14)) (PreH63 : (a14 <= 32767)) (PreH64 : ((-32768) <= a15)) (PreH65 : (a15 <= 32767)) (PreH66 : ((-32768) <= a16)) (PreH67 : (a16 <= 32767)) (PreH68 : ((-32768) <= a17)) (PreH69 : (a17 <= 32767)) (PreH70 : ((-32768) <= a18)) (PreH71 : (a18 <= 32767)) (PreH72 : ((-32768) <= a19)) (PreH73 : (a19 <= 32767)) (PreH74 : ((-32768) <= a20)) (PreH75 : (a20 <= 32767)) (PreH76 : ((-32768) <= a21)) (PreH77 : (a21 <= 32767)) (PreH78 : ((-32768) <= a22)) (PreH79 : (a22 <= 32767)) (PreH80 : ((-32768) <= a23)) (PreH81 : (a23 <= 32767)) (PreH82 : ((-32768) <= a24)) (PreH83 : (a24 <= 32767)) (PreH84 : ((-32768) <= a25)) (PreH85 : (a25 <= 32767)) (PreH86 : ((-32768) <= a26)) (PreH87 : (a26 <= 32767)) (PreH88 : ((-32768) <= a27)) (PreH89 : (a27 <= 32767)) (PreH90 : ((-32768) <= a28)) (PreH91 : (a28 <= 32767)) (PreH92 : ((-32768) <= a29)) (PreH93 : (a29 <= 32767)) (PreH94 : ((-32768) <= a30)) (PreH95 : (a30 <= 32767)) (PreH96 : ((-32768) <= a31)) (PreH97 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a11) ” 
  &&  “ (a11 <= INT_MAX) ” 
  &&  “ (retval_11 = (qu_u16 (a10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= 65535) ” 
  &&  “ (retval_10 = (qu_u16 (a9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= 65535) ” 
  &&  “ (retval_9 = (qu_u16 (a8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= 65535) ” 
  &&  “ (retval_8 = (qu_u16 (a7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= 65535) ” 
  &&  “ (retval_7 = (qu_u16 (a6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 65535) ” 
  &&  “ (retval_6 = (qu_u16 (a5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 65535) ” 
  &&  “ (retval_5 = (qu_u16 (a4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 65535) ” 
  &&  “ (retval_4 = (qu_u16 (a3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 65535) ” 
  &&  “ (retval_3 = (qu_u16 (a2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (qu_u16 (a1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (qu_u16 (a0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= a8) ” 
  &&  “ (a8 <= 32767) ” 
  &&  “ ((-32768) <= a9) ” 
  &&  “ (a9 <= 32767) ” 
  &&  “ ((-32768) <= a10) ” 
  &&  “ (a10 <= 32767) ” 
  &&  “ ((-32768) <= a11) ” 
  &&  “ (a11 <= 32767) ” 
  &&  “ ((-32768) <= a12) ” 
  &&  “ (a12 <= 32767) ” 
  &&  “ ((-32768) <= a13) ” 
  &&  “ (a13 <= 32767) ” 
  &&  “ ((-32768) <= a14) ” 
  &&  “ (a14 <= 32767) ” 
  &&  “ ((-32768) <= a15) ” 
  &&  “ (a15 <= 32767) ” 
  &&  “ ((-32768) <= a16) ” 
  &&  “ (a16 <= 32767) ” 
  &&  “ ((-32768) <= a17) ” 
  &&  “ (a17 <= 32767) ” 
  &&  “ ((-32768) <= a18) ” 
  &&  “ (a18 <= 32767) ” 
  &&  “ ((-32768) <= a19) ” 
  &&  “ (a19 <= 32767) ” 
  &&  “ ((-32768) <= a20) ” 
  &&  “ (a20 <= 32767) ” 
  &&  “ ((-32768) <= a21) ” 
  &&  “ (a21 <= 32767) ” 
  &&  “ ((-32768) <= a22) ” 
  &&  “ (a22 <= 32767) ” 
  &&  “ ((-32768) <= a23) ” 
  &&  “ (a23 <= 32767) ” 
  &&  “ ((-32768) <= a24) ” 
  &&  “ (a24 <= 32767) ” 
  &&  “ ((-32768) <= a25) ” 
  &&  “ (a25 <= 32767) ” 
  &&  “ ((-32768) <= a26) ” 
  &&  “ (a26 <= 32767) ” 
  &&  “ ((-32768) <= a27) ” 
  &&  “ (a27 <= 32767) ” 
  &&  “ ((-32768) <= a28) ” 
  &&  “ (a28 <= 32767) ” 
  &&  “ ((-32768) <= a29) ” 
  &&  “ (a29 <= 32767) ” 
  &&  “ ((-32768) <= a30) ” 
  &&  “ (a30 <= 32767) ” 
  &&  “ ((-32768) <= a31) ” 
  &&  “ (a31 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_12 := __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_12_pure -> __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_12_aux.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_13_pure := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (PreH1 : (retval_12 = (qu_u16 (a11)))) (PreH2 : (0 <= retval_12)) (PreH3 : (retval_12 <= 65535)) (PreH4 : (retval_11 = (qu_u16 (a10)))) (PreH5 : (0 <= retval_11)) (PreH6 : (retval_11 <= 65535)) (PreH7 : (retval_10 = (qu_u16 (a9)))) (PreH8 : (0 <= retval_10)) (PreH9 : (retval_10 <= 65535)) (PreH10 : (retval_9 = (qu_u16 (a8)))) (PreH11 : (0 <= retval_9)) (PreH12 : (retval_9 <= 65535)) (PreH13 : (retval_8 = (qu_u16 (a7)))) (PreH14 : (0 <= retval_8)) (PreH15 : (retval_8 <= 65535)) (PreH16 : (retval_7 = (qu_u16 (a6)))) (PreH17 : (0 <= retval_7)) (PreH18 : (retval_7 <= 65535)) (PreH19 : (retval_6 = (qu_u16 (a5)))) (PreH20 : (0 <= retval_6)) (PreH21 : (retval_6 <= 65535)) (PreH22 : (retval_5 = (qu_u16 (a4)))) (PreH23 : (0 <= retval_5)) (PreH24 : (retval_5 <= 65535)) (PreH25 : (retval_4 = (qu_u16 (a3)))) (PreH26 : (0 <= retval_4)) (PreH27 : (retval_4 <= 65535)) (PreH28 : (retval_3 = (qu_u16 (a2)))) (PreH29 : (0 <= retval_3)) (PreH30 : (retval_3 <= 65535)) (PreH31 : (retval_2 = (qu_u16 (a1)))) (PreH32 : (0 <= retval_2)) (PreH33 : (retval_2 <= 65535)) (PreH34 : (retval = (qu_u16 (a0)))) (PreH35 : (0 <= retval)) (PreH36 : (retval <= 65535)) (PreH37 : ((-32768) <= a0)) (PreH38 : (a0 <= 32767)) (PreH39 : ((-32768) <= a1)) (PreH40 : (a1 <= 32767)) (PreH41 : ((-32768) <= a2)) (PreH42 : (a2 <= 32767)) (PreH43 : ((-32768) <= a3)) (PreH44 : (a3 <= 32767)) (PreH45 : ((-32768) <= a4)) (PreH46 : (a4 <= 32767)) (PreH47 : ((-32768) <= a5)) (PreH48 : (a5 <= 32767)) (PreH49 : ((-32768) <= a6)) (PreH50 : (a6 <= 32767)) (PreH51 : ((-32768) <= a7)) (PreH52 : (a7 <= 32767)) (PreH53 : ((-32768) <= a8)) (PreH54 : (a8 <= 32767)) (PreH55 : ((-32768) <= a9)) (PreH56 : (a9 <= 32767)) (PreH57 : ((-32768) <= a10)) (PreH58 : (a10 <= 32767)) (PreH59 : ((-32768) <= a11)) (PreH60 : (a11 <= 32767)) (PreH61 : ((-32768) <= a12)) (PreH62 : (a12 <= 32767)) (PreH63 : ((-32768) <= a13)) (PreH64 : (a13 <= 32767)) (PreH65 : ((-32768) <= a14)) (PreH66 : (a14 <= 32767)) (PreH67 : ((-32768) <= a15)) (PreH68 : (a15 <= 32767)) (PreH69 : ((-32768) <= a16)) (PreH70 : (a16 <= 32767)) (PreH71 : ((-32768) <= a17)) (PreH72 : (a17 <= 32767)) (PreH73 : ((-32768) <= a18)) (PreH74 : (a18 <= 32767)) (PreH75 : ((-32768) <= a19)) (PreH76 : (a19 <= 32767)) (PreH77 : ((-32768) <= a20)) (PreH78 : (a20 <= 32767)) (PreH79 : ((-32768) <= a21)) (PreH80 : (a21 <= 32767)) (PreH81 : ((-32768) <= a22)) (PreH82 : (a22 <= 32767)) (PreH83 : ((-32768) <= a23)) (PreH84 : (a23 <= 32767)) (PreH85 : ((-32768) <= a24)) (PreH86 : (a24 <= 32767)) (PreH87 : ((-32768) <= a25)) (PreH88 : (a25 <= 32767)) (PreH89 : ((-32768) <= a26)) (PreH90 : (a26 <= 32767)) (PreH91 : ((-32768) <= a27)) (PreH92 : (a27 <= 32767)) (PreH93 : ((-32768) <= a28)) (PreH94 : (a28 <= 32767)) (PreH95 : ((-32768) <= a29)) (PreH96 : (a29 <= 32767)) (PreH97 : ((-32768) <= a30)) (PreH98 : (a30 <= 32767)) (PreH99 : ((-32768) <= a31)) (PreH100 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a12) ” 
  &&  “ (a12 <= INT_MAX) ”
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_13_aux := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (PreH1 : (retval_12 = (qu_u16 (a11)))) (PreH2 : (0 <= retval_12)) (PreH3 : (retval_12 <= 65535)) (PreH4 : (retval_11 = (qu_u16 (a10)))) (PreH5 : (0 <= retval_11)) (PreH6 : (retval_11 <= 65535)) (PreH7 : (retval_10 = (qu_u16 (a9)))) (PreH8 : (0 <= retval_10)) (PreH9 : (retval_10 <= 65535)) (PreH10 : (retval_9 = (qu_u16 (a8)))) (PreH11 : (0 <= retval_9)) (PreH12 : (retval_9 <= 65535)) (PreH13 : (retval_8 = (qu_u16 (a7)))) (PreH14 : (0 <= retval_8)) (PreH15 : (retval_8 <= 65535)) (PreH16 : (retval_7 = (qu_u16 (a6)))) (PreH17 : (0 <= retval_7)) (PreH18 : (retval_7 <= 65535)) (PreH19 : (retval_6 = (qu_u16 (a5)))) (PreH20 : (0 <= retval_6)) (PreH21 : (retval_6 <= 65535)) (PreH22 : (retval_5 = (qu_u16 (a4)))) (PreH23 : (0 <= retval_5)) (PreH24 : (retval_5 <= 65535)) (PreH25 : (retval_4 = (qu_u16 (a3)))) (PreH26 : (0 <= retval_4)) (PreH27 : (retval_4 <= 65535)) (PreH28 : (retval_3 = (qu_u16 (a2)))) (PreH29 : (0 <= retval_3)) (PreH30 : (retval_3 <= 65535)) (PreH31 : (retval_2 = (qu_u16 (a1)))) (PreH32 : (0 <= retval_2)) (PreH33 : (retval_2 <= 65535)) (PreH34 : (retval = (qu_u16 (a0)))) (PreH35 : (0 <= retval)) (PreH36 : (retval <= 65535)) (PreH37 : ((-32768) <= a0)) (PreH38 : (a0 <= 32767)) (PreH39 : ((-32768) <= a1)) (PreH40 : (a1 <= 32767)) (PreH41 : ((-32768) <= a2)) (PreH42 : (a2 <= 32767)) (PreH43 : ((-32768) <= a3)) (PreH44 : (a3 <= 32767)) (PreH45 : ((-32768) <= a4)) (PreH46 : (a4 <= 32767)) (PreH47 : ((-32768) <= a5)) (PreH48 : (a5 <= 32767)) (PreH49 : ((-32768) <= a6)) (PreH50 : (a6 <= 32767)) (PreH51 : ((-32768) <= a7)) (PreH52 : (a7 <= 32767)) (PreH53 : ((-32768) <= a8)) (PreH54 : (a8 <= 32767)) (PreH55 : ((-32768) <= a9)) (PreH56 : (a9 <= 32767)) (PreH57 : ((-32768) <= a10)) (PreH58 : (a10 <= 32767)) (PreH59 : ((-32768) <= a11)) (PreH60 : (a11 <= 32767)) (PreH61 : ((-32768) <= a12)) (PreH62 : (a12 <= 32767)) (PreH63 : ((-32768) <= a13)) (PreH64 : (a13 <= 32767)) (PreH65 : ((-32768) <= a14)) (PreH66 : (a14 <= 32767)) (PreH67 : ((-32768) <= a15)) (PreH68 : (a15 <= 32767)) (PreH69 : ((-32768) <= a16)) (PreH70 : (a16 <= 32767)) (PreH71 : ((-32768) <= a17)) (PreH72 : (a17 <= 32767)) (PreH73 : ((-32768) <= a18)) (PreH74 : (a18 <= 32767)) (PreH75 : ((-32768) <= a19)) (PreH76 : (a19 <= 32767)) (PreH77 : ((-32768) <= a20)) (PreH78 : (a20 <= 32767)) (PreH79 : ((-32768) <= a21)) (PreH80 : (a21 <= 32767)) (PreH81 : ((-32768) <= a22)) (PreH82 : (a22 <= 32767)) (PreH83 : ((-32768) <= a23)) (PreH84 : (a23 <= 32767)) (PreH85 : ((-32768) <= a24)) (PreH86 : (a24 <= 32767)) (PreH87 : ((-32768) <= a25)) (PreH88 : (a25 <= 32767)) (PreH89 : ((-32768) <= a26)) (PreH90 : (a26 <= 32767)) (PreH91 : ((-32768) <= a27)) (PreH92 : (a27 <= 32767)) (PreH93 : ((-32768) <= a28)) (PreH94 : (a28 <= 32767)) (PreH95 : ((-32768) <= a29)) (PreH96 : (a29 <= 32767)) (PreH97 : ((-32768) <= a30)) (PreH98 : (a30 <= 32767)) (PreH99 : ((-32768) <= a31)) (PreH100 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a12) ” 
  &&  “ (a12 <= INT_MAX) ” 
  &&  “ (retval_12 = (qu_u16 (a11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= 65535) ” 
  &&  “ (retval_11 = (qu_u16 (a10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= 65535) ” 
  &&  “ (retval_10 = (qu_u16 (a9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= 65535) ” 
  &&  “ (retval_9 = (qu_u16 (a8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= 65535) ” 
  &&  “ (retval_8 = (qu_u16 (a7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= 65535) ” 
  &&  “ (retval_7 = (qu_u16 (a6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 65535) ” 
  &&  “ (retval_6 = (qu_u16 (a5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 65535) ” 
  &&  “ (retval_5 = (qu_u16 (a4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 65535) ” 
  &&  “ (retval_4 = (qu_u16 (a3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 65535) ” 
  &&  “ (retval_3 = (qu_u16 (a2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (qu_u16 (a1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (qu_u16 (a0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= a8) ” 
  &&  “ (a8 <= 32767) ” 
  &&  “ ((-32768) <= a9) ” 
  &&  “ (a9 <= 32767) ” 
  &&  “ ((-32768) <= a10) ” 
  &&  “ (a10 <= 32767) ” 
  &&  “ ((-32768) <= a11) ” 
  &&  “ (a11 <= 32767) ” 
  &&  “ ((-32768) <= a12) ” 
  &&  “ (a12 <= 32767) ” 
  &&  “ ((-32768) <= a13) ” 
  &&  “ (a13 <= 32767) ” 
  &&  “ ((-32768) <= a14) ” 
  &&  “ (a14 <= 32767) ” 
  &&  “ ((-32768) <= a15) ” 
  &&  “ (a15 <= 32767) ” 
  &&  “ ((-32768) <= a16) ” 
  &&  “ (a16 <= 32767) ” 
  &&  “ ((-32768) <= a17) ” 
  &&  “ (a17 <= 32767) ” 
  &&  “ ((-32768) <= a18) ” 
  &&  “ (a18 <= 32767) ” 
  &&  “ ((-32768) <= a19) ” 
  &&  “ (a19 <= 32767) ” 
  &&  “ ((-32768) <= a20) ” 
  &&  “ (a20 <= 32767) ” 
  &&  “ ((-32768) <= a21) ” 
  &&  “ (a21 <= 32767) ” 
  &&  “ ((-32768) <= a22) ” 
  &&  “ (a22 <= 32767) ” 
  &&  “ ((-32768) <= a23) ” 
  &&  “ (a23 <= 32767) ” 
  &&  “ ((-32768) <= a24) ” 
  &&  “ (a24 <= 32767) ” 
  &&  “ ((-32768) <= a25) ” 
  &&  “ (a25 <= 32767) ” 
  &&  “ ((-32768) <= a26) ” 
  &&  “ (a26 <= 32767) ” 
  &&  “ ((-32768) <= a27) ” 
  &&  “ (a27 <= 32767) ” 
  &&  “ ((-32768) <= a28) ” 
  &&  “ (a28 <= 32767) ” 
  &&  “ ((-32768) <= a29) ” 
  &&  “ (a29 <= 32767) ” 
  &&  “ ((-32768) <= a30) ” 
  &&  “ (a30 <= 32767) ” 
  &&  “ ((-32768) <= a31) ” 
  &&  “ (a31 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_13 := __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_13_pure -> __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_13_aux.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_14_pure := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (PreH1 : (retval_13 = (qu_u16 (a12)))) (PreH2 : (0 <= retval_13)) (PreH3 : (retval_13 <= 65535)) (PreH4 : (retval_12 = (qu_u16 (a11)))) (PreH5 : (0 <= retval_12)) (PreH6 : (retval_12 <= 65535)) (PreH7 : (retval_11 = (qu_u16 (a10)))) (PreH8 : (0 <= retval_11)) (PreH9 : (retval_11 <= 65535)) (PreH10 : (retval_10 = (qu_u16 (a9)))) (PreH11 : (0 <= retval_10)) (PreH12 : (retval_10 <= 65535)) (PreH13 : (retval_9 = (qu_u16 (a8)))) (PreH14 : (0 <= retval_9)) (PreH15 : (retval_9 <= 65535)) (PreH16 : (retval_8 = (qu_u16 (a7)))) (PreH17 : (0 <= retval_8)) (PreH18 : (retval_8 <= 65535)) (PreH19 : (retval_7 = (qu_u16 (a6)))) (PreH20 : (0 <= retval_7)) (PreH21 : (retval_7 <= 65535)) (PreH22 : (retval_6 = (qu_u16 (a5)))) (PreH23 : (0 <= retval_6)) (PreH24 : (retval_6 <= 65535)) (PreH25 : (retval_5 = (qu_u16 (a4)))) (PreH26 : (0 <= retval_5)) (PreH27 : (retval_5 <= 65535)) (PreH28 : (retval_4 = (qu_u16 (a3)))) (PreH29 : (0 <= retval_4)) (PreH30 : (retval_4 <= 65535)) (PreH31 : (retval_3 = (qu_u16 (a2)))) (PreH32 : (0 <= retval_3)) (PreH33 : (retval_3 <= 65535)) (PreH34 : (retval_2 = (qu_u16 (a1)))) (PreH35 : (0 <= retval_2)) (PreH36 : (retval_2 <= 65535)) (PreH37 : (retval = (qu_u16 (a0)))) (PreH38 : (0 <= retval)) (PreH39 : (retval <= 65535)) (PreH40 : ((-32768) <= a0)) (PreH41 : (a0 <= 32767)) (PreH42 : ((-32768) <= a1)) (PreH43 : (a1 <= 32767)) (PreH44 : ((-32768) <= a2)) (PreH45 : (a2 <= 32767)) (PreH46 : ((-32768) <= a3)) (PreH47 : (a3 <= 32767)) (PreH48 : ((-32768) <= a4)) (PreH49 : (a4 <= 32767)) (PreH50 : ((-32768) <= a5)) (PreH51 : (a5 <= 32767)) (PreH52 : ((-32768) <= a6)) (PreH53 : (a6 <= 32767)) (PreH54 : ((-32768) <= a7)) (PreH55 : (a7 <= 32767)) (PreH56 : ((-32768) <= a8)) (PreH57 : (a8 <= 32767)) (PreH58 : ((-32768) <= a9)) (PreH59 : (a9 <= 32767)) (PreH60 : ((-32768) <= a10)) (PreH61 : (a10 <= 32767)) (PreH62 : ((-32768) <= a11)) (PreH63 : (a11 <= 32767)) (PreH64 : ((-32768) <= a12)) (PreH65 : (a12 <= 32767)) (PreH66 : ((-32768) <= a13)) (PreH67 : (a13 <= 32767)) (PreH68 : ((-32768) <= a14)) (PreH69 : (a14 <= 32767)) (PreH70 : ((-32768) <= a15)) (PreH71 : (a15 <= 32767)) (PreH72 : ((-32768) <= a16)) (PreH73 : (a16 <= 32767)) (PreH74 : ((-32768) <= a17)) (PreH75 : (a17 <= 32767)) (PreH76 : ((-32768) <= a18)) (PreH77 : (a18 <= 32767)) (PreH78 : ((-32768) <= a19)) (PreH79 : (a19 <= 32767)) (PreH80 : ((-32768) <= a20)) (PreH81 : (a20 <= 32767)) (PreH82 : ((-32768) <= a21)) (PreH83 : (a21 <= 32767)) (PreH84 : ((-32768) <= a22)) (PreH85 : (a22 <= 32767)) (PreH86 : ((-32768) <= a23)) (PreH87 : (a23 <= 32767)) (PreH88 : ((-32768) <= a24)) (PreH89 : (a24 <= 32767)) (PreH90 : ((-32768) <= a25)) (PreH91 : (a25 <= 32767)) (PreH92 : ((-32768) <= a26)) (PreH93 : (a26 <= 32767)) (PreH94 : ((-32768) <= a27)) (PreH95 : (a27 <= 32767)) (PreH96 : ((-32768) <= a28)) (PreH97 : (a28 <= 32767)) (PreH98 : ((-32768) <= a29)) (PreH99 : (a29 <= 32767)) (PreH100 : ((-32768) <= a30)) (PreH101 : (a30 <= 32767)) (PreH102 : ((-32768) <= a31)) (PreH103 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a13) ” 
  &&  “ (a13 <= INT_MAX) ”
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_14_aux := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (PreH1 : (retval_13 = (qu_u16 (a12)))) (PreH2 : (0 <= retval_13)) (PreH3 : (retval_13 <= 65535)) (PreH4 : (retval_12 = (qu_u16 (a11)))) (PreH5 : (0 <= retval_12)) (PreH6 : (retval_12 <= 65535)) (PreH7 : (retval_11 = (qu_u16 (a10)))) (PreH8 : (0 <= retval_11)) (PreH9 : (retval_11 <= 65535)) (PreH10 : (retval_10 = (qu_u16 (a9)))) (PreH11 : (0 <= retval_10)) (PreH12 : (retval_10 <= 65535)) (PreH13 : (retval_9 = (qu_u16 (a8)))) (PreH14 : (0 <= retval_9)) (PreH15 : (retval_9 <= 65535)) (PreH16 : (retval_8 = (qu_u16 (a7)))) (PreH17 : (0 <= retval_8)) (PreH18 : (retval_8 <= 65535)) (PreH19 : (retval_7 = (qu_u16 (a6)))) (PreH20 : (0 <= retval_7)) (PreH21 : (retval_7 <= 65535)) (PreH22 : (retval_6 = (qu_u16 (a5)))) (PreH23 : (0 <= retval_6)) (PreH24 : (retval_6 <= 65535)) (PreH25 : (retval_5 = (qu_u16 (a4)))) (PreH26 : (0 <= retval_5)) (PreH27 : (retval_5 <= 65535)) (PreH28 : (retval_4 = (qu_u16 (a3)))) (PreH29 : (0 <= retval_4)) (PreH30 : (retval_4 <= 65535)) (PreH31 : (retval_3 = (qu_u16 (a2)))) (PreH32 : (0 <= retval_3)) (PreH33 : (retval_3 <= 65535)) (PreH34 : (retval_2 = (qu_u16 (a1)))) (PreH35 : (0 <= retval_2)) (PreH36 : (retval_2 <= 65535)) (PreH37 : (retval = (qu_u16 (a0)))) (PreH38 : (0 <= retval)) (PreH39 : (retval <= 65535)) (PreH40 : ((-32768) <= a0)) (PreH41 : (a0 <= 32767)) (PreH42 : ((-32768) <= a1)) (PreH43 : (a1 <= 32767)) (PreH44 : ((-32768) <= a2)) (PreH45 : (a2 <= 32767)) (PreH46 : ((-32768) <= a3)) (PreH47 : (a3 <= 32767)) (PreH48 : ((-32768) <= a4)) (PreH49 : (a4 <= 32767)) (PreH50 : ((-32768) <= a5)) (PreH51 : (a5 <= 32767)) (PreH52 : ((-32768) <= a6)) (PreH53 : (a6 <= 32767)) (PreH54 : ((-32768) <= a7)) (PreH55 : (a7 <= 32767)) (PreH56 : ((-32768) <= a8)) (PreH57 : (a8 <= 32767)) (PreH58 : ((-32768) <= a9)) (PreH59 : (a9 <= 32767)) (PreH60 : ((-32768) <= a10)) (PreH61 : (a10 <= 32767)) (PreH62 : ((-32768) <= a11)) (PreH63 : (a11 <= 32767)) (PreH64 : ((-32768) <= a12)) (PreH65 : (a12 <= 32767)) (PreH66 : ((-32768) <= a13)) (PreH67 : (a13 <= 32767)) (PreH68 : ((-32768) <= a14)) (PreH69 : (a14 <= 32767)) (PreH70 : ((-32768) <= a15)) (PreH71 : (a15 <= 32767)) (PreH72 : ((-32768) <= a16)) (PreH73 : (a16 <= 32767)) (PreH74 : ((-32768) <= a17)) (PreH75 : (a17 <= 32767)) (PreH76 : ((-32768) <= a18)) (PreH77 : (a18 <= 32767)) (PreH78 : ((-32768) <= a19)) (PreH79 : (a19 <= 32767)) (PreH80 : ((-32768) <= a20)) (PreH81 : (a20 <= 32767)) (PreH82 : ((-32768) <= a21)) (PreH83 : (a21 <= 32767)) (PreH84 : ((-32768) <= a22)) (PreH85 : (a22 <= 32767)) (PreH86 : ((-32768) <= a23)) (PreH87 : (a23 <= 32767)) (PreH88 : ((-32768) <= a24)) (PreH89 : (a24 <= 32767)) (PreH90 : ((-32768) <= a25)) (PreH91 : (a25 <= 32767)) (PreH92 : ((-32768) <= a26)) (PreH93 : (a26 <= 32767)) (PreH94 : ((-32768) <= a27)) (PreH95 : (a27 <= 32767)) (PreH96 : ((-32768) <= a28)) (PreH97 : (a28 <= 32767)) (PreH98 : ((-32768) <= a29)) (PreH99 : (a29 <= 32767)) (PreH100 : ((-32768) <= a30)) (PreH101 : (a30 <= 32767)) (PreH102 : ((-32768) <= a31)) (PreH103 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a13) ” 
  &&  “ (a13 <= INT_MAX) ” 
  &&  “ (retval_13 = (qu_u16 (a12))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= 65535) ” 
  &&  “ (retval_12 = (qu_u16 (a11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= 65535) ” 
  &&  “ (retval_11 = (qu_u16 (a10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= 65535) ” 
  &&  “ (retval_10 = (qu_u16 (a9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= 65535) ” 
  &&  “ (retval_9 = (qu_u16 (a8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= 65535) ” 
  &&  “ (retval_8 = (qu_u16 (a7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= 65535) ” 
  &&  “ (retval_7 = (qu_u16 (a6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 65535) ” 
  &&  “ (retval_6 = (qu_u16 (a5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 65535) ” 
  &&  “ (retval_5 = (qu_u16 (a4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 65535) ” 
  &&  “ (retval_4 = (qu_u16 (a3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 65535) ” 
  &&  “ (retval_3 = (qu_u16 (a2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (qu_u16 (a1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (qu_u16 (a0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= a8) ” 
  &&  “ (a8 <= 32767) ” 
  &&  “ ((-32768) <= a9) ” 
  &&  “ (a9 <= 32767) ” 
  &&  “ ((-32768) <= a10) ” 
  &&  “ (a10 <= 32767) ” 
  &&  “ ((-32768) <= a11) ” 
  &&  “ (a11 <= 32767) ” 
  &&  “ ((-32768) <= a12) ” 
  &&  “ (a12 <= 32767) ” 
  &&  “ ((-32768) <= a13) ” 
  &&  “ (a13 <= 32767) ” 
  &&  “ ((-32768) <= a14) ” 
  &&  “ (a14 <= 32767) ” 
  &&  “ ((-32768) <= a15) ” 
  &&  “ (a15 <= 32767) ” 
  &&  “ ((-32768) <= a16) ” 
  &&  “ (a16 <= 32767) ” 
  &&  “ ((-32768) <= a17) ” 
  &&  “ (a17 <= 32767) ” 
  &&  “ ((-32768) <= a18) ” 
  &&  “ (a18 <= 32767) ” 
  &&  “ ((-32768) <= a19) ” 
  &&  “ (a19 <= 32767) ” 
  &&  “ ((-32768) <= a20) ” 
  &&  “ (a20 <= 32767) ” 
  &&  “ ((-32768) <= a21) ” 
  &&  “ (a21 <= 32767) ” 
  &&  “ ((-32768) <= a22) ” 
  &&  “ (a22 <= 32767) ” 
  &&  “ ((-32768) <= a23) ” 
  &&  “ (a23 <= 32767) ” 
  &&  “ ((-32768) <= a24) ” 
  &&  “ (a24 <= 32767) ” 
  &&  “ ((-32768) <= a25) ” 
  &&  “ (a25 <= 32767) ” 
  &&  “ ((-32768) <= a26) ” 
  &&  “ (a26 <= 32767) ” 
  &&  “ ((-32768) <= a27) ” 
  &&  “ (a27 <= 32767) ” 
  &&  “ ((-32768) <= a28) ” 
  &&  “ (a28 <= 32767) ” 
  &&  “ ((-32768) <= a29) ” 
  &&  “ (a29 <= 32767) ” 
  &&  “ ((-32768) <= a30) ” 
  &&  “ (a30 <= 32767) ” 
  &&  “ ((-32768) <= a31) ” 
  &&  “ (a31 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_14 := __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_14_pure -> __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_14_aux.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_15_pure := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (PreH1 : (retval_14 = (qu_u16 (a13)))) (PreH2 : (0 <= retval_14)) (PreH3 : (retval_14 <= 65535)) (PreH4 : (retval_13 = (qu_u16 (a12)))) (PreH5 : (0 <= retval_13)) (PreH6 : (retval_13 <= 65535)) (PreH7 : (retval_12 = (qu_u16 (a11)))) (PreH8 : (0 <= retval_12)) (PreH9 : (retval_12 <= 65535)) (PreH10 : (retval_11 = (qu_u16 (a10)))) (PreH11 : (0 <= retval_11)) (PreH12 : (retval_11 <= 65535)) (PreH13 : (retval_10 = (qu_u16 (a9)))) (PreH14 : (0 <= retval_10)) (PreH15 : (retval_10 <= 65535)) (PreH16 : (retval_9 = (qu_u16 (a8)))) (PreH17 : (0 <= retval_9)) (PreH18 : (retval_9 <= 65535)) (PreH19 : (retval_8 = (qu_u16 (a7)))) (PreH20 : (0 <= retval_8)) (PreH21 : (retval_8 <= 65535)) (PreH22 : (retval_7 = (qu_u16 (a6)))) (PreH23 : (0 <= retval_7)) (PreH24 : (retval_7 <= 65535)) (PreH25 : (retval_6 = (qu_u16 (a5)))) (PreH26 : (0 <= retval_6)) (PreH27 : (retval_6 <= 65535)) (PreH28 : (retval_5 = (qu_u16 (a4)))) (PreH29 : (0 <= retval_5)) (PreH30 : (retval_5 <= 65535)) (PreH31 : (retval_4 = (qu_u16 (a3)))) (PreH32 : (0 <= retval_4)) (PreH33 : (retval_4 <= 65535)) (PreH34 : (retval_3 = (qu_u16 (a2)))) (PreH35 : (0 <= retval_3)) (PreH36 : (retval_3 <= 65535)) (PreH37 : (retval_2 = (qu_u16 (a1)))) (PreH38 : (0 <= retval_2)) (PreH39 : (retval_2 <= 65535)) (PreH40 : (retval = (qu_u16 (a0)))) (PreH41 : (0 <= retval)) (PreH42 : (retval <= 65535)) (PreH43 : ((-32768) <= a0)) (PreH44 : (a0 <= 32767)) (PreH45 : ((-32768) <= a1)) (PreH46 : (a1 <= 32767)) (PreH47 : ((-32768) <= a2)) (PreH48 : (a2 <= 32767)) (PreH49 : ((-32768) <= a3)) (PreH50 : (a3 <= 32767)) (PreH51 : ((-32768) <= a4)) (PreH52 : (a4 <= 32767)) (PreH53 : ((-32768) <= a5)) (PreH54 : (a5 <= 32767)) (PreH55 : ((-32768) <= a6)) (PreH56 : (a6 <= 32767)) (PreH57 : ((-32768) <= a7)) (PreH58 : (a7 <= 32767)) (PreH59 : ((-32768) <= a8)) (PreH60 : (a8 <= 32767)) (PreH61 : ((-32768) <= a9)) (PreH62 : (a9 <= 32767)) (PreH63 : ((-32768) <= a10)) (PreH64 : (a10 <= 32767)) (PreH65 : ((-32768) <= a11)) (PreH66 : (a11 <= 32767)) (PreH67 : ((-32768) <= a12)) (PreH68 : (a12 <= 32767)) (PreH69 : ((-32768) <= a13)) (PreH70 : (a13 <= 32767)) (PreH71 : ((-32768) <= a14)) (PreH72 : (a14 <= 32767)) (PreH73 : ((-32768) <= a15)) (PreH74 : (a15 <= 32767)) (PreH75 : ((-32768) <= a16)) (PreH76 : (a16 <= 32767)) (PreH77 : ((-32768) <= a17)) (PreH78 : (a17 <= 32767)) (PreH79 : ((-32768) <= a18)) (PreH80 : (a18 <= 32767)) (PreH81 : ((-32768) <= a19)) (PreH82 : (a19 <= 32767)) (PreH83 : ((-32768) <= a20)) (PreH84 : (a20 <= 32767)) (PreH85 : ((-32768) <= a21)) (PreH86 : (a21 <= 32767)) (PreH87 : ((-32768) <= a22)) (PreH88 : (a22 <= 32767)) (PreH89 : ((-32768) <= a23)) (PreH90 : (a23 <= 32767)) (PreH91 : ((-32768) <= a24)) (PreH92 : (a24 <= 32767)) (PreH93 : ((-32768) <= a25)) (PreH94 : (a25 <= 32767)) (PreH95 : ((-32768) <= a26)) (PreH96 : (a26 <= 32767)) (PreH97 : ((-32768) <= a27)) (PreH98 : (a27 <= 32767)) (PreH99 : ((-32768) <= a28)) (PreH100 : (a28 <= 32767)) (PreH101 : ((-32768) <= a29)) (PreH102 : (a29 <= 32767)) (PreH103 : ((-32768) <= a30)) (PreH104 : (a30 <= 32767)) (PreH105 : ((-32768) <= a31)) (PreH106 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a14) ” 
  &&  “ (a14 <= INT_MAX) ”
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_15_aux := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (PreH1 : (retval_14 = (qu_u16 (a13)))) (PreH2 : (0 <= retval_14)) (PreH3 : (retval_14 <= 65535)) (PreH4 : (retval_13 = (qu_u16 (a12)))) (PreH5 : (0 <= retval_13)) (PreH6 : (retval_13 <= 65535)) (PreH7 : (retval_12 = (qu_u16 (a11)))) (PreH8 : (0 <= retval_12)) (PreH9 : (retval_12 <= 65535)) (PreH10 : (retval_11 = (qu_u16 (a10)))) (PreH11 : (0 <= retval_11)) (PreH12 : (retval_11 <= 65535)) (PreH13 : (retval_10 = (qu_u16 (a9)))) (PreH14 : (0 <= retval_10)) (PreH15 : (retval_10 <= 65535)) (PreH16 : (retval_9 = (qu_u16 (a8)))) (PreH17 : (0 <= retval_9)) (PreH18 : (retval_9 <= 65535)) (PreH19 : (retval_8 = (qu_u16 (a7)))) (PreH20 : (0 <= retval_8)) (PreH21 : (retval_8 <= 65535)) (PreH22 : (retval_7 = (qu_u16 (a6)))) (PreH23 : (0 <= retval_7)) (PreH24 : (retval_7 <= 65535)) (PreH25 : (retval_6 = (qu_u16 (a5)))) (PreH26 : (0 <= retval_6)) (PreH27 : (retval_6 <= 65535)) (PreH28 : (retval_5 = (qu_u16 (a4)))) (PreH29 : (0 <= retval_5)) (PreH30 : (retval_5 <= 65535)) (PreH31 : (retval_4 = (qu_u16 (a3)))) (PreH32 : (0 <= retval_4)) (PreH33 : (retval_4 <= 65535)) (PreH34 : (retval_3 = (qu_u16 (a2)))) (PreH35 : (0 <= retval_3)) (PreH36 : (retval_3 <= 65535)) (PreH37 : (retval_2 = (qu_u16 (a1)))) (PreH38 : (0 <= retval_2)) (PreH39 : (retval_2 <= 65535)) (PreH40 : (retval = (qu_u16 (a0)))) (PreH41 : (0 <= retval)) (PreH42 : (retval <= 65535)) (PreH43 : ((-32768) <= a0)) (PreH44 : (a0 <= 32767)) (PreH45 : ((-32768) <= a1)) (PreH46 : (a1 <= 32767)) (PreH47 : ((-32768) <= a2)) (PreH48 : (a2 <= 32767)) (PreH49 : ((-32768) <= a3)) (PreH50 : (a3 <= 32767)) (PreH51 : ((-32768) <= a4)) (PreH52 : (a4 <= 32767)) (PreH53 : ((-32768) <= a5)) (PreH54 : (a5 <= 32767)) (PreH55 : ((-32768) <= a6)) (PreH56 : (a6 <= 32767)) (PreH57 : ((-32768) <= a7)) (PreH58 : (a7 <= 32767)) (PreH59 : ((-32768) <= a8)) (PreH60 : (a8 <= 32767)) (PreH61 : ((-32768) <= a9)) (PreH62 : (a9 <= 32767)) (PreH63 : ((-32768) <= a10)) (PreH64 : (a10 <= 32767)) (PreH65 : ((-32768) <= a11)) (PreH66 : (a11 <= 32767)) (PreH67 : ((-32768) <= a12)) (PreH68 : (a12 <= 32767)) (PreH69 : ((-32768) <= a13)) (PreH70 : (a13 <= 32767)) (PreH71 : ((-32768) <= a14)) (PreH72 : (a14 <= 32767)) (PreH73 : ((-32768) <= a15)) (PreH74 : (a15 <= 32767)) (PreH75 : ((-32768) <= a16)) (PreH76 : (a16 <= 32767)) (PreH77 : ((-32768) <= a17)) (PreH78 : (a17 <= 32767)) (PreH79 : ((-32768) <= a18)) (PreH80 : (a18 <= 32767)) (PreH81 : ((-32768) <= a19)) (PreH82 : (a19 <= 32767)) (PreH83 : ((-32768) <= a20)) (PreH84 : (a20 <= 32767)) (PreH85 : ((-32768) <= a21)) (PreH86 : (a21 <= 32767)) (PreH87 : ((-32768) <= a22)) (PreH88 : (a22 <= 32767)) (PreH89 : ((-32768) <= a23)) (PreH90 : (a23 <= 32767)) (PreH91 : ((-32768) <= a24)) (PreH92 : (a24 <= 32767)) (PreH93 : ((-32768) <= a25)) (PreH94 : (a25 <= 32767)) (PreH95 : ((-32768) <= a26)) (PreH96 : (a26 <= 32767)) (PreH97 : ((-32768) <= a27)) (PreH98 : (a27 <= 32767)) (PreH99 : ((-32768) <= a28)) (PreH100 : (a28 <= 32767)) (PreH101 : ((-32768) <= a29)) (PreH102 : (a29 <= 32767)) (PreH103 : ((-32768) <= a30)) (PreH104 : (a30 <= 32767)) (PreH105 : ((-32768) <= a31)) (PreH106 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a14) ” 
  &&  “ (a14 <= INT_MAX) ” 
  &&  “ (retval_14 = (qu_u16 (a13))) ” 
  &&  “ (0 <= retval_14) ” 
  &&  “ (retval_14 <= 65535) ” 
  &&  “ (retval_13 = (qu_u16 (a12))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= 65535) ” 
  &&  “ (retval_12 = (qu_u16 (a11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= 65535) ” 
  &&  “ (retval_11 = (qu_u16 (a10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= 65535) ” 
  &&  “ (retval_10 = (qu_u16 (a9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= 65535) ” 
  &&  “ (retval_9 = (qu_u16 (a8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= 65535) ” 
  &&  “ (retval_8 = (qu_u16 (a7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= 65535) ” 
  &&  “ (retval_7 = (qu_u16 (a6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 65535) ” 
  &&  “ (retval_6 = (qu_u16 (a5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 65535) ” 
  &&  “ (retval_5 = (qu_u16 (a4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 65535) ” 
  &&  “ (retval_4 = (qu_u16 (a3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 65535) ” 
  &&  “ (retval_3 = (qu_u16 (a2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (qu_u16 (a1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (qu_u16 (a0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= a8) ” 
  &&  “ (a8 <= 32767) ” 
  &&  “ ((-32768) <= a9) ” 
  &&  “ (a9 <= 32767) ” 
  &&  “ ((-32768) <= a10) ” 
  &&  “ (a10 <= 32767) ” 
  &&  “ ((-32768) <= a11) ” 
  &&  “ (a11 <= 32767) ” 
  &&  “ ((-32768) <= a12) ” 
  &&  “ (a12 <= 32767) ” 
  &&  “ ((-32768) <= a13) ” 
  &&  “ (a13 <= 32767) ” 
  &&  “ ((-32768) <= a14) ” 
  &&  “ (a14 <= 32767) ” 
  &&  “ ((-32768) <= a15) ” 
  &&  “ (a15 <= 32767) ” 
  &&  “ ((-32768) <= a16) ” 
  &&  “ (a16 <= 32767) ” 
  &&  “ ((-32768) <= a17) ” 
  &&  “ (a17 <= 32767) ” 
  &&  “ ((-32768) <= a18) ” 
  &&  “ (a18 <= 32767) ” 
  &&  “ ((-32768) <= a19) ” 
  &&  “ (a19 <= 32767) ” 
  &&  “ ((-32768) <= a20) ” 
  &&  “ (a20 <= 32767) ” 
  &&  “ ((-32768) <= a21) ” 
  &&  “ (a21 <= 32767) ” 
  &&  “ ((-32768) <= a22) ” 
  &&  “ (a22 <= 32767) ” 
  &&  “ ((-32768) <= a23) ” 
  &&  “ (a23 <= 32767) ” 
  &&  “ ((-32768) <= a24) ” 
  &&  “ (a24 <= 32767) ” 
  &&  “ ((-32768) <= a25) ” 
  &&  “ (a25 <= 32767) ” 
  &&  “ ((-32768) <= a26) ” 
  &&  “ (a26 <= 32767) ” 
  &&  “ ((-32768) <= a27) ” 
  &&  “ (a27 <= 32767) ” 
  &&  “ ((-32768) <= a28) ” 
  &&  “ (a28 <= 32767) ” 
  &&  “ ((-32768) <= a29) ” 
  &&  “ (a29 <= 32767) ” 
  &&  “ ((-32768) <= a30) ” 
  &&  “ (a30 <= 32767) ” 
  &&  “ ((-32768) <= a31) ” 
  &&  “ (a31 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_15 := __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_15_pure -> __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_15_aux.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_16_pure := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (PreH1 : (retval_15 = (qu_u16 (a14)))) (PreH2 : (0 <= retval_15)) (PreH3 : (retval_15 <= 65535)) (PreH4 : (retval_14 = (qu_u16 (a13)))) (PreH5 : (0 <= retval_14)) (PreH6 : (retval_14 <= 65535)) (PreH7 : (retval_13 = (qu_u16 (a12)))) (PreH8 : (0 <= retval_13)) (PreH9 : (retval_13 <= 65535)) (PreH10 : (retval_12 = (qu_u16 (a11)))) (PreH11 : (0 <= retval_12)) (PreH12 : (retval_12 <= 65535)) (PreH13 : (retval_11 = (qu_u16 (a10)))) (PreH14 : (0 <= retval_11)) (PreH15 : (retval_11 <= 65535)) (PreH16 : (retval_10 = (qu_u16 (a9)))) (PreH17 : (0 <= retval_10)) (PreH18 : (retval_10 <= 65535)) (PreH19 : (retval_9 = (qu_u16 (a8)))) (PreH20 : (0 <= retval_9)) (PreH21 : (retval_9 <= 65535)) (PreH22 : (retval_8 = (qu_u16 (a7)))) (PreH23 : (0 <= retval_8)) (PreH24 : (retval_8 <= 65535)) (PreH25 : (retval_7 = (qu_u16 (a6)))) (PreH26 : (0 <= retval_7)) (PreH27 : (retval_7 <= 65535)) (PreH28 : (retval_6 = (qu_u16 (a5)))) (PreH29 : (0 <= retval_6)) (PreH30 : (retval_6 <= 65535)) (PreH31 : (retval_5 = (qu_u16 (a4)))) (PreH32 : (0 <= retval_5)) (PreH33 : (retval_5 <= 65535)) (PreH34 : (retval_4 = (qu_u16 (a3)))) (PreH35 : (0 <= retval_4)) (PreH36 : (retval_4 <= 65535)) (PreH37 : (retval_3 = (qu_u16 (a2)))) (PreH38 : (0 <= retval_3)) (PreH39 : (retval_3 <= 65535)) (PreH40 : (retval_2 = (qu_u16 (a1)))) (PreH41 : (0 <= retval_2)) (PreH42 : (retval_2 <= 65535)) (PreH43 : (retval = (qu_u16 (a0)))) (PreH44 : (0 <= retval)) (PreH45 : (retval <= 65535)) (PreH46 : ((-32768) <= a0)) (PreH47 : (a0 <= 32767)) (PreH48 : ((-32768) <= a1)) (PreH49 : (a1 <= 32767)) (PreH50 : ((-32768) <= a2)) (PreH51 : (a2 <= 32767)) (PreH52 : ((-32768) <= a3)) (PreH53 : (a3 <= 32767)) (PreH54 : ((-32768) <= a4)) (PreH55 : (a4 <= 32767)) (PreH56 : ((-32768) <= a5)) (PreH57 : (a5 <= 32767)) (PreH58 : ((-32768) <= a6)) (PreH59 : (a6 <= 32767)) (PreH60 : ((-32768) <= a7)) (PreH61 : (a7 <= 32767)) (PreH62 : ((-32768) <= a8)) (PreH63 : (a8 <= 32767)) (PreH64 : ((-32768) <= a9)) (PreH65 : (a9 <= 32767)) (PreH66 : ((-32768) <= a10)) (PreH67 : (a10 <= 32767)) (PreH68 : ((-32768) <= a11)) (PreH69 : (a11 <= 32767)) (PreH70 : ((-32768) <= a12)) (PreH71 : (a12 <= 32767)) (PreH72 : ((-32768) <= a13)) (PreH73 : (a13 <= 32767)) (PreH74 : ((-32768) <= a14)) (PreH75 : (a14 <= 32767)) (PreH76 : ((-32768) <= a15)) (PreH77 : (a15 <= 32767)) (PreH78 : ((-32768) <= a16)) (PreH79 : (a16 <= 32767)) (PreH80 : ((-32768) <= a17)) (PreH81 : (a17 <= 32767)) (PreH82 : ((-32768) <= a18)) (PreH83 : (a18 <= 32767)) (PreH84 : ((-32768) <= a19)) (PreH85 : (a19 <= 32767)) (PreH86 : ((-32768) <= a20)) (PreH87 : (a20 <= 32767)) (PreH88 : ((-32768) <= a21)) (PreH89 : (a21 <= 32767)) (PreH90 : ((-32768) <= a22)) (PreH91 : (a22 <= 32767)) (PreH92 : ((-32768) <= a23)) (PreH93 : (a23 <= 32767)) (PreH94 : ((-32768) <= a24)) (PreH95 : (a24 <= 32767)) (PreH96 : ((-32768) <= a25)) (PreH97 : (a25 <= 32767)) (PreH98 : ((-32768) <= a26)) (PreH99 : (a26 <= 32767)) (PreH100 : ((-32768) <= a27)) (PreH101 : (a27 <= 32767)) (PreH102 : ((-32768) <= a28)) (PreH103 : (a28 <= 32767)) (PreH104 : ((-32768) <= a29)) (PreH105 : (a29 <= 32767)) (PreH106 : ((-32768) <= a30)) (PreH107 : (a30 <= 32767)) (PreH108 : ((-32768) <= a31)) (PreH109 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a15) ” 
  &&  “ (a15 <= INT_MAX) ”
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_16_aux := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (PreH1 : (retval_15 = (qu_u16 (a14)))) (PreH2 : (0 <= retval_15)) (PreH3 : (retval_15 <= 65535)) (PreH4 : (retval_14 = (qu_u16 (a13)))) (PreH5 : (0 <= retval_14)) (PreH6 : (retval_14 <= 65535)) (PreH7 : (retval_13 = (qu_u16 (a12)))) (PreH8 : (0 <= retval_13)) (PreH9 : (retval_13 <= 65535)) (PreH10 : (retval_12 = (qu_u16 (a11)))) (PreH11 : (0 <= retval_12)) (PreH12 : (retval_12 <= 65535)) (PreH13 : (retval_11 = (qu_u16 (a10)))) (PreH14 : (0 <= retval_11)) (PreH15 : (retval_11 <= 65535)) (PreH16 : (retval_10 = (qu_u16 (a9)))) (PreH17 : (0 <= retval_10)) (PreH18 : (retval_10 <= 65535)) (PreH19 : (retval_9 = (qu_u16 (a8)))) (PreH20 : (0 <= retval_9)) (PreH21 : (retval_9 <= 65535)) (PreH22 : (retval_8 = (qu_u16 (a7)))) (PreH23 : (0 <= retval_8)) (PreH24 : (retval_8 <= 65535)) (PreH25 : (retval_7 = (qu_u16 (a6)))) (PreH26 : (0 <= retval_7)) (PreH27 : (retval_7 <= 65535)) (PreH28 : (retval_6 = (qu_u16 (a5)))) (PreH29 : (0 <= retval_6)) (PreH30 : (retval_6 <= 65535)) (PreH31 : (retval_5 = (qu_u16 (a4)))) (PreH32 : (0 <= retval_5)) (PreH33 : (retval_5 <= 65535)) (PreH34 : (retval_4 = (qu_u16 (a3)))) (PreH35 : (0 <= retval_4)) (PreH36 : (retval_4 <= 65535)) (PreH37 : (retval_3 = (qu_u16 (a2)))) (PreH38 : (0 <= retval_3)) (PreH39 : (retval_3 <= 65535)) (PreH40 : (retval_2 = (qu_u16 (a1)))) (PreH41 : (0 <= retval_2)) (PreH42 : (retval_2 <= 65535)) (PreH43 : (retval = (qu_u16 (a0)))) (PreH44 : (0 <= retval)) (PreH45 : (retval <= 65535)) (PreH46 : ((-32768) <= a0)) (PreH47 : (a0 <= 32767)) (PreH48 : ((-32768) <= a1)) (PreH49 : (a1 <= 32767)) (PreH50 : ((-32768) <= a2)) (PreH51 : (a2 <= 32767)) (PreH52 : ((-32768) <= a3)) (PreH53 : (a3 <= 32767)) (PreH54 : ((-32768) <= a4)) (PreH55 : (a4 <= 32767)) (PreH56 : ((-32768) <= a5)) (PreH57 : (a5 <= 32767)) (PreH58 : ((-32768) <= a6)) (PreH59 : (a6 <= 32767)) (PreH60 : ((-32768) <= a7)) (PreH61 : (a7 <= 32767)) (PreH62 : ((-32768) <= a8)) (PreH63 : (a8 <= 32767)) (PreH64 : ((-32768) <= a9)) (PreH65 : (a9 <= 32767)) (PreH66 : ((-32768) <= a10)) (PreH67 : (a10 <= 32767)) (PreH68 : ((-32768) <= a11)) (PreH69 : (a11 <= 32767)) (PreH70 : ((-32768) <= a12)) (PreH71 : (a12 <= 32767)) (PreH72 : ((-32768) <= a13)) (PreH73 : (a13 <= 32767)) (PreH74 : ((-32768) <= a14)) (PreH75 : (a14 <= 32767)) (PreH76 : ((-32768) <= a15)) (PreH77 : (a15 <= 32767)) (PreH78 : ((-32768) <= a16)) (PreH79 : (a16 <= 32767)) (PreH80 : ((-32768) <= a17)) (PreH81 : (a17 <= 32767)) (PreH82 : ((-32768) <= a18)) (PreH83 : (a18 <= 32767)) (PreH84 : ((-32768) <= a19)) (PreH85 : (a19 <= 32767)) (PreH86 : ((-32768) <= a20)) (PreH87 : (a20 <= 32767)) (PreH88 : ((-32768) <= a21)) (PreH89 : (a21 <= 32767)) (PreH90 : ((-32768) <= a22)) (PreH91 : (a22 <= 32767)) (PreH92 : ((-32768) <= a23)) (PreH93 : (a23 <= 32767)) (PreH94 : ((-32768) <= a24)) (PreH95 : (a24 <= 32767)) (PreH96 : ((-32768) <= a25)) (PreH97 : (a25 <= 32767)) (PreH98 : ((-32768) <= a26)) (PreH99 : (a26 <= 32767)) (PreH100 : ((-32768) <= a27)) (PreH101 : (a27 <= 32767)) (PreH102 : ((-32768) <= a28)) (PreH103 : (a28 <= 32767)) (PreH104 : ((-32768) <= a29)) (PreH105 : (a29 <= 32767)) (PreH106 : ((-32768) <= a30)) (PreH107 : (a30 <= 32767)) (PreH108 : ((-32768) <= a31)) (PreH109 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a15) ” 
  &&  “ (a15 <= INT_MAX) ” 
  &&  “ (retval_15 = (qu_u16 (a14))) ” 
  &&  “ (0 <= retval_15) ” 
  &&  “ (retval_15 <= 65535) ” 
  &&  “ (retval_14 = (qu_u16 (a13))) ” 
  &&  “ (0 <= retval_14) ” 
  &&  “ (retval_14 <= 65535) ” 
  &&  “ (retval_13 = (qu_u16 (a12))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= 65535) ” 
  &&  “ (retval_12 = (qu_u16 (a11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= 65535) ” 
  &&  “ (retval_11 = (qu_u16 (a10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= 65535) ” 
  &&  “ (retval_10 = (qu_u16 (a9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= 65535) ” 
  &&  “ (retval_9 = (qu_u16 (a8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= 65535) ” 
  &&  “ (retval_8 = (qu_u16 (a7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= 65535) ” 
  &&  “ (retval_7 = (qu_u16 (a6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 65535) ” 
  &&  “ (retval_6 = (qu_u16 (a5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 65535) ” 
  &&  “ (retval_5 = (qu_u16 (a4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 65535) ” 
  &&  “ (retval_4 = (qu_u16 (a3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 65535) ” 
  &&  “ (retval_3 = (qu_u16 (a2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (qu_u16 (a1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (qu_u16 (a0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= a8) ” 
  &&  “ (a8 <= 32767) ” 
  &&  “ ((-32768) <= a9) ” 
  &&  “ (a9 <= 32767) ” 
  &&  “ ((-32768) <= a10) ” 
  &&  “ (a10 <= 32767) ” 
  &&  “ ((-32768) <= a11) ” 
  &&  “ (a11 <= 32767) ” 
  &&  “ ((-32768) <= a12) ” 
  &&  “ (a12 <= 32767) ” 
  &&  “ ((-32768) <= a13) ” 
  &&  “ (a13 <= 32767) ” 
  &&  “ ((-32768) <= a14) ” 
  &&  “ (a14 <= 32767) ” 
  &&  “ ((-32768) <= a15) ” 
  &&  “ (a15 <= 32767) ” 
  &&  “ ((-32768) <= a16) ” 
  &&  “ (a16 <= 32767) ” 
  &&  “ ((-32768) <= a17) ” 
  &&  “ (a17 <= 32767) ” 
  &&  “ ((-32768) <= a18) ” 
  &&  “ (a18 <= 32767) ” 
  &&  “ ((-32768) <= a19) ” 
  &&  “ (a19 <= 32767) ” 
  &&  “ ((-32768) <= a20) ” 
  &&  “ (a20 <= 32767) ” 
  &&  “ ((-32768) <= a21) ” 
  &&  “ (a21 <= 32767) ” 
  &&  “ ((-32768) <= a22) ” 
  &&  “ (a22 <= 32767) ” 
  &&  “ ((-32768) <= a23) ” 
  &&  “ (a23 <= 32767) ” 
  &&  “ ((-32768) <= a24) ” 
  &&  “ (a24 <= 32767) ” 
  &&  “ ((-32768) <= a25) ” 
  &&  “ (a25 <= 32767) ” 
  &&  “ ((-32768) <= a26) ” 
  &&  “ (a26 <= 32767) ” 
  &&  “ ((-32768) <= a27) ” 
  &&  “ (a27 <= 32767) ” 
  &&  “ ((-32768) <= a28) ” 
  &&  “ (a28 <= 32767) ” 
  &&  “ ((-32768) <= a29) ” 
  &&  “ (a29 <= 32767) ” 
  &&  “ ((-32768) <= a30) ” 
  &&  “ (a30 <= 32767) ” 
  &&  “ ((-32768) <= a31) ” 
  &&  “ (a31 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_16 := __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_16_pure -> __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_16_aux.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_17_pure := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (PreH1 : (retval_16 = (qu_u16 (a15)))) (PreH2 : (0 <= retval_16)) (PreH3 : (retval_16 <= 65535)) (PreH4 : (retval_15 = (qu_u16 (a14)))) (PreH5 : (0 <= retval_15)) (PreH6 : (retval_15 <= 65535)) (PreH7 : (retval_14 = (qu_u16 (a13)))) (PreH8 : (0 <= retval_14)) (PreH9 : (retval_14 <= 65535)) (PreH10 : (retval_13 = (qu_u16 (a12)))) (PreH11 : (0 <= retval_13)) (PreH12 : (retval_13 <= 65535)) (PreH13 : (retval_12 = (qu_u16 (a11)))) (PreH14 : (0 <= retval_12)) (PreH15 : (retval_12 <= 65535)) (PreH16 : (retval_11 = (qu_u16 (a10)))) (PreH17 : (0 <= retval_11)) (PreH18 : (retval_11 <= 65535)) (PreH19 : (retval_10 = (qu_u16 (a9)))) (PreH20 : (0 <= retval_10)) (PreH21 : (retval_10 <= 65535)) (PreH22 : (retval_9 = (qu_u16 (a8)))) (PreH23 : (0 <= retval_9)) (PreH24 : (retval_9 <= 65535)) (PreH25 : (retval_8 = (qu_u16 (a7)))) (PreH26 : (0 <= retval_8)) (PreH27 : (retval_8 <= 65535)) (PreH28 : (retval_7 = (qu_u16 (a6)))) (PreH29 : (0 <= retval_7)) (PreH30 : (retval_7 <= 65535)) (PreH31 : (retval_6 = (qu_u16 (a5)))) (PreH32 : (0 <= retval_6)) (PreH33 : (retval_6 <= 65535)) (PreH34 : (retval_5 = (qu_u16 (a4)))) (PreH35 : (0 <= retval_5)) (PreH36 : (retval_5 <= 65535)) (PreH37 : (retval_4 = (qu_u16 (a3)))) (PreH38 : (0 <= retval_4)) (PreH39 : (retval_4 <= 65535)) (PreH40 : (retval_3 = (qu_u16 (a2)))) (PreH41 : (0 <= retval_3)) (PreH42 : (retval_3 <= 65535)) (PreH43 : (retval_2 = (qu_u16 (a1)))) (PreH44 : (0 <= retval_2)) (PreH45 : (retval_2 <= 65535)) (PreH46 : (retval = (qu_u16 (a0)))) (PreH47 : (0 <= retval)) (PreH48 : (retval <= 65535)) (PreH49 : ((-32768) <= a0)) (PreH50 : (a0 <= 32767)) (PreH51 : ((-32768) <= a1)) (PreH52 : (a1 <= 32767)) (PreH53 : ((-32768) <= a2)) (PreH54 : (a2 <= 32767)) (PreH55 : ((-32768) <= a3)) (PreH56 : (a3 <= 32767)) (PreH57 : ((-32768) <= a4)) (PreH58 : (a4 <= 32767)) (PreH59 : ((-32768) <= a5)) (PreH60 : (a5 <= 32767)) (PreH61 : ((-32768) <= a6)) (PreH62 : (a6 <= 32767)) (PreH63 : ((-32768) <= a7)) (PreH64 : (a7 <= 32767)) (PreH65 : ((-32768) <= a8)) (PreH66 : (a8 <= 32767)) (PreH67 : ((-32768) <= a9)) (PreH68 : (a9 <= 32767)) (PreH69 : ((-32768) <= a10)) (PreH70 : (a10 <= 32767)) (PreH71 : ((-32768) <= a11)) (PreH72 : (a11 <= 32767)) (PreH73 : ((-32768) <= a12)) (PreH74 : (a12 <= 32767)) (PreH75 : ((-32768) <= a13)) (PreH76 : (a13 <= 32767)) (PreH77 : ((-32768) <= a14)) (PreH78 : (a14 <= 32767)) (PreH79 : ((-32768) <= a15)) (PreH80 : (a15 <= 32767)) (PreH81 : ((-32768) <= a16)) (PreH82 : (a16 <= 32767)) (PreH83 : ((-32768) <= a17)) (PreH84 : (a17 <= 32767)) (PreH85 : ((-32768) <= a18)) (PreH86 : (a18 <= 32767)) (PreH87 : ((-32768) <= a19)) (PreH88 : (a19 <= 32767)) (PreH89 : ((-32768) <= a20)) (PreH90 : (a20 <= 32767)) (PreH91 : ((-32768) <= a21)) (PreH92 : (a21 <= 32767)) (PreH93 : ((-32768) <= a22)) (PreH94 : (a22 <= 32767)) (PreH95 : ((-32768) <= a23)) (PreH96 : (a23 <= 32767)) (PreH97 : ((-32768) <= a24)) (PreH98 : (a24 <= 32767)) (PreH99 : ((-32768) <= a25)) (PreH100 : (a25 <= 32767)) (PreH101 : ((-32768) <= a26)) (PreH102 : (a26 <= 32767)) (PreH103 : ((-32768) <= a27)) (PreH104 : (a27 <= 32767)) (PreH105 : ((-32768) <= a28)) (PreH106 : (a28 <= 32767)) (PreH107 : ((-32768) <= a29)) (PreH108 : (a29 <= 32767)) (PreH109 : ((-32768) <= a30)) (PreH110 : (a30 <= 32767)) (PreH111 : ((-32768) <= a31)) (PreH112 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a16) ” 
  &&  “ (a16 <= INT_MAX) ”
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_17_aux := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (PreH1 : (retval_16 = (qu_u16 (a15)))) (PreH2 : (0 <= retval_16)) (PreH3 : (retval_16 <= 65535)) (PreH4 : (retval_15 = (qu_u16 (a14)))) (PreH5 : (0 <= retval_15)) (PreH6 : (retval_15 <= 65535)) (PreH7 : (retval_14 = (qu_u16 (a13)))) (PreH8 : (0 <= retval_14)) (PreH9 : (retval_14 <= 65535)) (PreH10 : (retval_13 = (qu_u16 (a12)))) (PreH11 : (0 <= retval_13)) (PreH12 : (retval_13 <= 65535)) (PreH13 : (retval_12 = (qu_u16 (a11)))) (PreH14 : (0 <= retval_12)) (PreH15 : (retval_12 <= 65535)) (PreH16 : (retval_11 = (qu_u16 (a10)))) (PreH17 : (0 <= retval_11)) (PreH18 : (retval_11 <= 65535)) (PreH19 : (retval_10 = (qu_u16 (a9)))) (PreH20 : (0 <= retval_10)) (PreH21 : (retval_10 <= 65535)) (PreH22 : (retval_9 = (qu_u16 (a8)))) (PreH23 : (0 <= retval_9)) (PreH24 : (retval_9 <= 65535)) (PreH25 : (retval_8 = (qu_u16 (a7)))) (PreH26 : (0 <= retval_8)) (PreH27 : (retval_8 <= 65535)) (PreH28 : (retval_7 = (qu_u16 (a6)))) (PreH29 : (0 <= retval_7)) (PreH30 : (retval_7 <= 65535)) (PreH31 : (retval_6 = (qu_u16 (a5)))) (PreH32 : (0 <= retval_6)) (PreH33 : (retval_6 <= 65535)) (PreH34 : (retval_5 = (qu_u16 (a4)))) (PreH35 : (0 <= retval_5)) (PreH36 : (retval_5 <= 65535)) (PreH37 : (retval_4 = (qu_u16 (a3)))) (PreH38 : (0 <= retval_4)) (PreH39 : (retval_4 <= 65535)) (PreH40 : (retval_3 = (qu_u16 (a2)))) (PreH41 : (0 <= retval_3)) (PreH42 : (retval_3 <= 65535)) (PreH43 : (retval_2 = (qu_u16 (a1)))) (PreH44 : (0 <= retval_2)) (PreH45 : (retval_2 <= 65535)) (PreH46 : (retval = (qu_u16 (a0)))) (PreH47 : (0 <= retval)) (PreH48 : (retval <= 65535)) (PreH49 : ((-32768) <= a0)) (PreH50 : (a0 <= 32767)) (PreH51 : ((-32768) <= a1)) (PreH52 : (a1 <= 32767)) (PreH53 : ((-32768) <= a2)) (PreH54 : (a2 <= 32767)) (PreH55 : ((-32768) <= a3)) (PreH56 : (a3 <= 32767)) (PreH57 : ((-32768) <= a4)) (PreH58 : (a4 <= 32767)) (PreH59 : ((-32768) <= a5)) (PreH60 : (a5 <= 32767)) (PreH61 : ((-32768) <= a6)) (PreH62 : (a6 <= 32767)) (PreH63 : ((-32768) <= a7)) (PreH64 : (a7 <= 32767)) (PreH65 : ((-32768) <= a8)) (PreH66 : (a8 <= 32767)) (PreH67 : ((-32768) <= a9)) (PreH68 : (a9 <= 32767)) (PreH69 : ((-32768) <= a10)) (PreH70 : (a10 <= 32767)) (PreH71 : ((-32768) <= a11)) (PreH72 : (a11 <= 32767)) (PreH73 : ((-32768) <= a12)) (PreH74 : (a12 <= 32767)) (PreH75 : ((-32768) <= a13)) (PreH76 : (a13 <= 32767)) (PreH77 : ((-32768) <= a14)) (PreH78 : (a14 <= 32767)) (PreH79 : ((-32768) <= a15)) (PreH80 : (a15 <= 32767)) (PreH81 : ((-32768) <= a16)) (PreH82 : (a16 <= 32767)) (PreH83 : ((-32768) <= a17)) (PreH84 : (a17 <= 32767)) (PreH85 : ((-32768) <= a18)) (PreH86 : (a18 <= 32767)) (PreH87 : ((-32768) <= a19)) (PreH88 : (a19 <= 32767)) (PreH89 : ((-32768) <= a20)) (PreH90 : (a20 <= 32767)) (PreH91 : ((-32768) <= a21)) (PreH92 : (a21 <= 32767)) (PreH93 : ((-32768) <= a22)) (PreH94 : (a22 <= 32767)) (PreH95 : ((-32768) <= a23)) (PreH96 : (a23 <= 32767)) (PreH97 : ((-32768) <= a24)) (PreH98 : (a24 <= 32767)) (PreH99 : ((-32768) <= a25)) (PreH100 : (a25 <= 32767)) (PreH101 : ((-32768) <= a26)) (PreH102 : (a26 <= 32767)) (PreH103 : ((-32768) <= a27)) (PreH104 : (a27 <= 32767)) (PreH105 : ((-32768) <= a28)) (PreH106 : (a28 <= 32767)) (PreH107 : ((-32768) <= a29)) (PreH108 : (a29 <= 32767)) (PreH109 : ((-32768) <= a30)) (PreH110 : (a30 <= 32767)) (PreH111 : ((-32768) <= a31)) (PreH112 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a16) ” 
  &&  “ (a16 <= INT_MAX) ” 
  &&  “ (retval_16 = (qu_u16 (a15))) ” 
  &&  “ (0 <= retval_16) ” 
  &&  “ (retval_16 <= 65535) ” 
  &&  “ (retval_15 = (qu_u16 (a14))) ” 
  &&  “ (0 <= retval_15) ” 
  &&  “ (retval_15 <= 65535) ” 
  &&  “ (retval_14 = (qu_u16 (a13))) ” 
  &&  “ (0 <= retval_14) ” 
  &&  “ (retval_14 <= 65535) ” 
  &&  “ (retval_13 = (qu_u16 (a12))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= 65535) ” 
  &&  “ (retval_12 = (qu_u16 (a11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= 65535) ” 
  &&  “ (retval_11 = (qu_u16 (a10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= 65535) ” 
  &&  “ (retval_10 = (qu_u16 (a9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= 65535) ” 
  &&  “ (retval_9 = (qu_u16 (a8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= 65535) ” 
  &&  “ (retval_8 = (qu_u16 (a7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= 65535) ” 
  &&  “ (retval_7 = (qu_u16 (a6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 65535) ” 
  &&  “ (retval_6 = (qu_u16 (a5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 65535) ” 
  &&  “ (retval_5 = (qu_u16 (a4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 65535) ” 
  &&  “ (retval_4 = (qu_u16 (a3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 65535) ” 
  &&  “ (retval_3 = (qu_u16 (a2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (qu_u16 (a1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (qu_u16 (a0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= a8) ” 
  &&  “ (a8 <= 32767) ” 
  &&  “ ((-32768) <= a9) ” 
  &&  “ (a9 <= 32767) ” 
  &&  “ ((-32768) <= a10) ” 
  &&  “ (a10 <= 32767) ” 
  &&  “ ((-32768) <= a11) ” 
  &&  “ (a11 <= 32767) ” 
  &&  “ ((-32768) <= a12) ” 
  &&  “ (a12 <= 32767) ” 
  &&  “ ((-32768) <= a13) ” 
  &&  “ (a13 <= 32767) ” 
  &&  “ ((-32768) <= a14) ” 
  &&  “ (a14 <= 32767) ” 
  &&  “ ((-32768) <= a15) ” 
  &&  “ (a15 <= 32767) ” 
  &&  “ ((-32768) <= a16) ” 
  &&  “ (a16 <= 32767) ” 
  &&  “ ((-32768) <= a17) ” 
  &&  “ (a17 <= 32767) ” 
  &&  “ ((-32768) <= a18) ” 
  &&  “ (a18 <= 32767) ” 
  &&  “ ((-32768) <= a19) ” 
  &&  “ (a19 <= 32767) ” 
  &&  “ ((-32768) <= a20) ” 
  &&  “ (a20 <= 32767) ” 
  &&  “ ((-32768) <= a21) ” 
  &&  “ (a21 <= 32767) ” 
  &&  “ ((-32768) <= a22) ” 
  &&  “ (a22 <= 32767) ” 
  &&  “ ((-32768) <= a23) ” 
  &&  “ (a23 <= 32767) ” 
  &&  “ ((-32768) <= a24) ” 
  &&  “ (a24 <= 32767) ” 
  &&  “ ((-32768) <= a25) ” 
  &&  “ (a25 <= 32767) ” 
  &&  “ ((-32768) <= a26) ” 
  &&  “ (a26 <= 32767) ” 
  &&  “ ((-32768) <= a27) ” 
  &&  “ (a27 <= 32767) ” 
  &&  “ ((-32768) <= a28) ” 
  &&  “ (a28 <= 32767) ” 
  &&  “ ((-32768) <= a29) ” 
  &&  “ (a29 <= 32767) ” 
  &&  “ ((-32768) <= a30) ” 
  &&  “ (a30 <= 32767) ” 
  &&  “ ((-32768) <= a31) ” 
  &&  “ (a31 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_17 := __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_17_pure -> __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_17_aux.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_18_pure := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (PreH1 : (retval_17 = (qu_u16 (a16)))) (PreH2 : (0 <= retval_17)) (PreH3 : (retval_17 <= 65535)) (PreH4 : (retval_16 = (qu_u16 (a15)))) (PreH5 : (0 <= retval_16)) (PreH6 : (retval_16 <= 65535)) (PreH7 : (retval_15 = (qu_u16 (a14)))) (PreH8 : (0 <= retval_15)) (PreH9 : (retval_15 <= 65535)) (PreH10 : (retval_14 = (qu_u16 (a13)))) (PreH11 : (0 <= retval_14)) (PreH12 : (retval_14 <= 65535)) (PreH13 : (retval_13 = (qu_u16 (a12)))) (PreH14 : (0 <= retval_13)) (PreH15 : (retval_13 <= 65535)) (PreH16 : (retval_12 = (qu_u16 (a11)))) (PreH17 : (0 <= retval_12)) (PreH18 : (retval_12 <= 65535)) (PreH19 : (retval_11 = (qu_u16 (a10)))) (PreH20 : (0 <= retval_11)) (PreH21 : (retval_11 <= 65535)) (PreH22 : (retval_10 = (qu_u16 (a9)))) (PreH23 : (0 <= retval_10)) (PreH24 : (retval_10 <= 65535)) (PreH25 : (retval_9 = (qu_u16 (a8)))) (PreH26 : (0 <= retval_9)) (PreH27 : (retval_9 <= 65535)) (PreH28 : (retval_8 = (qu_u16 (a7)))) (PreH29 : (0 <= retval_8)) (PreH30 : (retval_8 <= 65535)) (PreH31 : (retval_7 = (qu_u16 (a6)))) (PreH32 : (0 <= retval_7)) (PreH33 : (retval_7 <= 65535)) (PreH34 : (retval_6 = (qu_u16 (a5)))) (PreH35 : (0 <= retval_6)) (PreH36 : (retval_6 <= 65535)) (PreH37 : (retval_5 = (qu_u16 (a4)))) (PreH38 : (0 <= retval_5)) (PreH39 : (retval_5 <= 65535)) (PreH40 : (retval_4 = (qu_u16 (a3)))) (PreH41 : (0 <= retval_4)) (PreH42 : (retval_4 <= 65535)) (PreH43 : (retval_3 = (qu_u16 (a2)))) (PreH44 : (0 <= retval_3)) (PreH45 : (retval_3 <= 65535)) (PreH46 : (retval_2 = (qu_u16 (a1)))) (PreH47 : (0 <= retval_2)) (PreH48 : (retval_2 <= 65535)) (PreH49 : (retval = (qu_u16 (a0)))) (PreH50 : (0 <= retval)) (PreH51 : (retval <= 65535)) (PreH52 : ((-32768) <= a0)) (PreH53 : (a0 <= 32767)) (PreH54 : ((-32768) <= a1)) (PreH55 : (a1 <= 32767)) (PreH56 : ((-32768) <= a2)) (PreH57 : (a2 <= 32767)) (PreH58 : ((-32768) <= a3)) (PreH59 : (a3 <= 32767)) (PreH60 : ((-32768) <= a4)) (PreH61 : (a4 <= 32767)) (PreH62 : ((-32768) <= a5)) (PreH63 : (a5 <= 32767)) (PreH64 : ((-32768) <= a6)) (PreH65 : (a6 <= 32767)) (PreH66 : ((-32768) <= a7)) (PreH67 : (a7 <= 32767)) (PreH68 : ((-32768) <= a8)) (PreH69 : (a8 <= 32767)) (PreH70 : ((-32768) <= a9)) (PreH71 : (a9 <= 32767)) (PreH72 : ((-32768) <= a10)) (PreH73 : (a10 <= 32767)) (PreH74 : ((-32768) <= a11)) (PreH75 : (a11 <= 32767)) (PreH76 : ((-32768) <= a12)) (PreH77 : (a12 <= 32767)) (PreH78 : ((-32768) <= a13)) (PreH79 : (a13 <= 32767)) (PreH80 : ((-32768) <= a14)) (PreH81 : (a14 <= 32767)) (PreH82 : ((-32768) <= a15)) (PreH83 : (a15 <= 32767)) (PreH84 : ((-32768) <= a16)) (PreH85 : (a16 <= 32767)) (PreH86 : ((-32768) <= a17)) (PreH87 : (a17 <= 32767)) (PreH88 : ((-32768) <= a18)) (PreH89 : (a18 <= 32767)) (PreH90 : ((-32768) <= a19)) (PreH91 : (a19 <= 32767)) (PreH92 : ((-32768) <= a20)) (PreH93 : (a20 <= 32767)) (PreH94 : ((-32768) <= a21)) (PreH95 : (a21 <= 32767)) (PreH96 : ((-32768) <= a22)) (PreH97 : (a22 <= 32767)) (PreH98 : ((-32768) <= a23)) (PreH99 : (a23 <= 32767)) (PreH100 : ((-32768) <= a24)) (PreH101 : (a24 <= 32767)) (PreH102 : ((-32768) <= a25)) (PreH103 : (a25 <= 32767)) (PreH104 : ((-32768) <= a26)) (PreH105 : (a26 <= 32767)) (PreH106 : ((-32768) <= a27)) (PreH107 : (a27 <= 32767)) (PreH108 : ((-32768) <= a28)) (PreH109 : (a28 <= 32767)) (PreH110 : ((-32768) <= a29)) (PreH111 : (a29 <= 32767)) (PreH112 : ((-32768) <= a30)) (PreH113 : (a30 <= 32767)) (PreH114 : ((-32768) <= a31)) (PreH115 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a17) ” 
  &&  “ (a17 <= INT_MAX) ”
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_18_aux := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (PreH1 : (retval_17 = (qu_u16 (a16)))) (PreH2 : (0 <= retval_17)) (PreH3 : (retval_17 <= 65535)) (PreH4 : (retval_16 = (qu_u16 (a15)))) (PreH5 : (0 <= retval_16)) (PreH6 : (retval_16 <= 65535)) (PreH7 : (retval_15 = (qu_u16 (a14)))) (PreH8 : (0 <= retval_15)) (PreH9 : (retval_15 <= 65535)) (PreH10 : (retval_14 = (qu_u16 (a13)))) (PreH11 : (0 <= retval_14)) (PreH12 : (retval_14 <= 65535)) (PreH13 : (retval_13 = (qu_u16 (a12)))) (PreH14 : (0 <= retval_13)) (PreH15 : (retval_13 <= 65535)) (PreH16 : (retval_12 = (qu_u16 (a11)))) (PreH17 : (0 <= retval_12)) (PreH18 : (retval_12 <= 65535)) (PreH19 : (retval_11 = (qu_u16 (a10)))) (PreH20 : (0 <= retval_11)) (PreH21 : (retval_11 <= 65535)) (PreH22 : (retval_10 = (qu_u16 (a9)))) (PreH23 : (0 <= retval_10)) (PreH24 : (retval_10 <= 65535)) (PreH25 : (retval_9 = (qu_u16 (a8)))) (PreH26 : (0 <= retval_9)) (PreH27 : (retval_9 <= 65535)) (PreH28 : (retval_8 = (qu_u16 (a7)))) (PreH29 : (0 <= retval_8)) (PreH30 : (retval_8 <= 65535)) (PreH31 : (retval_7 = (qu_u16 (a6)))) (PreH32 : (0 <= retval_7)) (PreH33 : (retval_7 <= 65535)) (PreH34 : (retval_6 = (qu_u16 (a5)))) (PreH35 : (0 <= retval_6)) (PreH36 : (retval_6 <= 65535)) (PreH37 : (retval_5 = (qu_u16 (a4)))) (PreH38 : (0 <= retval_5)) (PreH39 : (retval_5 <= 65535)) (PreH40 : (retval_4 = (qu_u16 (a3)))) (PreH41 : (0 <= retval_4)) (PreH42 : (retval_4 <= 65535)) (PreH43 : (retval_3 = (qu_u16 (a2)))) (PreH44 : (0 <= retval_3)) (PreH45 : (retval_3 <= 65535)) (PreH46 : (retval_2 = (qu_u16 (a1)))) (PreH47 : (0 <= retval_2)) (PreH48 : (retval_2 <= 65535)) (PreH49 : (retval = (qu_u16 (a0)))) (PreH50 : (0 <= retval)) (PreH51 : (retval <= 65535)) (PreH52 : ((-32768) <= a0)) (PreH53 : (a0 <= 32767)) (PreH54 : ((-32768) <= a1)) (PreH55 : (a1 <= 32767)) (PreH56 : ((-32768) <= a2)) (PreH57 : (a2 <= 32767)) (PreH58 : ((-32768) <= a3)) (PreH59 : (a3 <= 32767)) (PreH60 : ((-32768) <= a4)) (PreH61 : (a4 <= 32767)) (PreH62 : ((-32768) <= a5)) (PreH63 : (a5 <= 32767)) (PreH64 : ((-32768) <= a6)) (PreH65 : (a6 <= 32767)) (PreH66 : ((-32768) <= a7)) (PreH67 : (a7 <= 32767)) (PreH68 : ((-32768) <= a8)) (PreH69 : (a8 <= 32767)) (PreH70 : ((-32768) <= a9)) (PreH71 : (a9 <= 32767)) (PreH72 : ((-32768) <= a10)) (PreH73 : (a10 <= 32767)) (PreH74 : ((-32768) <= a11)) (PreH75 : (a11 <= 32767)) (PreH76 : ((-32768) <= a12)) (PreH77 : (a12 <= 32767)) (PreH78 : ((-32768) <= a13)) (PreH79 : (a13 <= 32767)) (PreH80 : ((-32768) <= a14)) (PreH81 : (a14 <= 32767)) (PreH82 : ((-32768) <= a15)) (PreH83 : (a15 <= 32767)) (PreH84 : ((-32768) <= a16)) (PreH85 : (a16 <= 32767)) (PreH86 : ((-32768) <= a17)) (PreH87 : (a17 <= 32767)) (PreH88 : ((-32768) <= a18)) (PreH89 : (a18 <= 32767)) (PreH90 : ((-32768) <= a19)) (PreH91 : (a19 <= 32767)) (PreH92 : ((-32768) <= a20)) (PreH93 : (a20 <= 32767)) (PreH94 : ((-32768) <= a21)) (PreH95 : (a21 <= 32767)) (PreH96 : ((-32768) <= a22)) (PreH97 : (a22 <= 32767)) (PreH98 : ((-32768) <= a23)) (PreH99 : (a23 <= 32767)) (PreH100 : ((-32768) <= a24)) (PreH101 : (a24 <= 32767)) (PreH102 : ((-32768) <= a25)) (PreH103 : (a25 <= 32767)) (PreH104 : ((-32768) <= a26)) (PreH105 : (a26 <= 32767)) (PreH106 : ((-32768) <= a27)) (PreH107 : (a27 <= 32767)) (PreH108 : ((-32768) <= a28)) (PreH109 : (a28 <= 32767)) (PreH110 : ((-32768) <= a29)) (PreH111 : (a29 <= 32767)) (PreH112 : ((-32768) <= a30)) (PreH113 : (a30 <= 32767)) (PreH114 : ((-32768) <= a31)) (PreH115 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a17) ” 
  &&  “ (a17 <= INT_MAX) ” 
  &&  “ (retval_17 = (qu_u16 (a16))) ” 
  &&  “ (0 <= retval_17) ” 
  &&  “ (retval_17 <= 65535) ” 
  &&  “ (retval_16 = (qu_u16 (a15))) ” 
  &&  “ (0 <= retval_16) ” 
  &&  “ (retval_16 <= 65535) ” 
  &&  “ (retval_15 = (qu_u16 (a14))) ” 
  &&  “ (0 <= retval_15) ” 
  &&  “ (retval_15 <= 65535) ” 
  &&  “ (retval_14 = (qu_u16 (a13))) ” 
  &&  “ (0 <= retval_14) ” 
  &&  “ (retval_14 <= 65535) ” 
  &&  “ (retval_13 = (qu_u16 (a12))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= 65535) ” 
  &&  “ (retval_12 = (qu_u16 (a11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= 65535) ” 
  &&  “ (retval_11 = (qu_u16 (a10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= 65535) ” 
  &&  “ (retval_10 = (qu_u16 (a9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= 65535) ” 
  &&  “ (retval_9 = (qu_u16 (a8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= 65535) ” 
  &&  “ (retval_8 = (qu_u16 (a7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= 65535) ” 
  &&  “ (retval_7 = (qu_u16 (a6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 65535) ” 
  &&  “ (retval_6 = (qu_u16 (a5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 65535) ” 
  &&  “ (retval_5 = (qu_u16 (a4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 65535) ” 
  &&  “ (retval_4 = (qu_u16 (a3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 65535) ” 
  &&  “ (retval_3 = (qu_u16 (a2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (qu_u16 (a1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (qu_u16 (a0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= a8) ” 
  &&  “ (a8 <= 32767) ” 
  &&  “ ((-32768) <= a9) ” 
  &&  “ (a9 <= 32767) ” 
  &&  “ ((-32768) <= a10) ” 
  &&  “ (a10 <= 32767) ” 
  &&  “ ((-32768) <= a11) ” 
  &&  “ (a11 <= 32767) ” 
  &&  “ ((-32768) <= a12) ” 
  &&  “ (a12 <= 32767) ” 
  &&  “ ((-32768) <= a13) ” 
  &&  “ (a13 <= 32767) ” 
  &&  “ ((-32768) <= a14) ” 
  &&  “ (a14 <= 32767) ” 
  &&  “ ((-32768) <= a15) ” 
  &&  “ (a15 <= 32767) ” 
  &&  “ ((-32768) <= a16) ” 
  &&  “ (a16 <= 32767) ” 
  &&  “ ((-32768) <= a17) ” 
  &&  “ (a17 <= 32767) ” 
  &&  “ ((-32768) <= a18) ” 
  &&  “ (a18 <= 32767) ” 
  &&  “ ((-32768) <= a19) ” 
  &&  “ (a19 <= 32767) ” 
  &&  “ ((-32768) <= a20) ” 
  &&  “ (a20 <= 32767) ” 
  &&  “ ((-32768) <= a21) ” 
  &&  “ (a21 <= 32767) ” 
  &&  “ ((-32768) <= a22) ” 
  &&  “ (a22 <= 32767) ” 
  &&  “ ((-32768) <= a23) ” 
  &&  “ (a23 <= 32767) ” 
  &&  “ ((-32768) <= a24) ” 
  &&  “ (a24 <= 32767) ” 
  &&  “ ((-32768) <= a25) ” 
  &&  “ (a25 <= 32767) ” 
  &&  “ ((-32768) <= a26) ” 
  &&  “ (a26 <= 32767) ” 
  &&  “ ((-32768) <= a27) ” 
  &&  “ (a27 <= 32767) ” 
  &&  “ ((-32768) <= a28) ” 
  &&  “ (a28 <= 32767) ” 
  &&  “ ((-32768) <= a29) ” 
  &&  “ (a29 <= 32767) ” 
  &&  “ ((-32768) <= a30) ” 
  &&  “ (a30 <= 32767) ” 
  &&  “ ((-32768) <= a31) ” 
  &&  “ (a31 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_18 := __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_18_pure -> __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_18_aux.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_19_pure := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (PreH1 : (retval_18 = (qu_u16 (a17)))) (PreH2 : (0 <= retval_18)) (PreH3 : (retval_18 <= 65535)) (PreH4 : (retval_17 = (qu_u16 (a16)))) (PreH5 : (0 <= retval_17)) (PreH6 : (retval_17 <= 65535)) (PreH7 : (retval_16 = (qu_u16 (a15)))) (PreH8 : (0 <= retval_16)) (PreH9 : (retval_16 <= 65535)) (PreH10 : (retval_15 = (qu_u16 (a14)))) (PreH11 : (0 <= retval_15)) (PreH12 : (retval_15 <= 65535)) (PreH13 : (retval_14 = (qu_u16 (a13)))) (PreH14 : (0 <= retval_14)) (PreH15 : (retval_14 <= 65535)) (PreH16 : (retval_13 = (qu_u16 (a12)))) (PreH17 : (0 <= retval_13)) (PreH18 : (retval_13 <= 65535)) (PreH19 : (retval_12 = (qu_u16 (a11)))) (PreH20 : (0 <= retval_12)) (PreH21 : (retval_12 <= 65535)) (PreH22 : (retval_11 = (qu_u16 (a10)))) (PreH23 : (0 <= retval_11)) (PreH24 : (retval_11 <= 65535)) (PreH25 : (retval_10 = (qu_u16 (a9)))) (PreH26 : (0 <= retval_10)) (PreH27 : (retval_10 <= 65535)) (PreH28 : (retval_9 = (qu_u16 (a8)))) (PreH29 : (0 <= retval_9)) (PreH30 : (retval_9 <= 65535)) (PreH31 : (retval_8 = (qu_u16 (a7)))) (PreH32 : (0 <= retval_8)) (PreH33 : (retval_8 <= 65535)) (PreH34 : (retval_7 = (qu_u16 (a6)))) (PreH35 : (0 <= retval_7)) (PreH36 : (retval_7 <= 65535)) (PreH37 : (retval_6 = (qu_u16 (a5)))) (PreH38 : (0 <= retval_6)) (PreH39 : (retval_6 <= 65535)) (PreH40 : (retval_5 = (qu_u16 (a4)))) (PreH41 : (0 <= retval_5)) (PreH42 : (retval_5 <= 65535)) (PreH43 : (retval_4 = (qu_u16 (a3)))) (PreH44 : (0 <= retval_4)) (PreH45 : (retval_4 <= 65535)) (PreH46 : (retval_3 = (qu_u16 (a2)))) (PreH47 : (0 <= retval_3)) (PreH48 : (retval_3 <= 65535)) (PreH49 : (retval_2 = (qu_u16 (a1)))) (PreH50 : (0 <= retval_2)) (PreH51 : (retval_2 <= 65535)) (PreH52 : (retval = (qu_u16 (a0)))) (PreH53 : (0 <= retval)) (PreH54 : (retval <= 65535)) (PreH55 : ((-32768) <= a0)) (PreH56 : (a0 <= 32767)) (PreH57 : ((-32768) <= a1)) (PreH58 : (a1 <= 32767)) (PreH59 : ((-32768) <= a2)) (PreH60 : (a2 <= 32767)) (PreH61 : ((-32768) <= a3)) (PreH62 : (a3 <= 32767)) (PreH63 : ((-32768) <= a4)) (PreH64 : (a4 <= 32767)) (PreH65 : ((-32768) <= a5)) (PreH66 : (a5 <= 32767)) (PreH67 : ((-32768) <= a6)) (PreH68 : (a6 <= 32767)) (PreH69 : ((-32768) <= a7)) (PreH70 : (a7 <= 32767)) (PreH71 : ((-32768) <= a8)) (PreH72 : (a8 <= 32767)) (PreH73 : ((-32768) <= a9)) (PreH74 : (a9 <= 32767)) (PreH75 : ((-32768) <= a10)) (PreH76 : (a10 <= 32767)) (PreH77 : ((-32768) <= a11)) (PreH78 : (a11 <= 32767)) (PreH79 : ((-32768) <= a12)) (PreH80 : (a12 <= 32767)) (PreH81 : ((-32768) <= a13)) (PreH82 : (a13 <= 32767)) (PreH83 : ((-32768) <= a14)) (PreH84 : (a14 <= 32767)) (PreH85 : ((-32768) <= a15)) (PreH86 : (a15 <= 32767)) (PreH87 : ((-32768) <= a16)) (PreH88 : (a16 <= 32767)) (PreH89 : ((-32768) <= a17)) (PreH90 : (a17 <= 32767)) (PreH91 : ((-32768) <= a18)) (PreH92 : (a18 <= 32767)) (PreH93 : ((-32768) <= a19)) (PreH94 : (a19 <= 32767)) (PreH95 : ((-32768) <= a20)) (PreH96 : (a20 <= 32767)) (PreH97 : ((-32768) <= a21)) (PreH98 : (a21 <= 32767)) (PreH99 : ((-32768) <= a22)) (PreH100 : (a22 <= 32767)) (PreH101 : ((-32768) <= a23)) (PreH102 : (a23 <= 32767)) (PreH103 : ((-32768) <= a24)) (PreH104 : (a24 <= 32767)) (PreH105 : ((-32768) <= a25)) (PreH106 : (a25 <= 32767)) (PreH107 : ((-32768) <= a26)) (PreH108 : (a26 <= 32767)) (PreH109 : ((-32768) <= a27)) (PreH110 : (a27 <= 32767)) (PreH111 : ((-32768) <= a28)) (PreH112 : (a28 <= 32767)) (PreH113 : ((-32768) <= a29)) (PreH114 : (a29 <= 32767)) (PreH115 : ((-32768) <= a30)) (PreH116 : (a30 <= 32767)) (PreH117 : ((-32768) <= a31)) (PreH118 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a18) ” 
  &&  “ (a18 <= INT_MAX) ”
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_19_aux := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (PreH1 : (retval_18 = (qu_u16 (a17)))) (PreH2 : (0 <= retval_18)) (PreH3 : (retval_18 <= 65535)) (PreH4 : (retval_17 = (qu_u16 (a16)))) (PreH5 : (0 <= retval_17)) (PreH6 : (retval_17 <= 65535)) (PreH7 : (retval_16 = (qu_u16 (a15)))) (PreH8 : (0 <= retval_16)) (PreH9 : (retval_16 <= 65535)) (PreH10 : (retval_15 = (qu_u16 (a14)))) (PreH11 : (0 <= retval_15)) (PreH12 : (retval_15 <= 65535)) (PreH13 : (retval_14 = (qu_u16 (a13)))) (PreH14 : (0 <= retval_14)) (PreH15 : (retval_14 <= 65535)) (PreH16 : (retval_13 = (qu_u16 (a12)))) (PreH17 : (0 <= retval_13)) (PreH18 : (retval_13 <= 65535)) (PreH19 : (retval_12 = (qu_u16 (a11)))) (PreH20 : (0 <= retval_12)) (PreH21 : (retval_12 <= 65535)) (PreH22 : (retval_11 = (qu_u16 (a10)))) (PreH23 : (0 <= retval_11)) (PreH24 : (retval_11 <= 65535)) (PreH25 : (retval_10 = (qu_u16 (a9)))) (PreH26 : (0 <= retval_10)) (PreH27 : (retval_10 <= 65535)) (PreH28 : (retval_9 = (qu_u16 (a8)))) (PreH29 : (0 <= retval_9)) (PreH30 : (retval_9 <= 65535)) (PreH31 : (retval_8 = (qu_u16 (a7)))) (PreH32 : (0 <= retval_8)) (PreH33 : (retval_8 <= 65535)) (PreH34 : (retval_7 = (qu_u16 (a6)))) (PreH35 : (0 <= retval_7)) (PreH36 : (retval_7 <= 65535)) (PreH37 : (retval_6 = (qu_u16 (a5)))) (PreH38 : (0 <= retval_6)) (PreH39 : (retval_6 <= 65535)) (PreH40 : (retval_5 = (qu_u16 (a4)))) (PreH41 : (0 <= retval_5)) (PreH42 : (retval_5 <= 65535)) (PreH43 : (retval_4 = (qu_u16 (a3)))) (PreH44 : (0 <= retval_4)) (PreH45 : (retval_4 <= 65535)) (PreH46 : (retval_3 = (qu_u16 (a2)))) (PreH47 : (0 <= retval_3)) (PreH48 : (retval_3 <= 65535)) (PreH49 : (retval_2 = (qu_u16 (a1)))) (PreH50 : (0 <= retval_2)) (PreH51 : (retval_2 <= 65535)) (PreH52 : (retval = (qu_u16 (a0)))) (PreH53 : (0 <= retval)) (PreH54 : (retval <= 65535)) (PreH55 : ((-32768) <= a0)) (PreH56 : (a0 <= 32767)) (PreH57 : ((-32768) <= a1)) (PreH58 : (a1 <= 32767)) (PreH59 : ((-32768) <= a2)) (PreH60 : (a2 <= 32767)) (PreH61 : ((-32768) <= a3)) (PreH62 : (a3 <= 32767)) (PreH63 : ((-32768) <= a4)) (PreH64 : (a4 <= 32767)) (PreH65 : ((-32768) <= a5)) (PreH66 : (a5 <= 32767)) (PreH67 : ((-32768) <= a6)) (PreH68 : (a6 <= 32767)) (PreH69 : ((-32768) <= a7)) (PreH70 : (a7 <= 32767)) (PreH71 : ((-32768) <= a8)) (PreH72 : (a8 <= 32767)) (PreH73 : ((-32768) <= a9)) (PreH74 : (a9 <= 32767)) (PreH75 : ((-32768) <= a10)) (PreH76 : (a10 <= 32767)) (PreH77 : ((-32768) <= a11)) (PreH78 : (a11 <= 32767)) (PreH79 : ((-32768) <= a12)) (PreH80 : (a12 <= 32767)) (PreH81 : ((-32768) <= a13)) (PreH82 : (a13 <= 32767)) (PreH83 : ((-32768) <= a14)) (PreH84 : (a14 <= 32767)) (PreH85 : ((-32768) <= a15)) (PreH86 : (a15 <= 32767)) (PreH87 : ((-32768) <= a16)) (PreH88 : (a16 <= 32767)) (PreH89 : ((-32768) <= a17)) (PreH90 : (a17 <= 32767)) (PreH91 : ((-32768) <= a18)) (PreH92 : (a18 <= 32767)) (PreH93 : ((-32768) <= a19)) (PreH94 : (a19 <= 32767)) (PreH95 : ((-32768) <= a20)) (PreH96 : (a20 <= 32767)) (PreH97 : ((-32768) <= a21)) (PreH98 : (a21 <= 32767)) (PreH99 : ((-32768) <= a22)) (PreH100 : (a22 <= 32767)) (PreH101 : ((-32768) <= a23)) (PreH102 : (a23 <= 32767)) (PreH103 : ((-32768) <= a24)) (PreH104 : (a24 <= 32767)) (PreH105 : ((-32768) <= a25)) (PreH106 : (a25 <= 32767)) (PreH107 : ((-32768) <= a26)) (PreH108 : (a26 <= 32767)) (PreH109 : ((-32768) <= a27)) (PreH110 : (a27 <= 32767)) (PreH111 : ((-32768) <= a28)) (PreH112 : (a28 <= 32767)) (PreH113 : ((-32768) <= a29)) (PreH114 : (a29 <= 32767)) (PreH115 : ((-32768) <= a30)) (PreH116 : (a30 <= 32767)) (PreH117 : ((-32768) <= a31)) (PreH118 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a18) ” 
  &&  “ (a18 <= INT_MAX) ” 
  &&  “ (retval_18 = (qu_u16 (a17))) ” 
  &&  “ (0 <= retval_18) ” 
  &&  “ (retval_18 <= 65535) ” 
  &&  “ (retval_17 = (qu_u16 (a16))) ” 
  &&  “ (0 <= retval_17) ” 
  &&  “ (retval_17 <= 65535) ” 
  &&  “ (retval_16 = (qu_u16 (a15))) ” 
  &&  “ (0 <= retval_16) ” 
  &&  “ (retval_16 <= 65535) ” 
  &&  “ (retval_15 = (qu_u16 (a14))) ” 
  &&  “ (0 <= retval_15) ” 
  &&  “ (retval_15 <= 65535) ” 
  &&  “ (retval_14 = (qu_u16 (a13))) ” 
  &&  “ (0 <= retval_14) ” 
  &&  “ (retval_14 <= 65535) ” 
  &&  “ (retval_13 = (qu_u16 (a12))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= 65535) ” 
  &&  “ (retval_12 = (qu_u16 (a11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= 65535) ” 
  &&  “ (retval_11 = (qu_u16 (a10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= 65535) ” 
  &&  “ (retval_10 = (qu_u16 (a9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= 65535) ” 
  &&  “ (retval_9 = (qu_u16 (a8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= 65535) ” 
  &&  “ (retval_8 = (qu_u16 (a7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= 65535) ” 
  &&  “ (retval_7 = (qu_u16 (a6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 65535) ” 
  &&  “ (retval_6 = (qu_u16 (a5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 65535) ” 
  &&  “ (retval_5 = (qu_u16 (a4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 65535) ” 
  &&  “ (retval_4 = (qu_u16 (a3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 65535) ” 
  &&  “ (retval_3 = (qu_u16 (a2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (qu_u16 (a1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (qu_u16 (a0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= a8) ” 
  &&  “ (a8 <= 32767) ” 
  &&  “ ((-32768) <= a9) ” 
  &&  “ (a9 <= 32767) ” 
  &&  “ ((-32768) <= a10) ” 
  &&  “ (a10 <= 32767) ” 
  &&  “ ((-32768) <= a11) ” 
  &&  “ (a11 <= 32767) ” 
  &&  “ ((-32768) <= a12) ” 
  &&  “ (a12 <= 32767) ” 
  &&  “ ((-32768) <= a13) ” 
  &&  “ (a13 <= 32767) ” 
  &&  “ ((-32768) <= a14) ” 
  &&  “ (a14 <= 32767) ” 
  &&  “ ((-32768) <= a15) ” 
  &&  “ (a15 <= 32767) ” 
  &&  “ ((-32768) <= a16) ” 
  &&  “ (a16 <= 32767) ” 
  &&  “ ((-32768) <= a17) ” 
  &&  “ (a17 <= 32767) ” 
  &&  “ ((-32768) <= a18) ” 
  &&  “ (a18 <= 32767) ” 
  &&  “ ((-32768) <= a19) ” 
  &&  “ (a19 <= 32767) ” 
  &&  “ ((-32768) <= a20) ” 
  &&  “ (a20 <= 32767) ” 
  &&  “ ((-32768) <= a21) ” 
  &&  “ (a21 <= 32767) ” 
  &&  “ ((-32768) <= a22) ” 
  &&  “ (a22 <= 32767) ” 
  &&  “ ((-32768) <= a23) ” 
  &&  “ (a23 <= 32767) ” 
  &&  “ ((-32768) <= a24) ” 
  &&  “ (a24 <= 32767) ” 
  &&  “ ((-32768) <= a25) ” 
  &&  “ (a25 <= 32767) ” 
  &&  “ ((-32768) <= a26) ” 
  &&  “ (a26 <= 32767) ” 
  &&  “ ((-32768) <= a27) ” 
  &&  “ (a27 <= 32767) ” 
  &&  “ ((-32768) <= a28) ” 
  &&  “ (a28 <= 32767) ” 
  &&  “ ((-32768) <= a29) ” 
  &&  “ (a29 <= 32767) ” 
  &&  “ ((-32768) <= a30) ” 
  &&  “ (a30 <= 32767) ” 
  &&  “ ((-32768) <= a31) ” 
  &&  “ (a31 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_19 := __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_19_pure -> __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_19_aux.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_20_pure := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (PreH1 : (retval_19 = (qu_u16 (a18)))) (PreH2 : (0 <= retval_19)) (PreH3 : (retval_19 <= 65535)) (PreH4 : (retval_18 = (qu_u16 (a17)))) (PreH5 : (0 <= retval_18)) (PreH6 : (retval_18 <= 65535)) (PreH7 : (retval_17 = (qu_u16 (a16)))) (PreH8 : (0 <= retval_17)) (PreH9 : (retval_17 <= 65535)) (PreH10 : (retval_16 = (qu_u16 (a15)))) (PreH11 : (0 <= retval_16)) (PreH12 : (retval_16 <= 65535)) (PreH13 : (retval_15 = (qu_u16 (a14)))) (PreH14 : (0 <= retval_15)) (PreH15 : (retval_15 <= 65535)) (PreH16 : (retval_14 = (qu_u16 (a13)))) (PreH17 : (0 <= retval_14)) (PreH18 : (retval_14 <= 65535)) (PreH19 : (retval_13 = (qu_u16 (a12)))) (PreH20 : (0 <= retval_13)) (PreH21 : (retval_13 <= 65535)) (PreH22 : (retval_12 = (qu_u16 (a11)))) (PreH23 : (0 <= retval_12)) (PreH24 : (retval_12 <= 65535)) (PreH25 : (retval_11 = (qu_u16 (a10)))) (PreH26 : (0 <= retval_11)) (PreH27 : (retval_11 <= 65535)) (PreH28 : (retval_10 = (qu_u16 (a9)))) (PreH29 : (0 <= retval_10)) (PreH30 : (retval_10 <= 65535)) (PreH31 : (retval_9 = (qu_u16 (a8)))) (PreH32 : (0 <= retval_9)) (PreH33 : (retval_9 <= 65535)) (PreH34 : (retval_8 = (qu_u16 (a7)))) (PreH35 : (0 <= retval_8)) (PreH36 : (retval_8 <= 65535)) (PreH37 : (retval_7 = (qu_u16 (a6)))) (PreH38 : (0 <= retval_7)) (PreH39 : (retval_7 <= 65535)) (PreH40 : (retval_6 = (qu_u16 (a5)))) (PreH41 : (0 <= retval_6)) (PreH42 : (retval_6 <= 65535)) (PreH43 : (retval_5 = (qu_u16 (a4)))) (PreH44 : (0 <= retval_5)) (PreH45 : (retval_5 <= 65535)) (PreH46 : (retval_4 = (qu_u16 (a3)))) (PreH47 : (0 <= retval_4)) (PreH48 : (retval_4 <= 65535)) (PreH49 : (retval_3 = (qu_u16 (a2)))) (PreH50 : (0 <= retval_3)) (PreH51 : (retval_3 <= 65535)) (PreH52 : (retval_2 = (qu_u16 (a1)))) (PreH53 : (0 <= retval_2)) (PreH54 : (retval_2 <= 65535)) (PreH55 : (retval = (qu_u16 (a0)))) (PreH56 : (0 <= retval)) (PreH57 : (retval <= 65535)) (PreH58 : ((-32768) <= a0)) (PreH59 : (a0 <= 32767)) (PreH60 : ((-32768) <= a1)) (PreH61 : (a1 <= 32767)) (PreH62 : ((-32768) <= a2)) (PreH63 : (a2 <= 32767)) (PreH64 : ((-32768) <= a3)) (PreH65 : (a3 <= 32767)) (PreH66 : ((-32768) <= a4)) (PreH67 : (a4 <= 32767)) (PreH68 : ((-32768) <= a5)) (PreH69 : (a5 <= 32767)) (PreH70 : ((-32768) <= a6)) (PreH71 : (a6 <= 32767)) (PreH72 : ((-32768) <= a7)) (PreH73 : (a7 <= 32767)) (PreH74 : ((-32768) <= a8)) (PreH75 : (a8 <= 32767)) (PreH76 : ((-32768) <= a9)) (PreH77 : (a9 <= 32767)) (PreH78 : ((-32768) <= a10)) (PreH79 : (a10 <= 32767)) (PreH80 : ((-32768) <= a11)) (PreH81 : (a11 <= 32767)) (PreH82 : ((-32768) <= a12)) (PreH83 : (a12 <= 32767)) (PreH84 : ((-32768) <= a13)) (PreH85 : (a13 <= 32767)) (PreH86 : ((-32768) <= a14)) (PreH87 : (a14 <= 32767)) (PreH88 : ((-32768) <= a15)) (PreH89 : (a15 <= 32767)) (PreH90 : ((-32768) <= a16)) (PreH91 : (a16 <= 32767)) (PreH92 : ((-32768) <= a17)) (PreH93 : (a17 <= 32767)) (PreH94 : ((-32768) <= a18)) (PreH95 : (a18 <= 32767)) (PreH96 : ((-32768) <= a19)) (PreH97 : (a19 <= 32767)) (PreH98 : ((-32768) <= a20)) (PreH99 : (a20 <= 32767)) (PreH100 : ((-32768) <= a21)) (PreH101 : (a21 <= 32767)) (PreH102 : ((-32768) <= a22)) (PreH103 : (a22 <= 32767)) (PreH104 : ((-32768) <= a23)) (PreH105 : (a23 <= 32767)) (PreH106 : ((-32768) <= a24)) (PreH107 : (a24 <= 32767)) (PreH108 : ((-32768) <= a25)) (PreH109 : (a25 <= 32767)) (PreH110 : ((-32768) <= a26)) (PreH111 : (a26 <= 32767)) (PreH112 : ((-32768) <= a27)) (PreH113 : (a27 <= 32767)) (PreH114 : ((-32768) <= a28)) (PreH115 : (a28 <= 32767)) (PreH116 : ((-32768) <= a29)) (PreH117 : (a29 <= 32767)) (PreH118 : ((-32768) <= a30)) (PreH119 : (a30 <= 32767)) (PreH120 : ((-32768) <= a31)) (PreH121 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a19) ” 
  &&  “ (a19 <= INT_MAX) ”
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_20_aux := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (PreH1 : (retval_19 = (qu_u16 (a18)))) (PreH2 : (0 <= retval_19)) (PreH3 : (retval_19 <= 65535)) (PreH4 : (retval_18 = (qu_u16 (a17)))) (PreH5 : (0 <= retval_18)) (PreH6 : (retval_18 <= 65535)) (PreH7 : (retval_17 = (qu_u16 (a16)))) (PreH8 : (0 <= retval_17)) (PreH9 : (retval_17 <= 65535)) (PreH10 : (retval_16 = (qu_u16 (a15)))) (PreH11 : (0 <= retval_16)) (PreH12 : (retval_16 <= 65535)) (PreH13 : (retval_15 = (qu_u16 (a14)))) (PreH14 : (0 <= retval_15)) (PreH15 : (retval_15 <= 65535)) (PreH16 : (retval_14 = (qu_u16 (a13)))) (PreH17 : (0 <= retval_14)) (PreH18 : (retval_14 <= 65535)) (PreH19 : (retval_13 = (qu_u16 (a12)))) (PreH20 : (0 <= retval_13)) (PreH21 : (retval_13 <= 65535)) (PreH22 : (retval_12 = (qu_u16 (a11)))) (PreH23 : (0 <= retval_12)) (PreH24 : (retval_12 <= 65535)) (PreH25 : (retval_11 = (qu_u16 (a10)))) (PreH26 : (0 <= retval_11)) (PreH27 : (retval_11 <= 65535)) (PreH28 : (retval_10 = (qu_u16 (a9)))) (PreH29 : (0 <= retval_10)) (PreH30 : (retval_10 <= 65535)) (PreH31 : (retval_9 = (qu_u16 (a8)))) (PreH32 : (0 <= retval_9)) (PreH33 : (retval_9 <= 65535)) (PreH34 : (retval_8 = (qu_u16 (a7)))) (PreH35 : (0 <= retval_8)) (PreH36 : (retval_8 <= 65535)) (PreH37 : (retval_7 = (qu_u16 (a6)))) (PreH38 : (0 <= retval_7)) (PreH39 : (retval_7 <= 65535)) (PreH40 : (retval_6 = (qu_u16 (a5)))) (PreH41 : (0 <= retval_6)) (PreH42 : (retval_6 <= 65535)) (PreH43 : (retval_5 = (qu_u16 (a4)))) (PreH44 : (0 <= retval_5)) (PreH45 : (retval_5 <= 65535)) (PreH46 : (retval_4 = (qu_u16 (a3)))) (PreH47 : (0 <= retval_4)) (PreH48 : (retval_4 <= 65535)) (PreH49 : (retval_3 = (qu_u16 (a2)))) (PreH50 : (0 <= retval_3)) (PreH51 : (retval_3 <= 65535)) (PreH52 : (retval_2 = (qu_u16 (a1)))) (PreH53 : (0 <= retval_2)) (PreH54 : (retval_2 <= 65535)) (PreH55 : (retval = (qu_u16 (a0)))) (PreH56 : (0 <= retval)) (PreH57 : (retval <= 65535)) (PreH58 : ((-32768) <= a0)) (PreH59 : (a0 <= 32767)) (PreH60 : ((-32768) <= a1)) (PreH61 : (a1 <= 32767)) (PreH62 : ((-32768) <= a2)) (PreH63 : (a2 <= 32767)) (PreH64 : ((-32768) <= a3)) (PreH65 : (a3 <= 32767)) (PreH66 : ((-32768) <= a4)) (PreH67 : (a4 <= 32767)) (PreH68 : ((-32768) <= a5)) (PreH69 : (a5 <= 32767)) (PreH70 : ((-32768) <= a6)) (PreH71 : (a6 <= 32767)) (PreH72 : ((-32768) <= a7)) (PreH73 : (a7 <= 32767)) (PreH74 : ((-32768) <= a8)) (PreH75 : (a8 <= 32767)) (PreH76 : ((-32768) <= a9)) (PreH77 : (a9 <= 32767)) (PreH78 : ((-32768) <= a10)) (PreH79 : (a10 <= 32767)) (PreH80 : ((-32768) <= a11)) (PreH81 : (a11 <= 32767)) (PreH82 : ((-32768) <= a12)) (PreH83 : (a12 <= 32767)) (PreH84 : ((-32768) <= a13)) (PreH85 : (a13 <= 32767)) (PreH86 : ((-32768) <= a14)) (PreH87 : (a14 <= 32767)) (PreH88 : ((-32768) <= a15)) (PreH89 : (a15 <= 32767)) (PreH90 : ((-32768) <= a16)) (PreH91 : (a16 <= 32767)) (PreH92 : ((-32768) <= a17)) (PreH93 : (a17 <= 32767)) (PreH94 : ((-32768) <= a18)) (PreH95 : (a18 <= 32767)) (PreH96 : ((-32768) <= a19)) (PreH97 : (a19 <= 32767)) (PreH98 : ((-32768) <= a20)) (PreH99 : (a20 <= 32767)) (PreH100 : ((-32768) <= a21)) (PreH101 : (a21 <= 32767)) (PreH102 : ((-32768) <= a22)) (PreH103 : (a22 <= 32767)) (PreH104 : ((-32768) <= a23)) (PreH105 : (a23 <= 32767)) (PreH106 : ((-32768) <= a24)) (PreH107 : (a24 <= 32767)) (PreH108 : ((-32768) <= a25)) (PreH109 : (a25 <= 32767)) (PreH110 : ((-32768) <= a26)) (PreH111 : (a26 <= 32767)) (PreH112 : ((-32768) <= a27)) (PreH113 : (a27 <= 32767)) (PreH114 : ((-32768) <= a28)) (PreH115 : (a28 <= 32767)) (PreH116 : ((-32768) <= a29)) (PreH117 : (a29 <= 32767)) (PreH118 : ((-32768) <= a30)) (PreH119 : (a30 <= 32767)) (PreH120 : ((-32768) <= a31)) (PreH121 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a19) ” 
  &&  “ (a19 <= INT_MAX) ” 
  &&  “ (retval_19 = (qu_u16 (a18))) ” 
  &&  “ (0 <= retval_19) ” 
  &&  “ (retval_19 <= 65535) ” 
  &&  “ (retval_18 = (qu_u16 (a17))) ” 
  &&  “ (0 <= retval_18) ” 
  &&  “ (retval_18 <= 65535) ” 
  &&  “ (retval_17 = (qu_u16 (a16))) ” 
  &&  “ (0 <= retval_17) ” 
  &&  “ (retval_17 <= 65535) ” 
  &&  “ (retval_16 = (qu_u16 (a15))) ” 
  &&  “ (0 <= retval_16) ” 
  &&  “ (retval_16 <= 65535) ” 
  &&  “ (retval_15 = (qu_u16 (a14))) ” 
  &&  “ (0 <= retval_15) ” 
  &&  “ (retval_15 <= 65535) ” 
  &&  “ (retval_14 = (qu_u16 (a13))) ” 
  &&  “ (0 <= retval_14) ” 
  &&  “ (retval_14 <= 65535) ” 
  &&  “ (retval_13 = (qu_u16 (a12))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= 65535) ” 
  &&  “ (retval_12 = (qu_u16 (a11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= 65535) ” 
  &&  “ (retval_11 = (qu_u16 (a10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= 65535) ” 
  &&  “ (retval_10 = (qu_u16 (a9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= 65535) ” 
  &&  “ (retval_9 = (qu_u16 (a8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= 65535) ” 
  &&  “ (retval_8 = (qu_u16 (a7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= 65535) ” 
  &&  “ (retval_7 = (qu_u16 (a6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 65535) ” 
  &&  “ (retval_6 = (qu_u16 (a5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 65535) ” 
  &&  “ (retval_5 = (qu_u16 (a4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 65535) ” 
  &&  “ (retval_4 = (qu_u16 (a3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 65535) ” 
  &&  “ (retval_3 = (qu_u16 (a2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (qu_u16 (a1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (qu_u16 (a0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= a8) ” 
  &&  “ (a8 <= 32767) ” 
  &&  “ ((-32768) <= a9) ” 
  &&  “ (a9 <= 32767) ” 
  &&  “ ((-32768) <= a10) ” 
  &&  “ (a10 <= 32767) ” 
  &&  “ ((-32768) <= a11) ” 
  &&  “ (a11 <= 32767) ” 
  &&  “ ((-32768) <= a12) ” 
  &&  “ (a12 <= 32767) ” 
  &&  “ ((-32768) <= a13) ” 
  &&  “ (a13 <= 32767) ” 
  &&  “ ((-32768) <= a14) ” 
  &&  “ (a14 <= 32767) ” 
  &&  “ ((-32768) <= a15) ” 
  &&  “ (a15 <= 32767) ” 
  &&  “ ((-32768) <= a16) ” 
  &&  “ (a16 <= 32767) ” 
  &&  “ ((-32768) <= a17) ” 
  &&  “ (a17 <= 32767) ” 
  &&  “ ((-32768) <= a18) ” 
  &&  “ (a18 <= 32767) ” 
  &&  “ ((-32768) <= a19) ” 
  &&  “ (a19 <= 32767) ” 
  &&  “ ((-32768) <= a20) ” 
  &&  “ (a20 <= 32767) ” 
  &&  “ ((-32768) <= a21) ” 
  &&  “ (a21 <= 32767) ” 
  &&  “ ((-32768) <= a22) ” 
  &&  “ (a22 <= 32767) ” 
  &&  “ ((-32768) <= a23) ” 
  &&  “ (a23 <= 32767) ” 
  &&  “ ((-32768) <= a24) ” 
  &&  “ (a24 <= 32767) ” 
  &&  “ ((-32768) <= a25) ” 
  &&  “ (a25 <= 32767) ” 
  &&  “ ((-32768) <= a26) ” 
  &&  “ (a26 <= 32767) ” 
  &&  “ ((-32768) <= a27) ” 
  &&  “ (a27 <= 32767) ” 
  &&  “ ((-32768) <= a28) ” 
  &&  “ (a28 <= 32767) ” 
  &&  “ ((-32768) <= a29) ” 
  &&  “ (a29 <= 32767) ” 
  &&  “ ((-32768) <= a30) ” 
  &&  “ (a30 <= 32767) ” 
  &&  “ ((-32768) <= a31) ” 
  &&  “ (a31 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_20 := __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_20_pure -> __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_20_aux.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_21_pure := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (PreH1 : (retval_20 = (qu_u16 (a19)))) (PreH2 : (0 <= retval_20)) (PreH3 : (retval_20 <= 65535)) (PreH4 : (retval_19 = (qu_u16 (a18)))) (PreH5 : (0 <= retval_19)) (PreH6 : (retval_19 <= 65535)) (PreH7 : (retval_18 = (qu_u16 (a17)))) (PreH8 : (0 <= retval_18)) (PreH9 : (retval_18 <= 65535)) (PreH10 : (retval_17 = (qu_u16 (a16)))) (PreH11 : (0 <= retval_17)) (PreH12 : (retval_17 <= 65535)) (PreH13 : (retval_16 = (qu_u16 (a15)))) (PreH14 : (0 <= retval_16)) (PreH15 : (retval_16 <= 65535)) (PreH16 : (retval_15 = (qu_u16 (a14)))) (PreH17 : (0 <= retval_15)) (PreH18 : (retval_15 <= 65535)) (PreH19 : (retval_14 = (qu_u16 (a13)))) (PreH20 : (0 <= retval_14)) (PreH21 : (retval_14 <= 65535)) (PreH22 : (retval_13 = (qu_u16 (a12)))) (PreH23 : (0 <= retval_13)) (PreH24 : (retval_13 <= 65535)) (PreH25 : (retval_12 = (qu_u16 (a11)))) (PreH26 : (0 <= retval_12)) (PreH27 : (retval_12 <= 65535)) (PreH28 : (retval_11 = (qu_u16 (a10)))) (PreH29 : (0 <= retval_11)) (PreH30 : (retval_11 <= 65535)) (PreH31 : (retval_10 = (qu_u16 (a9)))) (PreH32 : (0 <= retval_10)) (PreH33 : (retval_10 <= 65535)) (PreH34 : (retval_9 = (qu_u16 (a8)))) (PreH35 : (0 <= retval_9)) (PreH36 : (retval_9 <= 65535)) (PreH37 : (retval_8 = (qu_u16 (a7)))) (PreH38 : (0 <= retval_8)) (PreH39 : (retval_8 <= 65535)) (PreH40 : (retval_7 = (qu_u16 (a6)))) (PreH41 : (0 <= retval_7)) (PreH42 : (retval_7 <= 65535)) (PreH43 : (retval_6 = (qu_u16 (a5)))) (PreH44 : (0 <= retval_6)) (PreH45 : (retval_6 <= 65535)) (PreH46 : (retval_5 = (qu_u16 (a4)))) (PreH47 : (0 <= retval_5)) (PreH48 : (retval_5 <= 65535)) (PreH49 : (retval_4 = (qu_u16 (a3)))) (PreH50 : (0 <= retval_4)) (PreH51 : (retval_4 <= 65535)) (PreH52 : (retval_3 = (qu_u16 (a2)))) (PreH53 : (0 <= retval_3)) (PreH54 : (retval_3 <= 65535)) (PreH55 : (retval_2 = (qu_u16 (a1)))) (PreH56 : (0 <= retval_2)) (PreH57 : (retval_2 <= 65535)) (PreH58 : (retval = (qu_u16 (a0)))) (PreH59 : (0 <= retval)) (PreH60 : (retval <= 65535)) (PreH61 : ((-32768) <= a0)) (PreH62 : (a0 <= 32767)) (PreH63 : ((-32768) <= a1)) (PreH64 : (a1 <= 32767)) (PreH65 : ((-32768) <= a2)) (PreH66 : (a2 <= 32767)) (PreH67 : ((-32768) <= a3)) (PreH68 : (a3 <= 32767)) (PreH69 : ((-32768) <= a4)) (PreH70 : (a4 <= 32767)) (PreH71 : ((-32768) <= a5)) (PreH72 : (a5 <= 32767)) (PreH73 : ((-32768) <= a6)) (PreH74 : (a6 <= 32767)) (PreH75 : ((-32768) <= a7)) (PreH76 : (a7 <= 32767)) (PreH77 : ((-32768) <= a8)) (PreH78 : (a8 <= 32767)) (PreH79 : ((-32768) <= a9)) (PreH80 : (a9 <= 32767)) (PreH81 : ((-32768) <= a10)) (PreH82 : (a10 <= 32767)) (PreH83 : ((-32768) <= a11)) (PreH84 : (a11 <= 32767)) (PreH85 : ((-32768) <= a12)) (PreH86 : (a12 <= 32767)) (PreH87 : ((-32768) <= a13)) (PreH88 : (a13 <= 32767)) (PreH89 : ((-32768) <= a14)) (PreH90 : (a14 <= 32767)) (PreH91 : ((-32768) <= a15)) (PreH92 : (a15 <= 32767)) (PreH93 : ((-32768) <= a16)) (PreH94 : (a16 <= 32767)) (PreH95 : ((-32768) <= a17)) (PreH96 : (a17 <= 32767)) (PreH97 : ((-32768) <= a18)) (PreH98 : (a18 <= 32767)) (PreH99 : ((-32768) <= a19)) (PreH100 : (a19 <= 32767)) (PreH101 : ((-32768) <= a20)) (PreH102 : (a20 <= 32767)) (PreH103 : ((-32768) <= a21)) (PreH104 : (a21 <= 32767)) (PreH105 : ((-32768) <= a22)) (PreH106 : (a22 <= 32767)) (PreH107 : ((-32768) <= a23)) (PreH108 : (a23 <= 32767)) (PreH109 : ((-32768) <= a24)) (PreH110 : (a24 <= 32767)) (PreH111 : ((-32768) <= a25)) (PreH112 : (a25 <= 32767)) (PreH113 : ((-32768) <= a26)) (PreH114 : (a26 <= 32767)) (PreH115 : ((-32768) <= a27)) (PreH116 : (a27 <= 32767)) (PreH117 : ((-32768) <= a28)) (PreH118 : (a28 <= 32767)) (PreH119 : ((-32768) <= a29)) (PreH120 : (a29 <= 32767)) (PreH121 : ((-32768) <= a30)) (PreH122 : (a30 <= 32767)) (PreH123 : ((-32768) <= a31)) (PreH124 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a20) ” 
  &&  “ (a20 <= INT_MAX) ”
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_21_aux := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (PreH1 : (retval_20 = (qu_u16 (a19)))) (PreH2 : (0 <= retval_20)) (PreH3 : (retval_20 <= 65535)) (PreH4 : (retval_19 = (qu_u16 (a18)))) (PreH5 : (0 <= retval_19)) (PreH6 : (retval_19 <= 65535)) (PreH7 : (retval_18 = (qu_u16 (a17)))) (PreH8 : (0 <= retval_18)) (PreH9 : (retval_18 <= 65535)) (PreH10 : (retval_17 = (qu_u16 (a16)))) (PreH11 : (0 <= retval_17)) (PreH12 : (retval_17 <= 65535)) (PreH13 : (retval_16 = (qu_u16 (a15)))) (PreH14 : (0 <= retval_16)) (PreH15 : (retval_16 <= 65535)) (PreH16 : (retval_15 = (qu_u16 (a14)))) (PreH17 : (0 <= retval_15)) (PreH18 : (retval_15 <= 65535)) (PreH19 : (retval_14 = (qu_u16 (a13)))) (PreH20 : (0 <= retval_14)) (PreH21 : (retval_14 <= 65535)) (PreH22 : (retval_13 = (qu_u16 (a12)))) (PreH23 : (0 <= retval_13)) (PreH24 : (retval_13 <= 65535)) (PreH25 : (retval_12 = (qu_u16 (a11)))) (PreH26 : (0 <= retval_12)) (PreH27 : (retval_12 <= 65535)) (PreH28 : (retval_11 = (qu_u16 (a10)))) (PreH29 : (0 <= retval_11)) (PreH30 : (retval_11 <= 65535)) (PreH31 : (retval_10 = (qu_u16 (a9)))) (PreH32 : (0 <= retval_10)) (PreH33 : (retval_10 <= 65535)) (PreH34 : (retval_9 = (qu_u16 (a8)))) (PreH35 : (0 <= retval_9)) (PreH36 : (retval_9 <= 65535)) (PreH37 : (retval_8 = (qu_u16 (a7)))) (PreH38 : (0 <= retval_8)) (PreH39 : (retval_8 <= 65535)) (PreH40 : (retval_7 = (qu_u16 (a6)))) (PreH41 : (0 <= retval_7)) (PreH42 : (retval_7 <= 65535)) (PreH43 : (retval_6 = (qu_u16 (a5)))) (PreH44 : (0 <= retval_6)) (PreH45 : (retval_6 <= 65535)) (PreH46 : (retval_5 = (qu_u16 (a4)))) (PreH47 : (0 <= retval_5)) (PreH48 : (retval_5 <= 65535)) (PreH49 : (retval_4 = (qu_u16 (a3)))) (PreH50 : (0 <= retval_4)) (PreH51 : (retval_4 <= 65535)) (PreH52 : (retval_3 = (qu_u16 (a2)))) (PreH53 : (0 <= retval_3)) (PreH54 : (retval_3 <= 65535)) (PreH55 : (retval_2 = (qu_u16 (a1)))) (PreH56 : (0 <= retval_2)) (PreH57 : (retval_2 <= 65535)) (PreH58 : (retval = (qu_u16 (a0)))) (PreH59 : (0 <= retval)) (PreH60 : (retval <= 65535)) (PreH61 : ((-32768) <= a0)) (PreH62 : (a0 <= 32767)) (PreH63 : ((-32768) <= a1)) (PreH64 : (a1 <= 32767)) (PreH65 : ((-32768) <= a2)) (PreH66 : (a2 <= 32767)) (PreH67 : ((-32768) <= a3)) (PreH68 : (a3 <= 32767)) (PreH69 : ((-32768) <= a4)) (PreH70 : (a4 <= 32767)) (PreH71 : ((-32768) <= a5)) (PreH72 : (a5 <= 32767)) (PreH73 : ((-32768) <= a6)) (PreH74 : (a6 <= 32767)) (PreH75 : ((-32768) <= a7)) (PreH76 : (a7 <= 32767)) (PreH77 : ((-32768) <= a8)) (PreH78 : (a8 <= 32767)) (PreH79 : ((-32768) <= a9)) (PreH80 : (a9 <= 32767)) (PreH81 : ((-32768) <= a10)) (PreH82 : (a10 <= 32767)) (PreH83 : ((-32768) <= a11)) (PreH84 : (a11 <= 32767)) (PreH85 : ((-32768) <= a12)) (PreH86 : (a12 <= 32767)) (PreH87 : ((-32768) <= a13)) (PreH88 : (a13 <= 32767)) (PreH89 : ((-32768) <= a14)) (PreH90 : (a14 <= 32767)) (PreH91 : ((-32768) <= a15)) (PreH92 : (a15 <= 32767)) (PreH93 : ((-32768) <= a16)) (PreH94 : (a16 <= 32767)) (PreH95 : ((-32768) <= a17)) (PreH96 : (a17 <= 32767)) (PreH97 : ((-32768) <= a18)) (PreH98 : (a18 <= 32767)) (PreH99 : ((-32768) <= a19)) (PreH100 : (a19 <= 32767)) (PreH101 : ((-32768) <= a20)) (PreH102 : (a20 <= 32767)) (PreH103 : ((-32768) <= a21)) (PreH104 : (a21 <= 32767)) (PreH105 : ((-32768) <= a22)) (PreH106 : (a22 <= 32767)) (PreH107 : ((-32768) <= a23)) (PreH108 : (a23 <= 32767)) (PreH109 : ((-32768) <= a24)) (PreH110 : (a24 <= 32767)) (PreH111 : ((-32768) <= a25)) (PreH112 : (a25 <= 32767)) (PreH113 : ((-32768) <= a26)) (PreH114 : (a26 <= 32767)) (PreH115 : ((-32768) <= a27)) (PreH116 : (a27 <= 32767)) (PreH117 : ((-32768) <= a28)) (PreH118 : (a28 <= 32767)) (PreH119 : ((-32768) <= a29)) (PreH120 : (a29 <= 32767)) (PreH121 : ((-32768) <= a30)) (PreH122 : (a30 <= 32767)) (PreH123 : ((-32768) <= a31)) (PreH124 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a20) ” 
  &&  “ (a20 <= INT_MAX) ” 
  &&  “ (retval_20 = (qu_u16 (a19))) ” 
  &&  “ (0 <= retval_20) ” 
  &&  “ (retval_20 <= 65535) ” 
  &&  “ (retval_19 = (qu_u16 (a18))) ” 
  &&  “ (0 <= retval_19) ” 
  &&  “ (retval_19 <= 65535) ” 
  &&  “ (retval_18 = (qu_u16 (a17))) ” 
  &&  “ (0 <= retval_18) ” 
  &&  “ (retval_18 <= 65535) ” 
  &&  “ (retval_17 = (qu_u16 (a16))) ” 
  &&  “ (0 <= retval_17) ” 
  &&  “ (retval_17 <= 65535) ” 
  &&  “ (retval_16 = (qu_u16 (a15))) ” 
  &&  “ (0 <= retval_16) ” 
  &&  “ (retval_16 <= 65535) ” 
  &&  “ (retval_15 = (qu_u16 (a14))) ” 
  &&  “ (0 <= retval_15) ” 
  &&  “ (retval_15 <= 65535) ” 
  &&  “ (retval_14 = (qu_u16 (a13))) ” 
  &&  “ (0 <= retval_14) ” 
  &&  “ (retval_14 <= 65535) ” 
  &&  “ (retval_13 = (qu_u16 (a12))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= 65535) ” 
  &&  “ (retval_12 = (qu_u16 (a11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= 65535) ” 
  &&  “ (retval_11 = (qu_u16 (a10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= 65535) ” 
  &&  “ (retval_10 = (qu_u16 (a9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= 65535) ” 
  &&  “ (retval_9 = (qu_u16 (a8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= 65535) ” 
  &&  “ (retval_8 = (qu_u16 (a7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= 65535) ” 
  &&  “ (retval_7 = (qu_u16 (a6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 65535) ” 
  &&  “ (retval_6 = (qu_u16 (a5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 65535) ” 
  &&  “ (retval_5 = (qu_u16 (a4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 65535) ” 
  &&  “ (retval_4 = (qu_u16 (a3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 65535) ” 
  &&  “ (retval_3 = (qu_u16 (a2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (qu_u16 (a1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (qu_u16 (a0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= a8) ” 
  &&  “ (a8 <= 32767) ” 
  &&  “ ((-32768) <= a9) ” 
  &&  “ (a9 <= 32767) ” 
  &&  “ ((-32768) <= a10) ” 
  &&  “ (a10 <= 32767) ” 
  &&  “ ((-32768) <= a11) ” 
  &&  “ (a11 <= 32767) ” 
  &&  “ ((-32768) <= a12) ” 
  &&  “ (a12 <= 32767) ” 
  &&  “ ((-32768) <= a13) ” 
  &&  “ (a13 <= 32767) ” 
  &&  “ ((-32768) <= a14) ” 
  &&  “ (a14 <= 32767) ” 
  &&  “ ((-32768) <= a15) ” 
  &&  “ (a15 <= 32767) ” 
  &&  “ ((-32768) <= a16) ” 
  &&  “ (a16 <= 32767) ” 
  &&  “ ((-32768) <= a17) ” 
  &&  “ (a17 <= 32767) ” 
  &&  “ ((-32768) <= a18) ” 
  &&  “ (a18 <= 32767) ” 
  &&  “ ((-32768) <= a19) ” 
  &&  “ (a19 <= 32767) ” 
  &&  “ ((-32768) <= a20) ” 
  &&  “ (a20 <= 32767) ” 
  &&  “ ((-32768) <= a21) ” 
  &&  “ (a21 <= 32767) ” 
  &&  “ ((-32768) <= a22) ” 
  &&  “ (a22 <= 32767) ” 
  &&  “ ((-32768) <= a23) ” 
  &&  “ (a23 <= 32767) ” 
  &&  “ ((-32768) <= a24) ” 
  &&  “ (a24 <= 32767) ” 
  &&  “ ((-32768) <= a25) ” 
  &&  “ (a25 <= 32767) ” 
  &&  “ ((-32768) <= a26) ” 
  &&  “ (a26 <= 32767) ” 
  &&  “ ((-32768) <= a27) ” 
  &&  “ (a27 <= 32767) ” 
  &&  “ ((-32768) <= a28) ” 
  &&  “ (a28 <= 32767) ” 
  &&  “ ((-32768) <= a29) ” 
  &&  “ (a29 <= 32767) ” 
  &&  “ ((-32768) <= a30) ” 
  &&  “ (a30 <= 32767) ” 
  &&  “ ((-32768) <= a31) ” 
  &&  “ (a31 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_21 := __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_21_pure -> __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_21_aux.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_22_pure := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (PreH1 : (retval_21 = (qu_u16 (a20)))) (PreH2 : (0 <= retval_21)) (PreH3 : (retval_21 <= 65535)) (PreH4 : (retval_20 = (qu_u16 (a19)))) (PreH5 : (0 <= retval_20)) (PreH6 : (retval_20 <= 65535)) (PreH7 : (retval_19 = (qu_u16 (a18)))) (PreH8 : (0 <= retval_19)) (PreH9 : (retval_19 <= 65535)) (PreH10 : (retval_18 = (qu_u16 (a17)))) (PreH11 : (0 <= retval_18)) (PreH12 : (retval_18 <= 65535)) (PreH13 : (retval_17 = (qu_u16 (a16)))) (PreH14 : (0 <= retval_17)) (PreH15 : (retval_17 <= 65535)) (PreH16 : (retval_16 = (qu_u16 (a15)))) (PreH17 : (0 <= retval_16)) (PreH18 : (retval_16 <= 65535)) (PreH19 : (retval_15 = (qu_u16 (a14)))) (PreH20 : (0 <= retval_15)) (PreH21 : (retval_15 <= 65535)) (PreH22 : (retval_14 = (qu_u16 (a13)))) (PreH23 : (0 <= retval_14)) (PreH24 : (retval_14 <= 65535)) (PreH25 : (retval_13 = (qu_u16 (a12)))) (PreH26 : (0 <= retval_13)) (PreH27 : (retval_13 <= 65535)) (PreH28 : (retval_12 = (qu_u16 (a11)))) (PreH29 : (0 <= retval_12)) (PreH30 : (retval_12 <= 65535)) (PreH31 : (retval_11 = (qu_u16 (a10)))) (PreH32 : (0 <= retval_11)) (PreH33 : (retval_11 <= 65535)) (PreH34 : (retval_10 = (qu_u16 (a9)))) (PreH35 : (0 <= retval_10)) (PreH36 : (retval_10 <= 65535)) (PreH37 : (retval_9 = (qu_u16 (a8)))) (PreH38 : (0 <= retval_9)) (PreH39 : (retval_9 <= 65535)) (PreH40 : (retval_8 = (qu_u16 (a7)))) (PreH41 : (0 <= retval_8)) (PreH42 : (retval_8 <= 65535)) (PreH43 : (retval_7 = (qu_u16 (a6)))) (PreH44 : (0 <= retval_7)) (PreH45 : (retval_7 <= 65535)) (PreH46 : (retval_6 = (qu_u16 (a5)))) (PreH47 : (0 <= retval_6)) (PreH48 : (retval_6 <= 65535)) (PreH49 : (retval_5 = (qu_u16 (a4)))) (PreH50 : (0 <= retval_5)) (PreH51 : (retval_5 <= 65535)) (PreH52 : (retval_4 = (qu_u16 (a3)))) (PreH53 : (0 <= retval_4)) (PreH54 : (retval_4 <= 65535)) (PreH55 : (retval_3 = (qu_u16 (a2)))) (PreH56 : (0 <= retval_3)) (PreH57 : (retval_3 <= 65535)) (PreH58 : (retval_2 = (qu_u16 (a1)))) (PreH59 : (0 <= retval_2)) (PreH60 : (retval_2 <= 65535)) (PreH61 : (retval = (qu_u16 (a0)))) (PreH62 : (0 <= retval)) (PreH63 : (retval <= 65535)) (PreH64 : ((-32768) <= a0)) (PreH65 : (a0 <= 32767)) (PreH66 : ((-32768) <= a1)) (PreH67 : (a1 <= 32767)) (PreH68 : ((-32768) <= a2)) (PreH69 : (a2 <= 32767)) (PreH70 : ((-32768) <= a3)) (PreH71 : (a3 <= 32767)) (PreH72 : ((-32768) <= a4)) (PreH73 : (a4 <= 32767)) (PreH74 : ((-32768) <= a5)) (PreH75 : (a5 <= 32767)) (PreH76 : ((-32768) <= a6)) (PreH77 : (a6 <= 32767)) (PreH78 : ((-32768) <= a7)) (PreH79 : (a7 <= 32767)) (PreH80 : ((-32768) <= a8)) (PreH81 : (a8 <= 32767)) (PreH82 : ((-32768) <= a9)) (PreH83 : (a9 <= 32767)) (PreH84 : ((-32768) <= a10)) (PreH85 : (a10 <= 32767)) (PreH86 : ((-32768) <= a11)) (PreH87 : (a11 <= 32767)) (PreH88 : ((-32768) <= a12)) (PreH89 : (a12 <= 32767)) (PreH90 : ((-32768) <= a13)) (PreH91 : (a13 <= 32767)) (PreH92 : ((-32768) <= a14)) (PreH93 : (a14 <= 32767)) (PreH94 : ((-32768) <= a15)) (PreH95 : (a15 <= 32767)) (PreH96 : ((-32768) <= a16)) (PreH97 : (a16 <= 32767)) (PreH98 : ((-32768) <= a17)) (PreH99 : (a17 <= 32767)) (PreH100 : ((-32768) <= a18)) (PreH101 : (a18 <= 32767)) (PreH102 : ((-32768) <= a19)) (PreH103 : (a19 <= 32767)) (PreH104 : ((-32768) <= a20)) (PreH105 : (a20 <= 32767)) (PreH106 : ((-32768) <= a21)) (PreH107 : (a21 <= 32767)) (PreH108 : ((-32768) <= a22)) (PreH109 : (a22 <= 32767)) (PreH110 : ((-32768) <= a23)) (PreH111 : (a23 <= 32767)) (PreH112 : ((-32768) <= a24)) (PreH113 : (a24 <= 32767)) (PreH114 : ((-32768) <= a25)) (PreH115 : (a25 <= 32767)) (PreH116 : ((-32768) <= a26)) (PreH117 : (a26 <= 32767)) (PreH118 : ((-32768) <= a27)) (PreH119 : (a27 <= 32767)) (PreH120 : ((-32768) <= a28)) (PreH121 : (a28 <= 32767)) (PreH122 : ((-32768) <= a29)) (PreH123 : (a29 <= 32767)) (PreH124 : ((-32768) <= a30)) (PreH125 : (a30 <= 32767)) (PreH126 : ((-32768) <= a31)) (PreH127 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a21) ” 
  &&  “ (a21 <= INT_MAX) ”
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_22_aux := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (PreH1 : (retval_21 = (qu_u16 (a20)))) (PreH2 : (0 <= retval_21)) (PreH3 : (retval_21 <= 65535)) (PreH4 : (retval_20 = (qu_u16 (a19)))) (PreH5 : (0 <= retval_20)) (PreH6 : (retval_20 <= 65535)) (PreH7 : (retval_19 = (qu_u16 (a18)))) (PreH8 : (0 <= retval_19)) (PreH9 : (retval_19 <= 65535)) (PreH10 : (retval_18 = (qu_u16 (a17)))) (PreH11 : (0 <= retval_18)) (PreH12 : (retval_18 <= 65535)) (PreH13 : (retval_17 = (qu_u16 (a16)))) (PreH14 : (0 <= retval_17)) (PreH15 : (retval_17 <= 65535)) (PreH16 : (retval_16 = (qu_u16 (a15)))) (PreH17 : (0 <= retval_16)) (PreH18 : (retval_16 <= 65535)) (PreH19 : (retval_15 = (qu_u16 (a14)))) (PreH20 : (0 <= retval_15)) (PreH21 : (retval_15 <= 65535)) (PreH22 : (retval_14 = (qu_u16 (a13)))) (PreH23 : (0 <= retval_14)) (PreH24 : (retval_14 <= 65535)) (PreH25 : (retval_13 = (qu_u16 (a12)))) (PreH26 : (0 <= retval_13)) (PreH27 : (retval_13 <= 65535)) (PreH28 : (retval_12 = (qu_u16 (a11)))) (PreH29 : (0 <= retval_12)) (PreH30 : (retval_12 <= 65535)) (PreH31 : (retval_11 = (qu_u16 (a10)))) (PreH32 : (0 <= retval_11)) (PreH33 : (retval_11 <= 65535)) (PreH34 : (retval_10 = (qu_u16 (a9)))) (PreH35 : (0 <= retval_10)) (PreH36 : (retval_10 <= 65535)) (PreH37 : (retval_9 = (qu_u16 (a8)))) (PreH38 : (0 <= retval_9)) (PreH39 : (retval_9 <= 65535)) (PreH40 : (retval_8 = (qu_u16 (a7)))) (PreH41 : (0 <= retval_8)) (PreH42 : (retval_8 <= 65535)) (PreH43 : (retval_7 = (qu_u16 (a6)))) (PreH44 : (0 <= retval_7)) (PreH45 : (retval_7 <= 65535)) (PreH46 : (retval_6 = (qu_u16 (a5)))) (PreH47 : (0 <= retval_6)) (PreH48 : (retval_6 <= 65535)) (PreH49 : (retval_5 = (qu_u16 (a4)))) (PreH50 : (0 <= retval_5)) (PreH51 : (retval_5 <= 65535)) (PreH52 : (retval_4 = (qu_u16 (a3)))) (PreH53 : (0 <= retval_4)) (PreH54 : (retval_4 <= 65535)) (PreH55 : (retval_3 = (qu_u16 (a2)))) (PreH56 : (0 <= retval_3)) (PreH57 : (retval_3 <= 65535)) (PreH58 : (retval_2 = (qu_u16 (a1)))) (PreH59 : (0 <= retval_2)) (PreH60 : (retval_2 <= 65535)) (PreH61 : (retval = (qu_u16 (a0)))) (PreH62 : (0 <= retval)) (PreH63 : (retval <= 65535)) (PreH64 : ((-32768) <= a0)) (PreH65 : (a0 <= 32767)) (PreH66 : ((-32768) <= a1)) (PreH67 : (a1 <= 32767)) (PreH68 : ((-32768) <= a2)) (PreH69 : (a2 <= 32767)) (PreH70 : ((-32768) <= a3)) (PreH71 : (a3 <= 32767)) (PreH72 : ((-32768) <= a4)) (PreH73 : (a4 <= 32767)) (PreH74 : ((-32768) <= a5)) (PreH75 : (a5 <= 32767)) (PreH76 : ((-32768) <= a6)) (PreH77 : (a6 <= 32767)) (PreH78 : ((-32768) <= a7)) (PreH79 : (a7 <= 32767)) (PreH80 : ((-32768) <= a8)) (PreH81 : (a8 <= 32767)) (PreH82 : ((-32768) <= a9)) (PreH83 : (a9 <= 32767)) (PreH84 : ((-32768) <= a10)) (PreH85 : (a10 <= 32767)) (PreH86 : ((-32768) <= a11)) (PreH87 : (a11 <= 32767)) (PreH88 : ((-32768) <= a12)) (PreH89 : (a12 <= 32767)) (PreH90 : ((-32768) <= a13)) (PreH91 : (a13 <= 32767)) (PreH92 : ((-32768) <= a14)) (PreH93 : (a14 <= 32767)) (PreH94 : ((-32768) <= a15)) (PreH95 : (a15 <= 32767)) (PreH96 : ((-32768) <= a16)) (PreH97 : (a16 <= 32767)) (PreH98 : ((-32768) <= a17)) (PreH99 : (a17 <= 32767)) (PreH100 : ((-32768) <= a18)) (PreH101 : (a18 <= 32767)) (PreH102 : ((-32768) <= a19)) (PreH103 : (a19 <= 32767)) (PreH104 : ((-32768) <= a20)) (PreH105 : (a20 <= 32767)) (PreH106 : ((-32768) <= a21)) (PreH107 : (a21 <= 32767)) (PreH108 : ((-32768) <= a22)) (PreH109 : (a22 <= 32767)) (PreH110 : ((-32768) <= a23)) (PreH111 : (a23 <= 32767)) (PreH112 : ((-32768) <= a24)) (PreH113 : (a24 <= 32767)) (PreH114 : ((-32768) <= a25)) (PreH115 : (a25 <= 32767)) (PreH116 : ((-32768) <= a26)) (PreH117 : (a26 <= 32767)) (PreH118 : ((-32768) <= a27)) (PreH119 : (a27 <= 32767)) (PreH120 : ((-32768) <= a28)) (PreH121 : (a28 <= 32767)) (PreH122 : ((-32768) <= a29)) (PreH123 : (a29 <= 32767)) (PreH124 : ((-32768) <= a30)) (PreH125 : (a30 <= 32767)) (PreH126 : ((-32768) <= a31)) (PreH127 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a21) ” 
  &&  “ (a21 <= INT_MAX) ” 
  &&  “ (retval_21 = (qu_u16 (a20))) ” 
  &&  “ (0 <= retval_21) ” 
  &&  “ (retval_21 <= 65535) ” 
  &&  “ (retval_20 = (qu_u16 (a19))) ” 
  &&  “ (0 <= retval_20) ” 
  &&  “ (retval_20 <= 65535) ” 
  &&  “ (retval_19 = (qu_u16 (a18))) ” 
  &&  “ (0 <= retval_19) ” 
  &&  “ (retval_19 <= 65535) ” 
  &&  “ (retval_18 = (qu_u16 (a17))) ” 
  &&  “ (0 <= retval_18) ” 
  &&  “ (retval_18 <= 65535) ” 
  &&  “ (retval_17 = (qu_u16 (a16))) ” 
  &&  “ (0 <= retval_17) ” 
  &&  “ (retval_17 <= 65535) ” 
  &&  “ (retval_16 = (qu_u16 (a15))) ” 
  &&  “ (0 <= retval_16) ” 
  &&  “ (retval_16 <= 65535) ” 
  &&  “ (retval_15 = (qu_u16 (a14))) ” 
  &&  “ (0 <= retval_15) ” 
  &&  “ (retval_15 <= 65535) ” 
  &&  “ (retval_14 = (qu_u16 (a13))) ” 
  &&  “ (0 <= retval_14) ” 
  &&  “ (retval_14 <= 65535) ” 
  &&  “ (retval_13 = (qu_u16 (a12))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= 65535) ” 
  &&  “ (retval_12 = (qu_u16 (a11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= 65535) ” 
  &&  “ (retval_11 = (qu_u16 (a10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= 65535) ” 
  &&  “ (retval_10 = (qu_u16 (a9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= 65535) ” 
  &&  “ (retval_9 = (qu_u16 (a8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= 65535) ” 
  &&  “ (retval_8 = (qu_u16 (a7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= 65535) ” 
  &&  “ (retval_7 = (qu_u16 (a6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 65535) ” 
  &&  “ (retval_6 = (qu_u16 (a5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 65535) ” 
  &&  “ (retval_5 = (qu_u16 (a4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 65535) ” 
  &&  “ (retval_4 = (qu_u16 (a3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 65535) ” 
  &&  “ (retval_3 = (qu_u16 (a2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (qu_u16 (a1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (qu_u16 (a0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= a8) ” 
  &&  “ (a8 <= 32767) ” 
  &&  “ ((-32768) <= a9) ” 
  &&  “ (a9 <= 32767) ” 
  &&  “ ((-32768) <= a10) ” 
  &&  “ (a10 <= 32767) ” 
  &&  “ ((-32768) <= a11) ” 
  &&  “ (a11 <= 32767) ” 
  &&  “ ((-32768) <= a12) ” 
  &&  “ (a12 <= 32767) ” 
  &&  “ ((-32768) <= a13) ” 
  &&  “ (a13 <= 32767) ” 
  &&  “ ((-32768) <= a14) ” 
  &&  “ (a14 <= 32767) ” 
  &&  “ ((-32768) <= a15) ” 
  &&  “ (a15 <= 32767) ” 
  &&  “ ((-32768) <= a16) ” 
  &&  “ (a16 <= 32767) ” 
  &&  “ ((-32768) <= a17) ” 
  &&  “ (a17 <= 32767) ” 
  &&  “ ((-32768) <= a18) ” 
  &&  “ (a18 <= 32767) ” 
  &&  “ ((-32768) <= a19) ” 
  &&  “ (a19 <= 32767) ” 
  &&  “ ((-32768) <= a20) ” 
  &&  “ (a20 <= 32767) ” 
  &&  “ ((-32768) <= a21) ” 
  &&  “ (a21 <= 32767) ” 
  &&  “ ((-32768) <= a22) ” 
  &&  “ (a22 <= 32767) ” 
  &&  “ ((-32768) <= a23) ” 
  &&  “ (a23 <= 32767) ” 
  &&  “ ((-32768) <= a24) ” 
  &&  “ (a24 <= 32767) ” 
  &&  “ ((-32768) <= a25) ” 
  &&  “ (a25 <= 32767) ” 
  &&  “ ((-32768) <= a26) ” 
  &&  “ (a26 <= 32767) ” 
  &&  “ ((-32768) <= a27) ” 
  &&  “ (a27 <= 32767) ” 
  &&  “ ((-32768) <= a28) ” 
  &&  “ (a28 <= 32767) ” 
  &&  “ ((-32768) <= a29) ” 
  &&  “ (a29 <= 32767) ” 
  &&  “ ((-32768) <= a30) ” 
  &&  “ (a30 <= 32767) ” 
  &&  “ ((-32768) <= a31) ” 
  &&  “ (a31 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_22 := __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_22_pure -> __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_22_aux.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_23_pure := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (PreH1 : (retval_22 = (qu_u16 (a21)))) (PreH2 : (0 <= retval_22)) (PreH3 : (retval_22 <= 65535)) (PreH4 : (retval_21 = (qu_u16 (a20)))) (PreH5 : (0 <= retval_21)) (PreH6 : (retval_21 <= 65535)) (PreH7 : (retval_20 = (qu_u16 (a19)))) (PreH8 : (0 <= retval_20)) (PreH9 : (retval_20 <= 65535)) (PreH10 : (retval_19 = (qu_u16 (a18)))) (PreH11 : (0 <= retval_19)) (PreH12 : (retval_19 <= 65535)) (PreH13 : (retval_18 = (qu_u16 (a17)))) (PreH14 : (0 <= retval_18)) (PreH15 : (retval_18 <= 65535)) (PreH16 : (retval_17 = (qu_u16 (a16)))) (PreH17 : (0 <= retval_17)) (PreH18 : (retval_17 <= 65535)) (PreH19 : (retval_16 = (qu_u16 (a15)))) (PreH20 : (0 <= retval_16)) (PreH21 : (retval_16 <= 65535)) (PreH22 : (retval_15 = (qu_u16 (a14)))) (PreH23 : (0 <= retval_15)) (PreH24 : (retval_15 <= 65535)) (PreH25 : (retval_14 = (qu_u16 (a13)))) (PreH26 : (0 <= retval_14)) (PreH27 : (retval_14 <= 65535)) (PreH28 : (retval_13 = (qu_u16 (a12)))) (PreH29 : (0 <= retval_13)) (PreH30 : (retval_13 <= 65535)) (PreH31 : (retval_12 = (qu_u16 (a11)))) (PreH32 : (0 <= retval_12)) (PreH33 : (retval_12 <= 65535)) (PreH34 : (retval_11 = (qu_u16 (a10)))) (PreH35 : (0 <= retval_11)) (PreH36 : (retval_11 <= 65535)) (PreH37 : (retval_10 = (qu_u16 (a9)))) (PreH38 : (0 <= retval_10)) (PreH39 : (retval_10 <= 65535)) (PreH40 : (retval_9 = (qu_u16 (a8)))) (PreH41 : (0 <= retval_9)) (PreH42 : (retval_9 <= 65535)) (PreH43 : (retval_8 = (qu_u16 (a7)))) (PreH44 : (0 <= retval_8)) (PreH45 : (retval_8 <= 65535)) (PreH46 : (retval_7 = (qu_u16 (a6)))) (PreH47 : (0 <= retval_7)) (PreH48 : (retval_7 <= 65535)) (PreH49 : (retval_6 = (qu_u16 (a5)))) (PreH50 : (0 <= retval_6)) (PreH51 : (retval_6 <= 65535)) (PreH52 : (retval_5 = (qu_u16 (a4)))) (PreH53 : (0 <= retval_5)) (PreH54 : (retval_5 <= 65535)) (PreH55 : (retval_4 = (qu_u16 (a3)))) (PreH56 : (0 <= retval_4)) (PreH57 : (retval_4 <= 65535)) (PreH58 : (retval_3 = (qu_u16 (a2)))) (PreH59 : (0 <= retval_3)) (PreH60 : (retval_3 <= 65535)) (PreH61 : (retval_2 = (qu_u16 (a1)))) (PreH62 : (0 <= retval_2)) (PreH63 : (retval_2 <= 65535)) (PreH64 : (retval = (qu_u16 (a0)))) (PreH65 : (0 <= retval)) (PreH66 : (retval <= 65535)) (PreH67 : ((-32768) <= a0)) (PreH68 : (a0 <= 32767)) (PreH69 : ((-32768) <= a1)) (PreH70 : (a1 <= 32767)) (PreH71 : ((-32768) <= a2)) (PreH72 : (a2 <= 32767)) (PreH73 : ((-32768) <= a3)) (PreH74 : (a3 <= 32767)) (PreH75 : ((-32768) <= a4)) (PreH76 : (a4 <= 32767)) (PreH77 : ((-32768) <= a5)) (PreH78 : (a5 <= 32767)) (PreH79 : ((-32768) <= a6)) (PreH80 : (a6 <= 32767)) (PreH81 : ((-32768) <= a7)) (PreH82 : (a7 <= 32767)) (PreH83 : ((-32768) <= a8)) (PreH84 : (a8 <= 32767)) (PreH85 : ((-32768) <= a9)) (PreH86 : (a9 <= 32767)) (PreH87 : ((-32768) <= a10)) (PreH88 : (a10 <= 32767)) (PreH89 : ((-32768) <= a11)) (PreH90 : (a11 <= 32767)) (PreH91 : ((-32768) <= a12)) (PreH92 : (a12 <= 32767)) (PreH93 : ((-32768) <= a13)) (PreH94 : (a13 <= 32767)) (PreH95 : ((-32768) <= a14)) (PreH96 : (a14 <= 32767)) (PreH97 : ((-32768) <= a15)) (PreH98 : (a15 <= 32767)) (PreH99 : ((-32768) <= a16)) (PreH100 : (a16 <= 32767)) (PreH101 : ((-32768) <= a17)) (PreH102 : (a17 <= 32767)) (PreH103 : ((-32768) <= a18)) (PreH104 : (a18 <= 32767)) (PreH105 : ((-32768) <= a19)) (PreH106 : (a19 <= 32767)) (PreH107 : ((-32768) <= a20)) (PreH108 : (a20 <= 32767)) (PreH109 : ((-32768) <= a21)) (PreH110 : (a21 <= 32767)) (PreH111 : ((-32768) <= a22)) (PreH112 : (a22 <= 32767)) (PreH113 : ((-32768) <= a23)) (PreH114 : (a23 <= 32767)) (PreH115 : ((-32768) <= a24)) (PreH116 : (a24 <= 32767)) (PreH117 : ((-32768) <= a25)) (PreH118 : (a25 <= 32767)) (PreH119 : ((-32768) <= a26)) (PreH120 : (a26 <= 32767)) (PreH121 : ((-32768) <= a27)) (PreH122 : (a27 <= 32767)) (PreH123 : ((-32768) <= a28)) (PreH124 : (a28 <= 32767)) (PreH125 : ((-32768) <= a29)) (PreH126 : (a29 <= 32767)) (PreH127 : ((-32768) <= a30)) (PreH128 : (a30 <= 32767)) (PreH129 : ((-32768) <= a31)) (PreH130 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a22) ” 
  &&  “ (a22 <= INT_MAX) ”
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_23_aux := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (PreH1 : (retval_22 = (qu_u16 (a21)))) (PreH2 : (0 <= retval_22)) (PreH3 : (retval_22 <= 65535)) (PreH4 : (retval_21 = (qu_u16 (a20)))) (PreH5 : (0 <= retval_21)) (PreH6 : (retval_21 <= 65535)) (PreH7 : (retval_20 = (qu_u16 (a19)))) (PreH8 : (0 <= retval_20)) (PreH9 : (retval_20 <= 65535)) (PreH10 : (retval_19 = (qu_u16 (a18)))) (PreH11 : (0 <= retval_19)) (PreH12 : (retval_19 <= 65535)) (PreH13 : (retval_18 = (qu_u16 (a17)))) (PreH14 : (0 <= retval_18)) (PreH15 : (retval_18 <= 65535)) (PreH16 : (retval_17 = (qu_u16 (a16)))) (PreH17 : (0 <= retval_17)) (PreH18 : (retval_17 <= 65535)) (PreH19 : (retval_16 = (qu_u16 (a15)))) (PreH20 : (0 <= retval_16)) (PreH21 : (retval_16 <= 65535)) (PreH22 : (retval_15 = (qu_u16 (a14)))) (PreH23 : (0 <= retval_15)) (PreH24 : (retval_15 <= 65535)) (PreH25 : (retval_14 = (qu_u16 (a13)))) (PreH26 : (0 <= retval_14)) (PreH27 : (retval_14 <= 65535)) (PreH28 : (retval_13 = (qu_u16 (a12)))) (PreH29 : (0 <= retval_13)) (PreH30 : (retval_13 <= 65535)) (PreH31 : (retval_12 = (qu_u16 (a11)))) (PreH32 : (0 <= retval_12)) (PreH33 : (retval_12 <= 65535)) (PreH34 : (retval_11 = (qu_u16 (a10)))) (PreH35 : (0 <= retval_11)) (PreH36 : (retval_11 <= 65535)) (PreH37 : (retval_10 = (qu_u16 (a9)))) (PreH38 : (0 <= retval_10)) (PreH39 : (retval_10 <= 65535)) (PreH40 : (retval_9 = (qu_u16 (a8)))) (PreH41 : (0 <= retval_9)) (PreH42 : (retval_9 <= 65535)) (PreH43 : (retval_8 = (qu_u16 (a7)))) (PreH44 : (0 <= retval_8)) (PreH45 : (retval_8 <= 65535)) (PreH46 : (retval_7 = (qu_u16 (a6)))) (PreH47 : (0 <= retval_7)) (PreH48 : (retval_7 <= 65535)) (PreH49 : (retval_6 = (qu_u16 (a5)))) (PreH50 : (0 <= retval_6)) (PreH51 : (retval_6 <= 65535)) (PreH52 : (retval_5 = (qu_u16 (a4)))) (PreH53 : (0 <= retval_5)) (PreH54 : (retval_5 <= 65535)) (PreH55 : (retval_4 = (qu_u16 (a3)))) (PreH56 : (0 <= retval_4)) (PreH57 : (retval_4 <= 65535)) (PreH58 : (retval_3 = (qu_u16 (a2)))) (PreH59 : (0 <= retval_3)) (PreH60 : (retval_3 <= 65535)) (PreH61 : (retval_2 = (qu_u16 (a1)))) (PreH62 : (0 <= retval_2)) (PreH63 : (retval_2 <= 65535)) (PreH64 : (retval = (qu_u16 (a0)))) (PreH65 : (0 <= retval)) (PreH66 : (retval <= 65535)) (PreH67 : ((-32768) <= a0)) (PreH68 : (a0 <= 32767)) (PreH69 : ((-32768) <= a1)) (PreH70 : (a1 <= 32767)) (PreH71 : ((-32768) <= a2)) (PreH72 : (a2 <= 32767)) (PreH73 : ((-32768) <= a3)) (PreH74 : (a3 <= 32767)) (PreH75 : ((-32768) <= a4)) (PreH76 : (a4 <= 32767)) (PreH77 : ((-32768) <= a5)) (PreH78 : (a5 <= 32767)) (PreH79 : ((-32768) <= a6)) (PreH80 : (a6 <= 32767)) (PreH81 : ((-32768) <= a7)) (PreH82 : (a7 <= 32767)) (PreH83 : ((-32768) <= a8)) (PreH84 : (a8 <= 32767)) (PreH85 : ((-32768) <= a9)) (PreH86 : (a9 <= 32767)) (PreH87 : ((-32768) <= a10)) (PreH88 : (a10 <= 32767)) (PreH89 : ((-32768) <= a11)) (PreH90 : (a11 <= 32767)) (PreH91 : ((-32768) <= a12)) (PreH92 : (a12 <= 32767)) (PreH93 : ((-32768) <= a13)) (PreH94 : (a13 <= 32767)) (PreH95 : ((-32768) <= a14)) (PreH96 : (a14 <= 32767)) (PreH97 : ((-32768) <= a15)) (PreH98 : (a15 <= 32767)) (PreH99 : ((-32768) <= a16)) (PreH100 : (a16 <= 32767)) (PreH101 : ((-32768) <= a17)) (PreH102 : (a17 <= 32767)) (PreH103 : ((-32768) <= a18)) (PreH104 : (a18 <= 32767)) (PreH105 : ((-32768) <= a19)) (PreH106 : (a19 <= 32767)) (PreH107 : ((-32768) <= a20)) (PreH108 : (a20 <= 32767)) (PreH109 : ((-32768) <= a21)) (PreH110 : (a21 <= 32767)) (PreH111 : ((-32768) <= a22)) (PreH112 : (a22 <= 32767)) (PreH113 : ((-32768) <= a23)) (PreH114 : (a23 <= 32767)) (PreH115 : ((-32768) <= a24)) (PreH116 : (a24 <= 32767)) (PreH117 : ((-32768) <= a25)) (PreH118 : (a25 <= 32767)) (PreH119 : ((-32768) <= a26)) (PreH120 : (a26 <= 32767)) (PreH121 : ((-32768) <= a27)) (PreH122 : (a27 <= 32767)) (PreH123 : ((-32768) <= a28)) (PreH124 : (a28 <= 32767)) (PreH125 : ((-32768) <= a29)) (PreH126 : (a29 <= 32767)) (PreH127 : ((-32768) <= a30)) (PreH128 : (a30 <= 32767)) (PreH129 : ((-32768) <= a31)) (PreH130 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a22) ” 
  &&  “ (a22 <= INT_MAX) ” 
  &&  “ (retval_22 = (qu_u16 (a21))) ” 
  &&  “ (0 <= retval_22) ” 
  &&  “ (retval_22 <= 65535) ” 
  &&  “ (retval_21 = (qu_u16 (a20))) ” 
  &&  “ (0 <= retval_21) ” 
  &&  “ (retval_21 <= 65535) ” 
  &&  “ (retval_20 = (qu_u16 (a19))) ” 
  &&  “ (0 <= retval_20) ” 
  &&  “ (retval_20 <= 65535) ” 
  &&  “ (retval_19 = (qu_u16 (a18))) ” 
  &&  “ (0 <= retval_19) ” 
  &&  “ (retval_19 <= 65535) ” 
  &&  “ (retval_18 = (qu_u16 (a17))) ” 
  &&  “ (0 <= retval_18) ” 
  &&  “ (retval_18 <= 65535) ” 
  &&  “ (retval_17 = (qu_u16 (a16))) ” 
  &&  “ (0 <= retval_17) ” 
  &&  “ (retval_17 <= 65535) ” 
  &&  “ (retval_16 = (qu_u16 (a15))) ” 
  &&  “ (0 <= retval_16) ” 
  &&  “ (retval_16 <= 65535) ” 
  &&  “ (retval_15 = (qu_u16 (a14))) ” 
  &&  “ (0 <= retval_15) ” 
  &&  “ (retval_15 <= 65535) ” 
  &&  “ (retval_14 = (qu_u16 (a13))) ” 
  &&  “ (0 <= retval_14) ” 
  &&  “ (retval_14 <= 65535) ” 
  &&  “ (retval_13 = (qu_u16 (a12))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= 65535) ” 
  &&  “ (retval_12 = (qu_u16 (a11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= 65535) ” 
  &&  “ (retval_11 = (qu_u16 (a10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= 65535) ” 
  &&  “ (retval_10 = (qu_u16 (a9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= 65535) ” 
  &&  “ (retval_9 = (qu_u16 (a8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= 65535) ” 
  &&  “ (retval_8 = (qu_u16 (a7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= 65535) ” 
  &&  “ (retval_7 = (qu_u16 (a6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 65535) ” 
  &&  “ (retval_6 = (qu_u16 (a5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 65535) ” 
  &&  “ (retval_5 = (qu_u16 (a4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 65535) ” 
  &&  “ (retval_4 = (qu_u16 (a3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 65535) ” 
  &&  “ (retval_3 = (qu_u16 (a2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (qu_u16 (a1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (qu_u16 (a0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= a8) ” 
  &&  “ (a8 <= 32767) ” 
  &&  “ ((-32768) <= a9) ” 
  &&  “ (a9 <= 32767) ” 
  &&  “ ((-32768) <= a10) ” 
  &&  “ (a10 <= 32767) ” 
  &&  “ ((-32768) <= a11) ” 
  &&  “ (a11 <= 32767) ” 
  &&  “ ((-32768) <= a12) ” 
  &&  “ (a12 <= 32767) ” 
  &&  “ ((-32768) <= a13) ” 
  &&  “ (a13 <= 32767) ” 
  &&  “ ((-32768) <= a14) ” 
  &&  “ (a14 <= 32767) ” 
  &&  “ ((-32768) <= a15) ” 
  &&  “ (a15 <= 32767) ” 
  &&  “ ((-32768) <= a16) ” 
  &&  “ (a16 <= 32767) ” 
  &&  “ ((-32768) <= a17) ” 
  &&  “ (a17 <= 32767) ” 
  &&  “ ((-32768) <= a18) ” 
  &&  “ (a18 <= 32767) ” 
  &&  “ ((-32768) <= a19) ” 
  &&  “ (a19 <= 32767) ” 
  &&  “ ((-32768) <= a20) ” 
  &&  “ (a20 <= 32767) ” 
  &&  “ ((-32768) <= a21) ” 
  &&  “ (a21 <= 32767) ” 
  &&  “ ((-32768) <= a22) ” 
  &&  “ (a22 <= 32767) ” 
  &&  “ ((-32768) <= a23) ” 
  &&  “ (a23 <= 32767) ” 
  &&  “ ((-32768) <= a24) ” 
  &&  “ (a24 <= 32767) ” 
  &&  “ ((-32768) <= a25) ” 
  &&  “ (a25 <= 32767) ” 
  &&  “ ((-32768) <= a26) ” 
  &&  “ (a26 <= 32767) ” 
  &&  “ ((-32768) <= a27) ” 
  &&  “ (a27 <= 32767) ” 
  &&  “ ((-32768) <= a28) ” 
  &&  “ (a28 <= 32767) ” 
  &&  “ ((-32768) <= a29) ” 
  &&  “ (a29 <= 32767) ” 
  &&  “ ((-32768) <= a30) ” 
  &&  “ (a30 <= 32767) ” 
  &&  “ ((-32768) <= a31) ” 
  &&  “ (a31 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_23 := __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_23_pure -> __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_23_aux.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_24_pure := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (PreH1 : (retval_23 = (qu_u16 (a22)))) (PreH2 : (0 <= retval_23)) (PreH3 : (retval_23 <= 65535)) (PreH4 : (retval_22 = (qu_u16 (a21)))) (PreH5 : (0 <= retval_22)) (PreH6 : (retval_22 <= 65535)) (PreH7 : (retval_21 = (qu_u16 (a20)))) (PreH8 : (0 <= retval_21)) (PreH9 : (retval_21 <= 65535)) (PreH10 : (retval_20 = (qu_u16 (a19)))) (PreH11 : (0 <= retval_20)) (PreH12 : (retval_20 <= 65535)) (PreH13 : (retval_19 = (qu_u16 (a18)))) (PreH14 : (0 <= retval_19)) (PreH15 : (retval_19 <= 65535)) (PreH16 : (retval_18 = (qu_u16 (a17)))) (PreH17 : (0 <= retval_18)) (PreH18 : (retval_18 <= 65535)) (PreH19 : (retval_17 = (qu_u16 (a16)))) (PreH20 : (0 <= retval_17)) (PreH21 : (retval_17 <= 65535)) (PreH22 : (retval_16 = (qu_u16 (a15)))) (PreH23 : (0 <= retval_16)) (PreH24 : (retval_16 <= 65535)) (PreH25 : (retval_15 = (qu_u16 (a14)))) (PreH26 : (0 <= retval_15)) (PreH27 : (retval_15 <= 65535)) (PreH28 : (retval_14 = (qu_u16 (a13)))) (PreH29 : (0 <= retval_14)) (PreH30 : (retval_14 <= 65535)) (PreH31 : (retval_13 = (qu_u16 (a12)))) (PreH32 : (0 <= retval_13)) (PreH33 : (retval_13 <= 65535)) (PreH34 : (retval_12 = (qu_u16 (a11)))) (PreH35 : (0 <= retval_12)) (PreH36 : (retval_12 <= 65535)) (PreH37 : (retval_11 = (qu_u16 (a10)))) (PreH38 : (0 <= retval_11)) (PreH39 : (retval_11 <= 65535)) (PreH40 : (retval_10 = (qu_u16 (a9)))) (PreH41 : (0 <= retval_10)) (PreH42 : (retval_10 <= 65535)) (PreH43 : (retval_9 = (qu_u16 (a8)))) (PreH44 : (0 <= retval_9)) (PreH45 : (retval_9 <= 65535)) (PreH46 : (retval_8 = (qu_u16 (a7)))) (PreH47 : (0 <= retval_8)) (PreH48 : (retval_8 <= 65535)) (PreH49 : (retval_7 = (qu_u16 (a6)))) (PreH50 : (0 <= retval_7)) (PreH51 : (retval_7 <= 65535)) (PreH52 : (retval_6 = (qu_u16 (a5)))) (PreH53 : (0 <= retval_6)) (PreH54 : (retval_6 <= 65535)) (PreH55 : (retval_5 = (qu_u16 (a4)))) (PreH56 : (0 <= retval_5)) (PreH57 : (retval_5 <= 65535)) (PreH58 : (retval_4 = (qu_u16 (a3)))) (PreH59 : (0 <= retval_4)) (PreH60 : (retval_4 <= 65535)) (PreH61 : (retval_3 = (qu_u16 (a2)))) (PreH62 : (0 <= retval_3)) (PreH63 : (retval_3 <= 65535)) (PreH64 : (retval_2 = (qu_u16 (a1)))) (PreH65 : (0 <= retval_2)) (PreH66 : (retval_2 <= 65535)) (PreH67 : (retval = (qu_u16 (a0)))) (PreH68 : (0 <= retval)) (PreH69 : (retval <= 65535)) (PreH70 : ((-32768) <= a0)) (PreH71 : (a0 <= 32767)) (PreH72 : ((-32768) <= a1)) (PreH73 : (a1 <= 32767)) (PreH74 : ((-32768) <= a2)) (PreH75 : (a2 <= 32767)) (PreH76 : ((-32768) <= a3)) (PreH77 : (a3 <= 32767)) (PreH78 : ((-32768) <= a4)) (PreH79 : (a4 <= 32767)) (PreH80 : ((-32768) <= a5)) (PreH81 : (a5 <= 32767)) (PreH82 : ((-32768) <= a6)) (PreH83 : (a6 <= 32767)) (PreH84 : ((-32768) <= a7)) (PreH85 : (a7 <= 32767)) (PreH86 : ((-32768) <= a8)) (PreH87 : (a8 <= 32767)) (PreH88 : ((-32768) <= a9)) (PreH89 : (a9 <= 32767)) (PreH90 : ((-32768) <= a10)) (PreH91 : (a10 <= 32767)) (PreH92 : ((-32768) <= a11)) (PreH93 : (a11 <= 32767)) (PreH94 : ((-32768) <= a12)) (PreH95 : (a12 <= 32767)) (PreH96 : ((-32768) <= a13)) (PreH97 : (a13 <= 32767)) (PreH98 : ((-32768) <= a14)) (PreH99 : (a14 <= 32767)) (PreH100 : ((-32768) <= a15)) (PreH101 : (a15 <= 32767)) (PreH102 : ((-32768) <= a16)) (PreH103 : (a16 <= 32767)) (PreH104 : ((-32768) <= a17)) (PreH105 : (a17 <= 32767)) (PreH106 : ((-32768) <= a18)) (PreH107 : (a18 <= 32767)) (PreH108 : ((-32768) <= a19)) (PreH109 : (a19 <= 32767)) (PreH110 : ((-32768) <= a20)) (PreH111 : (a20 <= 32767)) (PreH112 : ((-32768) <= a21)) (PreH113 : (a21 <= 32767)) (PreH114 : ((-32768) <= a22)) (PreH115 : (a22 <= 32767)) (PreH116 : ((-32768) <= a23)) (PreH117 : (a23 <= 32767)) (PreH118 : ((-32768) <= a24)) (PreH119 : (a24 <= 32767)) (PreH120 : ((-32768) <= a25)) (PreH121 : (a25 <= 32767)) (PreH122 : ((-32768) <= a26)) (PreH123 : (a26 <= 32767)) (PreH124 : ((-32768) <= a27)) (PreH125 : (a27 <= 32767)) (PreH126 : ((-32768) <= a28)) (PreH127 : (a28 <= 32767)) (PreH128 : ((-32768) <= a29)) (PreH129 : (a29 <= 32767)) (PreH130 : ((-32768) <= a30)) (PreH131 : (a30 <= 32767)) (PreH132 : ((-32768) <= a31)) (PreH133 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a23) ” 
  &&  “ (a23 <= INT_MAX) ”
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_24_aux := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (PreH1 : (retval_23 = (qu_u16 (a22)))) (PreH2 : (0 <= retval_23)) (PreH3 : (retval_23 <= 65535)) (PreH4 : (retval_22 = (qu_u16 (a21)))) (PreH5 : (0 <= retval_22)) (PreH6 : (retval_22 <= 65535)) (PreH7 : (retval_21 = (qu_u16 (a20)))) (PreH8 : (0 <= retval_21)) (PreH9 : (retval_21 <= 65535)) (PreH10 : (retval_20 = (qu_u16 (a19)))) (PreH11 : (0 <= retval_20)) (PreH12 : (retval_20 <= 65535)) (PreH13 : (retval_19 = (qu_u16 (a18)))) (PreH14 : (0 <= retval_19)) (PreH15 : (retval_19 <= 65535)) (PreH16 : (retval_18 = (qu_u16 (a17)))) (PreH17 : (0 <= retval_18)) (PreH18 : (retval_18 <= 65535)) (PreH19 : (retval_17 = (qu_u16 (a16)))) (PreH20 : (0 <= retval_17)) (PreH21 : (retval_17 <= 65535)) (PreH22 : (retval_16 = (qu_u16 (a15)))) (PreH23 : (0 <= retval_16)) (PreH24 : (retval_16 <= 65535)) (PreH25 : (retval_15 = (qu_u16 (a14)))) (PreH26 : (0 <= retval_15)) (PreH27 : (retval_15 <= 65535)) (PreH28 : (retval_14 = (qu_u16 (a13)))) (PreH29 : (0 <= retval_14)) (PreH30 : (retval_14 <= 65535)) (PreH31 : (retval_13 = (qu_u16 (a12)))) (PreH32 : (0 <= retval_13)) (PreH33 : (retval_13 <= 65535)) (PreH34 : (retval_12 = (qu_u16 (a11)))) (PreH35 : (0 <= retval_12)) (PreH36 : (retval_12 <= 65535)) (PreH37 : (retval_11 = (qu_u16 (a10)))) (PreH38 : (0 <= retval_11)) (PreH39 : (retval_11 <= 65535)) (PreH40 : (retval_10 = (qu_u16 (a9)))) (PreH41 : (0 <= retval_10)) (PreH42 : (retval_10 <= 65535)) (PreH43 : (retval_9 = (qu_u16 (a8)))) (PreH44 : (0 <= retval_9)) (PreH45 : (retval_9 <= 65535)) (PreH46 : (retval_8 = (qu_u16 (a7)))) (PreH47 : (0 <= retval_8)) (PreH48 : (retval_8 <= 65535)) (PreH49 : (retval_7 = (qu_u16 (a6)))) (PreH50 : (0 <= retval_7)) (PreH51 : (retval_7 <= 65535)) (PreH52 : (retval_6 = (qu_u16 (a5)))) (PreH53 : (0 <= retval_6)) (PreH54 : (retval_6 <= 65535)) (PreH55 : (retval_5 = (qu_u16 (a4)))) (PreH56 : (0 <= retval_5)) (PreH57 : (retval_5 <= 65535)) (PreH58 : (retval_4 = (qu_u16 (a3)))) (PreH59 : (0 <= retval_4)) (PreH60 : (retval_4 <= 65535)) (PreH61 : (retval_3 = (qu_u16 (a2)))) (PreH62 : (0 <= retval_3)) (PreH63 : (retval_3 <= 65535)) (PreH64 : (retval_2 = (qu_u16 (a1)))) (PreH65 : (0 <= retval_2)) (PreH66 : (retval_2 <= 65535)) (PreH67 : (retval = (qu_u16 (a0)))) (PreH68 : (0 <= retval)) (PreH69 : (retval <= 65535)) (PreH70 : ((-32768) <= a0)) (PreH71 : (a0 <= 32767)) (PreH72 : ((-32768) <= a1)) (PreH73 : (a1 <= 32767)) (PreH74 : ((-32768) <= a2)) (PreH75 : (a2 <= 32767)) (PreH76 : ((-32768) <= a3)) (PreH77 : (a3 <= 32767)) (PreH78 : ((-32768) <= a4)) (PreH79 : (a4 <= 32767)) (PreH80 : ((-32768) <= a5)) (PreH81 : (a5 <= 32767)) (PreH82 : ((-32768) <= a6)) (PreH83 : (a6 <= 32767)) (PreH84 : ((-32768) <= a7)) (PreH85 : (a7 <= 32767)) (PreH86 : ((-32768) <= a8)) (PreH87 : (a8 <= 32767)) (PreH88 : ((-32768) <= a9)) (PreH89 : (a9 <= 32767)) (PreH90 : ((-32768) <= a10)) (PreH91 : (a10 <= 32767)) (PreH92 : ((-32768) <= a11)) (PreH93 : (a11 <= 32767)) (PreH94 : ((-32768) <= a12)) (PreH95 : (a12 <= 32767)) (PreH96 : ((-32768) <= a13)) (PreH97 : (a13 <= 32767)) (PreH98 : ((-32768) <= a14)) (PreH99 : (a14 <= 32767)) (PreH100 : ((-32768) <= a15)) (PreH101 : (a15 <= 32767)) (PreH102 : ((-32768) <= a16)) (PreH103 : (a16 <= 32767)) (PreH104 : ((-32768) <= a17)) (PreH105 : (a17 <= 32767)) (PreH106 : ((-32768) <= a18)) (PreH107 : (a18 <= 32767)) (PreH108 : ((-32768) <= a19)) (PreH109 : (a19 <= 32767)) (PreH110 : ((-32768) <= a20)) (PreH111 : (a20 <= 32767)) (PreH112 : ((-32768) <= a21)) (PreH113 : (a21 <= 32767)) (PreH114 : ((-32768) <= a22)) (PreH115 : (a22 <= 32767)) (PreH116 : ((-32768) <= a23)) (PreH117 : (a23 <= 32767)) (PreH118 : ((-32768) <= a24)) (PreH119 : (a24 <= 32767)) (PreH120 : ((-32768) <= a25)) (PreH121 : (a25 <= 32767)) (PreH122 : ((-32768) <= a26)) (PreH123 : (a26 <= 32767)) (PreH124 : ((-32768) <= a27)) (PreH125 : (a27 <= 32767)) (PreH126 : ((-32768) <= a28)) (PreH127 : (a28 <= 32767)) (PreH128 : ((-32768) <= a29)) (PreH129 : (a29 <= 32767)) (PreH130 : ((-32768) <= a30)) (PreH131 : (a30 <= 32767)) (PreH132 : ((-32768) <= a31)) (PreH133 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a23) ” 
  &&  “ (a23 <= INT_MAX) ” 
  &&  “ (retval_23 = (qu_u16 (a22))) ” 
  &&  “ (0 <= retval_23) ” 
  &&  “ (retval_23 <= 65535) ” 
  &&  “ (retval_22 = (qu_u16 (a21))) ” 
  &&  “ (0 <= retval_22) ” 
  &&  “ (retval_22 <= 65535) ” 
  &&  “ (retval_21 = (qu_u16 (a20))) ” 
  &&  “ (0 <= retval_21) ” 
  &&  “ (retval_21 <= 65535) ” 
  &&  “ (retval_20 = (qu_u16 (a19))) ” 
  &&  “ (0 <= retval_20) ” 
  &&  “ (retval_20 <= 65535) ” 
  &&  “ (retval_19 = (qu_u16 (a18))) ” 
  &&  “ (0 <= retval_19) ” 
  &&  “ (retval_19 <= 65535) ” 
  &&  “ (retval_18 = (qu_u16 (a17))) ” 
  &&  “ (0 <= retval_18) ” 
  &&  “ (retval_18 <= 65535) ” 
  &&  “ (retval_17 = (qu_u16 (a16))) ” 
  &&  “ (0 <= retval_17) ” 
  &&  “ (retval_17 <= 65535) ” 
  &&  “ (retval_16 = (qu_u16 (a15))) ” 
  &&  “ (0 <= retval_16) ” 
  &&  “ (retval_16 <= 65535) ” 
  &&  “ (retval_15 = (qu_u16 (a14))) ” 
  &&  “ (0 <= retval_15) ” 
  &&  “ (retval_15 <= 65535) ” 
  &&  “ (retval_14 = (qu_u16 (a13))) ” 
  &&  “ (0 <= retval_14) ” 
  &&  “ (retval_14 <= 65535) ” 
  &&  “ (retval_13 = (qu_u16 (a12))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= 65535) ” 
  &&  “ (retval_12 = (qu_u16 (a11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= 65535) ” 
  &&  “ (retval_11 = (qu_u16 (a10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= 65535) ” 
  &&  “ (retval_10 = (qu_u16 (a9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= 65535) ” 
  &&  “ (retval_9 = (qu_u16 (a8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= 65535) ” 
  &&  “ (retval_8 = (qu_u16 (a7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= 65535) ” 
  &&  “ (retval_7 = (qu_u16 (a6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 65535) ” 
  &&  “ (retval_6 = (qu_u16 (a5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 65535) ” 
  &&  “ (retval_5 = (qu_u16 (a4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 65535) ” 
  &&  “ (retval_4 = (qu_u16 (a3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 65535) ” 
  &&  “ (retval_3 = (qu_u16 (a2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (qu_u16 (a1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (qu_u16 (a0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= a8) ” 
  &&  “ (a8 <= 32767) ” 
  &&  “ ((-32768) <= a9) ” 
  &&  “ (a9 <= 32767) ” 
  &&  “ ((-32768) <= a10) ” 
  &&  “ (a10 <= 32767) ” 
  &&  “ ((-32768) <= a11) ” 
  &&  “ (a11 <= 32767) ” 
  &&  “ ((-32768) <= a12) ” 
  &&  “ (a12 <= 32767) ” 
  &&  “ ((-32768) <= a13) ” 
  &&  “ (a13 <= 32767) ” 
  &&  “ ((-32768) <= a14) ” 
  &&  “ (a14 <= 32767) ” 
  &&  “ ((-32768) <= a15) ” 
  &&  “ (a15 <= 32767) ” 
  &&  “ ((-32768) <= a16) ” 
  &&  “ (a16 <= 32767) ” 
  &&  “ ((-32768) <= a17) ” 
  &&  “ (a17 <= 32767) ” 
  &&  “ ((-32768) <= a18) ” 
  &&  “ (a18 <= 32767) ” 
  &&  “ ((-32768) <= a19) ” 
  &&  “ (a19 <= 32767) ” 
  &&  “ ((-32768) <= a20) ” 
  &&  “ (a20 <= 32767) ” 
  &&  “ ((-32768) <= a21) ” 
  &&  “ (a21 <= 32767) ” 
  &&  “ ((-32768) <= a22) ” 
  &&  “ (a22 <= 32767) ” 
  &&  “ ((-32768) <= a23) ” 
  &&  “ (a23 <= 32767) ” 
  &&  “ ((-32768) <= a24) ” 
  &&  “ (a24 <= 32767) ” 
  &&  “ ((-32768) <= a25) ” 
  &&  “ (a25 <= 32767) ” 
  &&  “ ((-32768) <= a26) ” 
  &&  “ (a26 <= 32767) ” 
  &&  “ ((-32768) <= a27) ” 
  &&  “ (a27 <= 32767) ” 
  &&  “ ((-32768) <= a28) ” 
  &&  “ (a28 <= 32767) ” 
  &&  “ ((-32768) <= a29) ” 
  &&  “ (a29 <= 32767) ” 
  &&  “ ((-32768) <= a30) ” 
  &&  “ (a30 <= 32767) ” 
  &&  “ ((-32768) <= a31) ” 
  &&  “ (a31 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_24 := __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_24_pure -> __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_24_aux.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_25_pure := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (PreH1 : (retval_24 = (qu_u16 (a23)))) (PreH2 : (0 <= retval_24)) (PreH3 : (retval_24 <= 65535)) (PreH4 : (retval_23 = (qu_u16 (a22)))) (PreH5 : (0 <= retval_23)) (PreH6 : (retval_23 <= 65535)) (PreH7 : (retval_22 = (qu_u16 (a21)))) (PreH8 : (0 <= retval_22)) (PreH9 : (retval_22 <= 65535)) (PreH10 : (retval_21 = (qu_u16 (a20)))) (PreH11 : (0 <= retval_21)) (PreH12 : (retval_21 <= 65535)) (PreH13 : (retval_20 = (qu_u16 (a19)))) (PreH14 : (0 <= retval_20)) (PreH15 : (retval_20 <= 65535)) (PreH16 : (retval_19 = (qu_u16 (a18)))) (PreH17 : (0 <= retval_19)) (PreH18 : (retval_19 <= 65535)) (PreH19 : (retval_18 = (qu_u16 (a17)))) (PreH20 : (0 <= retval_18)) (PreH21 : (retval_18 <= 65535)) (PreH22 : (retval_17 = (qu_u16 (a16)))) (PreH23 : (0 <= retval_17)) (PreH24 : (retval_17 <= 65535)) (PreH25 : (retval_16 = (qu_u16 (a15)))) (PreH26 : (0 <= retval_16)) (PreH27 : (retval_16 <= 65535)) (PreH28 : (retval_15 = (qu_u16 (a14)))) (PreH29 : (0 <= retval_15)) (PreH30 : (retval_15 <= 65535)) (PreH31 : (retval_14 = (qu_u16 (a13)))) (PreH32 : (0 <= retval_14)) (PreH33 : (retval_14 <= 65535)) (PreH34 : (retval_13 = (qu_u16 (a12)))) (PreH35 : (0 <= retval_13)) (PreH36 : (retval_13 <= 65535)) (PreH37 : (retval_12 = (qu_u16 (a11)))) (PreH38 : (0 <= retval_12)) (PreH39 : (retval_12 <= 65535)) (PreH40 : (retval_11 = (qu_u16 (a10)))) (PreH41 : (0 <= retval_11)) (PreH42 : (retval_11 <= 65535)) (PreH43 : (retval_10 = (qu_u16 (a9)))) (PreH44 : (0 <= retval_10)) (PreH45 : (retval_10 <= 65535)) (PreH46 : (retval_9 = (qu_u16 (a8)))) (PreH47 : (0 <= retval_9)) (PreH48 : (retval_9 <= 65535)) (PreH49 : (retval_8 = (qu_u16 (a7)))) (PreH50 : (0 <= retval_8)) (PreH51 : (retval_8 <= 65535)) (PreH52 : (retval_7 = (qu_u16 (a6)))) (PreH53 : (0 <= retval_7)) (PreH54 : (retval_7 <= 65535)) (PreH55 : (retval_6 = (qu_u16 (a5)))) (PreH56 : (0 <= retval_6)) (PreH57 : (retval_6 <= 65535)) (PreH58 : (retval_5 = (qu_u16 (a4)))) (PreH59 : (0 <= retval_5)) (PreH60 : (retval_5 <= 65535)) (PreH61 : (retval_4 = (qu_u16 (a3)))) (PreH62 : (0 <= retval_4)) (PreH63 : (retval_4 <= 65535)) (PreH64 : (retval_3 = (qu_u16 (a2)))) (PreH65 : (0 <= retval_3)) (PreH66 : (retval_3 <= 65535)) (PreH67 : (retval_2 = (qu_u16 (a1)))) (PreH68 : (0 <= retval_2)) (PreH69 : (retval_2 <= 65535)) (PreH70 : (retval = (qu_u16 (a0)))) (PreH71 : (0 <= retval)) (PreH72 : (retval <= 65535)) (PreH73 : ((-32768) <= a0)) (PreH74 : (a0 <= 32767)) (PreH75 : ((-32768) <= a1)) (PreH76 : (a1 <= 32767)) (PreH77 : ((-32768) <= a2)) (PreH78 : (a2 <= 32767)) (PreH79 : ((-32768) <= a3)) (PreH80 : (a3 <= 32767)) (PreH81 : ((-32768) <= a4)) (PreH82 : (a4 <= 32767)) (PreH83 : ((-32768) <= a5)) (PreH84 : (a5 <= 32767)) (PreH85 : ((-32768) <= a6)) (PreH86 : (a6 <= 32767)) (PreH87 : ((-32768) <= a7)) (PreH88 : (a7 <= 32767)) (PreH89 : ((-32768) <= a8)) (PreH90 : (a8 <= 32767)) (PreH91 : ((-32768) <= a9)) (PreH92 : (a9 <= 32767)) (PreH93 : ((-32768) <= a10)) (PreH94 : (a10 <= 32767)) (PreH95 : ((-32768) <= a11)) (PreH96 : (a11 <= 32767)) (PreH97 : ((-32768) <= a12)) (PreH98 : (a12 <= 32767)) (PreH99 : ((-32768) <= a13)) (PreH100 : (a13 <= 32767)) (PreH101 : ((-32768) <= a14)) (PreH102 : (a14 <= 32767)) (PreH103 : ((-32768) <= a15)) (PreH104 : (a15 <= 32767)) (PreH105 : ((-32768) <= a16)) (PreH106 : (a16 <= 32767)) (PreH107 : ((-32768) <= a17)) (PreH108 : (a17 <= 32767)) (PreH109 : ((-32768) <= a18)) (PreH110 : (a18 <= 32767)) (PreH111 : ((-32768) <= a19)) (PreH112 : (a19 <= 32767)) (PreH113 : ((-32768) <= a20)) (PreH114 : (a20 <= 32767)) (PreH115 : ((-32768) <= a21)) (PreH116 : (a21 <= 32767)) (PreH117 : ((-32768) <= a22)) (PreH118 : (a22 <= 32767)) (PreH119 : ((-32768) <= a23)) (PreH120 : (a23 <= 32767)) (PreH121 : ((-32768) <= a24)) (PreH122 : (a24 <= 32767)) (PreH123 : ((-32768) <= a25)) (PreH124 : (a25 <= 32767)) (PreH125 : ((-32768) <= a26)) (PreH126 : (a26 <= 32767)) (PreH127 : ((-32768) <= a27)) (PreH128 : (a27 <= 32767)) (PreH129 : ((-32768) <= a28)) (PreH130 : (a28 <= 32767)) (PreH131 : ((-32768) <= a29)) (PreH132 : (a29 <= 32767)) (PreH133 : ((-32768) <= a30)) (PreH134 : (a30 <= 32767)) (PreH135 : ((-32768) <= a31)) (PreH136 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a24) ” 
  &&  “ (a24 <= INT_MAX) ”
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_25_aux := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (PreH1 : (retval_24 = (qu_u16 (a23)))) (PreH2 : (0 <= retval_24)) (PreH3 : (retval_24 <= 65535)) (PreH4 : (retval_23 = (qu_u16 (a22)))) (PreH5 : (0 <= retval_23)) (PreH6 : (retval_23 <= 65535)) (PreH7 : (retval_22 = (qu_u16 (a21)))) (PreH8 : (0 <= retval_22)) (PreH9 : (retval_22 <= 65535)) (PreH10 : (retval_21 = (qu_u16 (a20)))) (PreH11 : (0 <= retval_21)) (PreH12 : (retval_21 <= 65535)) (PreH13 : (retval_20 = (qu_u16 (a19)))) (PreH14 : (0 <= retval_20)) (PreH15 : (retval_20 <= 65535)) (PreH16 : (retval_19 = (qu_u16 (a18)))) (PreH17 : (0 <= retval_19)) (PreH18 : (retval_19 <= 65535)) (PreH19 : (retval_18 = (qu_u16 (a17)))) (PreH20 : (0 <= retval_18)) (PreH21 : (retval_18 <= 65535)) (PreH22 : (retval_17 = (qu_u16 (a16)))) (PreH23 : (0 <= retval_17)) (PreH24 : (retval_17 <= 65535)) (PreH25 : (retval_16 = (qu_u16 (a15)))) (PreH26 : (0 <= retval_16)) (PreH27 : (retval_16 <= 65535)) (PreH28 : (retval_15 = (qu_u16 (a14)))) (PreH29 : (0 <= retval_15)) (PreH30 : (retval_15 <= 65535)) (PreH31 : (retval_14 = (qu_u16 (a13)))) (PreH32 : (0 <= retval_14)) (PreH33 : (retval_14 <= 65535)) (PreH34 : (retval_13 = (qu_u16 (a12)))) (PreH35 : (0 <= retval_13)) (PreH36 : (retval_13 <= 65535)) (PreH37 : (retval_12 = (qu_u16 (a11)))) (PreH38 : (0 <= retval_12)) (PreH39 : (retval_12 <= 65535)) (PreH40 : (retval_11 = (qu_u16 (a10)))) (PreH41 : (0 <= retval_11)) (PreH42 : (retval_11 <= 65535)) (PreH43 : (retval_10 = (qu_u16 (a9)))) (PreH44 : (0 <= retval_10)) (PreH45 : (retval_10 <= 65535)) (PreH46 : (retval_9 = (qu_u16 (a8)))) (PreH47 : (0 <= retval_9)) (PreH48 : (retval_9 <= 65535)) (PreH49 : (retval_8 = (qu_u16 (a7)))) (PreH50 : (0 <= retval_8)) (PreH51 : (retval_8 <= 65535)) (PreH52 : (retval_7 = (qu_u16 (a6)))) (PreH53 : (0 <= retval_7)) (PreH54 : (retval_7 <= 65535)) (PreH55 : (retval_6 = (qu_u16 (a5)))) (PreH56 : (0 <= retval_6)) (PreH57 : (retval_6 <= 65535)) (PreH58 : (retval_5 = (qu_u16 (a4)))) (PreH59 : (0 <= retval_5)) (PreH60 : (retval_5 <= 65535)) (PreH61 : (retval_4 = (qu_u16 (a3)))) (PreH62 : (0 <= retval_4)) (PreH63 : (retval_4 <= 65535)) (PreH64 : (retval_3 = (qu_u16 (a2)))) (PreH65 : (0 <= retval_3)) (PreH66 : (retval_3 <= 65535)) (PreH67 : (retval_2 = (qu_u16 (a1)))) (PreH68 : (0 <= retval_2)) (PreH69 : (retval_2 <= 65535)) (PreH70 : (retval = (qu_u16 (a0)))) (PreH71 : (0 <= retval)) (PreH72 : (retval <= 65535)) (PreH73 : ((-32768) <= a0)) (PreH74 : (a0 <= 32767)) (PreH75 : ((-32768) <= a1)) (PreH76 : (a1 <= 32767)) (PreH77 : ((-32768) <= a2)) (PreH78 : (a2 <= 32767)) (PreH79 : ((-32768) <= a3)) (PreH80 : (a3 <= 32767)) (PreH81 : ((-32768) <= a4)) (PreH82 : (a4 <= 32767)) (PreH83 : ((-32768) <= a5)) (PreH84 : (a5 <= 32767)) (PreH85 : ((-32768) <= a6)) (PreH86 : (a6 <= 32767)) (PreH87 : ((-32768) <= a7)) (PreH88 : (a7 <= 32767)) (PreH89 : ((-32768) <= a8)) (PreH90 : (a8 <= 32767)) (PreH91 : ((-32768) <= a9)) (PreH92 : (a9 <= 32767)) (PreH93 : ((-32768) <= a10)) (PreH94 : (a10 <= 32767)) (PreH95 : ((-32768) <= a11)) (PreH96 : (a11 <= 32767)) (PreH97 : ((-32768) <= a12)) (PreH98 : (a12 <= 32767)) (PreH99 : ((-32768) <= a13)) (PreH100 : (a13 <= 32767)) (PreH101 : ((-32768) <= a14)) (PreH102 : (a14 <= 32767)) (PreH103 : ((-32768) <= a15)) (PreH104 : (a15 <= 32767)) (PreH105 : ((-32768) <= a16)) (PreH106 : (a16 <= 32767)) (PreH107 : ((-32768) <= a17)) (PreH108 : (a17 <= 32767)) (PreH109 : ((-32768) <= a18)) (PreH110 : (a18 <= 32767)) (PreH111 : ((-32768) <= a19)) (PreH112 : (a19 <= 32767)) (PreH113 : ((-32768) <= a20)) (PreH114 : (a20 <= 32767)) (PreH115 : ((-32768) <= a21)) (PreH116 : (a21 <= 32767)) (PreH117 : ((-32768) <= a22)) (PreH118 : (a22 <= 32767)) (PreH119 : ((-32768) <= a23)) (PreH120 : (a23 <= 32767)) (PreH121 : ((-32768) <= a24)) (PreH122 : (a24 <= 32767)) (PreH123 : ((-32768) <= a25)) (PreH124 : (a25 <= 32767)) (PreH125 : ((-32768) <= a26)) (PreH126 : (a26 <= 32767)) (PreH127 : ((-32768) <= a27)) (PreH128 : (a27 <= 32767)) (PreH129 : ((-32768) <= a28)) (PreH130 : (a28 <= 32767)) (PreH131 : ((-32768) <= a29)) (PreH132 : (a29 <= 32767)) (PreH133 : ((-32768) <= a30)) (PreH134 : (a30 <= 32767)) (PreH135 : ((-32768) <= a31)) (PreH136 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a24) ” 
  &&  “ (a24 <= INT_MAX) ” 
  &&  “ (retval_24 = (qu_u16 (a23))) ” 
  &&  “ (0 <= retval_24) ” 
  &&  “ (retval_24 <= 65535) ” 
  &&  “ (retval_23 = (qu_u16 (a22))) ” 
  &&  “ (0 <= retval_23) ” 
  &&  “ (retval_23 <= 65535) ” 
  &&  “ (retval_22 = (qu_u16 (a21))) ” 
  &&  “ (0 <= retval_22) ” 
  &&  “ (retval_22 <= 65535) ” 
  &&  “ (retval_21 = (qu_u16 (a20))) ” 
  &&  “ (0 <= retval_21) ” 
  &&  “ (retval_21 <= 65535) ” 
  &&  “ (retval_20 = (qu_u16 (a19))) ” 
  &&  “ (0 <= retval_20) ” 
  &&  “ (retval_20 <= 65535) ” 
  &&  “ (retval_19 = (qu_u16 (a18))) ” 
  &&  “ (0 <= retval_19) ” 
  &&  “ (retval_19 <= 65535) ” 
  &&  “ (retval_18 = (qu_u16 (a17))) ” 
  &&  “ (0 <= retval_18) ” 
  &&  “ (retval_18 <= 65535) ” 
  &&  “ (retval_17 = (qu_u16 (a16))) ” 
  &&  “ (0 <= retval_17) ” 
  &&  “ (retval_17 <= 65535) ” 
  &&  “ (retval_16 = (qu_u16 (a15))) ” 
  &&  “ (0 <= retval_16) ” 
  &&  “ (retval_16 <= 65535) ” 
  &&  “ (retval_15 = (qu_u16 (a14))) ” 
  &&  “ (0 <= retval_15) ” 
  &&  “ (retval_15 <= 65535) ” 
  &&  “ (retval_14 = (qu_u16 (a13))) ” 
  &&  “ (0 <= retval_14) ” 
  &&  “ (retval_14 <= 65535) ” 
  &&  “ (retval_13 = (qu_u16 (a12))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= 65535) ” 
  &&  “ (retval_12 = (qu_u16 (a11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= 65535) ” 
  &&  “ (retval_11 = (qu_u16 (a10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= 65535) ” 
  &&  “ (retval_10 = (qu_u16 (a9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= 65535) ” 
  &&  “ (retval_9 = (qu_u16 (a8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= 65535) ” 
  &&  “ (retval_8 = (qu_u16 (a7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= 65535) ” 
  &&  “ (retval_7 = (qu_u16 (a6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 65535) ” 
  &&  “ (retval_6 = (qu_u16 (a5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 65535) ” 
  &&  “ (retval_5 = (qu_u16 (a4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 65535) ” 
  &&  “ (retval_4 = (qu_u16 (a3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 65535) ” 
  &&  “ (retval_3 = (qu_u16 (a2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (qu_u16 (a1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (qu_u16 (a0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= a8) ” 
  &&  “ (a8 <= 32767) ” 
  &&  “ ((-32768) <= a9) ” 
  &&  “ (a9 <= 32767) ” 
  &&  “ ((-32768) <= a10) ” 
  &&  “ (a10 <= 32767) ” 
  &&  “ ((-32768) <= a11) ” 
  &&  “ (a11 <= 32767) ” 
  &&  “ ((-32768) <= a12) ” 
  &&  “ (a12 <= 32767) ” 
  &&  “ ((-32768) <= a13) ” 
  &&  “ (a13 <= 32767) ” 
  &&  “ ((-32768) <= a14) ” 
  &&  “ (a14 <= 32767) ” 
  &&  “ ((-32768) <= a15) ” 
  &&  “ (a15 <= 32767) ” 
  &&  “ ((-32768) <= a16) ” 
  &&  “ (a16 <= 32767) ” 
  &&  “ ((-32768) <= a17) ” 
  &&  “ (a17 <= 32767) ” 
  &&  “ ((-32768) <= a18) ” 
  &&  “ (a18 <= 32767) ” 
  &&  “ ((-32768) <= a19) ” 
  &&  “ (a19 <= 32767) ” 
  &&  “ ((-32768) <= a20) ” 
  &&  “ (a20 <= 32767) ” 
  &&  “ ((-32768) <= a21) ” 
  &&  “ (a21 <= 32767) ” 
  &&  “ ((-32768) <= a22) ” 
  &&  “ (a22 <= 32767) ” 
  &&  “ ((-32768) <= a23) ” 
  &&  “ (a23 <= 32767) ” 
  &&  “ ((-32768) <= a24) ” 
  &&  “ (a24 <= 32767) ” 
  &&  “ ((-32768) <= a25) ” 
  &&  “ (a25 <= 32767) ” 
  &&  “ ((-32768) <= a26) ” 
  &&  “ (a26 <= 32767) ” 
  &&  “ ((-32768) <= a27) ” 
  &&  “ (a27 <= 32767) ” 
  &&  “ ((-32768) <= a28) ” 
  &&  “ (a28 <= 32767) ” 
  &&  “ ((-32768) <= a29) ” 
  &&  “ (a29 <= 32767) ” 
  &&  “ ((-32768) <= a30) ” 
  &&  “ (a30 <= 32767) ” 
  &&  “ ((-32768) <= a31) ” 
  &&  “ (a31 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_25 := __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_25_pure -> __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_25_aux.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_26_pure := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (PreH1 : (retval_25 = (qu_u16 (a24)))) (PreH2 : (0 <= retval_25)) (PreH3 : (retval_25 <= 65535)) (PreH4 : (retval_24 = (qu_u16 (a23)))) (PreH5 : (0 <= retval_24)) (PreH6 : (retval_24 <= 65535)) (PreH7 : (retval_23 = (qu_u16 (a22)))) (PreH8 : (0 <= retval_23)) (PreH9 : (retval_23 <= 65535)) (PreH10 : (retval_22 = (qu_u16 (a21)))) (PreH11 : (0 <= retval_22)) (PreH12 : (retval_22 <= 65535)) (PreH13 : (retval_21 = (qu_u16 (a20)))) (PreH14 : (0 <= retval_21)) (PreH15 : (retval_21 <= 65535)) (PreH16 : (retval_20 = (qu_u16 (a19)))) (PreH17 : (0 <= retval_20)) (PreH18 : (retval_20 <= 65535)) (PreH19 : (retval_19 = (qu_u16 (a18)))) (PreH20 : (0 <= retval_19)) (PreH21 : (retval_19 <= 65535)) (PreH22 : (retval_18 = (qu_u16 (a17)))) (PreH23 : (0 <= retval_18)) (PreH24 : (retval_18 <= 65535)) (PreH25 : (retval_17 = (qu_u16 (a16)))) (PreH26 : (0 <= retval_17)) (PreH27 : (retval_17 <= 65535)) (PreH28 : (retval_16 = (qu_u16 (a15)))) (PreH29 : (0 <= retval_16)) (PreH30 : (retval_16 <= 65535)) (PreH31 : (retval_15 = (qu_u16 (a14)))) (PreH32 : (0 <= retval_15)) (PreH33 : (retval_15 <= 65535)) (PreH34 : (retval_14 = (qu_u16 (a13)))) (PreH35 : (0 <= retval_14)) (PreH36 : (retval_14 <= 65535)) (PreH37 : (retval_13 = (qu_u16 (a12)))) (PreH38 : (0 <= retval_13)) (PreH39 : (retval_13 <= 65535)) (PreH40 : (retval_12 = (qu_u16 (a11)))) (PreH41 : (0 <= retval_12)) (PreH42 : (retval_12 <= 65535)) (PreH43 : (retval_11 = (qu_u16 (a10)))) (PreH44 : (0 <= retval_11)) (PreH45 : (retval_11 <= 65535)) (PreH46 : (retval_10 = (qu_u16 (a9)))) (PreH47 : (0 <= retval_10)) (PreH48 : (retval_10 <= 65535)) (PreH49 : (retval_9 = (qu_u16 (a8)))) (PreH50 : (0 <= retval_9)) (PreH51 : (retval_9 <= 65535)) (PreH52 : (retval_8 = (qu_u16 (a7)))) (PreH53 : (0 <= retval_8)) (PreH54 : (retval_8 <= 65535)) (PreH55 : (retval_7 = (qu_u16 (a6)))) (PreH56 : (0 <= retval_7)) (PreH57 : (retval_7 <= 65535)) (PreH58 : (retval_6 = (qu_u16 (a5)))) (PreH59 : (0 <= retval_6)) (PreH60 : (retval_6 <= 65535)) (PreH61 : (retval_5 = (qu_u16 (a4)))) (PreH62 : (0 <= retval_5)) (PreH63 : (retval_5 <= 65535)) (PreH64 : (retval_4 = (qu_u16 (a3)))) (PreH65 : (0 <= retval_4)) (PreH66 : (retval_4 <= 65535)) (PreH67 : (retval_3 = (qu_u16 (a2)))) (PreH68 : (0 <= retval_3)) (PreH69 : (retval_3 <= 65535)) (PreH70 : (retval_2 = (qu_u16 (a1)))) (PreH71 : (0 <= retval_2)) (PreH72 : (retval_2 <= 65535)) (PreH73 : (retval = (qu_u16 (a0)))) (PreH74 : (0 <= retval)) (PreH75 : (retval <= 65535)) (PreH76 : ((-32768) <= a0)) (PreH77 : (a0 <= 32767)) (PreH78 : ((-32768) <= a1)) (PreH79 : (a1 <= 32767)) (PreH80 : ((-32768) <= a2)) (PreH81 : (a2 <= 32767)) (PreH82 : ((-32768) <= a3)) (PreH83 : (a3 <= 32767)) (PreH84 : ((-32768) <= a4)) (PreH85 : (a4 <= 32767)) (PreH86 : ((-32768) <= a5)) (PreH87 : (a5 <= 32767)) (PreH88 : ((-32768) <= a6)) (PreH89 : (a6 <= 32767)) (PreH90 : ((-32768) <= a7)) (PreH91 : (a7 <= 32767)) (PreH92 : ((-32768) <= a8)) (PreH93 : (a8 <= 32767)) (PreH94 : ((-32768) <= a9)) (PreH95 : (a9 <= 32767)) (PreH96 : ((-32768) <= a10)) (PreH97 : (a10 <= 32767)) (PreH98 : ((-32768) <= a11)) (PreH99 : (a11 <= 32767)) (PreH100 : ((-32768) <= a12)) (PreH101 : (a12 <= 32767)) (PreH102 : ((-32768) <= a13)) (PreH103 : (a13 <= 32767)) (PreH104 : ((-32768) <= a14)) (PreH105 : (a14 <= 32767)) (PreH106 : ((-32768) <= a15)) (PreH107 : (a15 <= 32767)) (PreH108 : ((-32768) <= a16)) (PreH109 : (a16 <= 32767)) (PreH110 : ((-32768) <= a17)) (PreH111 : (a17 <= 32767)) (PreH112 : ((-32768) <= a18)) (PreH113 : (a18 <= 32767)) (PreH114 : ((-32768) <= a19)) (PreH115 : (a19 <= 32767)) (PreH116 : ((-32768) <= a20)) (PreH117 : (a20 <= 32767)) (PreH118 : ((-32768) <= a21)) (PreH119 : (a21 <= 32767)) (PreH120 : ((-32768) <= a22)) (PreH121 : (a22 <= 32767)) (PreH122 : ((-32768) <= a23)) (PreH123 : (a23 <= 32767)) (PreH124 : ((-32768) <= a24)) (PreH125 : (a24 <= 32767)) (PreH126 : ((-32768) <= a25)) (PreH127 : (a25 <= 32767)) (PreH128 : ((-32768) <= a26)) (PreH129 : (a26 <= 32767)) (PreH130 : ((-32768) <= a27)) (PreH131 : (a27 <= 32767)) (PreH132 : ((-32768) <= a28)) (PreH133 : (a28 <= 32767)) (PreH134 : ((-32768) <= a29)) (PreH135 : (a29 <= 32767)) (PreH136 : ((-32768) <= a30)) (PreH137 : (a30 <= 32767)) (PreH138 : ((-32768) <= a31)) (PreH139 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a25) ” 
  &&  “ (a25 <= INT_MAX) ”
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_26_aux := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (PreH1 : (retval_25 = (qu_u16 (a24)))) (PreH2 : (0 <= retval_25)) (PreH3 : (retval_25 <= 65535)) (PreH4 : (retval_24 = (qu_u16 (a23)))) (PreH5 : (0 <= retval_24)) (PreH6 : (retval_24 <= 65535)) (PreH7 : (retval_23 = (qu_u16 (a22)))) (PreH8 : (0 <= retval_23)) (PreH9 : (retval_23 <= 65535)) (PreH10 : (retval_22 = (qu_u16 (a21)))) (PreH11 : (0 <= retval_22)) (PreH12 : (retval_22 <= 65535)) (PreH13 : (retval_21 = (qu_u16 (a20)))) (PreH14 : (0 <= retval_21)) (PreH15 : (retval_21 <= 65535)) (PreH16 : (retval_20 = (qu_u16 (a19)))) (PreH17 : (0 <= retval_20)) (PreH18 : (retval_20 <= 65535)) (PreH19 : (retval_19 = (qu_u16 (a18)))) (PreH20 : (0 <= retval_19)) (PreH21 : (retval_19 <= 65535)) (PreH22 : (retval_18 = (qu_u16 (a17)))) (PreH23 : (0 <= retval_18)) (PreH24 : (retval_18 <= 65535)) (PreH25 : (retval_17 = (qu_u16 (a16)))) (PreH26 : (0 <= retval_17)) (PreH27 : (retval_17 <= 65535)) (PreH28 : (retval_16 = (qu_u16 (a15)))) (PreH29 : (0 <= retval_16)) (PreH30 : (retval_16 <= 65535)) (PreH31 : (retval_15 = (qu_u16 (a14)))) (PreH32 : (0 <= retval_15)) (PreH33 : (retval_15 <= 65535)) (PreH34 : (retval_14 = (qu_u16 (a13)))) (PreH35 : (0 <= retval_14)) (PreH36 : (retval_14 <= 65535)) (PreH37 : (retval_13 = (qu_u16 (a12)))) (PreH38 : (0 <= retval_13)) (PreH39 : (retval_13 <= 65535)) (PreH40 : (retval_12 = (qu_u16 (a11)))) (PreH41 : (0 <= retval_12)) (PreH42 : (retval_12 <= 65535)) (PreH43 : (retval_11 = (qu_u16 (a10)))) (PreH44 : (0 <= retval_11)) (PreH45 : (retval_11 <= 65535)) (PreH46 : (retval_10 = (qu_u16 (a9)))) (PreH47 : (0 <= retval_10)) (PreH48 : (retval_10 <= 65535)) (PreH49 : (retval_9 = (qu_u16 (a8)))) (PreH50 : (0 <= retval_9)) (PreH51 : (retval_9 <= 65535)) (PreH52 : (retval_8 = (qu_u16 (a7)))) (PreH53 : (0 <= retval_8)) (PreH54 : (retval_8 <= 65535)) (PreH55 : (retval_7 = (qu_u16 (a6)))) (PreH56 : (0 <= retval_7)) (PreH57 : (retval_7 <= 65535)) (PreH58 : (retval_6 = (qu_u16 (a5)))) (PreH59 : (0 <= retval_6)) (PreH60 : (retval_6 <= 65535)) (PreH61 : (retval_5 = (qu_u16 (a4)))) (PreH62 : (0 <= retval_5)) (PreH63 : (retval_5 <= 65535)) (PreH64 : (retval_4 = (qu_u16 (a3)))) (PreH65 : (0 <= retval_4)) (PreH66 : (retval_4 <= 65535)) (PreH67 : (retval_3 = (qu_u16 (a2)))) (PreH68 : (0 <= retval_3)) (PreH69 : (retval_3 <= 65535)) (PreH70 : (retval_2 = (qu_u16 (a1)))) (PreH71 : (0 <= retval_2)) (PreH72 : (retval_2 <= 65535)) (PreH73 : (retval = (qu_u16 (a0)))) (PreH74 : (0 <= retval)) (PreH75 : (retval <= 65535)) (PreH76 : ((-32768) <= a0)) (PreH77 : (a0 <= 32767)) (PreH78 : ((-32768) <= a1)) (PreH79 : (a1 <= 32767)) (PreH80 : ((-32768) <= a2)) (PreH81 : (a2 <= 32767)) (PreH82 : ((-32768) <= a3)) (PreH83 : (a3 <= 32767)) (PreH84 : ((-32768) <= a4)) (PreH85 : (a4 <= 32767)) (PreH86 : ((-32768) <= a5)) (PreH87 : (a5 <= 32767)) (PreH88 : ((-32768) <= a6)) (PreH89 : (a6 <= 32767)) (PreH90 : ((-32768) <= a7)) (PreH91 : (a7 <= 32767)) (PreH92 : ((-32768) <= a8)) (PreH93 : (a8 <= 32767)) (PreH94 : ((-32768) <= a9)) (PreH95 : (a9 <= 32767)) (PreH96 : ((-32768) <= a10)) (PreH97 : (a10 <= 32767)) (PreH98 : ((-32768) <= a11)) (PreH99 : (a11 <= 32767)) (PreH100 : ((-32768) <= a12)) (PreH101 : (a12 <= 32767)) (PreH102 : ((-32768) <= a13)) (PreH103 : (a13 <= 32767)) (PreH104 : ((-32768) <= a14)) (PreH105 : (a14 <= 32767)) (PreH106 : ((-32768) <= a15)) (PreH107 : (a15 <= 32767)) (PreH108 : ((-32768) <= a16)) (PreH109 : (a16 <= 32767)) (PreH110 : ((-32768) <= a17)) (PreH111 : (a17 <= 32767)) (PreH112 : ((-32768) <= a18)) (PreH113 : (a18 <= 32767)) (PreH114 : ((-32768) <= a19)) (PreH115 : (a19 <= 32767)) (PreH116 : ((-32768) <= a20)) (PreH117 : (a20 <= 32767)) (PreH118 : ((-32768) <= a21)) (PreH119 : (a21 <= 32767)) (PreH120 : ((-32768) <= a22)) (PreH121 : (a22 <= 32767)) (PreH122 : ((-32768) <= a23)) (PreH123 : (a23 <= 32767)) (PreH124 : ((-32768) <= a24)) (PreH125 : (a24 <= 32767)) (PreH126 : ((-32768) <= a25)) (PreH127 : (a25 <= 32767)) (PreH128 : ((-32768) <= a26)) (PreH129 : (a26 <= 32767)) (PreH130 : ((-32768) <= a27)) (PreH131 : (a27 <= 32767)) (PreH132 : ((-32768) <= a28)) (PreH133 : (a28 <= 32767)) (PreH134 : ((-32768) <= a29)) (PreH135 : (a29 <= 32767)) (PreH136 : ((-32768) <= a30)) (PreH137 : (a30 <= 32767)) (PreH138 : ((-32768) <= a31)) (PreH139 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a25) ” 
  &&  “ (a25 <= INT_MAX) ” 
  &&  “ (retval_25 = (qu_u16 (a24))) ” 
  &&  “ (0 <= retval_25) ” 
  &&  “ (retval_25 <= 65535) ” 
  &&  “ (retval_24 = (qu_u16 (a23))) ” 
  &&  “ (0 <= retval_24) ” 
  &&  “ (retval_24 <= 65535) ” 
  &&  “ (retval_23 = (qu_u16 (a22))) ” 
  &&  “ (0 <= retval_23) ” 
  &&  “ (retval_23 <= 65535) ” 
  &&  “ (retval_22 = (qu_u16 (a21))) ” 
  &&  “ (0 <= retval_22) ” 
  &&  “ (retval_22 <= 65535) ” 
  &&  “ (retval_21 = (qu_u16 (a20))) ” 
  &&  “ (0 <= retval_21) ” 
  &&  “ (retval_21 <= 65535) ” 
  &&  “ (retval_20 = (qu_u16 (a19))) ” 
  &&  “ (0 <= retval_20) ” 
  &&  “ (retval_20 <= 65535) ” 
  &&  “ (retval_19 = (qu_u16 (a18))) ” 
  &&  “ (0 <= retval_19) ” 
  &&  “ (retval_19 <= 65535) ” 
  &&  “ (retval_18 = (qu_u16 (a17))) ” 
  &&  “ (0 <= retval_18) ” 
  &&  “ (retval_18 <= 65535) ” 
  &&  “ (retval_17 = (qu_u16 (a16))) ” 
  &&  “ (0 <= retval_17) ” 
  &&  “ (retval_17 <= 65535) ” 
  &&  “ (retval_16 = (qu_u16 (a15))) ” 
  &&  “ (0 <= retval_16) ” 
  &&  “ (retval_16 <= 65535) ” 
  &&  “ (retval_15 = (qu_u16 (a14))) ” 
  &&  “ (0 <= retval_15) ” 
  &&  “ (retval_15 <= 65535) ” 
  &&  “ (retval_14 = (qu_u16 (a13))) ” 
  &&  “ (0 <= retval_14) ” 
  &&  “ (retval_14 <= 65535) ” 
  &&  “ (retval_13 = (qu_u16 (a12))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= 65535) ” 
  &&  “ (retval_12 = (qu_u16 (a11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= 65535) ” 
  &&  “ (retval_11 = (qu_u16 (a10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= 65535) ” 
  &&  “ (retval_10 = (qu_u16 (a9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= 65535) ” 
  &&  “ (retval_9 = (qu_u16 (a8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= 65535) ” 
  &&  “ (retval_8 = (qu_u16 (a7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= 65535) ” 
  &&  “ (retval_7 = (qu_u16 (a6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 65535) ” 
  &&  “ (retval_6 = (qu_u16 (a5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 65535) ” 
  &&  “ (retval_5 = (qu_u16 (a4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 65535) ” 
  &&  “ (retval_4 = (qu_u16 (a3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 65535) ” 
  &&  “ (retval_3 = (qu_u16 (a2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (qu_u16 (a1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (qu_u16 (a0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= a8) ” 
  &&  “ (a8 <= 32767) ” 
  &&  “ ((-32768) <= a9) ” 
  &&  “ (a9 <= 32767) ” 
  &&  “ ((-32768) <= a10) ” 
  &&  “ (a10 <= 32767) ” 
  &&  “ ((-32768) <= a11) ” 
  &&  “ (a11 <= 32767) ” 
  &&  “ ((-32768) <= a12) ” 
  &&  “ (a12 <= 32767) ” 
  &&  “ ((-32768) <= a13) ” 
  &&  “ (a13 <= 32767) ” 
  &&  “ ((-32768) <= a14) ” 
  &&  “ (a14 <= 32767) ” 
  &&  “ ((-32768) <= a15) ” 
  &&  “ (a15 <= 32767) ” 
  &&  “ ((-32768) <= a16) ” 
  &&  “ (a16 <= 32767) ” 
  &&  “ ((-32768) <= a17) ” 
  &&  “ (a17 <= 32767) ” 
  &&  “ ((-32768) <= a18) ” 
  &&  “ (a18 <= 32767) ” 
  &&  “ ((-32768) <= a19) ” 
  &&  “ (a19 <= 32767) ” 
  &&  “ ((-32768) <= a20) ” 
  &&  “ (a20 <= 32767) ” 
  &&  “ ((-32768) <= a21) ” 
  &&  “ (a21 <= 32767) ” 
  &&  “ ((-32768) <= a22) ” 
  &&  “ (a22 <= 32767) ” 
  &&  “ ((-32768) <= a23) ” 
  &&  “ (a23 <= 32767) ” 
  &&  “ ((-32768) <= a24) ” 
  &&  “ (a24 <= 32767) ” 
  &&  “ ((-32768) <= a25) ” 
  &&  “ (a25 <= 32767) ” 
  &&  “ ((-32768) <= a26) ” 
  &&  “ (a26 <= 32767) ” 
  &&  “ ((-32768) <= a27) ” 
  &&  “ (a27 <= 32767) ” 
  &&  “ ((-32768) <= a28) ” 
  &&  “ (a28 <= 32767) ” 
  &&  “ ((-32768) <= a29) ” 
  &&  “ (a29 <= 32767) ” 
  &&  “ ((-32768) <= a30) ” 
  &&  “ (a30 <= 32767) ” 
  &&  “ ((-32768) <= a31) ” 
  &&  “ (a31 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_26 := __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_26_pure -> __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_26_aux.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_27_pure := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (PreH1 : (retval_26 = (qu_u16 (a25)))) (PreH2 : (0 <= retval_26)) (PreH3 : (retval_26 <= 65535)) (PreH4 : (retval_25 = (qu_u16 (a24)))) (PreH5 : (0 <= retval_25)) (PreH6 : (retval_25 <= 65535)) (PreH7 : (retval_24 = (qu_u16 (a23)))) (PreH8 : (0 <= retval_24)) (PreH9 : (retval_24 <= 65535)) (PreH10 : (retval_23 = (qu_u16 (a22)))) (PreH11 : (0 <= retval_23)) (PreH12 : (retval_23 <= 65535)) (PreH13 : (retval_22 = (qu_u16 (a21)))) (PreH14 : (0 <= retval_22)) (PreH15 : (retval_22 <= 65535)) (PreH16 : (retval_21 = (qu_u16 (a20)))) (PreH17 : (0 <= retval_21)) (PreH18 : (retval_21 <= 65535)) (PreH19 : (retval_20 = (qu_u16 (a19)))) (PreH20 : (0 <= retval_20)) (PreH21 : (retval_20 <= 65535)) (PreH22 : (retval_19 = (qu_u16 (a18)))) (PreH23 : (0 <= retval_19)) (PreH24 : (retval_19 <= 65535)) (PreH25 : (retval_18 = (qu_u16 (a17)))) (PreH26 : (0 <= retval_18)) (PreH27 : (retval_18 <= 65535)) (PreH28 : (retval_17 = (qu_u16 (a16)))) (PreH29 : (0 <= retval_17)) (PreH30 : (retval_17 <= 65535)) (PreH31 : (retval_16 = (qu_u16 (a15)))) (PreH32 : (0 <= retval_16)) (PreH33 : (retval_16 <= 65535)) (PreH34 : (retval_15 = (qu_u16 (a14)))) (PreH35 : (0 <= retval_15)) (PreH36 : (retval_15 <= 65535)) (PreH37 : (retval_14 = (qu_u16 (a13)))) (PreH38 : (0 <= retval_14)) (PreH39 : (retval_14 <= 65535)) (PreH40 : (retval_13 = (qu_u16 (a12)))) (PreH41 : (0 <= retval_13)) (PreH42 : (retval_13 <= 65535)) (PreH43 : (retval_12 = (qu_u16 (a11)))) (PreH44 : (0 <= retval_12)) (PreH45 : (retval_12 <= 65535)) (PreH46 : (retval_11 = (qu_u16 (a10)))) (PreH47 : (0 <= retval_11)) (PreH48 : (retval_11 <= 65535)) (PreH49 : (retval_10 = (qu_u16 (a9)))) (PreH50 : (0 <= retval_10)) (PreH51 : (retval_10 <= 65535)) (PreH52 : (retval_9 = (qu_u16 (a8)))) (PreH53 : (0 <= retval_9)) (PreH54 : (retval_9 <= 65535)) (PreH55 : (retval_8 = (qu_u16 (a7)))) (PreH56 : (0 <= retval_8)) (PreH57 : (retval_8 <= 65535)) (PreH58 : (retval_7 = (qu_u16 (a6)))) (PreH59 : (0 <= retval_7)) (PreH60 : (retval_7 <= 65535)) (PreH61 : (retval_6 = (qu_u16 (a5)))) (PreH62 : (0 <= retval_6)) (PreH63 : (retval_6 <= 65535)) (PreH64 : (retval_5 = (qu_u16 (a4)))) (PreH65 : (0 <= retval_5)) (PreH66 : (retval_5 <= 65535)) (PreH67 : (retval_4 = (qu_u16 (a3)))) (PreH68 : (0 <= retval_4)) (PreH69 : (retval_4 <= 65535)) (PreH70 : (retval_3 = (qu_u16 (a2)))) (PreH71 : (0 <= retval_3)) (PreH72 : (retval_3 <= 65535)) (PreH73 : (retval_2 = (qu_u16 (a1)))) (PreH74 : (0 <= retval_2)) (PreH75 : (retval_2 <= 65535)) (PreH76 : (retval = (qu_u16 (a0)))) (PreH77 : (0 <= retval)) (PreH78 : (retval <= 65535)) (PreH79 : ((-32768) <= a0)) (PreH80 : (a0 <= 32767)) (PreH81 : ((-32768) <= a1)) (PreH82 : (a1 <= 32767)) (PreH83 : ((-32768) <= a2)) (PreH84 : (a2 <= 32767)) (PreH85 : ((-32768) <= a3)) (PreH86 : (a3 <= 32767)) (PreH87 : ((-32768) <= a4)) (PreH88 : (a4 <= 32767)) (PreH89 : ((-32768) <= a5)) (PreH90 : (a5 <= 32767)) (PreH91 : ((-32768) <= a6)) (PreH92 : (a6 <= 32767)) (PreH93 : ((-32768) <= a7)) (PreH94 : (a7 <= 32767)) (PreH95 : ((-32768) <= a8)) (PreH96 : (a8 <= 32767)) (PreH97 : ((-32768) <= a9)) (PreH98 : (a9 <= 32767)) (PreH99 : ((-32768) <= a10)) (PreH100 : (a10 <= 32767)) (PreH101 : ((-32768) <= a11)) (PreH102 : (a11 <= 32767)) (PreH103 : ((-32768) <= a12)) (PreH104 : (a12 <= 32767)) (PreH105 : ((-32768) <= a13)) (PreH106 : (a13 <= 32767)) (PreH107 : ((-32768) <= a14)) (PreH108 : (a14 <= 32767)) (PreH109 : ((-32768) <= a15)) (PreH110 : (a15 <= 32767)) (PreH111 : ((-32768) <= a16)) (PreH112 : (a16 <= 32767)) (PreH113 : ((-32768) <= a17)) (PreH114 : (a17 <= 32767)) (PreH115 : ((-32768) <= a18)) (PreH116 : (a18 <= 32767)) (PreH117 : ((-32768) <= a19)) (PreH118 : (a19 <= 32767)) (PreH119 : ((-32768) <= a20)) (PreH120 : (a20 <= 32767)) (PreH121 : ((-32768) <= a21)) (PreH122 : (a21 <= 32767)) (PreH123 : ((-32768) <= a22)) (PreH124 : (a22 <= 32767)) (PreH125 : ((-32768) <= a23)) (PreH126 : (a23 <= 32767)) (PreH127 : ((-32768) <= a24)) (PreH128 : (a24 <= 32767)) (PreH129 : ((-32768) <= a25)) (PreH130 : (a25 <= 32767)) (PreH131 : ((-32768) <= a26)) (PreH132 : (a26 <= 32767)) (PreH133 : ((-32768) <= a27)) (PreH134 : (a27 <= 32767)) (PreH135 : ((-32768) <= a28)) (PreH136 : (a28 <= 32767)) (PreH137 : ((-32768) <= a29)) (PreH138 : (a29 <= 32767)) (PreH139 : ((-32768) <= a30)) (PreH140 : (a30 <= 32767)) (PreH141 : ((-32768) <= a31)) (PreH142 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a26) ” 
  &&  “ (a26 <= INT_MAX) ”
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_27_aux := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (PreH1 : (retval_26 = (qu_u16 (a25)))) (PreH2 : (0 <= retval_26)) (PreH3 : (retval_26 <= 65535)) (PreH4 : (retval_25 = (qu_u16 (a24)))) (PreH5 : (0 <= retval_25)) (PreH6 : (retval_25 <= 65535)) (PreH7 : (retval_24 = (qu_u16 (a23)))) (PreH8 : (0 <= retval_24)) (PreH9 : (retval_24 <= 65535)) (PreH10 : (retval_23 = (qu_u16 (a22)))) (PreH11 : (0 <= retval_23)) (PreH12 : (retval_23 <= 65535)) (PreH13 : (retval_22 = (qu_u16 (a21)))) (PreH14 : (0 <= retval_22)) (PreH15 : (retval_22 <= 65535)) (PreH16 : (retval_21 = (qu_u16 (a20)))) (PreH17 : (0 <= retval_21)) (PreH18 : (retval_21 <= 65535)) (PreH19 : (retval_20 = (qu_u16 (a19)))) (PreH20 : (0 <= retval_20)) (PreH21 : (retval_20 <= 65535)) (PreH22 : (retval_19 = (qu_u16 (a18)))) (PreH23 : (0 <= retval_19)) (PreH24 : (retval_19 <= 65535)) (PreH25 : (retval_18 = (qu_u16 (a17)))) (PreH26 : (0 <= retval_18)) (PreH27 : (retval_18 <= 65535)) (PreH28 : (retval_17 = (qu_u16 (a16)))) (PreH29 : (0 <= retval_17)) (PreH30 : (retval_17 <= 65535)) (PreH31 : (retval_16 = (qu_u16 (a15)))) (PreH32 : (0 <= retval_16)) (PreH33 : (retval_16 <= 65535)) (PreH34 : (retval_15 = (qu_u16 (a14)))) (PreH35 : (0 <= retval_15)) (PreH36 : (retval_15 <= 65535)) (PreH37 : (retval_14 = (qu_u16 (a13)))) (PreH38 : (0 <= retval_14)) (PreH39 : (retval_14 <= 65535)) (PreH40 : (retval_13 = (qu_u16 (a12)))) (PreH41 : (0 <= retval_13)) (PreH42 : (retval_13 <= 65535)) (PreH43 : (retval_12 = (qu_u16 (a11)))) (PreH44 : (0 <= retval_12)) (PreH45 : (retval_12 <= 65535)) (PreH46 : (retval_11 = (qu_u16 (a10)))) (PreH47 : (0 <= retval_11)) (PreH48 : (retval_11 <= 65535)) (PreH49 : (retval_10 = (qu_u16 (a9)))) (PreH50 : (0 <= retval_10)) (PreH51 : (retval_10 <= 65535)) (PreH52 : (retval_9 = (qu_u16 (a8)))) (PreH53 : (0 <= retval_9)) (PreH54 : (retval_9 <= 65535)) (PreH55 : (retval_8 = (qu_u16 (a7)))) (PreH56 : (0 <= retval_8)) (PreH57 : (retval_8 <= 65535)) (PreH58 : (retval_7 = (qu_u16 (a6)))) (PreH59 : (0 <= retval_7)) (PreH60 : (retval_7 <= 65535)) (PreH61 : (retval_6 = (qu_u16 (a5)))) (PreH62 : (0 <= retval_6)) (PreH63 : (retval_6 <= 65535)) (PreH64 : (retval_5 = (qu_u16 (a4)))) (PreH65 : (0 <= retval_5)) (PreH66 : (retval_5 <= 65535)) (PreH67 : (retval_4 = (qu_u16 (a3)))) (PreH68 : (0 <= retval_4)) (PreH69 : (retval_4 <= 65535)) (PreH70 : (retval_3 = (qu_u16 (a2)))) (PreH71 : (0 <= retval_3)) (PreH72 : (retval_3 <= 65535)) (PreH73 : (retval_2 = (qu_u16 (a1)))) (PreH74 : (0 <= retval_2)) (PreH75 : (retval_2 <= 65535)) (PreH76 : (retval = (qu_u16 (a0)))) (PreH77 : (0 <= retval)) (PreH78 : (retval <= 65535)) (PreH79 : ((-32768) <= a0)) (PreH80 : (a0 <= 32767)) (PreH81 : ((-32768) <= a1)) (PreH82 : (a1 <= 32767)) (PreH83 : ((-32768) <= a2)) (PreH84 : (a2 <= 32767)) (PreH85 : ((-32768) <= a3)) (PreH86 : (a3 <= 32767)) (PreH87 : ((-32768) <= a4)) (PreH88 : (a4 <= 32767)) (PreH89 : ((-32768) <= a5)) (PreH90 : (a5 <= 32767)) (PreH91 : ((-32768) <= a6)) (PreH92 : (a6 <= 32767)) (PreH93 : ((-32768) <= a7)) (PreH94 : (a7 <= 32767)) (PreH95 : ((-32768) <= a8)) (PreH96 : (a8 <= 32767)) (PreH97 : ((-32768) <= a9)) (PreH98 : (a9 <= 32767)) (PreH99 : ((-32768) <= a10)) (PreH100 : (a10 <= 32767)) (PreH101 : ((-32768) <= a11)) (PreH102 : (a11 <= 32767)) (PreH103 : ((-32768) <= a12)) (PreH104 : (a12 <= 32767)) (PreH105 : ((-32768) <= a13)) (PreH106 : (a13 <= 32767)) (PreH107 : ((-32768) <= a14)) (PreH108 : (a14 <= 32767)) (PreH109 : ((-32768) <= a15)) (PreH110 : (a15 <= 32767)) (PreH111 : ((-32768) <= a16)) (PreH112 : (a16 <= 32767)) (PreH113 : ((-32768) <= a17)) (PreH114 : (a17 <= 32767)) (PreH115 : ((-32768) <= a18)) (PreH116 : (a18 <= 32767)) (PreH117 : ((-32768) <= a19)) (PreH118 : (a19 <= 32767)) (PreH119 : ((-32768) <= a20)) (PreH120 : (a20 <= 32767)) (PreH121 : ((-32768) <= a21)) (PreH122 : (a21 <= 32767)) (PreH123 : ((-32768) <= a22)) (PreH124 : (a22 <= 32767)) (PreH125 : ((-32768) <= a23)) (PreH126 : (a23 <= 32767)) (PreH127 : ((-32768) <= a24)) (PreH128 : (a24 <= 32767)) (PreH129 : ((-32768) <= a25)) (PreH130 : (a25 <= 32767)) (PreH131 : ((-32768) <= a26)) (PreH132 : (a26 <= 32767)) (PreH133 : ((-32768) <= a27)) (PreH134 : (a27 <= 32767)) (PreH135 : ((-32768) <= a28)) (PreH136 : (a28 <= 32767)) (PreH137 : ((-32768) <= a29)) (PreH138 : (a29 <= 32767)) (PreH139 : ((-32768) <= a30)) (PreH140 : (a30 <= 32767)) (PreH141 : ((-32768) <= a31)) (PreH142 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a26) ” 
  &&  “ (a26 <= INT_MAX) ” 
  &&  “ (retval_26 = (qu_u16 (a25))) ” 
  &&  “ (0 <= retval_26) ” 
  &&  “ (retval_26 <= 65535) ” 
  &&  “ (retval_25 = (qu_u16 (a24))) ” 
  &&  “ (0 <= retval_25) ” 
  &&  “ (retval_25 <= 65535) ” 
  &&  “ (retval_24 = (qu_u16 (a23))) ” 
  &&  “ (0 <= retval_24) ” 
  &&  “ (retval_24 <= 65535) ” 
  &&  “ (retval_23 = (qu_u16 (a22))) ” 
  &&  “ (0 <= retval_23) ” 
  &&  “ (retval_23 <= 65535) ” 
  &&  “ (retval_22 = (qu_u16 (a21))) ” 
  &&  “ (0 <= retval_22) ” 
  &&  “ (retval_22 <= 65535) ” 
  &&  “ (retval_21 = (qu_u16 (a20))) ” 
  &&  “ (0 <= retval_21) ” 
  &&  “ (retval_21 <= 65535) ” 
  &&  “ (retval_20 = (qu_u16 (a19))) ” 
  &&  “ (0 <= retval_20) ” 
  &&  “ (retval_20 <= 65535) ” 
  &&  “ (retval_19 = (qu_u16 (a18))) ” 
  &&  “ (0 <= retval_19) ” 
  &&  “ (retval_19 <= 65535) ” 
  &&  “ (retval_18 = (qu_u16 (a17))) ” 
  &&  “ (0 <= retval_18) ” 
  &&  “ (retval_18 <= 65535) ” 
  &&  “ (retval_17 = (qu_u16 (a16))) ” 
  &&  “ (0 <= retval_17) ” 
  &&  “ (retval_17 <= 65535) ” 
  &&  “ (retval_16 = (qu_u16 (a15))) ” 
  &&  “ (0 <= retval_16) ” 
  &&  “ (retval_16 <= 65535) ” 
  &&  “ (retval_15 = (qu_u16 (a14))) ” 
  &&  “ (0 <= retval_15) ” 
  &&  “ (retval_15 <= 65535) ” 
  &&  “ (retval_14 = (qu_u16 (a13))) ” 
  &&  “ (0 <= retval_14) ” 
  &&  “ (retval_14 <= 65535) ” 
  &&  “ (retval_13 = (qu_u16 (a12))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= 65535) ” 
  &&  “ (retval_12 = (qu_u16 (a11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= 65535) ” 
  &&  “ (retval_11 = (qu_u16 (a10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= 65535) ” 
  &&  “ (retval_10 = (qu_u16 (a9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= 65535) ” 
  &&  “ (retval_9 = (qu_u16 (a8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= 65535) ” 
  &&  “ (retval_8 = (qu_u16 (a7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= 65535) ” 
  &&  “ (retval_7 = (qu_u16 (a6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 65535) ” 
  &&  “ (retval_6 = (qu_u16 (a5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 65535) ” 
  &&  “ (retval_5 = (qu_u16 (a4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 65535) ” 
  &&  “ (retval_4 = (qu_u16 (a3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 65535) ” 
  &&  “ (retval_3 = (qu_u16 (a2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (qu_u16 (a1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (qu_u16 (a0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= a8) ” 
  &&  “ (a8 <= 32767) ” 
  &&  “ ((-32768) <= a9) ” 
  &&  “ (a9 <= 32767) ” 
  &&  “ ((-32768) <= a10) ” 
  &&  “ (a10 <= 32767) ” 
  &&  “ ((-32768) <= a11) ” 
  &&  “ (a11 <= 32767) ” 
  &&  “ ((-32768) <= a12) ” 
  &&  “ (a12 <= 32767) ” 
  &&  “ ((-32768) <= a13) ” 
  &&  “ (a13 <= 32767) ” 
  &&  “ ((-32768) <= a14) ” 
  &&  “ (a14 <= 32767) ” 
  &&  “ ((-32768) <= a15) ” 
  &&  “ (a15 <= 32767) ” 
  &&  “ ((-32768) <= a16) ” 
  &&  “ (a16 <= 32767) ” 
  &&  “ ((-32768) <= a17) ” 
  &&  “ (a17 <= 32767) ” 
  &&  “ ((-32768) <= a18) ” 
  &&  “ (a18 <= 32767) ” 
  &&  “ ((-32768) <= a19) ” 
  &&  “ (a19 <= 32767) ” 
  &&  “ ((-32768) <= a20) ” 
  &&  “ (a20 <= 32767) ” 
  &&  “ ((-32768) <= a21) ” 
  &&  “ (a21 <= 32767) ” 
  &&  “ ((-32768) <= a22) ” 
  &&  “ (a22 <= 32767) ” 
  &&  “ ((-32768) <= a23) ” 
  &&  “ (a23 <= 32767) ” 
  &&  “ ((-32768) <= a24) ” 
  &&  “ (a24 <= 32767) ” 
  &&  “ ((-32768) <= a25) ” 
  &&  “ (a25 <= 32767) ” 
  &&  “ ((-32768) <= a26) ” 
  &&  “ (a26 <= 32767) ” 
  &&  “ ((-32768) <= a27) ” 
  &&  “ (a27 <= 32767) ” 
  &&  “ ((-32768) <= a28) ” 
  &&  “ (a28 <= 32767) ” 
  &&  “ ((-32768) <= a29) ” 
  &&  “ (a29 <= 32767) ” 
  &&  “ ((-32768) <= a30) ” 
  &&  “ (a30 <= 32767) ” 
  &&  “ ((-32768) <= a31) ” 
  &&  “ (a31 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_27 := __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_27_pure -> __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_27_aux.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_28_pure := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (PreH1 : (retval_27 = (qu_u16 (a26)))) (PreH2 : (0 <= retval_27)) (PreH3 : (retval_27 <= 65535)) (PreH4 : (retval_26 = (qu_u16 (a25)))) (PreH5 : (0 <= retval_26)) (PreH6 : (retval_26 <= 65535)) (PreH7 : (retval_25 = (qu_u16 (a24)))) (PreH8 : (0 <= retval_25)) (PreH9 : (retval_25 <= 65535)) (PreH10 : (retval_24 = (qu_u16 (a23)))) (PreH11 : (0 <= retval_24)) (PreH12 : (retval_24 <= 65535)) (PreH13 : (retval_23 = (qu_u16 (a22)))) (PreH14 : (0 <= retval_23)) (PreH15 : (retval_23 <= 65535)) (PreH16 : (retval_22 = (qu_u16 (a21)))) (PreH17 : (0 <= retval_22)) (PreH18 : (retval_22 <= 65535)) (PreH19 : (retval_21 = (qu_u16 (a20)))) (PreH20 : (0 <= retval_21)) (PreH21 : (retval_21 <= 65535)) (PreH22 : (retval_20 = (qu_u16 (a19)))) (PreH23 : (0 <= retval_20)) (PreH24 : (retval_20 <= 65535)) (PreH25 : (retval_19 = (qu_u16 (a18)))) (PreH26 : (0 <= retval_19)) (PreH27 : (retval_19 <= 65535)) (PreH28 : (retval_18 = (qu_u16 (a17)))) (PreH29 : (0 <= retval_18)) (PreH30 : (retval_18 <= 65535)) (PreH31 : (retval_17 = (qu_u16 (a16)))) (PreH32 : (0 <= retval_17)) (PreH33 : (retval_17 <= 65535)) (PreH34 : (retval_16 = (qu_u16 (a15)))) (PreH35 : (0 <= retval_16)) (PreH36 : (retval_16 <= 65535)) (PreH37 : (retval_15 = (qu_u16 (a14)))) (PreH38 : (0 <= retval_15)) (PreH39 : (retval_15 <= 65535)) (PreH40 : (retval_14 = (qu_u16 (a13)))) (PreH41 : (0 <= retval_14)) (PreH42 : (retval_14 <= 65535)) (PreH43 : (retval_13 = (qu_u16 (a12)))) (PreH44 : (0 <= retval_13)) (PreH45 : (retval_13 <= 65535)) (PreH46 : (retval_12 = (qu_u16 (a11)))) (PreH47 : (0 <= retval_12)) (PreH48 : (retval_12 <= 65535)) (PreH49 : (retval_11 = (qu_u16 (a10)))) (PreH50 : (0 <= retval_11)) (PreH51 : (retval_11 <= 65535)) (PreH52 : (retval_10 = (qu_u16 (a9)))) (PreH53 : (0 <= retval_10)) (PreH54 : (retval_10 <= 65535)) (PreH55 : (retval_9 = (qu_u16 (a8)))) (PreH56 : (0 <= retval_9)) (PreH57 : (retval_9 <= 65535)) (PreH58 : (retval_8 = (qu_u16 (a7)))) (PreH59 : (0 <= retval_8)) (PreH60 : (retval_8 <= 65535)) (PreH61 : (retval_7 = (qu_u16 (a6)))) (PreH62 : (0 <= retval_7)) (PreH63 : (retval_7 <= 65535)) (PreH64 : (retval_6 = (qu_u16 (a5)))) (PreH65 : (0 <= retval_6)) (PreH66 : (retval_6 <= 65535)) (PreH67 : (retval_5 = (qu_u16 (a4)))) (PreH68 : (0 <= retval_5)) (PreH69 : (retval_5 <= 65535)) (PreH70 : (retval_4 = (qu_u16 (a3)))) (PreH71 : (0 <= retval_4)) (PreH72 : (retval_4 <= 65535)) (PreH73 : (retval_3 = (qu_u16 (a2)))) (PreH74 : (0 <= retval_3)) (PreH75 : (retval_3 <= 65535)) (PreH76 : (retval_2 = (qu_u16 (a1)))) (PreH77 : (0 <= retval_2)) (PreH78 : (retval_2 <= 65535)) (PreH79 : (retval = (qu_u16 (a0)))) (PreH80 : (0 <= retval)) (PreH81 : (retval <= 65535)) (PreH82 : ((-32768) <= a0)) (PreH83 : (a0 <= 32767)) (PreH84 : ((-32768) <= a1)) (PreH85 : (a1 <= 32767)) (PreH86 : ((-32768) <= a2)) (PreH87 : (a2 <= 32767)) (PreH88 : ((-32768) <= a3)) (PreH89 : (a3 <= 32767)) (PreH90 : ((-32768) <= a4)) (PreH91 : (a4 <= 32767)) (PreH92 : ((-32768) <= a5)) (PreH93 : (a5 <= 32767)) (PreH94 : ((-32768) <= a6)) (PreH95 : (a6 <= 32767)) (PreH96 : ((-32768) <= a7)) (PreH97 : (a7 <= 32767)) (PreH98 : ((-32768) <= a8)) (PreH99 : (a8 <= 32767)) (PreH100 : ((-32768) <= a9)) (PreH101 : (a9 <= 32767)) (PreH102 : ((-32768) <= a10)) (PreH103 : (a10 <= 32767)) (PreH104 : ((-32768) <= a11)) (PreH105 : (a11 <= 32767)) (PreH106 : ((-32768) <= a12)) (PreH107 : (a12 <= 32767)) (PreH108 : ((-32768) <= a13)) (PreH109 : (a13 <= 32767)) (PreH110 : ((-32768) <= a14)) (PreH111 : (a14 <= 32767)) (PreH112 : ((-32768) <= a15)) (PreH113 : (a15 <= 32767)) (PreH114 : ((-32768) <= a16)) (PreH115 : (a16 <= 32767)) (PreH116 : ((-32768) <= a17)) (PreH117 : (a17 <= 32767)) (PreH118 : ((-32768) <= a18)) (PreH119 : (a18 <= 32767)) (PreH120 : ((-32768) <= a19)) (PreH121 : (a19 <= 32767)) (PreH122 : ((-32768) <= a20)) (PreH123 : (a20 <= 32767)) (PreH124 : ((-32768) <= a21)) (PreH125 : (a21 <= 32767)) (PreH126 : ((-32768) <= a22)) (PreH127 : (a22 <= 32767)) (PreH128 : ((-32768) <= a23)) (PreH129 : (a23 <= 32767)) (PreH130 : ((-32768) <= a24)) (PreH131 : (a24 <= 32767)) (PreH132 : ((-32768) <= a25)) (PreH133 : (a25 <= 32767)) (PreH134 : ((-32768) <= a26)) (PreH135 : (a26 <= 32767)) (PreH136 : ((-32768) <= a27)) (PreH137 : (a27 <= 32767)) (PreH138 : ((-32768) <= a28)) (PreH139 : (a28 <= 32767)) (PreH140 : ((-32768) <= a29)) (PreH141 : (a29 <= 32767)) (PreH142 : ((-32768) <= a30)) (PreH143 : (a30 <= 32767)) (PreH144 : ((-32768) <= a31)) (PreH145 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a27) ” 
  &&  “ (a27 <= INT_MAX) ”
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_28_aux := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (PreH1 : (retval_27 = (qu_u16 (a26)))) (PreH2 : (0 <= retval_27)) (PreH3 : (retval_27 <= 65535)) (PreH4 : (retval_26 = (qu_u16 (a25)))) (PreH5 : (0 <= retval_26)) (PreH6 : (retval_26 <= 65535)) (PreH7 : (retval_25 = (qu_u16 (a24)))) (PreH8 : (0 <= retval_25)) (PreH9 : (retval_25 <= 65535)) (PreH10 : (retval_24 = (qu_u16 (a23)))) (PreH11 : (0 <= retval_24)) (PreH12 : (retval_24 <= 65535)) (PreH13 : (retval_23 = (qu_u16 (a22)))) (PreH14 : (0 <= retval_23)) (PreH15 : (retval_23 <= 65535)) (PreH16 : (retval_22 = (qu_u16 (a21)))) (PreH17 : (0 <= retval_22)) (PreH18 : (retval_22 <= 65535)) (PreH19 : (retval_21 = (qu_u16 (a20)))) (PreH20 : (0 <= retval_21)) (PreH21 : (retval_21 <= 65535)) (PreH22 : (retval_20 = (qu_u16 (a19)))) (PreH23 : (0 <= retval_20)) (PreH24 : (retval_20 <= 65535)) (PreH25 : (retval_19 = (qu_u16 (a18)))) (PreH26 : (0 <= retval_19)) (PreH27 : (retval_19 <= 65535)) (PreH28 : (retval_18 = (qu_u16 (a17)))) (PreH29 : (0 <= retval_18)) (PreH30 : (retval_18 <= 65535)) (PreH31 : (retval_17 = (qu_u16 (a16)))) (PreH32 : (0 <= retval_17)) (PreH33 : (retval_17 <= 65535)) (PreH34 : (retval_16 = (qu_u16 (a15)))) (PreH35 : (0 <= retval_16)) (PreH36 : (retval_16 <= 65535)) (PreH37 : (retval_15 = (qu_u16 (a14)))) (PreH38 : (0 <= retval_15)) (PreH39 : (retval_15 <= 65535)) (PreH40 : (retval_14 = (qu_u16 (a13)))) (PreH41 : (0 <= retval_14)) (PreH42 : (retval_14 <= 65535)) (PreH43 : (retval_13 = (qu_u16 (a12)))) (PreH44 : (0 <= retval_13)) (PreH45 : (retval_13 <= 65535)) (PreH46 : (retval_12 = (qu_u16 (a11)))) (PreH47 : (0 <= retval_12)) (PreH48 : (retval_12 <= 65535)) (PreH49 : (retval_11 = (qu_u16 (a10)))) (PreH50 : (0 <= retval_11)) (PreH51 : (retval_11 <= 65535)) (PreH52 : (retval_10 = (qu_u16 (a9)))) (PreH53 : (0 <= retval_10)) (PreH54 : (retval_10 <= 65535)) (PreH55 : (retval_9 = (qu_u16 (a8)))) (PreH56 : (0 <= retval_9)) (PreH57 : (retval_9 <= 65535)) (PreH58 : (retval_8 = (qu_u16 (a7)))) (PreH59 : (0 <= retval_8)) (PreH60 : (retval_8 <= 65535)) (PreH61 : (retval_7 = (qu_u16 (a6)))) (PreH62 : (0 <= retval_7)) (PreH63 : (retval_7 <= 65535)) (PreH64 : (retval_6 = (qu_u16 (a5)))) (PreH65 : (0 <= retval_6)) (PreH66 : (retval_6 <= 65535)) (PreH67 : (retval_5 = (qu_u16 (a4)))) (PreH68 : (0 <= retval_5)) (PreH69 : (retval_5 <= 65535)) (PreH70 : (retval_4 = (qu_u16 (a3)))) (PreH71 : (0 <= retval_4)) (PreH72 : (retval_4 <= 65535)) (PreH73 : (retval_3 = (qu_u16 (a2)))) (PreH74 : (0 <= retval_3)) (PreH75 : (retval_3 <= 65535)) (PreH76 : (retval_2 = (qu_u16 (a1)))) (PreH77 : (0 <= retval_2)) (PreH78 : (retval_2 <= 65535)) (PreH79 : (retval = (qu_u16 (a0)))) (PreH80 : (0 <= retval)) (PreH81 : (retval <= 65535)) (PreH82 : ((-32768) <= a0)) (PreH83 : (a0 <= 32767)) (PreH84 : ((-32768) <= a1)) (PreH85 : (a1 <= 32767)) (PreH86 : ((-32768) <= a2)) (PreH87 : (a2 <= 32767)) (PreH88 : ((-32768) <= a3)) (PreH89 : (a3 <= 32767)) (PreH90 : ((-32768) <= a4)) (PreH91 : (a4 <= 32767)) (PreH92 : ((-32768) <= a5)) (PreH93 : (a5 <= 32767)) (PreH94 : ((-32768) <= a6)) (PreH95 : (a6 <= 32767)) (PreH96 : ((-32768) <= a7)) (PreH97 : (a7 <= 32767)) (PreH98 : ((-32768) <= a8)) (PreH99 : (a8 <= 32767)) (PreH100 : ((-32768) <= a9)) (PreH101 : (a9 <= 32767)) (PreH102 : ((-32768) <= a10)) (PreH103 : (a10 <= 32767)) (PreH104 : ((-32768) <= a11)) (PreH105 : (a11 <= 32767)) (PreH106 : ((-32768) <= a12)) (PreH107 : (a12 <= 32767)) (PreH108 : ((-32768) <= a13)) (PreH109 : (a13 <= 32767)) (PreH110 : ((-32768) <= a14)) (PreH111 : (a14 <= 32767)) (PreH112 : ((-32768) <= a15)) (PreH113 : (a15 <= 32767)) (PreH114 : ((-32768) <= a16)) (PreH115 : (a16 <= 32767)) (PreH116 : ((-32768) <= a17)) (PreH117 : (a17 <= 32767)) (PreH118 : ((-32768) <= a18)) (PreH119 : (a18 <= 32767)) (PreH120 : ((-32768) <= a19)) (PreH121 : (a19 <= 32767)) (PreH122 : ((-32768) <= a20)) (PreH123 : (a20 <= 32767)) (PreH124 : ((-32768) <= a21)) (PreH125 : (a21 <= 32767)) (PreH126 : ((-32768) <= a22)) (PreH127 : (a22 <= 32767)) (PreH128 : ((-32768) <= a23)) (PreH129 : (a23 <= 32767)) (PreH130 : ((-32768) <= a24)) (PreH131 : (a24 <= 32767)) (PreH132 : ((-32768) <= a25)) (PreH133 : (a25 <= 32767)) (PreH134 : ((-32768) <= a26)) (PreH135 : (a26 <= 32767)) (PreH136 : ((-32768) <= a27)) (PreH137 : (a27 <= 32767)) (PreH138 : ((-32768) <= a28)) (PreH139 : (a28 <= 32767)) (PreH140 : ((-32768) <= a29)) (PreH141 : (a29 <= 32767)) (PreH142 : ((-32768) <= a30)) (PreH143 : (a30 <= 32767)) (PreH144 : ((-32768) <= a31)) (PreH145 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a27) ” 
  &&  “ (a27 <= INT_MAX) ” 
  &&  “ (retval_27 = (qu_u16 (a26))) ” 
  &&  “ (0 <= retval_27) ” 
  &&  “ (retval_27 <= 65535) ” 
  &&  “ (retval_26 = (qu_u16 (a25))) ” 
  &&  “ (0 <= retval_26) ” 
  &&  “ (retval_26 <= 65535) ” 
  &&  “ (retval_25 = (qu_u16 (a24))) ” 
  &&  “ (0 <= retval_25) ” 
  &&  “ (retval_25 <= 65535) ” 
  &&  “ (retval_24 = (qu_u16 (a23))) ” 
  &&  “ (0 <= retval_24) ” 
  &&  “ (retval_24 <= 65535) ” 
  &&  “ (retval_23 = (qu_u16 (a22))) ” 
  &&  “ (0 <= retval_23) ” 
  &&  “ (retval_23 <= 65535) ” 
  &&  “ (retval_22 = (qu_u16 (a21))) ” 
  &&  “ (0 <= retval_22) ” 
  &&  “ (retval_22 <= 65535) ” 
  &&  “ (retval_21 = (qu_u16 (a20))) ” 
  &&  “ (0 <= retval_21) ” 
  &&  “ (retval_21 <= 65535) ” 
  &&  “ (retval_20 = (qu_u16 (a19))) ” 
  &&  “ (0 <= retval_20) ” 
  &&  “ (retval_20 <= 65535) ” 
  &&  “ (retval_19 = (qu_u16 (a18))) ” 
  &&  “ (0 <= retval_19) ” 
  &&  “ (retval_19 <= 65535) ” 
  &&  “ (retval_18 = (qu_u16 (a17))) ” 
  &&  “ (0 <= retval_18) ” 
  &&  “ (retval_18 <= 65535) ” 
  &&  “ (retval_17 = (qu_u16 (a16))) ” 
  &&  “ (0 <= retval_17) ” 
  &&  “ (retval_17 <= 65535) ” 
  &&  “ (retval_16 = (qu_u16 (a15))) ” 
  &&  “ (0 <= retval_16) ” 
  &&  “ (retval_16 <= 65535) ” 
  &&  “ (retval_15 = (qu_u16 (a14))) ” 
  &&  “ (0 <= retval_15) ” 
  &&  “ (retval_15 <= 65535) ” 
  &&  “ (retval_14 = (qu_u16 (a13))) ” 
  &&  “ (0 <= retval_14) ” 
  &&  “ (retval_14 <= 65535) ” 
  &&  “ (retval_13 = (qu_u16 (a12))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= 65535) ” 
  &&  “ (retval_12 = (qu_u16 (a11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= 65535) ” 
  &&  “ (retval_11 = (qu_u16 (a10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= 65535) ” 
  &&  “ (retval_10 = (qu_u16 (a9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= 65535) ” 
  &&  “ (retval_9 = (qu_u16 (a8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= 65535) ” 
  &&  “ (retval_8 = (qu_u16 (a7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= 65535) ” 
  &&  “ (retval_7 = (qu_u16 (a6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 65535) ” 
  &&  “ (retval_6 = (qu_u16 (a5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 65535) ” 
  &&  “ (retval_5 = (qu_u16 (a4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 65535) ” 
  &&  “ (retval_4 = (qu_u16 (a3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 65535) ” 
  &&  “ (retval_3 = (qu_u16 (a2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (qu_u16 (a1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (qu_u16 (a0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= a8) ” 
  &&  “ (a8 <= 32767) ” 
  &&  “ ((-32768) <= a9) ” 
  &&  “ (a9 <= 32767) ” 
  &&  “ ((-32768) <= a10) ” 
  &&  “ (a10 <= 32767) ” 
  &&  “ ((-32768) <= a11) ” 
  &&  “ (a11 <= 32767) ” 
  &&  “ ((-32768) <= a12) ” 
  &&  “ (a12 <= 32767) ” 
  &&  “ ((-32768) <= a13) ” 
  &&  “ (a13 <= 32767) ” 
  &&  “ ((-32768) <= a14) ” 
  &&  “ (a14 <= 32767) ” 
  &&  “ ((-32768) <= a15) ” 
  &&  “ (a15 <= 32767) ” 
  &&  “ ((-32768) <= a16) ” 
  &&  “ (a16 <= 32767) ” 
  &&  “ ((-32768) <= a17) ” 
  &&  “ (a17 <= 32767) ” 
  &&  “ ((-32768) <= a18) ” 
  &&  “ (a18 <= 32767) ” 
  &&  “ ((-32768) <= a19) ” 
  &&  “ (a19 <= 32767) ” 
  &&  “ ((-32768) <= a20) ” 
  &&  “ (a20 <= 32767) ” 
  &&  “ ((-32768) <= a21) ” 
  &&  “ (a21 <= 32767) ” 
  &&  “ ((-32768) <= a22) ” 
  &&  “ (a22 <= 32767) ” 
  &&  “ ((-32768) <= a23) ” 
  &&  “ (a23 <= 32767) ” 
  &&  “ ((-32768) <= a24) ” 
  &&  “ (a24 <= 32767) ” 
  &&  “ ((-32768) <= a25) ” 
  &&  “ (a25 <= 32767) ” 
  &&  “ ((-32768) <= a26) ” 
  &&  “ (a26 <= 32767) ” 
  &&  “ ((-32768) <= a27) ” 
  &&  “ (a27 <= 32767) ” 
  &&  “ ((-32768) <= a28) ” 
  &&  “ (a28 <= 32767) ” 
  &&  “ ((-32768) <= a29) ” 
  &&  “ (a29 <= 32767) ” 
  &&  “ ((-32768) <= a30) ” 
  &&  “ (a30 <= 32767) ” 
  &&  “ ((-32768) <= a31) ” 
  &&  “ (a31 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_28 := __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_28_pure -> __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_28_aux.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_29_pure := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (PreH1 : (retval_28 = (qu_u16 (a27)))) (PreH2 : (0 <= retval_28)) (PreH3 : (retval_28 <= 65535)) (PreH4 : (retval_27 = (qu_u16 (a26)))) (PreH5 : (0 <= retval_27)) (PreH6 : (retval_27 <= 65535)) (PreH7 : (retval_26 = (qu_u16 (a25)))) (PreH8 : (0 <= retval_26)) (PreH9 : (retval_26 <= 65535)) (PreH10 : (retval_25 = (qu_u16 (a24)))) (PreH11 : (0 <= retval_25)) (PreH12 : (retval_25 <= 65535)) (PreH13 : (retval_24 = (qu_u16 (a23)))) (PreH14 : (0 <= retval_24)) (PreH15 : (retval_24 <= 65535)) (PreH16 : (retval_23 = (qu_u16 (a22)))) (PreH17 : (0 <= retval_23)) (PreH18 : (retval_23 <= 65535)) (PreH19 : (retval_22 = (qu_u16 (a21)))) (PreH20 : (0 <= retval_22)) (PreH21 : (retval_22 <= 65535)) (PreH22 : (retval_21 = (qu_u16 (a20)))) (PreH23 : (0 <= retval_21)) (PreH24 : (retval_21 <= 65535)) (PreH25 : (retval_20 = (qu_u16 (a19)))) (PreH26 : (0 <= retval_20)) (PreH27 : (retval_20 <= 65535)) (PreH28 : (retval_19 = (qu_u16 (a18)))) (PreH29 : (0 <= retval_19)) (PreH30 : (retval_19 <= 65535)) (PreH31 : (retval_18 = (qu_u16 (a17)))) (PreH32 : (0 <= retval_18)) (PreH33 : (retval_18 <= 65535)) (PreH34 : (retval_17 = (qu_u16 (a16)))) (PreH35 : (0 <= retval_17)) (PreH36 : (retval_17 <= 65535)) (PreH37 : (retval_16 = (qu_u16 (a15)))) (PreH38 : (0 <= retval_16)) (PreH39 : (retval_16 <= 65535)) (PreH40 : (retval_15 = (qu_u16 (a14)))) (PreH41 : (0 <= retval_15)) (PreH42 : (retval_15 <= 65535)) (PreH43 : (retval_14 = (qu_u16 (a13)))) (PreH44 : (0 <= retval_14)) (PreH45 : (retval_14 <= 65535)) (PreH46 : (retval_13 = (qu_u16 (a12)))) (PreH47 : (0 <= retval_13)) (PreH48 : (retval_13 <= 65535)) (PreH49 : (retval_12 = (qu_u16 (a11)))) (PreH50 : (0 <= retval_12)) (PreH51 : (retval_12 <= 65535)) (PreH52 : (retval_11 = (qu_u16 (a10)))) (PreH53 : (0 <= retval_11)) (PreH54 : (retval_11 <= 65535)) (PreH55 : (retval_10 = (qu_u16 (a9)))) (PreH56 : (0 <= retval_10)) (PreH57 : (retval_10 <= 65535)) (PreH58 : (retval_9 = (qu_u16 (a8)))) (PreH59 : (0 <= retval_9)) (PreH60 : (retval_9 <= 65535)) (PreH61 : (retval_8 = (qu_u16 (a7)))) (PreH62 : (0 <= retval_8)) (PreH63 : (retval_8 <= 65535)) (PreH64 : (retval_7 = (qu_u16 (a6)))) (PreH65 : (0 <= retval_7)) (PreH66 : (retval_7 <= 65535)) (PreH67 : (retval_6 = (qu_u16 (a5)))) (PreH68 : (0 <= retval_6)) (PreH69 : (retval_6 <= 65535)) (PreH70 : (retval_5 = (qu_u16 (a4)))) (PreH71 : (0 <= retval_5)) (PreH72 : (retval_5 <= 65535)) (PreH73 : (retval_4 = (qu_u16 (a3)))) (PreH74 : (0 <= retval_4)) (PreH75 : (retval_4 <= 65535)) (PreH76 : (retval_3 = (qu_u16 (a2)))) (PreH77 : (0 <= retval_3)) (PreH78 : (retval_3 <= 65535)) (PreH79 : (retval_2 = (qu_u16 (a1)))) (PreH80 : (0 <= retval_2)) (PreH81 : (retval_2 <= 65535)) (PreH82 : (retval = (qu_u16 (a0)))) (PreH83 : (0 <= retval)) (PreH84 : (retval <= 65535)) (PreH85 : ((-32768) <= a0)) (PreH86 : (a0 <= 32767)) (PreH87 : ((-32768) <= a1)) (PreH88 : (a1 <= 32767)) (PreH89 : ((-32768) <= a2)) (PreH90 : (a2 <= 32767)) (PreH91 : ((-32768) <= a3)) (PreH92 : (a3 <= 32767)) (PreH93 : ((-32768) <= a4)) (PreH94 : (a4 <= 32767)) (PreH95 : ((-32768) <= a5)) (PreH96 : (a5 <= 32767)) (PreH97 : ((-32768) <= a6)) (PreH98 : (a6 <= 32767)) (PreH99 : ((-32768) <= a7)) (PreH100 : (a7 <= 32767)) (PreH101 : ((-32768) <= a8)) (PreH102 : (a8 <= 32767)) (PreH103 : ((-32768) <= a9)) (PreH104 : (a9 <= 32767)) (PreH105 : ((-32768) <= a10)) (PreH106 : (a10 <= 32767)) (PreH107 : ((-32768) <= a11)) (PreH108 : (a11 <= 32767)) (PreH109 : ((-32768) <= a12)) (PreH110 : (a12 <= 32767)) (PreH111 : ((-32768) <= a13)) (PreH112 : (a13 <= 32767)) (PreH113 : ((-32768) <= a14)) (PreH114 : (a14 <= 32767)) (PreH115 : ((-32768) <= a15)) (PreH116 : (a15 <= 32767)) (PreH117 : ((-32768) <= a16)) (PreH118 : (a16 <= 32767)) (PreH119 : ((-32768) <= a17)) (PreH120 : (a17 <= 32767)) (PreH121 : ((-32768) <= a18)) (PreH122 : (a18 <= 32767)) (PreH123 : ((-32768) <= a19)) (PreH124 : (a19 <= 32767)) (PreH125 : ((-32768) <= a20)) (PreH126 : (a20 <= 32767)) (PreH127 : ((-32768) <= a21)) (PreH128 : (a21 <= 32767)) (PreH129 : ((-32768) <= a22)) (PreH130 : (a22 <= 32767)) (PreH131 : ((-32768) <= a23)) (PreH132 : (a23 <= 32767)) (PreH133 : ((-32768) <= a24)) (PreH134 : (a24 <= 32767)) (PreH135 : ((-32768) <= a25)) (PreH136 : (a25 <= 32767)) (PreH137 : ((-32768) <= a26)) (PreH138 : (a26 <= 32767)) (PreH139 : ((-32768) <= a27)) (PreH140 : (a27 <= 32767)) (PreH141 : ((-32768) <= a28)) (PreH142 : (a28 <= 32767)) (PreH143 : ((-32768) <= a29)) (PreH144 : (a29 <= 32767)) (PreH145 : ((-32768) <= a30)) (PreH146 : (a30 <= 32767)) (PreH147 : ((-32768) <= a31)) (PreH148 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a28) ” 
  &&  “ (a28 <= INT_MAX) ”
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_29_aux := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (PreH1 : (retval_28 = (qu_u16 (a27)))) (PreH2 : (0 <= retval_28)) (PreH3 : (retval_28 <= 65535)) (PreH4 : (retval_27 = (qu_u16 (a26)))) (PreH5 : (0 <= retval_27)) (PreH6 : (retval_27 <= 65535)) (PreH7 : (retval_26 = (qu_u16 (a25)))) (PreH8 : (0 <= retval_26)) (PreH9 : (retval_26 <= 65535)) (PreH10 : (retval_25 = (qu_u16 (a24)))) (PreH11 : (0 <= retval_25)) (PreH12 : (retval_25 <= 65535)) (PreH13 : (retval_24 = (qu_u16 (a23)))) (PreH14 : (0 <= retval_24)) (PreH15 : (retval_24 <= 65535)) (PreH16 : (retval_23 = (qu_u16 (a22)))) (PreH17 : (0 <= retval_23)) (PreH18 : (retval_23 <= 65535)) (PreH19 : (retval_22 = (qu_u16 (a21)))) (PreH20 : (0 <= retval_22)) (PreH21 : (retval_22 <= 65535)) (PreH22 : (retval_21 = (qu_u16 (a20)))) (PreH23 : (0 <= retval_21)) (PreH24 : (retval_21 <= 65535)) (PreH25 : (retval_20 = (qu_u16 (a19)))) (PreH26 : (0 <= retval_20)) (PreH27 : (retval_20 <= 65535)) (PreH28 : (retval_19 = (qu_u16 (a18)))) (PreH29 : (0 <= retval_19)) (PreH30 : (retval_19 <= 65535)) (PreH31 : (retval_18 = (qu_u16 (a17)))) (PreH32 : (0 <= retval_18)) (PreH33 : (retval_18 <= 65535)) (PreH34 : (retval_17 = (qu_u16 (a16)))) (PreH35 : (0 <= retval_17)) (PreH36 : (retval_17 <= 65535)) (PreH37 : (retval_16 = (qu_u16 (a15)))) (PreH38 : (0 <= retval_16)) (PreH39 : (retval_16 <= 65535)) (PreH40 : (retval_15 = (qu_u16 (a14)))) (PreH41 : (0 <= retval_15)) (PreH42 : (retval_15 <= 65535)) (PreH43 : (retval_14 = (qu_u16 (a13)))) (PreH44 : (0 <= retval_14)) (PreH45 : (retval_14 <= 65535)) (PreH46 : (retval_13 = (qu_u16 (a12)))) (PreH47 : (0 <= retval_13)) (PreH48 : (retval_13 <= 65535)) (PreH49 : (retval_12 = (qu_u16 (a11)))) (PreH50 : (0 <= retval_12)) (PreH51 : (retval_12 <= 65535)) (PreH52 : (retval_11 = (qu_u16 (a10)))) (PreH53 : (0 <= retval_11)) (PreH54 : (retval_11 <= 65535)) (PreH55 : (retval_10 = (qu_u16 (a9)))) (PreH56 : (0 <= retval_10)) (PreH57 : (retval_10 <= 65535)) (PreH58 : (retval_9 = (qu_u16 (a8)))) (PreH59 : (0 <= retval_9)) (PreH60 : (retval_9 <= 65535)) (PreH61 : (retval_8 = (qu_u16 (a7)))) (PreH62 : (0 <= retval_8)) (PreH63 : (retval_8 <= 65535)) (PreH64 : (retval_7 = (qu_u16 (a6)))) (PreH65 : (0 <= retval_7)) (PreH66 : (retval_7 <= 65535)) (PreH67 : (retval_6 = (qu_u16 (a5)))) (PreH68 : (0 <= retval_6)) (PreH69 : (retval_6 <= 65535)) (PreH70 : (retval_5 = (qu_u16 (a4)))) (PreH71 : (0 <= retval_5)) (PreH72 : (retval_5 <= 65535)) (PreH73 : (retval_4 = (qu_u16 (a3)))) (PreH74 : (0 <= retval_4)) (PreH75 : (retval_4 <= 65535)) (PreH76 : (retval_3 = (qu_u16 (a2)))) (PreH77 : (0 <= retval_3)) (PreH78 : (retval_3 <= 65535)) (PreH79 : (retval_2 = (qu_u16 (a1)))) (PreH80 : (0 <= retval_2)) (PreH81 : (retval_2 <= 65535)) (PreH82 : (retval = (qu_u16 (a0)))) (PreH83 : (0 <= retval)) (PreH84 : (retval <= 65535)) (PreH85 : ((-32768) <= a0)) (PreH86 : (a0 <= 32767)) (PreH87 : ((-32768) <= a1)) (PreH88 : (a1 <= 32767)) (PreH89 : ((-32768) <= a2)) (PreH90 : (a2 <= 32767)) (PreH91 : ((-32768) <= a3)) (PreH92 : (a3 <= 32767)) (PreH93 : ((-32768) <= a4)) (PreH94 : (a4 <= 32767)) (PreH95 : ((-32768) <= a5)) (PreH96 : (a5 <= 32767)) (PreH97 : ((-32768) <= a6)) (PreH98 : (a6 <= 32767)) (PreH99 : ((-32768) <= a7)) (PreH100 : (a7 <= 32767)) (PreH101 : ((-32768) <= a8)) (PreH102 : (a8 <= 32767)) (PreH103 : ((-32768) <= a9)) (PreH104 : (a9 <= 32767)) (PreH105 : ((-32768) <= a10)) (PreH106 : (a10 <= 32767)) (PreH107 : ((-32768) <= a11)) (PreH108 : (a11 <= 32767)) (PreH109 : ((-32768) <= a12)) (PreH110 : (a12 <= 32767)) (PreH111 : ((-32768) <= a13)) (PreH112 : (a13 <= 32767)) (PreH113 : ((-32768) <= a14)) (PreH114 : (a14 <= 32767)) (PreH115 : ((-32768) <= a15)) (PreH116 : (a15 <= 32767)) (PreH117 : ((-32768) <= a16)) (PreH118 : (a16 <= 32767)) (PreH119 : ((-32768) <= a17)) (PreH120 : (a17 <= 32767)) (PreH121 : ((-32768) <= a18)) (PreH122 : (a18 <= 32767)) (PreH123 : ((-32768) <= a19)) (PreH124 : (a19 <= 32767)) (PreH125 : ((-32768) <= a20)) (PreH126 : (a20 <= 32767)) (PreH127 : ((-32768) <= a21)) (PreH128 : (a21 <= 32767)) (PreH129 : ((-32768) <= a22)) (PreH130 : (a22 <= 32767)) (PreH131 : ((-32768) <= a23)) (PreH132 : (a23 <= 32767)) (PreH133 : ((-32768) <= a24)) (PreH134 : (a24 <= 32767)) (PreH135 : ((-32768) <= a25)) (PreH136 : (a25 <= 32767)) (PreH137 : ((-32768) <= a26)) (PreH138 : (a26 <= 32767)) (PreH139 : ((-32768) <= a27)) (PreH140 : (a27 <= 32767)) (PreH141 : ((-32768) <= a28)) (PreH142 : (a28 <= 32767)) (PreH143 : ((-32768) <= a29)) (PreH144 : (a29 <= 32767)) (PreH145 : ((-32768) <= a30)) (PreH146 : (a30 <= 32767)) (PreH147 : ((-32768) <= a31)) (PreH148 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a28) ” 
  &&  “ (a28 <= INT_MAX) ” 
  &&  “ (retval_28 = (qu_u16 (a27))) ” 
  &&  “ (0 <= retval_28) ” 
  &&  “ (retval_28 <= 65535) ” 
  &&  “ (retval_27 = (qu_u16 (a26))) ” 
  &&  “ (0 <= retval_27) ” 
  &&  “ (retval_27 <= 65535) ” 
  &&  “ (retval_26 = (qu_u16 (a25))) ” 
  &&  “ (0 <= retval_26) ” 
  &&  “ (retval_26 <= 65535) ” 
  &&  “ (retval_25 = (qu_u16 (a24))) ” 
  &&  “ (0 <= retval_25) ” 
  &&  “ (retval_25 <= 65535) ” 
  &&  “ (retval_24 = (qu_u16 (a23))) ” 
  &&  “ (0 <= retval_24) ” 
  &&  “ (retval_24 <= 65535) ” 
  &&  “ (retval_23 = (qu_u16 (a22))) ” 
  &&  “ (0 <= retval_23) ” 
  &&  “ (retval_23 <= 65535) ” 
  &&  “ (retval_22 = (qu_u16 (a21))) ” 
  &&  “ (0 <= retval_22) ” 
  &&  “ (retval_22 <= 65535) ” 
  &&  “ (retval_21 = (qu_u16 (a20))) ” 
  &&  “ (0 <= retval_21) ” 
  &&  “ (retval_21 <= 65535) ” 
  &&  “ (retval_20 = (qu_u16 (a19))) ” 
  &&  “ (0 <= retval_20) ” 
  &&  “ (retval_20 <= 65535) ” 
  &&  “ (retval_19 = (qu_u16 (a18))) ” 
  &&  “ (0 <= retval_19) ” 
  &&  “ (retval_19 <= 65535) ” 
  &&  “ (retval_18 = (qu_u16 (a17))) ” 
  &&  “ (0 <= retval_18) ” 
  &&  “ (retval_18 <= 65535) ” 
  &&  “ (retval_17 = (qu_u16 (a16))) ” 
  &&  “ (0 <= retval_17) ” 
  &&  “ (retval_17 <= 65535) ” 
  &&  “ (retval_16 = (qu_u16 (a15))) ” 
  &&  “ (0 <= retval_16) ” 
  &&  “ (retval_16 <= 65535) ” 
  &&  “ (retval_15 = (qu_u16 (a14))) ” 
  &&  “ (0 <= retval_15) ” 
  &&  “ (retval_15 <= 65535) ” 
  &&  “ (retval_14 = (qu_u16 (a13))) ” 
  &&  “ (0 <= retval_14) ” 
  &&  “ (retval_14 <= 65535) ” 
  &&  “ (retval_13 = (qu_u16 (a12))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= 65535) ” 
  &&  “ (retval_12 = (qu_u16 (a11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= 65535) ” 
  &&  “ (retval_11 = (qu_u16 (a10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= 65535) ” 
  &&  “ (retval_10 = (qu_u16 (a9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= 65535) ” 
  &&  “ (retval_9 = (qu_u16 (a8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= 65535) ” 
  &&  “ (retval_8 = (qu_u16 (a7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= 65535) ” 
  &&  “ (retval_7 = (qu_u16 (a6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 65535) ” 
  &&  “ (retval_6 = (qu_u16 (a5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 65535) ” 
  &&  “ (retval_5 = (qu_u16 (a4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 65535) ” 
  &&  “ (retval_4 = (qu_u16 (a3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 65535) ” 
  &&  “ (retval_3 = (qu_u16 (a2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (qu_u16 (a1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (qu_u16 (a0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= a8) ” 
  &&  “ (a8 <= 32767) ” 
  &&  “ ((-32768) <= a9) ” 
  &&  “ (a9 <= 32767) ” 
  &&  “ ((-32768) <= a10) ” 
  &&  “ (a10 <= 32767) ” 
  &&  “ ((-32768) <= a11) ” 
  &&  “ (a11 <= 32767) ” 
  &&  “ ((-32768) <= a12) ” 
  &&  “ (a12 <= 32767) ” 
  &&  “ ((-32768) <= a13) ” 
  &&  “ (a13 <= 32767) ” 
  &&  “ ((-32768) <= a14) ” 
  &&  “ (a14 <= 32767) ” 
  &&  “ ((-32768) <= a15) ” 
  &&  “ (a15 <= 32767) ” 
  &&  “ ((-32768) <= a16) ” 
  &&  “ (a16 <= 32767) ” 
  &&  “ ((-32768) <= a17) ” 
  &&  “ (a17 <= 32767) ” 
  &&  “ ((-32768) <= a18) ” 
  &&  “ (a18 <= 32767) ” 
  &&  “ ((-32768) <= a19) ” 
  &&  “ (a19 <= 32767) ” 
  &&  “ ((-32768) <= a20) ” 
  &&  “ (a20 <= 32767) ” 
  &&  “ ((-32768) <= a21) ” 
  &&  “ (a21 <= 32767) ” 
  &&  “ ((-32768) <= a22) ” 
  &&  “ (a22 <= 32767) ” 
  &&  “ ((-32768) <= a23) ” 
  &&  “ (a23 <= 32767) ” 
  &&  “ ((-32768) <= a24) ” 
  &&  “ (a24 <= 32767) ” 
  &&  “ ((-32768) <= a25) ” 
  &&  “ (a25 <= 32767) ” 
  &&  “ ((-32768) <= a26) ” 
  &&  “ (a26 <= 32767) ” 
  &&  “ ((-32768) <= a27) ” 
  &&  “ (a27 <= 32767) ” 
  &&  “ ((-32768) <= a28) ” 
  &&  “ (a28 <= 32767) ” 
  &&  “ ((-32768) <= a29) ” 
  &&  “ (a29 <= 32767) ” 
  &&  “ ((-32768) <= a30) ” 
  &&  “ (a30 <= 32767) ” 
  &&  “ ((-32768) <= a31) ” 
  &&  “ (a31 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_29 := __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_29_pure -> __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_29_aux.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_30_pure := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (PreH1 : (retval_29 = (qu_u16 (a28)))) (PreH2 : (0 <= retval_29)) (PreH3 : (retval_29 <= 65535)) (PreH4 : (retval_28 = (qu_u16 (a27)))) (PreH5 : (0 <= retval_28)) (PreH6 : (retval_28 <= 65535)) (PreH7 : (retval_27 = (qu_u16 (a26)))) (PreH8 : (0 <= retval_27)) (PreH9 : (retval_27 <= 65535)) (PreH10 : (retval_26 = (qu_u16 (a25)))) (PreH11 : (0 <= retval_26)) (PreH12 : (retval_26 <= 65535)) (PreH13 : (retval_25 = (qu_u16 (a24)))) (PreH14 : (0 <= retval_25)) (PreH15 : (retval_25 <= 65535)) (PreH16 : (retval_24 = (qu_u16 (a23)))) (PreH17 : (0 <= retval_24)) (PreH18 : (retval_24 <= 65535)) (PreH19 : (retval_23 = (qu_u16 (a22)))) (PreH20 : (0 <= retval_23)) (PreH21 : (retval_23 <= 65535)) (PreH22 : (retval_22 = (qu_u16 (a21)))) (PreH23 : (0 <= retval_22)) (PreH24 : (retval_22 <= 65535)) (PreH25 : (retval_21 = (qu_u16 (a20)))) (PreH26 : (0 <= retval_21)) (PreH27 : (retval_21 <= 65535)) (PreH28 : (retval_20 = (qu_u16 (a19)))) (PreH29 : (0 <= retval_20)) (PreH30 : (retval_20 <= 65535)) (PreH31 : (retval_19 = (qu_u16 (a18)))) (PreH32 : (0 <= retval_19)) (PreH33 : (retval_19 <= 65535)) (PreH34 : (retval_18 = (qu_u16 (a17)))) (PreH35 : (0 <= retval_18)) (PreH36 : (retval_18 <= 65535)) (PreH37 : (retval_17 = (qu_u16 (a16)))) (PreH38 : (0 <= retval_17)) (PreH39 : (retval_17 <= 65535)) (PreH40 : (retval_16 = (qu_u16 (a15)))) (PreH41 : (0 <= retval_16)) (PreH42 : (retval_16 <= 65535)) (PreH43 : (retval_15 = (qu_u16 (a14)))) (PreH44 : (0 <= retval_15)) (PreH45 : (retval_15 <= 65535)) (PreH46 : (retval_14 = (qu_u16 (a13)))) (PreH47 : (0 <= retval_14)) (PreH48 : (retval_14 <= 65535)) (PreH49 : (retval_13 = (qu_u16 (a12)))) (PreH50 : (0 <= retval_13)) (PreH51 : (retval_13 <= 65535)) (PreH52 : (retval_12 = (qu_u16 (a11)))) (PreH53 : (0 <= retval_12)) (PreH54 : (retval_12 <= 65535)) (PreH55 : (retval_11 = (qu_u16 (a10)))) (PreH56 : (0 <= retval_11)) (PreH57 : (retval_11 <= 65535)) (PreH58 : (retval_10 = (qu_u16 (a9)))) (PreH59 : (0 <= retval_10)) (PreH60 : (retval_10 <= 65535)) (PreH61 : (retval_9 = (qu_u16 (a8)))) (PreH62 : (0 <= retval_9)) (PreH63 : (retval_9 <= 65535)) (PreH64 : (retval_8 = (qu_u16 (a7)))) (PreH65 : (0 <= retval_8)) (PreH66 : (retval_8 <= 65535)) (PreH67 : (retval_7 = (qu_u16 (a6)))) (PreH68 : (0 <= retval_7)) (PreH69 : (retval_7 <= 65535)) (PreH70 : (retval_6 = (qu_u16 (a5)))) (PreH71 : (0 <= retval_6)) (PreH72 : (retval_6 <= 65535)) (PreH73 : (retval_5 = (qu_u16 (a4)))) (PreH74 : (0 <= retval_5)) (PreH75 : (retval_5 <= 65535)) (PreH76 : (retval_4 = (qu_u16 (a3)))) (PreH77 : (0 <= retval_4)) (PreH78 : (retval_4 <= 65535)) (PreH79 : (retval_3 = (qu_u16 (a2)))) (PreH80 : (0 <= retval_3)) (PreH81 : (retval_3 <= 65535)) (PreH82 : (retval_2 = (qu_u16 (a1)))) (PreH83 : (0 <= retval_2)) (PreH84 : (retval_2 <= 65535)) (PreH85 : (retval = (qu_u16 (a0)))) (PreH86 : (0 <= retval)) (PreH87 : (retval <= 65535)) (PreH88 : ((-32768) <= a0)) (PreH89 : (a0 <= 32767)) (PreH90 : ((-32768) <= a1)) (PreH91 : (a1 <= 32767)) (PreH92 : ((-32768) <= a2)) (PreH93 : (a2 <= 32767)) (PreH94 : ((-32768) <= a3)) (PreH95 : (a3 <= 32767)) (PreH96 : ((-32768) <= a4)) (PreH97 : (a4 <= 32767)) (PreH98 : ((-32768) <= a5)) (PreH99 : (a5 <= 32767)) (PreH100 : ((-32768) <= a6)) (PreH101 : (a6 <= 32767)) (PreH102 : ((-32768) <= a7)) (PreH103 : (a7 <= 32767)) (PreH104 : ((-32768) <= a8)) (PreH105 : (a8 <= 32767)) (PreH106 : ((-32768) <= a9)) (PreH107 : (a9 <= 32767)) (PreH108 : ((-32768) <= a10)) (PreH109 : (a10 <= 32767)) (PreH110 : ((-32768) <= a11)) (PreH111 : (a11 <= 32767)) (PreH112 : ((-32768) <= a12)) (PreH113 : (a12 <= 32767)) (PreH114 : ((-32768) <= a13)) (PreH115 : (a13 <= 32767)) (PreH116 : ((-32768) <= a14)) (PreH117 : (a14 <= 32767)) (PreH118 : ((-32768) <= a15)) (PreH119 : (a15 <= 32767)) (PreH120 : ((-32768) <= a16)) (PreH121 : (a16 <= 32767)) (PreH122 : ((-32768) <= a17)) (PreH123 : (a17 <= 32767)) (PreH124 : ((-32768) <= a18)) (PreH125 : (a18 <= 32767)) (PreH126 : ((-32768) <= a19)) (PreH127 : (a19 <= 32767)) (PreH128 : ((-32768) <= a20)) (PreH129 : (a20 <= 32767)) (PreH130 : ((-32768) <= a21)) (PreH131 : (a21 <= 32767)) (PreH132 : ((-32768) <= a22)) (PreH133 : (a22 <= 32767)) (PreH134 : ((-32768) <= a23)) (PreH135 : (a23 <= 32767)) (PreH136 : ((-32768) <= a24)) (PreH137 : (a24 <= 32767)) (PreH138 : ((-32768) <= a25)) (PreH139 : (a25 <= 32767)) (PreH140 : ((-32768) <= a26)) (PreH141 : (a26 <= 32767)) (PreH142 : ((-32768) <= a27)) (PreH143 : (a27 <= 32767)) (PreH144 : ((-32768) <= a28)) (PreH145 : (a28 <= 32767)) (PreH146 : ((-32768) <= a29)) (PreH147 : (a29 <= 32767)) (PreH148 : ((-32768) <= a30)) (PreH149 : (a30 <= 32767)) (PreH150 : ((-32768) <= a31)) (PreH151 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a29) ” 
  &&  “ (a29 <= INT_MAX) ”
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_30_aux := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (PreH1 : (retval_29 = (qu_u16 (a28)))) (PreH2 : (0 <= retval_29)) (PreH3 : (retval_29 <= 65535)) (PreH4 : (retval_28 = (qu_u16 (a27)))) (PreH5 : (0 <= retval_28)) (PreH6 : (retval_28 <= 65535)) (PreH7 : (retval_27 = (qu_u16 (a26)))) (PreH8 : (0 <= retval_27)) (PreH9 : (retval_27 <= 65535)) (PreH10 : (retval_26 = (qu_u16 (a25)))) (PreH11 : (0 <= retval_26)) (PreH12 : (retval_26 <= 65535)) (PreH13 : (retval_25 = (qu_u16 (a24)))) (PreH14 : (0 <= retval_25)) (PreH15 : (retval_25 <= 65535)) (PreH16 : (retval_24 = (qu_u16 (a23)))) (PreH17 : (0 <= retval_24)) (PreH18 : (retval_24 <= 65535)) (PreH19 : (retval_23 = (qu_u16 (a22)))) (PreH20 : (0 <= retval_23)) (PreH21 : (retval_23 <= 65535)) (PreH22 : (retval_22 = (qu_u16 (a21)))) (PreH23 : (0 <= retval_22)) (PreH24 : (retval_22 <= 65535)) (PreH25 : (retval_21 = (qu_u16 (a20)))) (PreH26 : (0 <= retval_21)) (PreH27 : (retval_21 <= 65535)) (PreH28 : (retval_20 = (qu_u16 (a19)))) (PreH29 : (0 <= retval_20)) (PreH30 : (retval_20 <= 65535)) (PreH31 : (retval_19 = (qu_u16 (a18)))) (PreH32 : (0 <= retval_19)) (PreH33 : (retval_19 <= 65535)) (PreH34 : (retval_18 = (qu_u16 (a17)))) (PreH35 : (0 <= retval_18)) (PreH36 : (retval_18 <= 65535)) (PreH37 : (retval_17 = (qu_u16 (a16)))) (PreH38 : (0 <= retval_17)) (PreH39 : (retval_17 <= 65535)) (PreH40 : (retval_16 = (qu_u16 (a15)))) (PreH41 : (0 <= retval_16)) (PreH42 : (retval_16 <= 65535)) (PreH43 : (retval_15 = (qu_u16 (a14)))) (PreH44 : (0 <= retval_15)) (PreH45 : (retval_15 <= 65535)) (PreH46 : (retval_14 = (qu_u16 (a13)))) (PreH47 : (0 <= retval_14)) (PreH48 : (retval_14 <= 65535)) (PreH49 : (retval_13 = (qu_u16 (a12)))) (PreH50 : (0 <= retval_13)) (PreH51 : (retval_13 <= 65535)) (PreH52 : (retval_12 = (qu_u16 (a11)))) (PreH53 : (0 <= retval_12)) (PreH54 : (retval_12 <= 65535)) (PreH55 : (retval_11 = (qu_u16 (a10)))) (PreH56 : (0 <= retval_11)) (PreH57 : (retval_11 <= 65535)) (PreH58 : (retval_10 = (qu_u16 (a9)))) (PreH59 : (0 <= retval_10)) (PreH60 : (retval_10 <= 65535)) (PreH61 : (retval_9 = (qu_u16 (a8)))) (PreH62 : (0 <= retval_9)) (PreH63 : (retval_9 <= 65535)) (PreH64 : (retval_8 = (qu_u16 (a7)))) (PreH65 : (0 <= retval_8)) (PreH66 : (retval_8 <= 65535)) (PreH67 : (retval_7 = (qu_u16 (a6)))) (PreH68 : (0 <= retval_7)) (PreH69 : (retval_7 <= 65535)) (PreH70 : (retval_6 = (qu_u16 (a5)))) (PreH71 : (0 <= retval_6)) (PreH72 : (retval_6 <= 65535)) (PreH73 : (retval_5 = (qu_u16 (a4)))) (PreH74 : (0 <= retval_5)) (PreH75 : (retval_5 <= 65535)) (PreH76 : (retval_4 = (qu_u16 (a3)))) (PreH77 : (0 <= retval_4)) (PreH78 : (retval_4 <= 65535)) (PreH79 : (retval_3 = (qu_u16 (a2)))) (PreH80 : (0 <= retval_3)) (PreH81 : (retval_3 <= 65535)) (PreH82 : (retval_2 = (qu_u16 (a1)))) (PreH83 : (0 <= retval_2)) (PreH84 : (retval_2 <= 65535)) (PreH85 : (retval = (qu_u16 (a0)))) (PreH86 : (0 <= retval)) (PreH87 : (retval <= 65535)) (PreH88 : ((-32768) <= a0)) (PreH89 : (a0 <= 32767)) (PreH90 : ((-32768) <= a1)) (PreH91 : (a1 <= 32767)) (PreH92 : ((-32768) <= a2)) (PreH93 : (a2 <= 32767)) (PreH94 : ((-32768) <= a3)) (PreH95 : (a3 <= 32767)) (PreH96 : ((-32768) <= a4)) (PreH97 : (a4 <= 32767)) (PreH98 : ((-32768) <= a5)) (PreH99 : (a5 <= 32767)) (PreH100 : ((-32768) <= a6)) (PreH101 : (a6 <= 32767)) (PreH102 : ((-32768) <= a7)) (PreH103 : (a7 <= 32767)) (PreH104 : ((-32768) <= a8)) (PreH105 : (a8 <= 32767)) (PreH106 : ((-32768) <= a9)) (PreH107 : (a9 <= 32767)) (PreH108 : ((-32768) <= a10)) (PreH109 : (a10 <= 32767)) (PreH110 : ((-32768) <= a11)) (PreH111 : (a11 <= 32767)) (PreH112 : ((-32768) <= a12)) (PreH113 : (a12 <= 32767)) (PreH114 : ((-32768) <= a13)) (PreH115 : (a13 <= 32767)) (PreH116 : ((-32768) <= a14)) (PreH117 : (a14 <= 32767)) (PreH118 : ((-32768) <= a15)) (PreH119 : (a15 <= 32767)) (PreH120 : ((-32768) <= a16)) (PreH121 : (a16 <= 32767)) (PreH122 : ((-32768) <= a17)) (PreH123 : (a17 <= 32767)) (PreH124 : ((-32768) <= a18)) (PreH125 : (a18 <= 32767)) (PreH126 : ((-32768) <= a19)) (PreH127 : (a19 <= 32767)) (PreH128 : ((-32768) <= a20)) (PreH129 : (a20 <= 32767)) (PreH130 : ((-32768) <= a21)) (PreH131 : (a21 <= 32767)) (PreH132 : ((-32768) <= a22)) (PreH133 : (a22 <= 32767)) (PreH134 : ((-32768) <= a23)) (PreH135 : (a23 <= 32767)) (PreH136 : ((-32768) <= a24)) (PreH137 : (a24 <= 32767)) (PreH138 : ((-32768) <= a25)) (PreH139 : (a25 <= 32767)) (PreH140 : ((-32768) <= a26)) (PreH141 : (a26 <= 32767)) (PreH142 : ((-32768) <= a27)) (PreH143 : (a27 <= 32767)) (PreH144 : ((-32768) <= a28)) (PreH145 : (a28 <= 32767)) (PreH146 : ((-32768) <= a29)) (PreH147 : (a29 <= 32767)) (PreH148 : ((-32768) <= a30)) (PreH149 : (a30 <= 32767)) (PreH150 : ((-32768) <= a31)) (PreH151 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a29) ” 
  &&  “ (a29 <= INT_MAX) ” 
  &&  “ (retval_29 = (qu_u16 (a28))) ” 
  &&  “ (0 <= retval_29) ” 
  &&  “ (retval_29 <= 65535) ” 
  &&  “ (retval_28 = (qu_u16 (a27))) ” 
  &&  “ (0 <= retval_28) ” 
  &&  “ (retval_28 <= 65535) ” 
  &&  “ (retval_27 = (qu_u16 (a26))) ” 
  &&  “ (0 <= retval_27) ” 
  &&  “ (retval_27 <= 65535) ” 
  &&  “ (retval_26 = (qu_u16 (a25))) ” 
  &&  “ (0 <= retval_26) ” 
  &&  “ (retval_26 <= 65535) ” 
  &&  “ (retval_25 = (qu_u16 (a24))) ” 
  &&  “ (0 <= retval_25) ” 
  &&  “ (retval_25 <= 65535) ” 
  &&  “ (retval_24 = (qu_u16 (a23))) ” 
  &&  “ (0 <= retval_24) ” 
  &&  “ (retval_24 <= 65535) ” 
  &&  “ (retval_23 = (qu_u16 (a22))) ” 
  &&  “ (0 <= retval_23) ” 
  &&  “ (retval_23 <= 65535) ” 
  &&  “ (retval_22 = (qu_u16 (a21))) ” 
  &&  “ (0 <= retval_22) ” 
  &&  “ (retval_22 <= 65535) ” 
  &&  “ (retval_21 = (qu_u16 (a20))) ” 
  &&  “ (0 <= retval_21) ” 
  &&  “ (retval_21 <= 65535) ” 
  &&  “ (retval_20 = (qu_u16 (a19))) ” 
  &&  “ (0 <= retval_20) ” 
  &&  “ (retval_20 <= 65535) ” 
  &&  “ (retval_19 = (qu_u16 (a18))) ” 
  &&  “ (0 <= retval_19) ” 
  &&  “ (retval_19 <= 65535) ” 
  &&  “ (retval_18 = (qu_u16 (a17))) ” 
  &&  “ (0 <= retval_18) ” 
  &&  “ (retval_18 <= 65535) ” 
  &&  “ (retval_17 = (qu_u16 (a16))) ” 
  &&  “ (0 <= retval_17) ” 
  &&  “ (retval_17 <= 65535) ” 
  &&  “ (retval_16 = (qu_u16 (a15))) ” 
  &&  “ (0 <= retval_16) ” 
  &&  “ (retval_16 <= 65535) ” 
  &&  “ (retval_15 = (qu_u16 (a14))) ” 
  &&  “ (0 <= retval_15) ” 
  &&  “ (retval_15 <= 65535) ” 
  &&  “ (retval_14 = (qu_u16 (a13))) ” 
  &&  “ (0 <= retval_14) ” 
  &&  “ (retval_14 <= 65535) ” 
  &&  “ (retval_13 = (qu_u16 (a12))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= 65535) ” 
  &&  “ (retval_12 = (qu_u16 (a11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= 65535) ” 
  &&  “ (retval_11 = (qu_u16 (a10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= 65535) ” 
  &&  “ (retval_10 = (qu_u16 (a9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= 65535) ” 
  &&  “ (retval_9 = (qu_u16 (a8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= 65535) ” 
  &&  “ (retval_8 = (qu_u16 (a7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= 65535) ” 
  &&  “ (retval_7 = (qu_u16 (a6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 65535) ” 
  &&  “ (retval_6 = (qu_u16 (a5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 65535) ” 
  &&  “ (retval_5 = (qu_u16 (a4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 65535) ” 
  &&  “ (retval_4 = (qu_u16 (a3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 65535) ” 
  &&  “ (retval_3 = (qu_u16 (a2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (qu_u16 (a1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (qu_u16 (a0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= a8) ” 
  &&  “ (a8 <= 32767) ” 
  &&  “ ((-32768) <= a9) ” 
  &&  “ (a9 <= 32767) ” 
  &&  “ ((-32768) <= a10) ” 
  &&  “ (a10 <= 32767) ” 
  &&  “ ((-32768) <= a11) ” 
  &&  “ (a11 <= 32767) ” 
  &&  “ ((-32768) <= a12) ” 
  &&  “ (a12 <= 32767) ” 
  &&  “ ((-32768) <= a13) ” 
  &&  “ (a13 <= 32767) ” 
  &&  “ ((-32768) <= a14) ” 
  &&  “ (a14 <= 32767) ” 
  &&  “ ((-32768) <= a15) ” 
  &&  “ (a15 <= 32767) ” 
  &&  “ ((-32768) <= a16) ” 
  &&  “ (a16 <= 32767) ” 
  &&  “ ((-32768) <= a17) ” 
  &&  “ (a17 <= 32767) ” 
  &&  “ ((-32768) <= a18) ” 
  &&  “ (a18 <= 32767) ” 
  &&  “ ((-32768) <= a19) ” 
  &&  “ (a19 <= 32767) ” 
  &&  “ ((-32768) <= a20) ” 
  &&  “ (a20 <= 32767) ” 
  &&  “ ((-32768) <= a21) ” 
  &&  “ (a21 <= 32767) ” 
  &&  “ ((-32768) <= a22) ” 
  &&  “ (a22 <= 32767) ” 
  &&  “ ((-32768) <= a23) ” 
  &&  “ (a23 <= 32767) ” 
  &&  “ ((-32768) <= a24) ” 
  &&  “ (a24 <= 32767) ” 
  &&  “ ((-32768) <= a25) ” 
  &&  “ (a25 <= 32767) ” 
  &&  “ ((-32768) <= a26) ” 
  &&  “ (a26 <= 32767) ” 
  &&  “ ((-32768) <= a27) ” 
  &&  “ (a27 <= 32767) ” 
  &&  “ ((-32768) <= a28) ” 
  &&  “ (a28 <= 32767) ” 
  &&  “ ((-32768) <= a29) ” 
  &&  “ (a29 <= 32767) ” 
  &&  “ ((-32768) <= a30) ” 
  &&  “ (a30 <= 32767) ” 
  &&  “ ((-32768) <= a31) ” 
  &&  “ (a31 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_30 := __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_30_pure -> __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_30_aux.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_31_pure := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (PreH1 : (retval_30 = (qu_u16 (a29)))) (PreH2 : (0 <= retval_30)) (PreH3 : (retval_30 <= 65535)) (PreH4 : (retval_29 = (qu_u16 (a28)))) (PreH5 : (0 <= retval_29)) (PreH6 : (retval_29 <= 65535)) (PreH7 : (retval_28 = (qu_u16 (a27)))) (PreH8 : (0 <= retval_28)) (PreH9 : (retval_28 <= 65535)) (PreH10 : (retval_27 = (qu_u16 (a26)))) (PreH11 : (0 <= retval_27)) (PreH12 : (retval_27 <= 65535)) (PreH13 : (retval_26 = (qu_u16 (a25)))) (PreH14 : (0 <= retval_26)) (PreH15 : (retval_26 <= 65535)) (PreH16 : (retval_25 = (qu_u16 (a24)))) (PreH17 : (0 <= retval_25)) (PreH18 : (retval_25 <= 65535)) (PreH19 : (retval_24 = (qu_u16 (a23)))) (PreH20 : (0 <= retval_24)) (PreH21 : (retval_24 <= 65535)) (PreH22 : (retval_23 = (qu_u16 (a22)))) (PreH23 : (0 <= retval_23)) (PreH24 : (retval_23 <= 65535)) (PreH25 : (retval_22 = (qu_u16 (a21)))) (PreH26 : (0 <= retval_22)) (PreH27 : (retval_22 <= 65535)) (PreH28 : (retval_21 = (qu_u16 (a20)))) (PreH29 : (0 <= retval_21)) (PreH30 : (retval_21 <= 65535)) (PreH31 : (retval_20 = (qu_u16 (a19)))) (PreH32 : (0 <= retval_20)) (PreH33 : (retval_20 <= 65535)) (PreH34 : (retval_19 = (qu_u16 (a18)))) (PreH35 : (0 <= retval_19)) (PreH36 : (retval_19 <= 65535)) (PreH37 : (retval_18 = (qu_u16 (a17)))) (PreH38 : (0 <= retval_18)) (PreH39 : (retval_18 <= 65535)) (PreH40 : (retval_17 = (qu_u16 (a16)))) (PreH41 : (0 <= retval_17)) (PreH42 : (retval_17 <= 65535)) (PreH43 : (retval_16 = (qu_u16 (a15)))) (PreH44 : (0 <= retval_16)) (PreH45 : (retval_16 <= 65535)) (PreH46 : (retval_15 = (qu_u16 (a14)))) (PreH47 : (0 <= retval_15)) (PreH48 : (retval_15 <= 65535)) (PreH49 : (retval_14 = (qu_u16 (a13)))) (PreH50 : (0 <= retval_14)) (PreH51 : (retval_14 <= 65535)) (PreH52 : (retval_13 = (qu_u16 (a12)))) (PreH53 : (0 <= retval_13)) (PreH54 : (retval_13 <= 65535)) (PreH55 : (retval_12 = (qu_u16 (a11)))) (PreH56 : (0 <= retval_12)) (PreH57 : (retval_12 <= 65535)) (PreH58 : (retval_11 = (qu_u16 (a10)))) (PreH59 : (0 <= retval_11)) (PreH60 : (retval_11 <= 65535)) (PreH61 : (retval_10 = (qu_u16 (a9)))) (PreH62 : (0 <= retval_10)) (PreH63 : (retval_10 <= 65535)) (PreH64 : (retval_9 = (qu_u16 (a8)))) (PreH65 : (0 <= retval_9)) (PreH66 : (retval_9 <= 65535)) (PreH67 : (retval_8 = (qu_u16 (a7)))) (PreH68 : (0 <= retval_8)) (PreH69 : (retval_8 <= 65535)) (PreH70 : (retval_7 = (qu_u16 (a6)))) (PreH71 : (0 <= retval_7)) (PreH72 : (retval_7 <= 65535)) (PreH73 : (retval_6 = (qu_u16 (a5)))) (PreH74 : (0 <= retval_6)) (PreH75 : (retval_6 <= 65535)) (PreH76 : (retval_5 = (qu_u16 (a4)))) (PreH77 : (0 <= retval_5)) (PreH78 : (retval_5 <= 65535)) (PreH79 : (retval_4 = (qu_u16 (a3)))) (PreH80 : (0 <= retval_4)) (PreH81 : (retval_4 <= 65535)) (PreH82 : (retval_3 = (qu_u16 (a2)))) (PreH83 : (0 <= retval_3)) (PreH84 : (retval_3 <= 65535)) (PreH85 : (retval_2 = (qu_u16 (a1)))) (PreH86 : (0 <= retval_2)) (PreH87 : (retval_2 <= 65535)) (PreH88 : (retval = (qu_u16 (a0)))) (PreH89 : (0 <= retval)) (PreH90 : (retval <= 65535)) (PreH91 : ((-32768) <= a0)) (PreH92 : (a0 <= 32767)) (PreH93 : ((-32768) <= a1)) (PreH94 : (a1 <= 32767)) (PreH95 : ((-32768) <= a2)) (PreH96 : (a2 <= 32767)) (PreH97 : ((-32768) <= a3)) (PreH98 : (a3 <= 32767)) (PreH99 : ((-32768) <= a4)) (PreH100 : (a4 <= 32767)) (PreH101 : ((-32768) <= a5)) (PreH102 : (a5 <= 32767)) (PreH103 : ((-32768) <= a6)) (PreH104 : (a6 <= 32767)) (PreH105 : ((-32768) <= a7)) (PreH106 : (a7 <= 32767)) (PreH107 : ((-32768) <= a8)) (PreH108 : (a8 <= 32767)) (PreH109 : ((-32768) <= a9)) (PreH110 : (a9 <= 32767)) (PreH111 : ((-32768) <= a10)) (PreH112 : (a10 <= 32767)) (PreH113 : ((-32768) <= a11)) (PreH114 : (a11 <= 32767)) (PreH115 : ((-32768) <= a12)) (PreH116 : (a12 <= 32767)) (PreH117 : ((-32768) <= a13)) (PreH118 : (a13 <= 32767)) (PreH119 : ((-32768) <= a14)) (PreH120 : (a14 <= 32767)) (PreH121 : ((-32768) <= a15)) (PreH122 : (a15 <= 32767)) (PreH123 : ((-32768) <= a16)) (PreH124 : (a16 <= 32767)) (PreH125 : ((-32768) <= a17)) (PreH126 : (a17 <= 32767)) (PreH127 : ((-32768) <= a18)) (PreH128 : (a18 <= 32767)) (PreH129 : ((-32768) <= a19)) (PreH130 : (a19 <= 32767)) (PreH131 : ((-32768) <= a20)) (PreH132 : (a20 <= 32767)) (PreH133 : ((-32768) <= a21)) (PreH134 : (a21 <= 32767)) (PreH135 : ((-32768) <= a22)) (PreH136 : (a22 <= 32767)) (PreH137 : ((-32768) <= a23)) (PreH138 : (a23 <= 32767)) (PreH139 : ((-32768) <= a24)) (PreH140 : (a24 <= 32767)) (PreH141 : ((-32768) <= a25)) (PreH142 : (a25 <= 32767)) (PreH143 : ((-32768) <= a26)) (PreH144 : (a26 <= 32767)) (PreH145 : ((-32768) <= a27)) (PreH146 : (a27 <= 32767)) (PreH147 : ((-32768) <= a28)) (PreH148 : (a28 <= 32767)) (PreH149 : ((-32768) <= a29)) (PreH150 : (a29 <= 32767)) (PreH151 : ((-32768) <= a30)) (PreH152 : (a30 <= 32767)) (PreH153 : ((-32768) <= a31)) (PreH154 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |-> retval_30)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a30) ” 
  &&  “ (a30 <= INT_MAX) ”
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_31_aux := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (PreH1 : (retval_30 = (qu_u16 (a29)))) (PreH2 : (0 <= retval_30)) (PreH3 : (retval_30 <= 65535)) (PreH4 : (retval_29 = (qu_u16 (a28)))) (PreH5 : (0 <= retval_29)) (PreH6 : (retval_29 <= 65535)) (PreH7 : (retval_28 = (qu_u16 (a27)))) (PreH8 : (0 <= retval_28)) (PreH9 : (retval_28 <= 65535)) (PreH10 : (retval_27 = (qu_u16 (a26)))) (PreH11 : (0 <= retval_27)) (PreH12 : (retval_27 <= 65535)) (PreH13 : (retval_26 = (qu_u16 (a25)))) (PreH14 : (0 <= retval_26)) (PreH15 : (retval_26 <= 65535)) (PreH16 : (retval_25 = (qu_u16 (a24)))) (PreH17 : (0 <= retval_25)) (PreH18 : (retval_25 <= 65535)) (PreH19 : (retval_24 = (qu_u16 (a23)))) (PreH20 : (0 <= retval_24)) (PreH21 : (retval_24 <= 65535)) (PreH22 : (retval_23 = (qu_u16 (a22)))) (PreH23 : (0 <= retval_23)) (PreH24 : (retval_23 <= 65535)) (PreH25 : (retval_22 = (qu_u16 (a21)))) (PreH26 : (0 <= retval_22)) (PreH27 : (retval_22 <= 65535)) (PreH28 : (retval_21 = (qu_u16 (a20)))) (PreH29 : (0 <= retval_21)) (PreH30 : (retval_21 <= 65535)) (PreH31 : (retval_20 = (qu_u16 (a19)))) (PreH32 : (0 <= retval_20)) (PreH33 : (retval_20 <= 65535)) (PreH34 : (retval_19 = (qu_u16 (a18)))) (PreH35 : (0 <= retval_19)) (PreH36 : (retval_19 <= 65535)) (PreH37 : (retval_18 = (qu_u16 (a17)))) (PreH38 : (0 <= retval_18)) (PreH39 : (retval_18 <= 65535)) (PreH40 : (retval_17 = (qu_u16 (a16)))) (PreH41 : (0 <= retval_17)) (PreH42 : (retval_17 <= 65535)) (PreH43 : (retval_16 = (qu_u16 (a15)))) (PreH44 : (0 <= retval_16)) (PreH45 : (retval_16 <= 65535)) (PreH46 : (retval_15 = (qu_u16 (a14)))) (PreH47 : (0 <= retval_15)) (PreH48 : (retval_15 <= 65535)) (PreH49 : (retval_14 = (qu_u16 (a13)))) (PreH50 : (0 <= retval_14)) (PreH51 : (retval_14 <= 65535)) (PreH52 : (retval_13 = (qu_u16 (a12)))) (PreH53 : (0 <= retval_13)) (PreH54 : (retval_13 <= 65535)) (PreH55 : (retval_12 = (qu_u16 (a11)))) (PreH56 : (0 <= retval_12)) (PreH57 : (retval_12 <= 65535)) (PreH58 : (retval_11 = (qu_u16 (a10)))) (PreH59 : (0 <= retval_11)) (PreH60 : (retval_11 <= 65535)) (PreH61 : (retval_10 = (qu_u16 (a9)))) (PreH62 : (0 <= retval_10)) (PreH63 : (retval_10 <= 65535)) (PreH64 : (retval_9 = (qu_u16 (a8)))) (PreH65 : (0 <= retval_9)) (PreH66 : (retval_9 <= 65535)) (PreH67 : (retval_8 = (qu_u16 (a7)))) (PreH68 : (0 <= retval_8)) (PreH69 : (retval_8 <= 65535)) (PreH70 : (retval_7 = (qu_u16 (a6)))) (PreH71 : (0 <= retval_7)) (PreH72 : (retval_7 <= 65535)) (PreH73 : (retval_6 = (qu_u16 (a5)))) (PreH74 : (0 <= retval_6)) (PreH75 : (retval_6 <= 65535)) (PreH76 : (retval_5 = (qu_u16 (a4)))) (PreH77 : (0 <= retval_5)) (PreH78 : (retval_5 <= 65535)) (PreH79 : (retval_4 = (qu_u16 (a3)))) (PreH80 : (0 <= retval_4)) (PreH81 : (retval_4 <= 65535)) (PreH82 : (retval_3 = (qu_u16 (a2)))) (PreH83 : (0 <= retval_3)) (PreH84 : (retval_3 <= 65535)) (PreH85 : (retval_2 = (qu_u16 (a1)))) (PreH86 : (0 <= retval_2)) (PreH87 : (retval_2 <= 65535)) (PreH88 : (retval = (qu_u16 (a0)))) (PreH89 : (0 <= retval)) (PreH90 : (retval <= 65535)) (PreH91 : ((-32768) <= a0)) (PreH92 : (a0 <= 32767)) (PreH93 : ((-32768) <= a1)) (PreH94 : (a1 <= 32767)) (PreH95 : ((-32768) <= a2)) (PreH96 : (a2 <= 32767)) (PreH97 : ((-32768) <= a3)) (PreH98 : (a3 <= 32767)) (PreH99 : ((-32768) <= a4)) (PreH100 : (a4 <= 32767)) (PreH101 : ((-32768) <= a5)) (PreH102 : (a5 <= 32767)) (PreH103 : ((-32768) <= a6)) (PreH104 : (a6 <= 32767)) (PreH105 : ((-32768) <= a7)) (PreH106 : (a7 <= 32767)) (PreH107 : ((-32768) <= a8)) (PreH108 : (a8 <= 32767)) (PreH109 : ((-32768) <= a9)) (PreH110 : (a9 <= 32767)) (PreH111 : ((-32768) <= a10)) (PreH112 : (a10 <= 32767)) (PreH113 : ((-32768) <= a11)) (PreH114 : (a11 <= 32767)) (PreH115 : ((-32768) <= a12)) (PreH116 : (a12 <= 32767)) (PreH117 : ((-32768) <= a13)) (PreH118 : (a13 <= 32767)) (PreH119 : ((-32768) <= a14)) (PreH120 : (a14 <= 32767)) (PreH121 : ((-32768) <= a15)) (PreH122 : (a15 <= 32767)) (PreH123 : ((-32768) <= a16)) (PreH124 : (a16 <= 32767)) (PreH125 : ((-32768) <= a17)) (PreH126 : (a17 <= 32767)) (PreH127 : ((-32768) <= a18)) (PreH128 : (a18 <= 32767)) (PreH129 : ((-32768) <= a19)) (PreH130 : (a19 <= 32767)) (PreH131 : ((-32768) <= a20)) (PreH132 : (a20 <= 32767)) (PreH133 : ((-32768) <= a21)) (PreH134 : (a21 <= 32767)) (PreH135 : ((-32768) <= a22)) (PreH136 : (a22 <= 32767)) (PreH137 : ((-32768) <= a23)) (PreH138 : (a23 <= 32767)) (PreH139 : ((-32768) <= a24)) (PreH140 : (a24 <= 32767)) (PreH141 : ((-32768) <= a25)) (PreH142 : (a25 <= 32767)) (PreH143 : ((-32768) <= a26)) (PreH144 : (a26 <= 32767)) (PreH145 : ((-32768) <= a27)) (PreH146 : (a27 <= 32767)) (PreH147 : ((-32768) <= a28)) (PreH148 : (a28 <= 32767)) (PreH149 : ((-32768) <= a29)) (PreH150 : (a29 <= 32767)) (PreH151 : ((-32768) <= a30)) (PreH152 : (a30 <= 32767)) (PreH153 : ((-32768) <= a31)) (PreH154 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |-> retval_30)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a30) ” 
  &&  “ (a30 <= INT_MAX) ” 
  &&  “ (retval_30 = (qu_u16 (a29))) ” 
  &&  “ (0 <= retval_30) ” 
  &&  “ (retval_30 <= 65535) ” 
  &&  “ (retval_29 = (qu_u16 (a28))) ” 
  &&  “ (0 <= retval_29) ” 
  &&  “ (retval_29 <= 65535) ” 
  &&  “ (retval_28 = (qu_u16 (a27))) ” 
  &&  “ (0 <= retval_28) ” 
  &&  “ (retval_28 <= 65535) ” 
  &&  “ (retval_27 = (qu_u16 (a26))) ” 
  &&  “ (0 <= retval_27) ” 
  &&  “ (retval_27 <= 65535) ” 
  &&  “ (retval_26 = (qu_u16 (a25))) ” 
  &&  “ (0 <= retval_26) ” 
  &&  “ (retval_26 <= 65535) ” 
  &&  “ (retval_25 = (qu_u16 (a24))) ” 
  &&  “ (0 <= retval_25) ” 
  &&  “ (retval_25 <= 65535) ” 
  &&  “ (retval_24 = (qu_u16 (a23))) ” 
  &&  “ (0 <= retval_24) ” 
  &&  “ (retval_24 <= 65535) ” 
  &&  “ (retval_23 = (qu_u16 (a22))) ” 
  &&  “ (0 <= retval_23) ” 
  &&  “ (retval_23 <= 65535) ” 
  &&  “ (retval_22 = (qu_u16 (a21))) ” 
  &&  “ (0 <= retval_22) ” 
  &&  “ (retval_22 <= 65535) ” 
  &&  “ (retval_21 = (qu_u16 (a20))) ” 
  &&  “ (0 <= retval_21) ” 
  &&  “ (retval_21 <= 65535) ” 
  &&  “ (retval_20 = (qu_u16 (a19))) ” 
  &&  “ (0 <= retval_20) ” 
  &&  “ (retval_20 <= 65535) ” 
  &&  “ (retval_19 = (qu_u16 (a18))) ” 
  &&  “ (0 <= retval_19) ” 
  &&  “ (retval_19 <= 65535) ” 
  &&  “ (retval_18 = (qu_u16 (a17))) ” 
  &&  “ (0 <= retval_18) ” 
  &&  “ (retval_18 <= 65535) ” 
  &&  “ (retval_17 = (qu_u16 (a16))) ” 
  &&  “ (0 <= retval_17) ” 
  &&  “ (retval_17 <= 65535) ” 
  &&  “ (retval_16 = (qu_u16 (a15))) ” 
  &&  “ (0 <= retval_16) ” 
  &&  “ (retval_16 <= 65535) ” 
  &&  “ (retval_15 = (qu_u16 (a14))) ” 
  &&  “ (0 <= retval_15) ” 
  &&  “ (retval_15 <= 65535) ” 
  &&  “ (retval_14 = (qu_u16 (a13))) ” 
  &&  “ (0 <= retval_14) ” 
  &&  “ (retval_14 <= 65535) ” 
  &&  “ (retval_13 = (qu_u16 (a12))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= 65535) ” 
  &&  “ (retval_12 = (qu_u16 (a11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= 65535) ” 
  &&  “ (retval_11 = (qu_u16 (a10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= 65535) ” 
  &&  “ (retval_10 = (qu_u16 (a9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= 65535) ” 
  &&  “ (retval_9 = (qu_u16 (a8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= 65535) ” 
  &&  “ (retval_8 = (qu_u16 (a7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= 65535) ” 
  &&  “ (retval_7 = (qu_u16 (a6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 65535) ” 
  &&  “ (retval_6 = (qu_u16 (a5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 65535) ” 
  &&  “ (retval_5 = (qu_u16 (a4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 65535) ” 
  &&  “ (retval_4 = (qu_u16 (a3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 65535) ” 
  &&  “ (retval_3 = (qu_u16 (a2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (qu_u16 (a1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (qu_u16 (a0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= a8) ” 
  &&  “ (a8 <= 32767) ” 
  &&  “ ((-32768) <= a9) ” 
  &&  “ (a9 <= 32767) ” 
  &&  “ ((-32768) <= a10) ” 
  &&  “ (a10 <= 32767) ” 
  &&  “ ((-32768) <= a11) ” 
  &&  “ (a11 <= 32767) ” 
  &&  “ ((-32768) <= a12) ” 
  &&  “ (a12 <= 32767) ” 
  &&  “ ((-32768) <= a13) ” 
  &&  “ (a13 <= 32767) ” 
  &&  “ ((-32768) <= a14) ” 
  &&  “ (a14 <= 32767) ” 
  &&  “ ((-32768) <= a15) ” 
  &&  “ (a15 <= 32767) ” 
  &&  “ ((-32768) <= a16) ” 
  &&  “ (a16 <= 32767) ” 
  &&  “ ((-32768) <= a17) ” 
  &&  “ (a17 <= 32767) ” 
  &&  “ ((-32768) <= a18) ” 
  &&  “ (a18 <= 32767) ” 
  &&  “ ((-32768) <= a19) ” 
  &&  “ (a19 <= 32767) ” 
  &&  “ ((-32768) <= a20) ” 
  &&  “ (a20 <= 32767) ” 
  &&  “ ((-32768) <= a21) ” 
  &&  “ (a21 <= 32767) ” 
  &&  “ ((-32768) <= a22) ” 
  &&  “ (a22 <= 32767) ” 
  &&  “ ((-32768) <= a23) ” 
  &&  “ (a23 <= 32767) ” 
  &&  “ ((-32768) <= a24) ” 
  &&  “ (a24 <= 32767) ” 
  &&  “ ((-32768) <= a25) ” 
  &&  “ (a25 <= 32767) ” 
  &&  “ ((-32768) <= a26) ” 
  &&  “ (a26 <= 32767) ” 
  &&  “ ((-32768) <= a27) ” 
  &&  “ (a27 <= 32767) ” 
  &&  “ ((-32768) <= a28) ” 
  &&  “ (a28 <= 32767) ” 
  &&  “ ((-32768) <= a29) ” 
  &&  “ (a29 <= 32767) ” 
  &&  “ ((-32768) <= a30) ” 
  &&  “ (a30 <= 32767) ” 
  &&  “ ((-32768) <= a31) ” 
  &&  “ (a31 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |-> retval_30)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_31 := __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_31_pure -> __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_31_aux.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_32_pure := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (retval_31: Z) (PreH1 : (retval_31 = (qu_u16 (a30)))) (PreH2 : (0 <= retval_31)) (PreH3 : (retval_31 <= 65535)) (PreH4 : (retval_30 = (qu_u16 (a29)))) (PreH5 : (0 <= retval_30)) (PreH6 : (retval_30 <= 65535)) (PreH7 : (retval_29 = (qu_u16 (a28)))) (PreH8 : (0 <= retval_29)) (PreH9 : (retval_29 <= 65535)) (PreH10 : (retval_28 = (qu_u16 (a27)))) (PreH11 : (0 <= retval_28)) (PreH12 : (retval_28 <= 65535)) (PreH13 : (retval_27 = (qu_u16 (a26)))) (PreH14 : (0 <= retval_27)) (PreH15 : (retval_27 <= 65535)) (PreH16 : (retval_26 = (qu_u16 (a25)))) (PreH17 : (0 <= retval_26)) (PreH18 : (retval_26 <= 65535)) (PreH19 : (retval_25 = (qu_u16 (a24)))) (PreH20 : (0 <= retval_25)) (PreH21 : (retval_25 <= 65535)) (PreH22 : (retval_24 = (qu_u16 (a23)))) (PreH23 : (0 <= retval_24)) (PreH24 : (retval_24 <= 65535)) (PreH25 : (retval_23 = (qu_u16 (a22)))) (PreH26 : (0 <= retval_23)) (PreH27 : (retval_23 <= 65535)) (PreH28 : (retval_22 = (qu_u16 (a21)))) (PreH29 : (0 <= retval_22)) (PreH30 : (retval_22 <= 65535)) (PreH31 : (retval_21 = (qu_u16 (a20)))) (PreH32 : (0 <= retval_21)) (PreH33 : (retval_21 <= 65535)) (PreH34 : (retval_20 = (qu_u16 (a19)))) (PreH35 : (0 <= retval_20)) (PreH36 : (retval_20 <= 65535)) (PreH37 : (retval_19 = (qu_u16 (a18)))) (PreH38 : (0 <= retval_19)) (PreH39 : (retval_19 <= 65535)) (PreH40 : (retval_18 = (qu_u16 (a17)))) (PreH41 : (0 <= retval_18)) (PreH42 : (retval_18 <= 65535)) (PreH43 : (retval_17 = (qu_u16 (a16)))) (PreH44 : (0 <= retval_17)) (PreH45 : (retval_17 <= 65535)) (PreH46 : (retval_16 = (qu_u16 (a15)))) (PreH47 : (0 <= retval_16)) (PreH48 : (retval_16 <= 65535)) (PreH49 : (retval_15 = (qu_u16 (a14)))) (PreH50 : (0 <= retval_15)) (PreH51 : (retval_15 <= 65535)) (PreH52 : (retval_14 = (qu_u16 (a13)))) (PreH53 : (0 <= retval_14)) (PreH54 : (retval_14 <= 65535)) (PreH55 : (retval_13 = (qu_u16 (a12)))) (PreH56 : (0 <= retval_13)) (PreH57 : (retval_13 <= 65535)) (PreH58 : (retval_12 = (qu_u16 (a11)))) (PreH59 : (0 <= retval_12)) (PreH60 : (retval_12 <= 65535)) (PreH61 : (retval_11 = (qu_u16 (a10)))) (PreH62 : (0 <= retval_11)) (PreH63 : (retval_11 <= 65535)) (PreH64 : (retval_10 = (qu_u16 (a9)))) (PreH65 : (0 <= retval_10)) (PreH66 : (retval_10 <= 65535)) (PreH67 : (retval_9 = (qu_u16 (a8)))) (PreH68 : (0 <= retval_9)) (PreH69 : (retval_9 <= 65535)) (PreH70 : (retval_8 = (qu_u16 (a7)))) (PreH71 : (0 <= retval_8)) (PreH72 : (retval_8 <= 65535)) (PreH73 : (retval_7 = (qu_u16 (a6)))) (PreH74 : (0 <= retval_7)) (PreH75 : (retval_7 <= 65535)) (PreH76 : (retval_6 = (qu_u16 (a5)))) (PreH77 : (0 <= retval_6)) (PreH78 : (retval_6 <= 65535)) (PreH79 : (retval_5 = (qu_u16 (a4)))) (PreH80 : (0 <= retval_5)) (PreH81 : (retval_5 <= 65535)) (PreH82 : (retval_4 = (qu_u16 (a3)))) (PreH83 : (0 <= retval_4)) (PreH84 : (retval_4 <= 65535)) (PreH85 : (retval_3 = (qu_u16 (a2)))) (PreH86 : (0 <= retval_3)) (PreH87 : (retval_3 <= 65535)) (PreH88 : (retval_2 = (qu_u16 (a1)))) (PreH89 : (0 <= retval_2)) (PreH90 : (retval_2 <= 65535)) (PreH91 : (retval = (qu_u16 (a0)))) (PreH92 : (0 <= retval)) (PreH93 : (retval <= 65535)) (PreH94 : ((-32768) <= a0)) (PreH95 : (a0 <= 32767)) (PreH96 : ((-32768) <= a1)) (PreH97 : (a1 <= 32767)) (PreH98 : ((-32768) <= a2)) (PreH99 : (a2 <= 32767)) (PreH100 : ((-32768) <= a3)) (PreH101 : (a3 <= 32767)) (PreH102 : ((-32768) <= a4)) (PreH103 : (a4 <= 32767)) (PreH104 : ((-32768) <= a5)) (PreH105 : (a5 <= 32767)) (PreH106 : ((-32768) <= a6)) (PreH107 : (a6 <= 32767)) (PreH108 : ((-32768) <= a7)) (PreH109 : (a7 <= 32767)) (PreH110 : ((-32768) <= a8)) (PreH111 : (a8 <= 32767)) (PreH112 : ((-32768) <= a9)) (PreH113 : (a9 <= 32767)) (PreH114 : ((-32768) <= a10)) (PreH115 : (a10 <= 32767)) (PreH116 : ((-32768) <= a11)) (PreH117 : (a11 <= 32767)) (PreH118 : ((-32768) <= a12)) (PreH119 : (a12 <= 32767)) (PreH120 : ((-32768) <= a13)) (PreH121 : (a13 <= 32767)) (PreH122 : ((-32768) <= a14)) (PreH123 : (a14 <= 32767)) (PreH124 : ((-32768) <= a15)) (PreH125 : (a15 <= 32767)) (PreH126 : ((-32768) <= a16)) (PreH127 : (a16 <= 32767)) (PreH128 : ((-32768) <= a17)) (PreH129 : (a17 <= 32767)) (PreH130 : ((-32768) <= a18)) (PreH131 : (a18 <= 32767)) (PreH132 : ((-32768) <= a19)) (PreH133 : (a19 <= 32767)) (PreH134 : ((-32768) <= a20)) (PreH135 : (a20 <= 32767)) (PreH136 : ((-32768) <= a21)) (PreH137 : (a21 <= 32767)) (PreH138 : ((-32768) <= a22)) (PreH139 : (a22 <= 32767)) (PreH140 : ((-32768) <= a23)) (PreH141 : (a23 <= 32767)) (PreH142 : ((-32768) <= a24)) (PreH143 : (a24 <= 32767)) (PreH144 : ((-32768) <= a25)) (PreH145 : (a25 <= 32767)) (PreH146 : ((-32768) <= a26)) (PreH147 : (a26 <= 32767)) (PreH148 : ((-32768) <= a27)) (PreH149 : (a27 <= 32767)) (PreH150 : ((-32768) <= a28)) (PreH151 : (a28 <= 32767)) (PreH152 : ((-32768) <= a29)) (PreH153 : (a29 <= 32767)) (PreH154 : ((-32768) <= a30)) (PreH155 : (a30 <= 32767)) (PreH156 : ((-32768) <= a31)) (PreH157 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |-> retval_31)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |-> retval_30)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a31) ” 
  &&  “ (a31 <= INT_MAX) ”
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_32_aux := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (retval_31: Z) (PreH1 : (retval_31 = (qu_u16 (a30)))) (PreH2 : (0 <= retval_31)) (PreH3 : (retval_31 <= 65535)) (PreH4 : (retval_30 = (qu_u16 (a29)))) (PreH5 : (0 <= retval_30)) (PreH6 : (retval_30 <= 65535)) (PreH7 : (retval_29 = (qu_u16 (a28)))) (PreH8 : (0 <= retval_29)) (PreH9 : (retval_29 <= 65535)) (PreH10 : (retval_28 = (qu_u16 (a27)))) (PreH11 : (0 <= retval_28)) (PreH12 : (retval_28 <= 65535)) (PreH13 : (retval_27 = (qu_u16 (a26)))) (PreH14 : (0 <= retval_27)) (PreH15 : (retval_27 <= 65535)) (PreH16 : (retval_26 = (qu_u16 (a25)))) (PreH17 : (0 <= retval_26)) (PreH18 : (retval_26 <= 65535)) (PreH19 : (retval_25 = (qu_u16 (a24)))) (PreH20 : (0 <= retval_25)) (PreH21 : (retval_25 <= 65535)) (PreH22 : (retval_24 = (qu_u16 (a23)))) (PreH23 : (0 <= retval_24)) (PreH24 : (retval_24 <= 65535)) (PreH25 : (retval_23 = (qu_u16 (a22)))) (PreH26 : (0 <= retval_23)) (PreH27 : (retval_23 <= 65535)) (PreH28 : (retval_22 = (qu_u16 (a21)))) (PreH29 : (0 <= retval_22)) (PreH30 : (retval_22 <= 65535)) (PreH31 : (retval_21 = (qu_u16 (a20)))) (PreH32 : (0 <= retval_21)) (PreH33 : (retval_21 <= 65535)) (PreH34 : (retval_20 = (qu_u16 (a19)))) (PreH35 : (0 <= retval_20)) (PreH36 : (retval_20 <= 65535)) (PreH37 : (retval_19 = (qu_u16 (a18)))) (PreH38 : (0 <= retval_19)) (PreH39 : (retval_19 <= 65535)) (PreH40 : (retval_18 = (qu_u16 (a17)))) (PreH41 : (0 <= retval_18)) (PreH42 : (retval_18 <= 65535)) (PreH43 : (retval_17 = (qu_u16 (a16)))) (PreH44 : (0 <= retval_17)) (PreH45 : (retval_17 <= 65535)) (PreH46 : (retval_16 = (qu_u16 (a15)))) (PreH47 : (0 <= retval_16)) (PreH48 : (retval_16 <= 65535)) (PreH49 : (retval_15 = (qu_u16 (a14)))) (PreH50 : (0 <= retval_15)) (PreH51 : (retval_15 <= 65535)) (PreH52 : (retval_14 = (qu_u16 (a13)))) (PreH53 : (0 <= retval_14)) (PreH54 : (retval_14 <= 65535)) (PreH55 : (retval_13 = (qu_u16 (a12)))) (PreH56 : (0 <= retval_13)) (PreH57 : (retval_13 <= 65535)) (PreH58 : (retval_12 = (qu_u16 (a11)))) (PreH59 : (0 <= retval_12)) (PreH60 : (retval_12 <= 65535)) (PreH61 : (retval_11 = (qu_u16 (a10)))) (PreH62 : (0 <= retval_11)) (PreH63 : (retval_11 <= 65535)) (PreH64 : (retval_10 = (qu_u16 (a9)))) (PreH65 : (0 <= retval_10)) (PreH66 : (retval_10 <= 65535)) (PreH67 : (retval_9 = (qu_u16 (a8)))) (PreH68 : (0 <= retval_9)) (PreH69 : (retval_9 <= 65535)) (PreH70 : (retval_8 = (qu_u16 (a7)))) (PreH71 : (0 <= retval_8)) (PreH72 : (retval_8 <= 65535)) (PreH73 : (retval_7 = (qu_u16 (a6)))) (PreH74 : (0 <= retval_7)) (PreH75 : (retval_7 <= 65535)) (PreH76 : (retval_6 = (qu_u16 (a5)))) (PreH77 : (0 <= retval_6)) (PreH78 : (retval_6 <= 65535)) (PreH79 : (retval_5 = (qu_u16 (a4)))) (PreH80 : (0 <= retval_5)) (PreH81 : (retval_5 <= 65535)) (PreH82 : (retval_4 = (qu_u16 (a3)))) (PreH83 : (0 <= retval_4)) (PreH84 : (retval_4 <= 65535)) (PreH85 : (retval_3 = (qu_u16 (a2)))) (PreH86 : (0 <= retval_3)) (PreH87 : (retval_3 <= 65535)) (PreH88 : (retval_2 = (qu_u16 (a1)))) (PreH89 : (0 <= retval_2)) (PreH90 : (retval_2 <= 65535)) (PreH91 : (retval = (qu_u16 (a0)))) (PreH92 : (0 <= retval)) (PreH93 : (retval <= 65535)) (PreH94 : ((-32768) <= a0)) (PreH95 : (a0 <= 32767)) (PreH96 : ((-32768) <= a1)) (PreH97 : (a1 <= 32767)) (PreH98 : ((-32768) <= a2)) (PreH99 : (a2 <= 32767)) (PreH100 : ((-32768) <= a3)) (PreH101 : (a3 <= 32767)) (PreH102 : ((-32768) <= a4)) (PreH103 : (a4 <= 32767)) (PreH104 : ((-32768) <= a5)) (PreH105 : (a5 <= 32767)) (PreH106 : ((-32768) <= a6)) (PreH107 : (a6 <= 32767)) (PreH108 : ((-32768) <= a7)) (PreH109 : (a7 <= 32767)) (PreH110 : ((-32768) <= a8)) (PreH111 : (a8 <= 32767)) (PreH112 : ((-32768) <= a9)) (PreH113 : (a9 <= 32767)) (PreH114 : ((-32768) <= a10)) (PreH115 : (a10 <= 32767)) (PreH116 : ((-32768) <= a11)) (PreH117 : (a11 <= 32767)) (PreH118 : ((-32768) <= a12)) (PreH119 : (a12 <= 32767)) (PreH120 : ((-32768) <= a13)) (PreH121 : (a13 <= 32767)) (PreH122 : ((-32768) <= a14)) (PreH123 : (a14 <= 32767)) (PreH124 : ((-32768) <= a15)) (PreH125 : (a15 <= 32767)) (PreH126 : ((-32768) <= a16)) (PreH127 : (a16 <= 32767)) (PreH128 : ((-32768) <= a17)) (PreH129 : (a17 <= 32767)) (PreH130 : ((-32768) <= a18)) (PreH131 : (a18 <= 32767)) (PreH132 : ((-32768) <= a19)) (PreH133 : (a19 <= 32767)) (PreH134 : ((-32768) <= a20)) (PreH135 : (a20 <= 32767)) (PreH136 : ((-32768) <= a21)) (PreH137 : (a21 <= 32767)) (PreH138 : ((-32768) <= a22)) (PreH139 : (a22 <= 32767)) (PreH140 : ((-32768) <= a23)) (PreH141 : (a23 <= 32767)) (PreH142 : ((-32768) <= a24)) (PreH143 : (a24 <= 32767)) (PreH144 : ((-32768) <= a25)) (PreH145 : (a25 <= 32767)) (PreH146 : ((-32768) <= a26)) (PreH147 : (a26 <= 32767)) (PreH148 : ((-32768) <= a27)) (PreH149 : (a27 <= 32767)) (PreH150 : ((-32768) <= a28)) (PreH151 : (a28 <= 32767)) (PreH152 : ((-32768) <= a29)) (PreH153 : (a29 <= 32767)) (PreH154 : ((-32768) <= a30)) (PreH155 : (a30 <= 32767)) (PreH156 : ((-32768) <= a31)) (PreH157 : (a31 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |-> retval_31)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |-> retval_30)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (((-INT_MAX) - 1 ) <= a31) ” 
  &&  “ (a31 <= INT_MAX) ” 
  &&  “ (retval_31 = (qu_u16 (a30))) ” 
  &&  “ (0 <= retval_31) ” 
  &&  “ (retval_31 <= 65535) ” 
  &&  “ (retval_30 = (qu_u16 (a29))) ” 
  &&  “ (0 <= retval_30) ” 
  &&  “ (retval_30 <= 65535) ” 
  &&  “ (retval_29 = (qu_u16 (a28))) ” 
  &&  “ (0 <= retval_29) ” 
  &&  “ (retval_29 <= 65535) ” 
  &&  “ (retval_28 = (qu_u16 (a27))) ” 
  &&  “ (0 <= retval_28) ” 
  &&  “ (retval_28 <= 65535) ” 
  &&  “ (retval_27 = (qu_u16 (a26))) ” 
  &&  “ (0 <= retval_27) ” 
  &&  “ (retval_27 <= 65535) ” 
  &&  “ (retval_26 = (qu_u16 (a25))) ” 
  &&  “ (0 <= retval_26) ” 
  &&  “ (retval_26 <= 65535) ” 
  &&  “ (retval_25 = (qu_u16 (a24))) ” 
  &&  “ (0 <= retval_25) ” 
  &&  “ (retval_25 <= 65535) ” 
  &&  “ (retval_24 = (qu_u16 (a23))) ” 
  &&  “ (0 <= retval_24) ” 
  &&  “ (retval_24 <= 65535) ” 
  &&  “ (retval_23 = (qu_u16 (a22))) ” 
  &&  “ (0 <= retval_23) ” 
  &&  “ (retval_23 <= 65535) ” 
  &&  “ (retval_22 = (qu_u16 (a21))) ” 
  &&  “ (0 <= retval_22) ” 
  &&  “ (retval_22 <= 65535) ” 
  &&  “ (retval_21 = (qu_u16 (a20))) ” 
  &&  “ (0 <= retval_21) ” 
  &&  “ (retval_21 <= 65535) ” 
  &&  “ (retval_20 = (qu_u16 (a19))) ” 
  &&  “ (0 <= retval_20) ” 
  &&  “ (retval_20 <= 65535) ” 
  &&  “ (retval_19 = (qu_u16 (a18))) ” 
  &&  “ (0 <= retval_19) ” 
  &&  “ (retval_19 <= 65535) ” 
  &&  “ (retval_18 = (qu_u16 (a17))) ” 
  &&  “ (0 <= retval_18) ” 
  &&  “ (retval_18 <= 65535) ” 
  &&  “ (retval_17 = (qu_u16 (a16))) ” 
  &&  “ (0 <= retval_17) ” 
  &&  “ (retval_17 <= 65535) ” 
  &&  “ (retval_16 = (qu_u16 (a15))) ” 
  &&  “ (0 <= retval_16) ” 
  &&  “ (retval_16 <= 65535) ” 
  &&  “ (retval_15 = (qu_u16 (a14))) ” 
  &&  “ (0 <= retval_15) ” 
  &&  “ (retval_15 <= 65535) ” 
  &&  “ (retval_14 = (qu_u16 (a13))) ” 
  &&  “ (0 <= retval_14) ” 
  &&  “ (retval_14 <= 65535) ” 
  &&  “ (retval_13 = (qu_u16 (a12))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= 65535) ” 
  &&  “ (retval_12 = (qu_u16 (a11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= 65535) ” 
  &&  “ (retval_11 = (qu_u16 (a10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= 65535) ” 
  &&  “ (retval_10 = (qu_u16 (a9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= 65535) ” 
  &&  “ (retval_9 = (qu_u16 (a8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= 65535) ” 
  &&  “ (retval_8 = (qu_u16 (a7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= 65535) ” 
  &&  “ (retval_7 = (qu_u16 (a6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 65535) ” 
  &&  “ (retval_6 = (qu_u16 (a5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 65535) ” 
  &&  “ (retval_5 = (qu_u16 (a4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 65535) ” 
  &&  “ (retval_4 = (qu_u16 (a3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 65535) ” 
  &&  “ (retval_3 = (qu_u16 (a2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (qu_u16 (a1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (qu_u16 (a0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= a8) ” 
  &&  “ (a8 <= 32767) ” 
  &&  “ ((-32768) <= a9) ” 
  &&  “ (a9 <= 32767) ” 
  &&  “ ((-32768) <= a10) ” 
  &&  “ (a10 <= 32767) ” 
  &&  “ ((-32768) <= a11) ” 
  &&  “ (a11 <= 32767) ” 
  &&  “ ((-32768) <= a12) ” 
  &&  “ (a12 <= 32767) ” 
  &&  “ ((-32768) <= a13) ” 
  &&  “ (a13 <= 32767) ” 
  &&  “ ((-32768) <= a14) ” 
  &&  “ (a14 <= 32767) ” 
  &&  “ ((-32768) <= a15) ” 
  &&  “ (a15 <= 32767) ” 
  &&  “ ((-32768) <= a16) ” 
  &&  “ (a16 <= 32767) ” 
  &&  “ ((-32768) <= a17) ” 
  &&  “ (a17 <= 32767) ” 
  &&  “ ((-32768) <= a18) ” 
  &&  “ (a18 <= 32767) ” 
  &&  “ ((-32768) <= a19) ” 
  &&  “ (a19 <= 32767) ” 
  &&  “ ((-32768) <= a20) ” 
  &&  “ (a20 <= 32767) ” 
  &&  “ ((-32768) <= a21) ” 
  &&  “ (a21 <= 32767) ” 
  &&  “ ((-32768) <= a22) ” 
  &&  “ (a22 <= 32767) ” 
  &&  “ ((-32768) <= a23) ” 
  &&  “ (a23 <= 32767) ” 
  &&  “ ((-32768) <= a24) ” 
  &&  “ (a24 <= 32767) ” 
  &&  “ ((-32768) <= a25) ” 
  &&  “ (a25 <= 32767) ” 
  &&  “ ((-32768) <= a26) ” 
  &&  “ (a26 <= 32767) ” 
  &&  “ ((-32768) <= a27) ” 
  &&  “ (a27 <= 32767) ” 
  &&  “ ((-32768) <= a28) ” 
  &&  “ (a28 <= 32767) ” 
  &&  “ ((-32768) <= a29) ” 
  &&  “ (a29 <= 32767) ” 
  &&  “ ((-32768) <= a30) ” 
  &&  “ (a30 <= 32767) ” 
  &&  “ ((-32768) <= a31) ” 
  &&  “ (a31 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |-> retval_31)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |-> retval_30)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_32 := __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_32_pure -> __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_32_aux.

Definition __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_33 := 
forall (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (retval_31: Z) (retval_32: Z) (record_return: Z) (PreH1 : (retval_32 = (qu_u16 (a31)))) (PreH2 : (0 <= retval_32)) (PreH3 : (retval_32 <= 65535)) (PreH4 : (retval_31 = (qu_u16 (a30)))) (PreH5 : (0 <= retval_31)) (PreH6 : (retval_31 <= 65535)) (PreH7 : (retval_30 = (qu_u16 (a29)))) (PreH8 : (0 <= retval_30)) (PreH9 : (retval_30 <= 65535)) (PreH10 : (retval_29 = (qu_u16 (a28)))) (PreH11 : (0 <= retval_29)) (PreH12 : (retval_29 <= 65535)) (PreH13 : (retval_28 = (qu_u16 (a27)))) (PreH14 : (0 <= retval_28)) (PreH15 : (retval_28 <= 65535)) (PreH16 : (retval_27 = (qu_u16 (a26)))) (PreH17 : (0 <= retval_27)) (PreH18 : (retval_27 <= 65535)) (PreH19 : (retval_26 = (qu_u16 (a25)))) (PreH20 : (0 <= retval_26)) (PreH21 : (retval_26 <= 65535)) (PreH22 : (retval_25 = (qu_u16 (a24)))) (PreH23 : (0 <= retval_25)) (PreH24 : (retval_25 <= 65535)) (PreH25 : (retval_24 = (qu_u16 (a23)))) (PreH26 : (0 <= retval_24)) (PreH27 : (retval_24 <= 65535)) (PreH28 : (retval_23 = (qu_u16 (a22)))) (PreH29 : (0 <= retval_23)) (PreH30 : (retval_23 <= 65535)) (PreH31 : (retval_22 = (qu_u16 (a21)))) (PreH32 : (0 <= retval_22)) (PreH33 : (retval_22 <= 65535)) (PreH34 : (retval_21 = (qu_u16 (a20)))) (PreH35 : (0 <= retval_21)) (PreH36 : (retval_21 <= 65535)) (PreH37 : (retval_20 = (qu_u16 (a19)))) (PreH38 : (0 <= retval_20)) (PreH39 : (retval_20 <= 65535)) (PreH40 : (retval_19 = (qu_u16 (a18)))) (PreH41 : (0 <= retval_19)) (PreH42 : (retval_19 <= 65535)) (PreH43 : (retval_18 = (qu_u16 (a17)))) (PreH44 : (0 <= retval_18)) (PreH45 : (retval_18 <= 65535)) (PreH46 : (retval_17 = (qu_u16 (a16)))) (PreH47 : (0 <= retval_17)) (PreH48 : (retval_17 <= 65535)) (PreH49 : (retval_16 = (qu_u16 (a15)))) (PreH50 : (0 <= retval_16)) (PreH51 : (retval_16 <= 65535)) (PreH52 : (retval_15 = (qu_u16 (a14)))) (PreH53 : (0 <= retval_15)) (PreH54 : (retval_15 <= 65535)) (PreH55 : (retval_14 = (qu_u16 (a13)))) (PreH56 : (0 <= retval_14)) (PreH57 : (retval_14 <= 65535)) (PreH58 : (retval_13 = (qu_u16 (a12)))) (PreH59 : (0 <= retval_13)) (PreH60 : (retval_13 <= 65535)) (PreH61 : (retval_12 = (qu_u16 (a11)))) (PreH62 : (0 <= retval_12)) (PreH63 : (retval_12 <= 65535)) (PreH64 : (retval_11 = (qu_u16 (a10)))) (PreH65 : (0 <= retval_11)) (PreH66 : (retval_11 <= 65535)) (PreH67 : (retval_10 = (qu_u16 (a9)))) (PreH68 : (0 <= retval_10)) (PreH69 : (retval_10 <= 65535)) (PreH70 : (retval_9 = (qu_u16 (a8)))) (PreH71 : (0 <= retval_9)) (PreH72 : (retval_9 <= 65535)) (PreH73 : (retval_8 = (qu_u16 (a7)))) (PreH74 : (0 <= retval_8)) (PreH75 : (retval_8 <= 65535)) (PreH76 : (retval_7 = (qu_u16 (a6)))) (PreH77 : (0 <= retval_7)) (PreH78 : (retval_7 <= 65535)) (PreH79 : (retval_6 = (qu_u16 (a5)))) (PreH80 : (0 <= retval_6)) (PreH81 : (retval_6 <= 65535)) (PreH82 : (retval_5 = (qu_u16 (a4)))) (PreH83 : (0 <= retval_5)) (PreH84 : (retval_5 <= 65535)) (PreH85 : (retval_4 = (qu_u16 (a3)))) (PreH86 : (0 <= retval_4)) (PreH87 : (retval_4 <= 65535)) (PreH88 : (retval_3 = (qu_u16 (a2)))) (PreH89 : (0 <= retval_3)) (PreH90 : (retval_3 <= 65535)) (PreH91 : (retval_2 = (qu_u16 (a1)))) (PreH92 : (0 <= retval_2)) (PreH93 : (retval_2 <= 65535)) (PreH94 : (retval = (qu_u16 (a0)))) (PreH95 : (0 <= retval)) (PreH96 : (retval <= 65535)) (PreH97 : ((-32768) <= a0)) (PreH98 : (a0 <= 32767)) (PreH99 : ((-32768) <= a1)) (PreH100 : (a1 <= 32767)) (PreH101 : ((-32768) <= a2)) (PreH102 : (a2 <= 32767)) (PreH103 : ((-32768) <= a3)) (PreH104 : (a3 <= 32767)) (PreH105 : ((-32768) <= a4)) (PreH106 : (a4 <= 32767)) (PreH107 : ((-32768) <= a5)) (PreH108 : (a5 <= 32767)) (PreH109 : ((-32768) <= a6)) (PreH110 : (a6 <= 32767)) (PreH111 : ((-32768) <= a7)) (PreH112 : (a7 <= 32767)) (PreH113 : ((-32768) <= a8)) (PreH114 : (a8 <= 32767)) (PreH115 : ((-32768) <= a9)) (PreH116 : (a9 <= 32767)) (PreH117 : ((-32768) <= a10)) (PreH118 : (a10 <= 32767)) (PreH119 : ((-32768) <= a11)) (PreH120 : (a11 <= 32767)) (PreH121 : ((-32768) <= a12)) (PreH122 : (a12 <= 32767)) (PreH123 : ((-32768) <= a13)) (PreH124 : (a13 <= 32767)) (PreH125 : ((-32768) <= a14)) (PreH126 : (a14 <= 32767)) (PreH127 : ((-32768) <= a15)) (PreH128 : (a15 <= 32767)) (PreH129 : ((-32768) <= a16)) (PreH130 : (a16 <= 32767)) (PreH131 : ((-32768) <= a17)) (PreH132 : (a17 <= 32767)) (PreH133 : ((-32768) <= a18)) (PreH134 : (a18 <= 32767)) (PreH135 : ((-32768) <= a19)) (PreH136 : (a19 <= 32767)) (PreH137 : ((-32768) <= a20)) (PreH138 : (a20 <= 32767)) (PreH139 : ((-32768) <= a21)) (PreH140 : (a21 <= 32767)) (PreH141 : ((-32768) <= a22)) (PreH142 : (a22 <= 32767)) (PreH143 : ((-32768) <= a23)) (PreH144 : (a23 <= 32767)) (PreH145 : ((-32768) <= a24)) (PreH146 : (a24 <= 32767)) (PreH147 : ((-32768) <= a25)) (PreH148 : (a25 <= 32767)) (PreH149 : ((-32768) <= a26)) (PreH150 : (a26 <= 32767)) (PreH151 : ((-32768) <= a27)) (PreH152 : (a27 <= 32767)) (PreH153 : ((-32768) <= a28)) (PreH154 : (a28 <= 32767)) (PreH155 : ((-32768) <= a29)) (PreH156 : (a29 <= 32767)) (PreH157 : ((-32768) <= a30)) (PreH158 : (a30 <= 32767)) (PreH159 : ((-32768) <= a31)) (PreH160 : (a31 <= 32767)) ,
  (UndefStructPredvuint16m4_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |-> retval_32)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |-> retval_31)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |-> retval_30)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
|--
  “ (retval_32 = (qu_u16 (a31))) ” 
  &&  “ (0 <= retval_32) ” 
  &&  “ (retval_32 <= 65535) ” 
  &&  “ (retval_31 = (qu_u16 (a30))) ” 
  &&  “ (0 <= retval_31) ” 
  &&  “ (retval_31 <= 65535) ” 
  &&  “ (retval_30 = (qu_u16 (a29))) ” 
  &&  “ (0 <= retval_30) ” 
  &&  “ (retval_30 <= 65535) ” 
  &&  “ (retval_29 = (qu_u16 (a28))) ” 
  &&  “ (0 <= retval_29) ” 
  &&  “ (retval_29 <= 65535) ” 
  &&  “ (retval_28 = (qu_u16 (a27))) ” 
  &&  “ (0 <= retval_28) ” 
  &&  “ (retval_28 <= 65535) ” 
  &&  “ (retval_27 = (qu_u16 (a26))) ” 
  &&  “ (0 <= retval_27) ” 
  &&  “ (retval_27 <= 65535) ” 
  &&  “ (retval_26 = (qu_u16 (a25))) ” 
  &&  “ (0 <= retval_26) ” 
  &&  “ (retval_26 <= 65535) ” 
  &&  “ (retval_25 = (qu_u16 (a24))) ” 
  &&  “ (0 <= retval_25) ” 
  &&  “ (retval_25 <= 65535) ” 
  &&  “ (retval_24 = (qu_u16 (a23))) ” 
  &&  “ (0 <= retval_24) ” 
  &&  “ (retval_24 <= 65535) ” 
  &&  “ (retval_23 = (qu_u16 (a22))) ” 
  &&  “ (0 <= retval_23) ” 
  &&  “ (retval_23 <= 65535) ” 
  &&  “ (retval_22 = (qu_u16 (a21))) ” 
  &&  “ (0 <= retval_22) ” 
  &&  “ (retval_22 <= 65535) ” 
  &&  “ (retval_21 = (qu_u16 (a20))) ” 
  &&  “ (0 <= retval_21) ” 
  &&  “ (retval_21 <= 65535) ” 
  &&  “ (retval_20 = (qu_u16 (a19))) ” 
  &&  “ (0 <= retval_20) ” 
  &&  “ (retval_20 <= 65535) ” 
  &&  “ (retval_19 = (qu_u16 (a18))) ” 
  &&  “ (0 <= retval_19) ” 
  &&  “ (retval_19 <= 65535) ” 
  &&  “ (retval_18 = (qu_u16 (a17))) ” 
  &&  “ (0 <= retval_18) ” 
  &&  “ (retval_18 <= 65535) ” 
  &&  “ (retval_17 = (qu_u16 (a16))) ” 
  &&  “ (0 <= retval_17) ” 
  &&  “ (retval_17 <= 65535) ” 
  &&  “ (retval_16 = (qu_u16 (a15))) ” 
  &&  “ (0 <= retval_16) ” 
  &&  “ (retval_16 <= 65535) ” 
  &&  “ (retval_15 = (qu_u16 (a14))) ” 
  &&  “ (0 <= retval_15) ” 
  &&  “ (retval_15 <= 65535) ” 
  &&  “ (retval_14 = (qu_u16 (a13))) ” 
  &&  “ (0 <= retval_14) ” 
  &&  “ (retval_14 <= 65535) ” 
  &&  “ (retval_13 = (qu_u16 (a12))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= 65535) ” 
  &&  “ (retval_12 = (qu_u16 (a11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= 65535) ” 
  &&  “ (retval_11 = (qu_u16 (a10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= 65535) ” 
  &&  “ (retval_10 = (qu_u16 (a9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= 65535) ” 
  &&  “ (retval_9 = (qu_u16 (a8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= 65535) ” 
  &&  “ (retval_8 = (qu_u16 (a7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= 65535) ” 
  &&  “ (retval_7 = (qu_u16 (a6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= 65535) ” 
  &&  “ (retval_6 = (qu_u16 (a5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= 65535) ” 
  &&  “ (retval_5 = (qu_u16 (a4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= 65535) ” 
  &&  “ (retval_4 = (qu_u16 (a3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 65535) ” 
  &&  “ (retval_3 = (qu_u16 (a2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 65535) ” 
  &&  “ (retval_2 = (qu_u16 (a1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 65535) ” 
  &&  “ (retval = (qu_u16 (a0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= a8) ” 
  &&  “ (a8 <= 32767) ” 
  &&  “ ((-32768) <= a9) ” 
  &&  “ (a9 <= 32767) ” 
  &&  “ ((-32768) <= a10) ” 
  &&  “ (a10 <= 32767) ” 
  &&  “ ((-32768) <= a11) ” 
  &&  “ (a11 <= 32767) ” 
  &&  “ ((-32768) <= a12) ” 
  &&  “ (a12 <= 32767) ” 
  &&  “ ((-32768) <= a13) ” 
  &&  “ (a13 <= 32767) ” 
  &&  “ ((-32768) <= a14) ” 
  &&  “ (a14 <= 32767) ” 
  &&  “ ((-32768) <= a15) ” 
  &&  “ (a15 <= 32767) ” 
  &&  “ ((-32768) <= a16) ” 
  &&  “ (a16 <= 32767) ” 
  &&  “ ((-32768) <= a17) ” 
  &&  “ (a17 <= 32767) ” 
  &&  “ ((-32768) <= a18) ” 
  &&  “ (a18 <= 32767) ” 
  &&  “ ((-32768) <= a19) ” 
  &&  “ (a19 <= 32767) ” 
  &&  “ ((-32768) <= a20) ” 
  &&  “ (a20 <= 32767) ” 
  &&  “ ((-32768) <= a21) ” 
  &&  “ (a21 <= 32767) ” 
  &&  “ ((-32768) <= a22) ” 
  &&  “ (a22 <= 32767) ” 
  &&  “ ((-32768) <= a23) ” 
  &&  “ (a23 <= 32767) ” 
  &&  “ ((-32768) <= a24) ” 
  &&  “ (a24 <= 32767) ” 
  &&  “ ((-32768) <= a25) ” 
  &&  “ (a25 <= 32767) ” 
  &&  “ ((-32768) <= a26) ” 
  &&  “ (a26 <= 32767) ” 
  &&  “ ((-32768) <= a27) ” 
  &&  “ (a27 <= 32767) ” 
  &&  “ ((-32768) <= a28) ” 
  &&  “ (a28 <= 32767) ” 
  &&  “ ((-32768) <= a29) ” 
  &&  “ (a29 <= 32767) ” 
  &&  “ ((-32768) <= a30) ” 
  &&  “ (a30 <= 32767) ” 
  &&  “ ((-32768) <= a31) ” 
  &&  “ (a31 <= 32767) ”
  &&  ((&((record_return)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s31")) # UShort  |-> retval_32)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # UShort  |-> retval_31)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # UShort  |-> retval_30)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # UShort  |-> retval_29)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # UShort  |-> retval_28)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # UShort  |-> retval_27)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # UShort  |-> retval_26)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # UShort  |-> retval_25)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # UShort  |-> retval_24)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # UShort  |-> retval_23)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # UShort  |-> retval_22)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # UShort  |-> retval_21)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # UShort  |-> retval_20)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # UShort  |-> retval_19)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # UShort  |-> retval_18)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # UShort  |-> retval_17)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # UShort  |-> retval_16)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # UShort  |-> retval_15)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # UShort  |-> retval_14)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # UShort  |-> retval_13)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # UShort  |-> retval_12)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # UShort  |-> retval_11)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # UShort  |-> retval_10)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # UShort  |-> retval_9)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # UShort  |-> retval_8)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # UShort  |-> retval_7)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # UShort  |-> retval_6)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # UShort  |-> retval_5)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UShort  |-> retval_4)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UShort  |-> retval_3)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UShort  |-> retval_2)
  **  ((&((record_return)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UShort  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Short  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Short  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Short  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Short  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Short  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Short  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Short  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Short  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Short  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Short  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Short  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Short  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Short  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Short  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Short  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Short  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Short  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Short  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Short  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Short  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Short  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Short  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Short  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Short  |-> a31)
.

Module Type VC_Correct.


Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_return_wit_1 : __riscv_vreinterpret_v_i16m4_u16m4_return_wit_1.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_1_pure : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_1_pure.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_1 : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_1.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_2_pure : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_2_pure.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_2 : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_2.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_3_pure : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_3_pure.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_3 : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_3.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_4_pure : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_4_pure.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_4 : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_4.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_5_pure : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_5_pure.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_5 : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_5.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_6_pure : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_6_pure.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_6 : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_6.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_7_pure : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_7_pure.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_7 : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_7.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_8_pure : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_8_pure.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_8 : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_8.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_9_pure : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_9_pure.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_9 : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_9.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_10_pure : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_10_pure.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_10 : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_10.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_11_pure : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_11_pure.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_11 : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_11.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_12_pure : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_12_pure.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_12 : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_12.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_13_pure : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_13_pure.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_13 : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_13.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_14_pure : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_14_pure.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_14 : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_14.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_15_pure : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_15_pure.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_15 : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_15.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_16_pure : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_16_pure.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_16 : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_16.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_17_pure : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_17_pure.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_17 : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_17.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_18_pure : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_18_pure.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_18 : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_18.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_19_pure : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_19_pure.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_19 : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_19.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_20_pure : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_20_pure.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_20 : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_20.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_21_pure : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_21_pure.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_21 : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_21.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_22_pure : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_22_pure.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_22 : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_22.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_23_pure : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_23_pure.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_23 : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_23.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_24_pure : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_24_pure.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_24 : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_24.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_25_pure : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_25_pure.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_25 : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_25.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_26_pure : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_26_pure.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_26 : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_26.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_27_pure : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_27_pure.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_27 : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_27.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_28_pure : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_28_pure.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_28 : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_28.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_29_pure : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_29_pure.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_29 : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_29.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_30_pure : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_30_pure.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_30 : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_30.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_31_pure : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_31_pure.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_31 : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_31.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_32_pure : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_32_pure.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_32 : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_32.
Axiom proof_of___riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_33 : __riscv_vreinterpret_v_i16m4_u16m4_partial_solve_wit_33.

End VC_Correct.
