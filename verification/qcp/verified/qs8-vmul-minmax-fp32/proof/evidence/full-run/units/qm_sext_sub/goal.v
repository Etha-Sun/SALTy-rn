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
Local Open Scope sac.

(*----- Function qm_sext_sub -----*)

Definition qm_sext_sub_return_wit_1 := 
forall (vl_pre: Z) (x_pre: Z) (A: (Z -> Z)) (a0: Z) (a1: Z) (a2: Z) (a3: Z) (a4: Z) (a5: Z) (a6: Z) (a7: Z) (a8: Z) (a9: Z) (a10: Z) (a11: Z) (a12: Z) (a13: Z) (a14: Z) (a15: Z) (a16: Z) (a17: Z) (a18: Z) (a19: Z) (a20: Z) (a21: Z) (a22: Z) (a23: Z) (a24: Z) (a25: Z) (a26: Z) (a27: Z) (a28: Z) (a29: Z) (a30: Z) (a31: Z) (r31_2: Z) (r30_2: Z) (r29_2: Z) (r28_2: Z) (r27_2: Z) (r26_2: Z) (r25_2: Z) (r24_2: Z) (r23_2: Z) (r22_2: Z) (r21_2: Z) (r20_2: Z) (r19_2: Z) (r18_2: Z) (r17_2: Z) (r16_2: Z) (r15_2: Z) (r14_2: Z) (r13_2: Z) (r12_2: Z) (r11_2: Z) (r10_2: Z) (r9_2: Z) (r8_2: Z) (r7_2: Z) (r6_2: Z) (r5_2: Z) (r4_2: Z) (r3_2: Z) (r2_2: Z) (r1_2: Z) (r0_2: Z) (r31_3: Z) (r30_3: Z) (r29_3: Z) (r28_3: Z) (r27_3: Z) (r26_3: Z) (r25_3: Z) (r24_3: Z) (r23_3: Z) (r22_3: Z) (r21_3: Z) (r20_3: Z) (r19_3: Z) (r18_3: Z) (r17_3: Z) (r16_3: Z) (r15_3: Z) (r14_3: Z) (r13_3: Z) (r12_3: Z) (r11_3: Z) (r10_3: Z) (r9_3: Z) (r8_3: Z) (r7_3: Z) (r6_3: Z) (r5_3: Z) (r4_3: Z) (r3_3: Z) (r2_3: Z) (r1_3: Z) (r0_3: Z) (record_return: Z) (PreH1 : (qm_lane_match 0 vl_pre r0_3 (qm_sub16 ((A (0))) (x_pre)) )) (PreH2 : (qm_lane_match 1 vl_pre r1_3 (qm_sub16 ((A (1))) (x_pre)) )) (PreH3 : (qm_lane_match 2 vl_pre r2_3 (qm_sub16 ((A (2))) (x_pre)) )) (PreH4 : (qm_lane_match 3 vl_pre r3_3 (qm_sub16 ((A (3))) (x_pre)) )) (PreH5 : (qm_lane_match 4 vl_pre r4_3 (qm_sub16 ((A (4))) (x_pre)) )) (PreH6 : (qm_lane_match 5 vl_pre r5_3 (qm_sub16 ((A (5))) (x_pre)) )) (PreH7 : (qm_lane_match 6 vl_pre r6_3 (qm_sub16 ((A (6))) (x_pre)) )) (PreH8 : (qm_lane_match 7 vl_pre r7_3 (qm_sub16 ((A (7))) (x_pre)) )) (PreH9 : (qm_lane_match 8 vl_pre r8_3 (qm_sub16 ((A (8))) (x_pre)) )) (PreH10 : (qm_lane_match 9 vl_pre r9_3 (qm_sub16 ((A (9))) (x_pre)) )) (PreH11 : (qm_lane_match 10 vl_pre r10_3 (qm_sub16 ((A (10))) (x_pre)) )) (PreH12 : (qm_lane_match 11 vl_pre r11_3 (qm_sub16 ((A (11))) (x_pre)) )) (PreH13 : (qm_lane_match 12 vl_pre r12_3 (qm_sub16 ((A (12))) (x_pre)) )) (PreH14 : (qm_lane_match 13 vl_pre r13_3 (qm_sub16 ((A (13))) (x_pre)) )) (PreH15 : (qm_lane_match 14 vl_pre r14_3 (qm_sub16 ((A (14))) (x_pre)) )) (PreH16 : (qm_lane_match 15 vl_pre r15_3 (qm_sub16 ((A (15))) (x_pre)) )) (PreH17 : (qm_lane_match 16 vl_pre r16_3 (qm_sub16 ((A (16))) (x_pre)) )) (PreH18 : (qm_lane_match 17 vl_pre r17_3 (qm_sub16 ((A (17))) (x_pre)) )) (PreH19 : (qm_lane_match 18 vl_pre r18_3 (qm_sub16 ((A (18))) (x_pre)) )) (PreH20 : (qm_lane_match 19 vl_pre r19_3 (qm_sub16 ((A (19))) (x_pre)) )) (PreH21 : (qm_lane_match 20 vl_pre r20_3 (qm_sub16 ((A (20))) (x_pre)) )) (PreH22 : (qm_lane_match 21 vl_pre r21_3 (qm_sub16 ((A (21))) (x_pre)) )) (PreH23 : (qm_lane_match 22 vl_pre r22_3 (qm_sub16 ((A (22))) (x_pre)) )) (PreH24 : (qm_lane_match 23 vl_pre r23_3 (qm_sub16 ((A (23))) (x_pre)) )) (PreH25 : (qm_lane_match 24 vl_pre r24_3 (qm_sub16 ((A (24))) (x_pre)) )) (PreH26 : (qm_lane_match 25 vl_pre r25_3 (qm_sub16 ((A (25))) (x_pre)) )) (PreH27 : (qm_lane_match 26 vl_pre r26_3 (qm_sub16 ((A (26))) (x_pre)) )) (PreH28 : (qm_lane_match 27 vl_pre r27_3 (qm_sub16 ((A (27))) (x_pre)) )) (PreH29 : (qm_lane_match 28 vl_pre r28_3 (qm_sub16 ((A (28))) (x_pre)) )) (PreH30 : (qm_lane_match 29 vl_pre r29_3 (qm_sub16 ((A (29))) (x_pre)) )) (PreH31 : (qm_lane_match 30 vl_pre r30_3 (qm_sub16 ((A (30))) (x_pre)) )) (PreH32 : (qm_lane_match 31 vl_pre r31_3 (qm_sub16 ((A (31))) (x_pre)) )) (PreH33 : (qm_lane_match 0 vl_pre r0_2 (A (0)) )) (PreH34 : (qm_lane_match 1 vl_pre r1_2 (A (1)) )) (PreH35 : (qm_lane_match 2 vl_pre r2_2 (A (2)) )) (PreH36 : (qm_lane_match 3 vl_pre r3_2 (A (3)) )) (PreH37 : (qm_lane_match 4 vl_pre r4_2 (A (4)) )) (PreH38 : (qm_lane_match 5 vl_pre r5_2 (A (5)) )) (PreH39 : (qm_lane_match 6 vl_pre r6_2 (A (6)) )) (PreH40 : (qm_lane_match 7 vl_pre r7_2 (A (7)) )) (PreH41 : (qm_lane_match 8 vl_pre r8_2 (A (8)) )) (PreH42 : (qm_lane_match 9 vl_pre r9_2 (A (9)) )) (PreH43 : (qm_lane_match 10 vl_pre r10_2 (A (10)) )) (PreH44 : (qm_lane_match 11 vl_pre r11_2 (A (11)) )) (PreH45 : (qm_lane_match 12 vl_pre r12_2 (A (12)) )) (PreH46 : (qm_lane_match 13 vl_pre r13_2 (A (13)) )) (PreH47 : (qm_lane_match 14 vl_pre r14_2 (A (14)) )) (PreH48 : (qm_lane_match 15 vl_pre r15_2 (A (15)) )) (PreH49 : (qm_lane_match 16 vl_pre r16_2 (A (16)) )) (PreH50 : (qm_lane_match 17 vl_pre r17_2 (A (17)) )) (PreH51 : (qm_lane_match 18 vl_pre r18_2 (A (18)) )) (PreH52 : (qm_lane_match 19 vl_pre r19_2 (A (19)) )) (PreH53 : (qm_lane_match 20 vl_pre r20_2 (A (20)) )) (PreH54 : (qm_lane_match 21 vl_pre r21_2 (A (21)) )) (PreH55 : (qm_lane_match 22 vl_pre r22_2 (A (22)) )) (PreH56 : (qm_lane_match 23 vl_pre r23_2 (A (23)) )) (PreH57 : (qm_lane_match 24 vl_pre r24_2 (A (24)) )) (PreH58 : (qm_lane_match 25 vl_pre r25_2 (A (25)) )) (PreH59 : (qm_lane_match 26 vl_pre r26_2 (A (26)) )) (PreH60 : (qm_lane_match 27 vl_pre r27_2 (A (27)) )) (PreH61 : (qm_lane_match 28 vl_pre r28_2 (A (28)) )) (PreH62 : (qm_lane_match 29 vl_pre r29_2 (A (29)) )) (PreH63 : (qm_lane_match 30 vl_pre r30_2 (A (30)) )) (PreH64 : (qm_lane_match 31 vl_pre r31_2 (A (31)) )) (PreH65 : (0 <= vl_pre)) (PreH66 : (vl_pre <= 32)) (PreH67 : (qm_lane_match 0 vl_pre a0 (A (0)) )) (PreH68 : (qm_lane_match 1 vl_pre a1 (A (1)) )) (PreH69 : (qm_lane_match 2 vl_pre a2 (A (2)) )) (PreH70 : (qm_lane_match 3 vl_pre a3 (A (3)) )) (PreH71 : (qm_lane_match 4 vl_pre a4 (A (4)) )) (PreH72 : (qm_lane_match 5 vl_pre a5 (A (5)) )) (PreH73 : (qm_lane_match 6 vl_pre a6 (A (6)) )) (PreH74 : (qm_lane_match 7 vl_pre a7 (A (7)) )) (PreH75 : (qm_lane_match 8 vl_pre a8 (A (8)) )) (PreH76 : (qm_lane_match 9 vl_pre a9 (A (9)) )) (PreH77 : (qm_lane_match 10 vl_pre a10 (A (10)) )) (PreH78 : (qm_lane_match 11 vl_pre a11 (A (11)) )) (PreH79 : (qm_lane_match 12 vl_pre a12 (A (12)) )) (PreH80 : (qm_lane_match 13 vl_pre a13 (A (13)) )) (PreH81 : (qm_lane_match 14 vl_pre a14 (A (14)) )) (PreH82 : (qm_lane_match 15 vl_pre a15 (A (15)) )) (PreH83 : (qm_lane_match 16 vl_pre a16 (A (16)) )) (PreH84 : (qm_lane_match 17 vl_pre a17 (A (17)) )) (PreH85 : (qm_lane_match 18 vl_pre a18 (A (18)) )) (PreH86 : (qm_lane_match 19 vl_pre a19 (A (19)) )) (PreH87 : (qm_lane_match 20 vl_pre a20 (A (20)) )) (PreH88 : (qm_lane_match 21 vl_pre a21 (A (21)) )) (PreH89 : (qm_lane_match 22 vl_pre a22 (A (22)) )) (PreH90 : (qm_lane_match 23 vl_pre a23 (A (23)) )) (PreH91 : (qm_lane_match 24 vl_pre a24 (A (24)) )) (PreH92 : (qm_lane_match 25 vl_pre a25 (A (25)) )) (PreH93 : (qm_lane_match 26 vl_pre a26 (A (26)) )) (PreH94 : (qm_lane_match 27 vl_pre a27 (A (27)) )) (PreH95 : (qm_lane_match 28 vl_pre a28 (A (28)) )) (PreH96 : (qm_lane_match 29 vl_pre a29 (A (29)) )) (PreH97 : (qm_lane_match 30 vl_pre a30 (A (30)) )) (PreH98 : (qm_lane_match 31 vl_pre a31 (A (31)) )) ,
  ((&((record_return)  # "vint16m4_t" ->ₛ "s31")) # Short  |-> r31_3)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s30")) # Short  |-> r30_3)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s29")) # Short  |-> r29_3)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s28")) # Short  |-> r28_3)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s27")) # Short  |-> r27_3)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s26")) # Short  |-> r26_3)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s25")) # Short  |-> r25_3)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s24")) # Short  |-> r24_3)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s23")) # Short  |-> r23_3)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s22")) # Short  |-> r22_3)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s21")) # Short  |-> r21_3)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s20")) # Short  |-> r20_3)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s19")) # Short  |-> r19_3)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s18")) # Short  |-> r18_3)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s17")) # Short  |-> r17_3)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s16")) # Short  |-> r16_3)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s15")) # Short  |-> r15_3)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s14")) # Short  |-> r14_3)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s13")) # Short  |-> r13_3)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s12")) # Short  |-> r12_3)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s11")) # Short  |-> r11_3)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s10")) # Short  |-> r10_3)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s9")) # Short  |-> r9_3)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s8")) # Short  |-> r8_3)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s7")) # Short  |-> r7_3)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s6")) # Short  |-> r6_3)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s5")) # Short  |-> r5_3)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s4")) # Short  |-> r4_3)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s3")) # Short  |-> r3_3)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s2")) # Short  |-> r2_3)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s1")) # Short  |-> r1_3)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s0")) # Short  |-> r0_3)
|--
  EX (r31: Z)  (r30: Z)  (r29: Z)  (r28: Z)  (r27: Z)  (r26: Z)  (r25: Z)  (r24: Z)  (r23: Z)  (r22: Z)  (r21: Z)  (r20: Z)  (r19: Z)  (r18: Z)  (r17: Z)  (r16: Z)  (r15: Z)  (r14: Z)  (r13: Z)  (r12: Z)  (r11: Z)  (r10: Z)  (r9: Z)  (r8: Z)  (r7: Z)  (r6: Z)  (r5: Z)  (r4: Z)  (r3: Z)  (r2: Z)  (r1: Z)  (r0: Z) ,
  “ (qm_lane_match 0 vl_pre r0 (qm_sub16 ((A (0))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 1 vl_pre r1 (qm_sub16 ((A (1))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 2 vl_pre r2 (qm_sub16 ((A (2))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 3 vl_pre r3 (qm_sub16 ((A (3))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 4 vl_pre r4 (qm_sub16 ((A (4))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 5 vl_pre r5 (qm_sub16 ((A (5))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 6 vl_pre r6 (qm_sub16 ((A (6))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 7 vl_pre r7 (qm_sub16 ((A (7))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 8 vl_pre r8 (qm_sub16 ((A (8))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 9 vl_pre r9 (qm_sub16 ((A (9))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 10 vl_pre r10 (qm_sub16 ((A (10))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 11 vl_pre r11 (qm_sub16 ((A (11))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 12 vl_pre r12 (qm_sub16 ((A (12))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 13 vl_pre r13 (qm_sub16 ((A (13))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 14 vl_pre r14 (qm_sub16 ((A (14))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 15 vl_pre r15 (qm_sub16 ((A (15))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 16 vl_pre r16 (qm_sub16 ((A (16))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 17 vl_pre r17 (qm_sub16 ((A (17))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 18 vl_pre r18 (qm_sub16 ((A (18))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 19 vl_pre r19 (qm_sub16 ((A (19))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 20 vl_pre r20 (qm_sub16 ((A (20))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 21 vl_pre r21 (qm_sub16 ((A (21))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 22 vl_pre r22 (qm_sub16 ((A (22))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 23 vl_pre r23 (qm_sub16 ((A (23))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 24 vl_pre r24 (qm_sub16 ((A (24))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 25 vl_pre r25 (qm_sub16 ((A (25))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 26 vl_pre r26 (qm_sub16 ((A (26))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 27 vl_pre r27 (qm_sub16 ((A (27))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 28 vl_pre r28 (qm_sub16 ((A (28))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 29 vl_pre r29 (qm_sub16 ((A (29))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 30 vl_pre r30 (qm_sub16 ((A (30))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 31 vl_pre r31 (qm_sub16 ((A (31))) (x_pre)) ) ”
  &&  ((&((record_return)  # "vint16m4_t" ->ₛ "s0")) # Short  |-> r0)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s1")) # Short  |-> r1)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s2")) # Short  |-> r2)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s3")) # Short  |-> r3)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s4")) # Short  |-> r4)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s5")) # Short  |-> r5)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s6")) # Short  |-> r6)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s7")) # Short  |-> r7)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s8")) # Short  |-> r8)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s9")) # Short  |-> r9)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s10")) # Short  |-> r10)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s11")) # Short  |-> r11)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s12")) # Short  |-> r12)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s13")) # Short  |-> r13)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s14")) # Short  |-> r14)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s15")) # Short  |-> r15)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s16")) # Short  |-> r16)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s17")) # Short  |-> r17)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s18")) # Short  |-> r18)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s19")) # Short  |-> r19)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s20")) # Short  |-> r20)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s21")) # Short  |-> r21)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s22")) # Short  |-> r22)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s23")) # Short  |-> r23)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s24")) # Short  |-> r24)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s25")) # Short  |-> r25)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s26")) # Short  |-> r26)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s27")) # Short  |-> r27)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s28")) # Short  |-> r28)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s29")) # Short  |-> r29)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s30")) # Short  |-> r30)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s31")) # Short  |-> r31)
.

Definition qm_sext_sub_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (x_pre: Z) (A: (Z -> Z)) (a0: Z) (a1: Z) (a2: Z) (a3: Z) (a4: Z) (a5: Z) (a6: Z) (a7: Z) (a8: Z) (a9: Z) (a10: Z) (a11: Z) (a12: Z) (a13: Z) (a14: Z) (a15: Z) (a16: Z) (a17: Z) (a18: Z) (a19: Z) (a20: Z) (a21: Z) (a22: Z) (a23: Z) (a24: Z) (a25: Z) (a26: Z) (a27: Z) (a28: Z) (a29: Z) (a30: Z) (a31: Z) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (qm_lane_match 0 vl_pre a0 (A (0)) )) (PreH4 : (qm_lane_match 1 vl_pre a1 (A (1)) )) (PreH5 : (qm_lane_match 2 vl_pre a2 (A (2)) )) (PreH6 : (qm_lane_match 3 vl_pre a3 (A (3)) )) (PreH7 : (qm_lane_match 4 vl_pre a4 (A (4)) )) (PreH8 : (qm_lane_match 5 vl_pre a5 (A (5)) )) (PreH9 : (qm_lane_match 6 vl_pre a6 (A (6)) )) (PreH10 : (qm_lane_match 7 vl_pre a7 (A (7)) )) (PreH11 : (qm_lane_match 8 vl_pre a8 (A (8)) )) (PreH12 : (qm_lane_match 9 vl_pre a9 (A (9)) )) (PreH13 : (qm_lane_match 10 vl_pre a10 (A (10)) )) (PreH14 : (qm_lane_match 11 vl_pre a11 (A (11)) )) (PreH15 : (qm_lane_match 12 vl_pre a12 (A (12)) )) (PreH16 : (qm_lane_match 13 vl_pre a13 (A (13)) )) (PreH17 : (qm_lane_match 14 vl_pre a14 (A (14)) )) (PreH18 : (qm_lane_match 15 vl_pre a15 (A (15)) )) (PreH19 : (qm_lane_match 16 vl_pre a16 (A (16)) )) (PreH20 : (qm_lane_match 17 vl_pre a17 (A (17)) )) (PreH21 : (qm_lane_match 18 vl_pre a18 (A (18)) )) (PreH22 : (qm_lane_match 19 vl_pre a19 (A (19)) )) (PreH23 : (qm_lane_match 20 vl_pre a20 (A (20)) )) (PreH24 : (qm_lane_match 21 vl_pre a21 (A (21)) )) (PreH25 : (qm_lane_match 22 vl_pre a22 (A (22)) )) (PreH26 : (qm_lane_match 23 vl_pre a23 (A (23)) )) (PreH27 : (qm_lane_match 24 vl_pre a24 (A (24)) )) (PreH28 : (qm_lane_match 25 vl_pre a25 (A (25)) )) (PreH29 : (qm_lane_match 26 vl_pre a26 (A (26)) )) (PreH30 : (qm_lane_match 27 vl_pre a27 (A (27)) )) (PreH31 : (qm_lane_match 28 vl_pre a28 (A (28)) )) (PreH32 : (qm_lane_match 29 vl_pre a29 (A (29)) )) (PreH33 : (qm_lane_match 30 vl_pre a30 (A (30)) )) (PreH34 : (qm_lane_match 31 vl_pre a31 (A (31)) )) ,
  (UndefStructPredvint16m4_t ( &( "s" ) ) )
  **  ((( &( "x" ) )) # Short  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Char  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Char  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Char  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Char  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Char  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Char  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Char  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Char  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Char  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Char  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Char  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Char  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Char  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Char  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Char  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Char  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Char  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Char  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Char  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Char  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Char  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Char  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Char  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Char  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Char  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Char  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Char  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Char  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Char  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Char  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Char  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Char  |-> a31)
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (qm_lane_match 0 vl_pre a0 (A (0)) ) ” 
  &&  “ (qm_lane_match 1 vl_pre a1 (A (1)) ) ” 
  &&  “ (qm_lane_match 2 vl_pre a2 (A (2)) ) ” 
  &&  “ (qm_lane_match 3 vl_pre a3 (A (3)) ) ” 
  &&  “ (qm_lane_match 4 vl_pre a4 (A (4)) ) ” 
  &&  “ (qm_lane_match 5 vl_pre a5 (A (5)) ) ” 
  &&  “ (qm_lane_match 6 vl_pre a6 (A (6)) ) ” 
  &&  “ (qm_lane_match 7 vl_pre a7 (A (7)) ) ” 
  &&  “ (qm_lane_match 8 vl_pre a8 (A (8)) ) ” 
  &&  “ (qm_lane_match 9 vl_pre a9 (A (9)) ) ” 
  &&  “ (qm_lane_match 10 vl_pre a10 (A (10)) ) ” 
  &&  “ (qm_lane_match 11 vl_pre a11 (A (11)) ) ” 
  &&  “ (qm_lane_match 12 vl_pre a12 (A (12)) ) ” 
  &&  “ (qm_lane_match 13 vl_pre a13 (A (13)) ) ” 
  &&  “ (qm_lane_match 14 vl_pre a14 (A (14)) ) ” 
  &&  “ (qm_lane_match 15 vl_pre a15 (A (15)) ) ” 
  &&  “ (qm_lane_match 16 vl_pre a16 (A (16)) ) ” 
  &&  “ (qm_lane_match 17 vl_pre a17 (A (17)) ) ” 
  &&  “ (qm_lane_match 18 vl_pre a18 (A (18)) ) ” 
  &&  “ (qm_lane_match 19 vl_pre a19 (A (19)) ) ” 
  &&  “ (qm_lane_match 20 vl_pre a20 (A (20)) ) ” 
  &&  “ (qm_lane_match 21 vl_pre a21 (A (21)) ) ” 
  &&  “ (qm_lane_match 22 vl_pre a22 (A (22)) ) ” 
  &&  “ (qm_lane_match 23 vl_pre a23 (A (23)) ) ” 
  &&  “ (qm_lane_match 24 vl_pre a24 (A (24)) ) ” 
  &&  “ (qm_lane_match 25 vl_pre a25 (A (25)) ) ” 
  &&  “ (qm_lane_match 26 vl_pre a26 (A (26)) ) ” 
  &&  “ (qm_lane_match 27 vl_pre a27 (A (27)) ) ” 
  &&  “ (qm_lane_match 28 vl_pre a28 (A (28)) ) ” 
  &&  “ (qm_lane_match 29 vl_pre a29 (A (29)) ) ” 
  &&  “ (qm_lane_match 30 vl_pre a30 (A (30)) ) ” 
  &&  “ (qm_lane_match 31 vl_pre a31 (A (31)) ) ”
.

Definition qm_sext_sub_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (A: (Z -> Z)) (a0: Z) (a1: Z) (a2: Z) (a3: Z) (a4: Z) (a5: Z) (a6: Z) (a7: Z) (a8: Z) (a9: Z) (a10: Z) (a11: Z) (a12: Z) (a13: Z) (a14: Z) (a15: Z) (a16: Z) (a17: Z) (a18: Z) (a19: Z) (a20: Z) (a21: Z) (a22: Z) (a23: Z) (a24: Z) (a25: Z) (a26: Z) (a27: Z) (a28: Z) (a29: Z) (a30: Z) (a31: Z) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (qm_lane_match 0 vl_pre a0 (A (0)) )) (PreH4 : (qm_lane_match 1 vl_pre a1 (A (1)) )) (PreH5 : (qm_lane_match 2 vl_pre a2 (A (2)) )) (PreH6 : (qm_lane_match 3 vl_pre a3 (A (3)) )) (PreH7 : (qm_lane_match 4 vl_pre a4 (A (4)) )) (PreH8 : (qm_lane_match 5 vl_pre a5 (A (5)) )) (PreH9 : (qm_lane_match 6 vl_pre a6 (A (6)) )) (PreH10 : (qm_lane_match 7 vl_pre a7 (A (7)) )) (PreH11 : (qm_lane_match 8 vl_pre a8 (A (8)) )) (PreH12 : (qm_lane_match 9 vl_pre a9 (A (9)) )) (PreH13 : (qm_lane_match 10 vl_pre a10 (A (10)) )) (PreH14 : (qm_lane_match 11 vl_pre a11 (A (11)) )) (PreH15 : (qm_lane_match 12 vl_pre a12 (A (12)) )) (PreH16 : (qm_lane_match 13 vl_pre a13 (A (13)) )) (PreH17 : (qm_lane_match 14 vl_pre a14 (A (14)) )) (PreH18 : (qm_lane_match 15 vl_pre a15 (A (15)) )) (PreH19 : (qm_lane_match 16 vl_pre a16 (A (16)) )) (PreH20 : (qm_lane_match 17 vl_pre a17 (A (17)) )) (PreH21 : (qm_lane_match 18 vl_pre a18 (A (18)) )) (PreH22 : (qm_lane_match 19 vl_pre a19 (A (19)) )) (PreH23 : (qm_lane_match 20 vl_pre a20 (A (20)) )) (PreH24 : (qm_lane_match 21 vl_pre a21 (A (21)) )) (PreH25 : (qm_lane_match 22 vl_pre a22 (A (22)) )) (PreH26 : (qm_lane_match 23 vl_pre a23 (A (23)) )) (PreH27 : (qm_lane_match 24 vl_pre a24 (A (24)) )) (PreH28 : (qm_lane_match 25 vl_pre a25 (A (25)) )) (PreH29 : (qm_lane_match 26 vl_pre a26 (A (26)) )) (PreH30 : (qm_lane_match 27 vl_pre a27 (A (27)) )) (PreH31 : (qm_lane_match 28 vl_pre a28 (A (28)) )) (PreH32 : (qm_lane_match 29 vl_pre a29 (A (29)) )) (PreH33 : (qm_lane_match 30 vl_pre a30 (A (30)) )) (PreH34 : (qm_lane_match 31 vl_pre a31 (A (31)) )) ,
  (UndefStructPredvint16m4_t ( &( "s" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Char  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Char  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Char  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Char  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Char  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Char  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Char  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Char  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Char  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Char  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Char  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Char  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Char  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Char  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Char  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Char  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Char  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Char  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Char  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Char  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Char  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Char  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Char  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Char  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Char  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Char  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Char  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Char  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Char  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Char  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Char  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Char  |-> a31)
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (qm_lane_match 0 vl_pre a0 (A (0)) ) ” 
  &&  “ (qm_lane_match 1 vl_pre a1 (A (1)) ) ” 
  &&  “ (qm_lane_match 2 vl_pre a2 (A (2)) ) ” 
  &&  “ (qm_lane_match 3 vl_pre a3 (A (3)) ) ” 
  &&  “ (qm_lane_match 4 vl_pre a4 (A (4)) ) ” 
  &&  “ (qm_lane_match 5 vl_pre a5 (A (5)) ) ” 
  &&  “ (qm_lane_match 6 vl_pre a6 (A (6)) ) ” 
  &&  “ (qm_lane_match 7 vl_pre a7 (A (7)) ) ” 
  &&  “ (qm_lane_match 8 vl_pre a8 (A (8)) ) ” 
  &&  “ (qm_lane_match 9 vl_pre a9 (A (9)) ) ” 
  &&  “ (qm_lane_match 10 vl_pre a10 (A (10)) ) ” 
  &&  “ (qm_lane_match 11 vl_pre a11 (A (11)) ) ” 
  &&  “ (qm_lane_match 12 vl_pre a12 (A (12)) ) ” 
  &&  “ (qm_lane_match 13 vl_pre a13 (A (13)) ) ” 
  &&  “ (qm_lane_match 14 vl_pre a14 (A (14)) ) ” 
  &&  “ (qm_lane_match 15 vl_pre a15 (A (15)) ) ” 
  &&  “ (qm_lane_match 16 vl_pre a16 (A (16)) ) ” 
  &&  “ (qm_lane_match 17 vl_pre a17 (A (17)) ) ” 
  &&  “ (qm_lane_match 18 vl_pre a18 (A (18)) ) ” 
  &&  “ (qm_lane_match 19 vl_pre a19 (A (19)) ) ” 
  &&  “ (qm_lane_match 20 vl_pre a20 (A (20)) ) ” 
  &&  “ (qm_lane_match 21 vl_pre a21 (A (21)) ) ” 
  &&  “ (qm_lane_match 22 vl_pre a22 (A (22)) ) ” 
  &&  “ (qm_lane_match 23 vl_pre a23 (A (23)) ) ” 
  &&  “ (qm_lane_match 24 vl_pre a24 (A (24)) ) ” 
  &&  “ (qm_lane_match 25 vl_pre a25 (A (25)) ) ” 
  &&  “ (qm_lane_match 26 vl_pre a26 (A (26)) ) ” 
  &&  “ (qm_lane_match 27 vl_pre a27 (A (27)) ) ” 
  &&  “ (qm_lane_match 28 vl_pre a28 (A (28)) ) ” 
  &&  “ (qm_lane_match 29 vl_pre a29 (A (29)) ) ” 
  &&  “ (qm_lane_match 30 vl_pre a30 (A (30)) ) ” 
  &&  “ (qm_lane_match 31 vl_pre a31 (A (31)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (qm_lane_match 0 vl_pre a0 (A (0)) ) ” 
  &&  “ (qm_lane_match 1 vl_pre a1 (A (1)) ) ” 
  &&  “ (qm_lane_match 2 vl_pre a2 (A (2)) ) ” 
  &&  “ (qm_lane_match 3 vl_pre a3 (A (3)) ) ” 
  &&  “ (qm_lane_match 4 vl_pre a4 (A (4)) ) ” 
  &&  “ (qm_lane_match 5 vl_pre a5 (A (5)) ) ” 
  &&  “ (qm_lane_match 6 vl_pre a6 (A (6)) ) ” 
  &&  “ (qm_lane_match 7 vl_pre a7 (A (7)) ) ” 
  &&  “ (qm_lane_match 8 vl_pre a8 (A (8)) ) ” 
  &&  “ (qm_lane_match 9 vl_pre a9 (A (9)) ) ” 
  &&  “ (qm_lane_match 10 vl_pre a10 (A (10)) ) ” 
  &&  “ (qm_lane_match 11 vl_pre a11 (A (11)) ) ” 
  &&  “ (qm_lane_match 12 vl_pre a12 (A (12)) ) ” 
  &&  “ (qm_lane_match 13 vl_pre a13 (A (13)) ) ” 
  &&  “ (qm_lane_match 14 vl_pre a14 (A (14)) ) ” 
  &&  “ (qm_lane_match 15 vl_pre a15 (A (15)) ) ” 
  &&  “ (qm_lane_match 16 vl_pre a16 (A (16)) ) ” 
  &&  “ (qm_lane_match 17 vl_pre a17 (A (17)) ) ” 
  &&  “ (qm_lane_match 18 vl_pre a18 (A (18)) ) ” 
  &&  “ (qm_lane_match 19 vl_pre a19 (A (19)) ) ” 
  &&  “ (qm_lane_match 20 vl_pre a20 (A (20)) ) ” 
  &&  “ (qm_lane_match 21 vl_pre a21 (A (21)) ) ” 
  &&  “ (qm_lane_match 22 vl_pre a22 (A (22)) ) ” 
  &&  “ (qm_lane_match 23 vl_pre a23 (A (23)) ) ” 
  &&  “ (qm_lane_match 24 vl_pre a24 (A (24)) ) ” 
  &&  “ (qm_lane_match 25 vl_pre a25 (A (25)) ) ” 
  &&  “ (qm_lane_match 26 vl_pre a26 (A (26)) ) ” 
  &&  “ (qm_lane_match 27 vl_pre a27 (A (27)) ) ” 
  &&  “ (qm_lane_match 28 vl_pre a28 (A (28)) ) ” 
  &&  “ (qm_lane_match 29 vl_pre a29 (A (29)) ) ” 
  &&  “ (qm_lane_match 30 vl_pre a30 (A (30)) ) ” 
  &&  “ (qm_lane_match 31 vl_pre a31 (A (31)) ) ”
  &&  ((&(( &( "a" ) )->ₛ "s0")) # Char  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Char  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Char  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Char  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Char  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Char  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Char  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Char  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Char  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Char  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Char  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Char  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Char  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Char  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Char  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Char  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Char  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Char  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Char  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Char  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Char  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Char  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Char  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Char  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Char  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Char  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Char  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Char  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Char  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Char  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Char  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Char  |-> a31)
  **  (UndefStructPredvint16m4_t ( &( "s" ) ) )
.

Definition qm_sext_sub_partial_solve_wit_1 := qm_sext_sub_partial_solve_wit_1_pure -> qm_sext_sub_partial_solve_wit_1_aux.

Definition qm_sext_sub_partial_solve_wit_2 := 
forall (vl_pre: Z) (A: (Z -> Z)) (a0: Z) (a1: Z) (a2: Z) (a3: Z) (a4: Z) (a5: Z) (a6: Z) (a7: Z) (a8: Z) (a9: Z) (a10: Z) (a11: Z) (a12: Z) (a13: Z) (a14: Z) (a15: Z) (a16: Z) (a17: Z) (a18: Z) (a19: Z) (a20: Z) (a21: Z) (a22: Z) (a23: Z) (a24: Z) (a25: Z) (a26: Z) (a27: Z) (a28: Z) (a29: Z) (a30: Z) (a31: Z) (a31_2: Z) (a30_2: Z) (a29_2: Z) (a28_2: Z) (a27_2: Z) (a26_2: Z) (a25_2: Z) (a24_2: Z) (a23_2: Z) (a22_2: Z) (a21_2: Z) (a20_2: Z) (a19_2: Z) (a18_2: Z) (a17_2: Z) (a16_2: Z) (a15_2: Z) (a14_2: Z) (a13_2: Z) (a12_2: Z) (a11_2: Z) (a10_2: Z) (a9_2: Z) (a8_2: Z) (a7_2: Z) (a6_2: Z) (a5_2: Z) (a4_2: Z) (a3_2: Z) (a2_2: Z) (a1_2: Z) (a0_2: Z) (r31: Z) (r30: Z) (r29: Z) (r28: Z) (r27: Z) (r26: Z) (r25: Z) (r24: Z) (r23: Z) (r22: Z) (r21: Z) (r20: Z) (r19: Z) (r18: Z) (r17: Z) (r16: Z) (r15: Z) (r14: Z) (r13: Z) (r12: Z) (r11: Z) (r10: Z) (r9: Z) (r8: Z) (r7: Z) (r6: Z) (r5: Z) (r4: Z) (r3: Z) (r2: Z) (r1: Z) (r0: Z) (retval: Z) (PreH1 : (qm_lane_match 0 vl_pre r0 (A (0)) )) (PreH2 : (qm_lane_match 1 vl_pre r1 (A (1)) )) (PreH3 : (qm_lane_match 2 vl_pre r2 (A (2)) )) (PreH4 : (qm_lane_match 3 vl_pre r3 (A (3)) )) (PreH5 : (qm_lane_match 4 vl_pre r4 (A (4)) )) (PreH6 : (qm_lane_match 5 vl_pre r5 (A (5)) )) (PreH7 : (qm_lane_match 6 vl_pre r6 (A (6)) )) (PreH8 : (qm_lane_match 7 vl_pre r7 (A (7)) )) (PreH9 : (qm_lane_match 8 vl_pre r8 (A (8)) )) (PreH10 : (qm_lane_match 9 vl_pre r9 (A (9)) )) (PreH11 : (qm_lane_match 10 vl_pre r10 (A (10)) )) (PreH12 : (qm_lane_match 11 vl_pre r11 (A (11)) )) (PreH13 : (qm_lane_match 12 vl_pre r12 (A (12)) )) (PreH14 : (qm_lane_match 13 vl_pre r13 (A (13)) )) (PreH15 : (qm_lane_match 14 vl_pre r14 (A (14)) )) (PreH16 : (qm_lane_match 15 vl_pre r15 (A (15)) )) (PreH17 : (qm_lane_match 16 vl_pre r16 (A (16)) )) (PreH18 : (qm_lane_match 17 vl_pre r17 (A (17)) )) (PreH19 : (qm_lane_match 18 vl_pre r18 (A (18)) )) (PreH20 : (qm_lane_match 19 vl_pre r19 (A (19)) )) (PreH21 : (qm_lane_match 20 vl_pre r20 (A (20)) )) (PreH22 : (qm_lane_match 21 vl_pre r21 (A (21)) )) (PreH23 : (qm_lane_match 22 vl_pre r22 (A (22)) )) (PreH24 : (qm_lane_match 23 vl_pre r23 (A (23)) )) (PreH25 : (qm_lane_match 24 vl_pre r24 (A (24)) )) (PreH26 : (qm_lane_match 25 vl_pre r25 (A (25)) )) (PreH27 : (qm_lane_match 26 vl_pre r26 (A (26)) )) (PreH28 : (qm_lane_match 27 vl_pre r27 (A (27)) )) (PreH29 : (qm_lane_match 28 vl_pre r28 (A (28)) )) (PreH30 : (qm_lane_match 29 vl_pre r29 (A (29)) )) (PreH31 : (qm_lane_match 30 vl_pre r30 (A (30)) )) (PreH32 : (qm_lane_match 31 vl_pre r31 (A (31)) )) (PreH33 : (0 <= vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (qm_lane_match 0 vl_pre a0 (A (0)) )) (PreH36 : (qm_lane_match 1 vl_pre a1 (A (1)) )) (PreH37 : (qm_lane_match 2 vl_pre a2 (A (2)) )) (PreH38 : (qm_lane_match 3 vl_pre a3 (A (3)) )) (PreH39 : (qm_lane_match 4 vl_pre a4 (A (4)) )) (PreH40 : (qm_lane_match 5 vl_pre a5 (A (5)) )) (PreH41 : (qm_lane_match 6 vl_pre a6 (A (6)) )) (PreH42 : (qm_lane_match 7 vl_pre a7 (A (7)) )) (PreH43 : (qm_lane_match 8 vl_pre a8 (A (8)) )) (PreH44 : (qm_lane_match 9 vl_pre a9 (A (9)) )) (PreH45 : (qm_lane_match 10 vl_pre a10 (A (10)) )) (PreH46 : (qm_lane_match 11 vl_pre a11 (A (11)) )) (PreH47 : (qm_lane_match 12 vl_pre a12 (A (12)) )) (PreH48 : (qm_lane_match 13 vl_pre a13 (A (13)) )) (PreH49 : (qm_lane_match 14 vl_pre a14 (A (14)) )) (PreH50 : (qm_lane_match 15 vl_pre a15 (A (15)) )) (PreH51 : (qm_lane_match 16 vl_pre a16 (A (16)) )) (PreH52 : (qm_lane_match 17 vl_pre a17 (A (17)) )) (PreH53 : (qm_lane_match 18 vl_pre a18 (A (18)) )) (PreH54 : (qm_lane_match 19 vl_pre a19 (A (19)) )) (PreH55 : (qm_lane_match 20 vl_pre a20 (A (20)) )) (PreH56 : (qm_lane_match 21 vl_pre a21 (A (21)) )) (PreH57 : (qm_lane_match 22 vl_pre a22 (A (22)) )) (PreH58 : (qm_lane_match 23 vl_pre a23 (A (23)) )) (PreH59 : (qm_lane_match 24 vl_pre a24 (A (24)) )) (PreH60 : (qm_lane_match 25 vl_pre a25 (A (25)) )) (PreH61 : (qm_lane_match 26 vl_pre a26 (A (26)) )) (PreH62 : (qm_lane_match 27 vl_pre a27 (A (27)) )) (PreH63 : (qm_lane_match 28 vl_pre a28 (A (28)) )) (PreH64 : (qm_lane_match 29 vl_pre a29 (A (29)) )) (PreH65 : (qm_lane_match 30 vl_pre a30 (A (30)) )) (PreH66 : (qm_lane_match 31 vl_pre a31 (A (31)) )) ,
  ((&((retval)  # "vint16m4_t" ->ₛ "s0")) # Short  |-> r0)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s1")) # Short  |-> r1)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s2")) # Short  |-> r2)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s3")) # Short  |-> r3)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s4")) # Short  |-> r4)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s5")) # Short  |-> r5)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s6")) # Short  |-> r6)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s7")) # Short  |-> r7)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s8")) # Short  |-> r8)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s9")) # Short  |-> r9)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s10")) # Short  |-> r10)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s11")) # Short  |-> r11)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s12")) # Short  |-> r12)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s13")) # Short  |-> r13)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s14")) # Short  |-> r14)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s15")) # Short  |-> r15)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s16")) # Short  |-> r16)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s17")) # Short  |-> r17)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s18")) # Short  |-> r18)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s19")) # Short  |-> r19)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s20")) # Short  |-> r20)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s21")) # Short  |-> r21)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s22")) # Short  |-> r22)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s23")) # Short  |-> r23)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s24")) # Short  |-> r24)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s25")) # Short  |-> r25)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s26")) # Short  |-> r26)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s27")) # Short  |-> r27)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s28")) # Short  |-> r28)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s29")) # Short  |-> r29)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s30")) # Short  |-> r30)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s31")) # Short  |-> r31)
  **  (UndefStructPredvint16m4_t ( &( "s" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Char  |-> a0_2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Char  |-> a1_2)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Char  |-> a2_2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Char  |-> a3_2)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Char  |-> a4_2)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Char  |-> a5_2)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Char  |-> a6_2)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Char  |-> a7_2)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Char  |-> a8_2)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Char  |-> a9_2)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Char  |-> a10_2)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Char  |-> a11_2)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Char  |-> a12_2)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Char  |-> a13_2)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Char  |-> a14_2)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Char  |-> a15_2)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Char  |-> a16_2)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Char  |-> a17_2)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Char  |-> a18_2)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Char  |-> a19_2)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Char  |-> a20_2)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Char  |-> a21_2)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Char  |-> a22_2)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Char  |-> a23_2)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Char  |-> a24_2)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Char  |-> a25_2)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Char  |-> a26_2)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Char  |-> a27_2)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Char  |-> a28_2)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Char  |-> a29_2)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Char  |-> a30_2)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Char  |-> a31_2)
|--
  “ (qm_lane_match 0 vl_pre r0 (A (0)) ) ” 
  &&  “ (qm_lane_match 1 vl_pre r1 (A (1)) ) ” 
  &&  “ (qm_lane_match 2 vl_pre r2 (A (2)) ) ” 
  &&  “ (qm_lane_match 3 vl_pre r3 (A (3)) ) ” 
  &&  “ (qm_lane_match 4 vl_pre r4 (A (4)) ) ” 
  &&  “ (qm_lane_match 5 vl_pre r5 (A (5)) ) ” 
  &&  “ (qm_lane_match 6 vl_pre r6 (A (6)) ) ” 
  &&  “ (qm_lane_match 7 vl_pre r7 (A (7)) ) ” 
  &&  “ (qm_lane_match 8 vl_pre r8 (A (8)) ) ” 
  &&  “ (qm_lane_match 9 vl_pre r9 (A (9)) ) ” 
  &&  “ (qm_lane_match 10 vl_pre r10 (A (10)) ) ” 
  &&  “ (qm_lane_match 11 vl_pre r11 (A (11)) ) ” 
  &&  “ (qm_lane_match 12 vl_pre r12 (A (12)) ) ” 
  &&  “ (qm_lane_match 13 vl_pre r13 (A (13)) ) ” 
  &&  “ (qm_lane_match 14 vl_pre r14 (A (14)) ) ” 
  &&  “ (qm_lane_match 15 vl_pre r15 (A (15)) ) ” 
  &&  “ (qm_lane_match 16 vl_pre r16 (A (16)) ) ” 
  &&  “ (qm_lane_match 17 vl_pre r17 (A (17)) ) ” 
  &&  “ (qm_lane_match 18 vl_pre r18 (A (18)) ) ” 
  &&  “ (qm_lane_match 19 vl_pre r19 (A (19)) ) ” 
  &&  “ (qm_lane_match 20 vl_pre r20 (A (20)) ) ” 
  &&  “ (qm_lane_match 21 vl_pre r21 (A (21)) ) ” 
  &&  “ (qm_lane_match 22 vl_pre r22 (A (22)) ) ” 
  &&  “ (qm_lane_match 23 vl_pre r23 (A (23)) ) ” 
  &&  “ (qm_lane_match 24 vl_pre r24 (A (24)) ) ” 
  &&  “ (qm_lane_match 25 vl_pre r25 (A (25)) ) ” 
  &&  “ (qm_lane_match 26 vl_pre r26 (A (26)) ) ” 
  &&  “ (qm_lane_match 27 vl_pre r27 (A (27)) ) ” 
  &&  “ (qm_lane_match 28 vl_pre r28 (A (28)) ) ” 
  &&  “ (qm_lane_match 29 vl_pre r29 (A (29)) ) ” 
  &&  “ (qm_lane_match 30 vl_pre r30 (A (30)) ) ” 
  &&  “ (qm_lane_match 31 vl_pre r31 (A (31)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (qm_lane_match 0 vl_pre a0 (A (0)) ) ” 
  &&  “ (qm_lane_match 1 vl_pre a1 (A (1)) ) ” 
  &&  “ (qm_lane_match 2 vl_pre a2 (A (2)) ) ” 
  &&  “ (qm_lane_match 3 vl_pre a3 (A (3)) ) ” 
  &&  “ (qm_lane_match 4 vl_pre a4 (A (4)) ) ” 
  &&  “ (qm_lane_match 5 vl_pre a5 (A (5)) ) ” 
  &&  “ (qm_lane_match 6 vl_pre a6 (A (6)) ) ” 
  &&  “ (qm_lane_match 7 vl_pre a7 (A (7)) ) ” 
  &&  “ (qm_lane_match 8 vl_pre a8 (A (8)) ) ” 
  &&  “ (qm_lane_match 9 vl_pre a9 (A (9)) ) ” 
  &&  “ (qm_lane_match 10 vl_pre a10 (A (10)) ) ” 
  &&  “ (qm_lane_match 11 vl_pre a11 (A (11)) ) ” 
  &&  “ (qm_lane_match 12 vl_pre a12 (A (12)) ) ” 
  &&  “ (qm_lane_match 13 vl_pre a13 (A (13)) ) ” 
  &&  “ (qm_lane_match 14 vl_pre a14 (A (14)) ) ” 
  &&  “ (qm_lane_match 15 vl_pre a15 (A (15)) ) ” 
  &&  “ (qm_lane_match 16 vl_pre a16 (A (16)) ) ” 
  &&  “ (qm_lane_match 17 vl_pre a17 (A (17)) ) ” 
  &&  “ (qm_lane_match 18 vl_pre a18 (A (18)) ) ” 
  &&  “ (qm_lane_match 19 vl_pre a19 (A (19)) ) ” 
  &&  “ (qm_lane_match 20 vl_pre a20 (A (20)) ) ” 
  &&  “ (qm_lane_match 21 vl_pre a21 (A (21)) ) ” 
  &&  “ (qm_lane_match 22 vl_pre a22 (A (22)) ) ” 
  &&  “ (qm_lane_match 23 vl_pre a23 (A (23)) ) ” 
  &&  “ (qm_lane_match 24 vl_pre a24 (A (24)) ) ” 
  &&  “ (qm_lane_match 25 vl_pre a25 (A (25)) ) ” 
  &&  “ (qm_lane_match 26 vl_pre a26 (A (26)) ) ” 
  &&  “ (qm_lane_match 27 vl_pre a27 (A (27)) ) ” 
  &&  “ (qm_lane_match 28 vl_pre a28 (A (28)) ) ” 
  &&  “ (qm_lane_match 29 vl_pre a29 (A (29)) ) ” 
  &&  “ (qm_lane_match 30 vl_pre a30 (A (30)) ) ” 
  &&  “ (qm_lane_match 31 vl_pre a31 (A (31)) ) ”
  &&  ((&(( &( "s" ) )->ₛ "s31")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s31")) # Short  |-> r31)
  **  ((&(( &( "s" ) )->ₛ "s30")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s30")) # Short  |-> r30)
  **  ((&(( &( "s" ) )->ₛ "s29")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s29")) # Short  |-> r29)
  **  ((&(( &( "s" ) )->ₛ "s28")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s28")) # Short  |-> r28)
  **  ((&(( &( "s" ) )->ₛ "s27")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s27")) # Short  |-> r27)
  **  ((&(( &( "s" ) )->ₛ "s26")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s26")) # Short  |-> r26)
  **  ((&(( &( "s" ) )->ₛ "s25")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s25")) # Short  |-> r25)
  **  ((&(( &( "s" ) )->ₛ "s24")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s24")) # Short  |-> r24)
  **  ((&(( &( "s" ) )->ₛ "s23")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s23")) # Short  |-> r23)
  **  ((&(( &( "s" ) )->ₛ "s22")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s22")) # Short  |-> r22)
  **  ((&(( &( "s" ) )->ₛ "s21")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s21")) # Short  |-> r21)
  **  ((&(( &( "s" ) )->ₛ "s20")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s20")) # Short  |-> r20)
  **  ((&(( &( "s" ) )->ₛ "s19")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s19")) # Short  |-> r19)
  **  ((&(( &( "s" ) )->ₛ "s18")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s18")) # Short  |-> r18)
  **  ((&(( &( "s" ) )->ₛ "s17")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s17")) # Short  |-> r17)
  **  ((&(( &( "s" ) )->ₛ "s16")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s16")) # Short  |-> r16)
  **  ((&(( &( "s" ) )->ₛ "s15")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s15")) # Short  |-> r15)
  **  ((&(( &( "s" ) )->ₛ "s14")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s14")) # Short  |-> r14)
  **  ((&(( &( "s" ) )->ₛ "s13")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s13")) # Short  |-> r13)
  **  ((&(( &( "s" ) )->ₛ "s12")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s12")) # Short  |-> r12)
  **  ((&(( &( "s" ) )->ₛ "s11")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s11")) # Short  |-> r11)
  **  ((&(( &( "s" ) )->ₛ "s10")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s10")) # Short  |-> r10)
  **  ((&(( &( "s" ) )->ₛ "s9")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s9")) # Short  |-> r9)
  **  ((&(( &( "s" ) )->ₛ "s8")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s8")) # Short  |-> r8)
  **  ((&(( &( "s" ) )->ₛ "s7")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s7")) # Short  |-> r7)
  **  ((&(( &( "s" ) )->ₛ "s6")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s6")) # Short  |-> r6)
  **  ((&(( &( "s" ) )->ₛ "s5")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s5")) # Short  |-> r5)
  **  ((&(( &( "s" ) )->ₛ "s4")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s4")) # Short  |-> r4)
  **  ((&(( &( "s" ) )->ₛ "s3")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s3")) # Short  |-> r3)
  **  ((&(( &( "s" ) )->ₛ "s2")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s2")) # Short  |-> r2)
  **  ((&(( &( "s" ) )->ₛ "s1")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s1")) # Short  |-> r1)
  **  ((&(( &( "s" ) )->ₛ "s0")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s0")) # Short  |-> r0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Char  |-> a0_2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Char  |-> a1_2)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Char  |-> a2_2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Char  |-> a3_2)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Char  |-> a4_2)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Char  |-> a5_2)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Char  |-> a6_2)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Char  |-> a7_2)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Char  |-> a8_2)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Char  |-> a9_2)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Char  |-> a10_2)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Char  |-> a11_2)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Char  |-> a12_2)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Char  |-> a13_2)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Char  |-> a14_2)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Char  |-> a15_2)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Char  |-> a16_2)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Char  |-> a17_2)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Char  |-> a18_2)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Char  |-> a19_2)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Char  |-> a20_2)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Char  |-> a21_2)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Char  |-> a22_2)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Char  |-> a23_2)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Char  |-> a24_2)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Char  |-> a25_2)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Char  |-> a26_2)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Char  |-> a27_2)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Char  |-> a28_2)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Char  |-> a29_2)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Char  |-> a30_2)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Char  |-> a31_2)
.

Definition qm_sext_sub_partial_solve_wit_3_pure := 
forall (vl_pre: Z) (x_pre: Z) (A: (Z -> Z)) (a0: Z) (a1: Z) (a2: Z) (a3: Z) (a4: Z) (a5: Z) (a6: Z) (a7: Z) (a8: Z) (a9: Z) (a10: Z) (a11: Z) (a12: Z) (a13: Z) (a14: Z) (a15: Z) (a16: Z) (a17: Z) (a18: Z) (a19: Z) (a20: Z) (a21: Z) (a22: Z) (a23: Z) (a24: Z) (a25: Z) (a26: Z) (a27: Z) (a28: Z) (a29: Z) (a30: Z) (a31: Z) (a31_2: Z) (a30_2: Z) (a29_2: Z) (a28_2: Z) (a27_2: Z) (a26_2: Z) (a25_2: Z) (a24_2: Z) (a23_2: Z) (a22_2: Z) (a21_2: Z) (a20_2: Z) (a19_2: Z) (a18_2: Z) (a17_2: Z) (a16_2: Z) (a15_2: Z) (a14_2: Z) (a13_2: Z) (a12_2: Z) (a11_2: Z) (a10_2: Z) (a9_2: Z) (a8_2: Z) (a7_2: Z) (a6_2: Z) (a5_2: Z) (a4_2: Z) (a3_2: Z) (a2_2: Z) (a1_2: Z) (a0_2: Z) (r31: Z) (r30: Z) (r29: Z) (r28: Z) (r27: Z) (r26: Z) (r25: Z) (r24: Z) (r23: Z) (r22: Z) (r21: Z) (r20: Z) (r19: Z) (r18: Z) (r17: Z) (r16: Z) (r15: Z) (r14: Z) (r13: Z) (r12: Z) (r11: Z) (r10: Z) (r9: Z) (r8: Z) (r7: Z) (r6: Z) (r5: Z) (r4: Z) (r3: Z) (r2: Z) (r1: Z) (r0: Z) (PreH1 : (qm_lane_match 0 vl_pre r0 (A (0)) )) (PreH2 : (qm_lane_match 1 vl_pre r1 (A (1)) )) (PreH3 : (qm_lane_match 2 vl_pre r2 (A (2)) )) (PreH4 : (qm_lane_match 3 vl_pre r3 (A (3)) )) (PreH5 : (qm_lane_match 4 vl_pre r4 (A (4)) )) (PreH6 : (qm_lane_match 5 vl_pre r5 (A (5)) )) (PreH7 : (qm_lane_match 6 vl_pre r6 (A (6)) )) (PreH8 : (qm_lane_match 7 vl_pre r7 (A (7)) )) (PreH9 : (qm_lane_match 8 vl_pre r8 (A (8)) )) (PreH10 : (qm_lane_match 9 vl_pre r9 (A (9)) )) (PreH11 : (qm_lane_match 10 vl_pre r10 (A (10)) )) (PreH12 : (qm_lane_match 11 vl_pre r11 (A (11)) )) (PreH13 : (qm_lane_match 12 vl_pre r12 (A (12)) )) (PreH14 : (qm_lane_match 13 vl_pre r13 (A (13)) )) (PreH15 : (qm_lane_match 14 vl_pre r14 (A (14)) )) (PreH16 : (qm_lane_match 15 vl_pre r15 (A (15)) )) (PreH17 : (qm_lane_match 16 vl_pre r16 (A (16)) )) (PreH18 : (qm_lane_match 17 vl_pre r17 (A (17)) )) (PreH19 : (qm_lane_match 18 vl_pre r18 (A (18)) )) (PreH20 : (qm_lane_match 19 vl_pre r19 (A (19)) )) (PreH21 : (qm_lane_match 20 vl_pre r20 (A (20)) )) (PreH22 : (qm_lane_match 21 vl_pre r21 (A (21)) )) (PreH23 : (qm_lane_match 22 vl_pre r22 (A (22)) )) (PreH24 : (qm_lane_match 23 vl_pre r23 (A (23)) )) (PreH25 : (qm_lane_match 24 vl_pre r24 (A (24)) )) (PreH26 : (qm_lane_match 25 vl_pre r25 (A (25)) )) (PreH27 : (qm_lane_match 26 vl_pre r26 (A (26)) )) (PreH28 : (qm_lane_match 27 vl_pre r27 (A (27)) )) (PreH29 : (qm_lane_match 28 vl_pre r28 (A (28)) )) (PreH30 : (qm_lane_match 29 vl_pre r29 (A (29)) )) (PreH31 : (qm_lane_match 30 vl_pre r30 (A (30)) )) (PreH32 : (qm_lane_match 31 vl_pre r31 (A (31)) )) (PreH33 : (0 <= vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (qm_lane_match 0 vl_pre a0 (A (0)) )) (PreH36 : (qm_lane_match 1 vl_pre a1 (A (1)) )) (PreH37 : (qm_lane_match 2 vl_pre a2 (A (2)) )) (PreH38 : (qm_lane_match 3 vl_pre a3 (A (3)) )) (PreH39 : (qm_lane_match 4 vl_pre a4 (A (4)) )) (PreH40 : (qm_lane_match 5 vl_pre a5 (A (5)) )) (PreH41 : (qm_lane_match 6 vl_pre a6 (A (6)) )) (PreH42 : (qm_lane_match 7 vl_pre a7 (A (7)) )) (PreH43 : (qm_lane_match 8 vl_pre a8 (A (8)) )) (PreH44 : (qm_lane_match 9 vl_pre a9 (A (9)) )) (PreH45 : (qm_lane_match 10 vl_pre a10 (A (10)) )) (PreH46 : (qm_lane_match 11 vl_pre a11 (A (11)) )) (PreH47 : (qm_lane_match 12 vl_pre a12 (A (12)) )) (PreH48 : (qm_lane_match 13 vl_pre a13 (A (13)) )) (PreH49 : (qm_lane_match 14 vl_pre a14 (A (14)) )) (PreH50 : (qm_lane_match 15 vl_pre a15 (A (15)) )) (PreH51 : (qm_lane_match 16 vl_pre a16 (A (16)) )) (PreH52 : (qm_lane_match 17 vl_pre a17 (A (17)) )) (PreH53 : (qm_lane_match 18 vl_pre a18 (A (18)) )) (PreH54 : (qm_lane_match 19 vl_pre a19 (A (19)) )) (PreH55 : (qm_lane_match 20 vl_pre a20 (A (20)) )) (PreH56 : (qm_lane_match 21 vl_pre a21 (A (21)) )) (PreH57 : (qm_lane_match 22 vl_pre a22 (A (22)) )) (PreH58 : (qm_lane_match 23 vl_pre a23 (A (23)) )) (PreH59 : (qm_lane_match 24 vl_pre a24 (A (24)) )) (PreH60 : (qm_lane_match 25 vl_pre a25 (A (25)) )) (PreH61 : (qm_lane_match 26 vl_pre a26 (A (26)) )) (PreH62 : (qm_lane_match 27 vl_pre a27 (A (27)) )) (PreH63 : (qm_lane_match 28 vl_pre a28 (A (28)) )) (PreH64 : (qm_lane_match 29 vl_pre a29 (A (29)) )) (PreH65 : (qm_lane_match 30 vl_pre a30 (A (30)) )) (PreH66 : (qm_lane_match 31 vl_pre a31 (A (31)) )) ,
  (UndefStructPredvint16m4_t ( &( "r" ) ) )
  **  ((&(( &( "s" ) )->ₛ "s31")) # Short  |-> r31)
  **  ((&(( &( "s" ) )->ₛ "s30")) # Short  |-> r30)
  **  ((&(( &( "s" ) )->ₛ "s29")) # Short  |-> r29)
  **  ((&(( &( "s" ) )->ₛ "s28")) # Short  |-> r28)
  **  ((&(( &( "s" ) )->ₛ "s27")) # Short  |-> r27)
  **  ((&(( &( "s" ) )->ₛ "s26")) # Short  |-> r26)
  **  ((&(( &( "s" ) )->ₛ "s25")) # Short  |-> r25)
  **  ((&(( &( "s" ) )->ₛ "s24")) # Short  |-> r24)
  **  ((&(( &( "s" ) )->ₛ "s23")) # Short  |-> r23)
  **  ((&(( &( "s" ) )->ₛ "s22")) # Short  |-> r22)
  **  ((&(( &( "s" ) )->ₛ "s21")) # Short  |-> r21)
  **  ((&(( &( "s" ) )->ₛ "s20")) # Short  |-> r20)
  **  ((&(( &( "s" ) )->ₛ "s19")) # Short  |-> r19)
  **  ((&(( &( "s" ) )->ₛ "s18")) # Short  |-> r18)
  **  ((&(( &( "s" ) )->ₛ "s17")) # Short  |-> r17)
  **  ((&(( &( "s" ) )->ₛ "s16")) # Short  |-> r16)
  **  ((&(( &( "s" ) )->ₛ "s15")) # Short  |-> r15)
  **  ((&(( &( "s" ) )->ₛ "s14")) # Short  |-> r14)
  **  ((&(( &( "s" ) )->ₛ "s13")) # Short  |-> r13)
  **  ((&(( &( "s" ) )->ₛ "s12")) # Short  |-> r12)
  **  ((&(( &( "s" ) )->ₛ "s11")) # Short  |-> r11)
  **  ((&(( &( "s" ) )->ₛ "s10")) # Short  |-> r10)
  **  ((&(( &( "s" ) )->ₛ "s9")) # Short  |-> r9)
  **  ((&(( &( "s" ) )->ₛ "s8")) # Short  |-> r8)
  **  ((&(( &( "s" ) )->ₛ "s7")) # Short  |-> r7)
  **  ((&(( &( "s" ) )->ₛ "s6")) # Short  |-> r6)
  **  ((&(( &( "s" ) )->ₛ "s5")) # Short  |-> r5)
  **  ((&(( &( "s" ) )->ₛ "s4")) # Short  |-> r4)
  **  ((&(( &( "s" ) )->ₛ "s3")) # Short  |-> r3)
  **  ((&(( &( "s" ) )->ₛ "s2")) # Short  |-> r2)
  **  ((&(( &( "s" ) )->ₛ "s1")) # Short  |-> r1)
  **  ((&(( &( "s" ) )->ₛ "s0")) # Short  |-> r0)
  **  ((( &( "x" ) )) # Short  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Char  |-> a0_2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Char  |-> a1_2)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Char  |-> a2_2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Char  |-> a3_2)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Char  |-> a4_2)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Char  |-> a5_2)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Char  |-> a6_2)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Char  |-> a7_2)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Char  |-> a8_2)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Char  |-> a9_2)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Char  |-> a10_2)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Char  |-> a11_2)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Char  |-> a12_2)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Char  |-> a13_2)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Char  |-> a14_2)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Char  |-> a15_2)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Char  |-> a16_2)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Char  |-> a17_2)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Char  |-> a18_2)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Char  |-> a19_2)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Char  |-> a20_2)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Char  |-> a21_2)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Char  |-> a22_2)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Char  |-> a23_2)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Char  |-> a24_2)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Char  |-> a25_2)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Char  |-> a26_2)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Char  |-> a27_2)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Char  |-> a28_2)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Char  |-> a29_2)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Char  |-> a30_2)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Char  |-> a31_2)
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (qm_lane_match 0 vl_pre r0 (A (0)) ) ” 
  &&  “ (qm_lane_match 1 vl_pre r1 (A (1)) ) ” 
  &&  “ (qm_lane_match 2 vl_pre r2 (A (2)) ) ” 
  &&  “ (qm_lane_match 3 vl_pre r3 (A (3)) ) ” 
  &&  “ (qm_lane_match 4 vl_pre r4 (A (4)) ) ” 
  &&  “ (qm_lane_match 5 vl_pre r5 (A (5)) ) ” 
  &&  “ (qm_lane_match 6 vl_pre r6 (A (6)) ) ” 
  &&  “ (qm_lane_match 7 vl_pre r7 (A (7)) ) ” 
  &&  “ (qm_lane_match 8 vl_pre r8 (A (8)) ) ” 
  &&  “ (qm_lane_match 9 vl_pre r9 (A (9)) ) ” 
  &&  “ (qm_lane_match 10 vl_pre r10 (A (10)) ) ” 
  &&  “ (qm_lane_match 11 vl_pre r11 (A (11)) ) ” 
  &&  “ (qm_lane_match 12 vl_pre r12 (A (12)) ) ” 
  &&  “ (qm_lane_match 13 vl_pre r13 (A (13)) ) ” 
  &&  “ (qm_lane_match 14 vl_pre r14 (A (14)) ) ” 
  &&  “ (qm_lane_match 15 vl_pre r15 (A (15)) ) ” 
  &&  “ (qm_lane_match 16 vl_pre r16 (A (16)) ) ” 
  &&  “ (qm_lane_match 17 vl_pre r17 (A (17)) ) ” 
  &&  “ (qm_lane_match 18 vl_pre r18 (A (18)) ) ” 
  &&  “ (qm_lane_match 19 vl_pre r19 (A (19)) ) ” 
  &&  “ (qm_lane_match 20 vl_pre r20 (A (20)) ) ” 
  &&  “ (qm_lane_match 21 vl_pre r21 (A (21)) ) ” 
  &&  “ (qm_lane_match 22 vl_pre r22 (A (22)) ) ” 
  &&  “ (qm_lane_match 23 vl_pre r23 (A (23)) ) ” 
  &&  “ (qm_lane_match 24 vl_pre r24 (A (24)) ) ” 
  &&  “ (qm_lane_match 25 vl_pre r25 (A (25)) ) ” 
  &&  “ (qm_lane_match 26 vl_pre r26 (A (26)) ) ” 
  &&  “ (qm_lane_match 27 vl_pre r27 (A (27)) ) ” 
  &&  “ (qm_lane_match 28 vl_pre r28 (A (28)) ) ” 
  &&  “ (qm_lane_match 29 vl_pre r29 (A (29)) ) ” 
  &&  “ (qm_lane_match 30 vl_pre r30 (A (30)) ) ” 
  &&  “ (qm_lane_match 31 vl_pre r31 (A (31)) ) ”
.

Definition qm_sext_sub_partial_solve_wit_3_aux := 
forall (vl_pre: Z) (A: (Z -> Z)) (a0: Z) (a1: Z) (a2: Z) (a3: Z) (a4: Z) (a5: Z) (a6: Z) (a7: Z) (a8: Z) (a9: Z) (a10: Z) (a11: Z) (a12: Z) (a13: Z) (a14: Z) (a15: Z) (a16: Z) (a17: Z) (a18: Z) (a19: Z) (a20: Z) (a21: Z) (a22: Z) (a23: Z) (a24: Z) (a25: Z) (a26: Z) (a27: Z) (a28: Z) (a29: Z) (a30: Z) (a31: Z) (a31_2: Z) (a30_2: Z) (a29_2: Z) (a28_2: Z) (a27_2: Z) (a26_2: Z) (a25_2: Z) (a24_2: Z) (a23_2: Z) (a22_2: Z) (a21_2: Z) (a20_2: Z) (a19_2: Z) (a18_2: Z) (a17_2: Z) (a16_2: Z) (a15_2: Z) (a14_2: Z) (a13_2: Z) (a12_2: Z) (a11_2: Z) (a10_2: Z) (a9_2: Z) (a8_2: Z) (a7_2: Z) (a6_2: Z) (a5_2: Z) (a4_2: Z) (a3_2: Z) (a2_2: Z) (a1_2: Z) (a0_2: Z) (r31: Z) (r30: Z) (r29: Z) (r28: Z) (r27: Z) (r26: Z) (r25: Z) (r24: Z) (r23: Z) (r22: Z) (r21: Z) (r20: Z) (r19: Z) (r18: Z) (r17: Z) (r16: Z) (r15: Z) (r14: Z) (r13: Z) (r12: Z) (r11: Z) (r10: Z) (r9: Z) (r8: Z) (r7: Z) (r6: Z) (r5: Z) (r4: Z) (r3: Z) (r2: Z) (r1: Z) (r0: Z) (PreH1 : (qm_lane_match 0 vl_pre r0 (A (0)) )) (PreH2 : (qm_lane_match 1 vl_pre r1 (A (1)) )) (PreH3 : (qm_lane_match 2 vl_pre r2 (A (2)) )) (PreH4 : (qm_lane_match 3 vl_pre r3 (A (3)) )) (PreH5 : (qm_lane_match 4 vl_pre r4 (A (4)) )) (PreH6 : (qm_lane_match 5 vl_pre r5 (A (5)) )) (PreH7 : (qm_lane_match 6 vl_pre r6 (A (6)) )) (PreH8 : (qm_lane_match 7 vl_pre r7 (A (7)) )) (PreH9 : (qm_lane_match 8 vl_pre r8 (A (8)) )) (PreH10 : (qm_lane_match 9 vl_pre r9 (A (9)) )) (PreH11 : (qm_lane_match 10 vl_pre r10 (A (10)) )) (PreH12 : (qm_lane_match 11 vl_pre r11 (A (11)) )) (PreH13 : (qm_lane_match 12 vl_pre r12 (A (12)) )) (PreH14 : (qm_lane_match 13 vl_pre r13 (A (13)) )) (PreH15 : (qm_lane_match 14 vl_pre r14 (A (14)) )) (PreH16 : (qm_lane_match 15 vl_pre r15 (A (15)) )) (PreH17 : (qm_lane_match 16 vl_pre r16 (A (16)) )) (PreH18 : (qm_lane_match 17 vl_pre r17 (A (17)) )) (PreH19 : (qm_lane_match 18 vl_pre r18 (A (18)) )) (PreH20 : (qm_lane_match 19 vl_pre r19 (A (19)) )) (PreH21 : (qm_lane_match 20 vl_pre r20 (A (20)) )) (PreH22 : (qm_lane_match 21 vl_pre r21 (A (21)) )) (PreH23 : (qm_lane_match 22 vl_pre r22 (A (22)) )) (PreH24 : (qm_lane_match 23 vl_pre r23 (A (23)) )) (PreH25 : (qm_lane_match 24 vl_pre r24 (A (24)) )) (PreH26 : (qm_lane_match 25 vl_pre r25 (A (25)) )) (PreH27 : (qm_lane_match 26 vl_pre r26 (A (26)) )) (PreH28 : (qm_lane_match 27 vl_pre r27 (A (27)) )) (PreH29 : (qm_lane_match 28 vl_pre r28 (A (28)) )) (PreH30 : (qm_lane_match 29 vl_pre r29 (A (29)) )) (PreH31 : (qm_lane_match 30 vl_pre r30 (A (30)) )) (PreH32 : (qm_lane_match 31 vl_pre r31 (A (31)) )) (PreH33 : (0 <= vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (qm_lane_match 0 vl_pre a0 (A (0)) )) (PreH36 : (qm_lane_match 1 vl_pre a1 (A (1)) )) (PreH37 : (qm_lane_match 2 vl_pre a2 (A (2)) )) (PreH38 : (qm_lane_match 3 vl_pre a3 (A (3)) )) (PreH39 : (qm_lane_match 4 vl_pre a4 (A (4)) )) (PreH40 : (qm_lane_match 5 vl_pre a5 (A (5)) )) (PreH41 : (qm_lane_match 6 vl_pre a6 (A (6)) )) (PreH42 : (qm_lane_match 7 vl_pre a7 (A (7)) )) (PreH43 : (qm_lane_match 8 vl_pre a8 (A (8)) )) (PreH44 : (qm_lane_match 9 vl_pre a9 (A (9)) )) (PreH45 : (qm_lane_match 10 vl_pre a10 (A (10)) )) (PreH46 : (qm_lane_match 11 vl_pre a11 (A (11)) )) (PreH47 : (qm_lane_match 12 vl_pre a12 (A (12)) )) (PreH48 : (qm_lane_match 13 vl_pre a13 (A (13)) )) (PreH49 : (qm_lane_match 14 vl_pre a14 (A (14)) )) (PreH50 : (qm_lane_match 15 vl_pre a15 (A (15)) )) (PreH51 : (qm_lane_match 16 vl_pre a16 (A (16)) )) (PreH52 : (qm_lane_match 17 vl_pre a17 (A (17)) )) (PreH53 : (qm_lane_match 18 vl_pre a18 (A (18)) )) (PreH54 : (qm_lane_match 19 vl_pre a19 (A (19)) )) (PreH55 : (qm_lane_match 20 vl_pre a20 (A (20)) )) (PreH56 : (qm_lane_match 21 vl_pre a21 (A (21)) )) (PreH57 : (qm_lane_match 22 vl_pre a22 (A (22)) )) (PreH58 : (qm_lane_match 23 vl_pre a23 (A (23)) )) (PreH59 : (qm_lane_match 24 vl_pre a24 (A (24)) )) (PreH60 : (qm_lane_match 25 vl_pre a25 (A (25)) )) (PreH61 : (qm_lane_match 26 vl_pre a26 (A (26)) )) (PreH62 : (qm_lane_match 27 vl_pre a27 (A (27)) )) (PreH63 : (qm_lane_match 28 vl_pre a28 (A (28)) )) (PreH64 : (qm_lane_match 29 vl_pre a29 (A (29)) )) (PreH65 : (qm_lane_match 30 vl_pre a30 (A (30)) )) (PreH66 : (qm_lane_match 31 vl_pre a31 (A (31)) )) ,
  (UndefStructPredvint16m4_t ( &( "r" ) ) )
  **  ((&(( &( "s" ) )->ₛ "s31")) # Short  |-> r31)
  **  ((&(( &( "s" ) )->ₛ "s30")) # Short  |-> r30)
  **  ((&(( &( "s" ) )->ₛ "s29")) # Short  |-> r29)
  **  ((&(( &( "s" ) )->ₛ "s28")) # Short  |-> r28)
  **  ((&(( &( "s" ) )->ₛ "s27")) # Short  |-> r27)
  **  ((&(( &( "s" ) )->ₛ "s26")) # Short  |-> r26)
  **  ((&(( &( "s" ) )->ₛ "s25")) # Short  |-> r25)
  **  ((&(( &( "s" ) )->ₛ "s24")) # Short  |-> r24)
  **  ((&(( &( "s" ) )->ₛ "s23")) # Short  |-> r23)
  **  ((&(( &( "s" ) )->ₛ "s22")) # Short  |-> r22)
  **  ((&(( &( "s" ) )->ₛ "s21")) # Short  |-> r21)
  **  ((&(( &( "s" ) )->ₛ "s20")) # Short  |-> r20)
  **  ((&(( &( "s" ) )->ₛ "s19")) # Short  |-> r19)
  **  ((&(( &( "s" ) )->ₛ "s18")) # Short  |-> r18)
  **  ((&(( &( "s" ) )->ₛ "s17")) # Short  |-> r17)
  **  ((&(( &( "s" ) )->ₛ "s16")) # Short  |-> r16)
  **  ((&(( &( "s" ) )->ₛ "s15")) # Short  |-> r15)
  **  ((&(( &( "s" ) )->ₛ "s14")) # Short  |-> r14)
  **  ((&(( &( "s" ) )->ₛ "s13")) # Short  |-> r13)
  **  ((&(( &( "s" ) )->ₛ "s12")) # Short  |-> r12)
  **  ((&(( &( "s" ) )->ₛ "s11")) # Short  |-> r11)
  **  ((&(( &( "s" ) )->ₛ "s10")) # Short  |-> r10)
  **  ((&(( &( "s" ) )->ₛ "s9")) # Short  |-> r9)
  **  ((&(( &( "s" ) )->ₛ "s8")) # Short  |-> r8)
  **  ((&(( &( "s" ) )->ₛ "s7")) # Short  |-> r7)
  **  ((&(( &( "s" ) )->ₛ "s6")) # Short  |-> r6)
  **  ((&(( &( "s" ) )->ₛ "s5")) # Short  |-> r5)
  **  ((&(( &( "s" ) )->ₛ "s4")) # Short  |-> r4)
  **  ((&(( &( "s" ) )->ₛ "s3")) # Short  |-> r3)
  **  ((&(( &( "s" ) )->ₛ "s2")) # Short  |-> r2)
  **  ((&(( &( "s" ) )->ₛ "s1")) # Short  |-> r1)
  **  ((&(( &( "s" ) )->ₛ "s0")) # Short  |-> r0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Char  |-> a0_2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Char  |-> a1_2)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Char  |-> a2_2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Char  |-> a3_2)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Char  |-> a4_2)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Char  |-> a5_2)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Char  |-> a6_2)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Char  |-> a7_2)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Char  |-> a8_2)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Char  |-> a9_2)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Char  |-> a10_2)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Char  |-> a11_2)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Char  |-> a12_2)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Char  |-> a13_2)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Char  |-> a14_2)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Char  |-> a15_2)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Char  |-> a16_2)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Char  |-> a17_2)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Char  |-> a18_2)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Char  |-> a19_2)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Char  |-> a20_2)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Char  |-> a21_2)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Char  |-> a22_2)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Char  |-> a23_2)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Char  |-> a24_2)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Char  |-> a25_2)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Char  |-> a26_2)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Char  |-> a27_2)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Char  |-> a28_2)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Char  |-> a29_2)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Char  |-> a30_2)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Char  |-> a31_2)
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (qm_lane_match 0 vl_pre r0 (A (0)) ) ” 
  &&  “ (qm_lane_match 1 vl_pre r1 (A (1)) ) ” 
  &&  “ (qm_lane_match 2 vl_pre r2 (A (2)) ) ” 
  &&  “ (qm_lane_match 3 vl_pre r3 (A (3)) ) ” 
  &&  “ (qm_lane_match 4 vl_pre r4 (A (4)) ) ” 
  &&  “ (qm_lane_match 5 vl_pre r5 (A (5)) ) ” 
  &&  “ (qm_lane_match 6 vl_pre r6 (A (6)) ) ” 
  &&  “ (qm_lane_match 7 vl_pre r7 (A (7)) ) ” 
  &&  “ (qm_lane_match 8 vl_pre r8 (A (8)) ) ” 
  &&  “ (qm_lane_match 9 vl_pre r9 (A (9)) ) ” 
  &&  “ (qm_lane_match 10 vl_pre r10 (A (10)) ) ” 
  &&  “ (qm_lane_match 11 vl_pre r11 (A (11)) ) ” 
  &&  “ (qm_lane_match 12 vl_pre r12 (A (12)) ) ” 
  &&  “ (qm_lane_match 13 vl_pre r13 (A (13)) ) ” 
  &&  “ (qm_lane_match 14 vl_pre r14 (A (14)) ) ” 
  &&  “ (qm_lane_match 15 vl_pre r15 (A (15)) ) ” 
  &&  “ (qm_lane_match 16 vl_pre r16 (A (16)) ) ” 
  &&  “ (qm_lane_match 17 vl_pre r17 (A (17)) ) ” 
  &&  “ (qm_lane_match 18 vl_pre r18 (A (18)) ) ” 
  &&  “ (qm_lane_match 19 vl_pre r19 (A (19)) ) ” 
  &&  “ (qm_lane_match 20 vl_pre r20 (A (20)) ) ” 
  &&  “ (qm_lane_match 21 vl_pre r21 (A (21)) ) ” 
  &&  “ (qm_lane_match 22 vl_pre r22 (A (22)) ) ” 
  &&  “ (qm_lane_match 23 vl_pre r23 (A (23)) ) ” 
  &&  “ (qm_lane_match 24 vl_pre r24 (A (24)) ) ” 
  &&  “ (qm_lane_match 25 vl_pre r25 (A (25)) ) ” 
  &&  “ (qm_lane_match 26 vl_pre r26 (A (26)) ) ” 
  &&  “ (qm_lane_match 27 vl_pre r27 (A (27)) ) ” 
  &&  “ (qm_lane_match 28 vl_pre r28 (A (28)) ) ” 
  &&  “ (qm_lane_match 29 vl_pre r29 (A (29)) ) ” 
  &&  “ (qm_lane_match 30 vl_pre r30 (A (30)) ) ” 
  &&  “ (qm_lane_match 31 vl_pre r31 (A (31)) ) ” 
  &&  “ (qm_lane_match 0 vl_pre r0 (A (0)) ) ” 
  &&  “ (qm_lane_match 1 vl_pre r1 (A (1)) ) ” 
  &&  “ (qm_lane_match 2 vl_pre r2 (A (2)) ) ” 
  &&  “ (qm_lane_match 3 vl_pre r3 (A (3)) ) ” 
  &&  “ (qm_lane_match 4 vl_pre r4 (A (4)) ) ” 
  &&  “ (qm_lane_match 5 vl_pre r5 (A (5)) ) ” 
  &&  “ (qm_lane_match 6 vl_pre r6 (A (6)) ) ” 
  &&  “ (qm_lane_match 7 vl_pre r7 (A (7)) ) ” 
  &&  “ (qm_lane_match 8 vl_pre r8 (A (8)) ) ” 
  &&  “ (qm_lane_match 9 vl_pre r9 (A (9)) ) ” 
  &&  “ (qm_lane_match 10 vl_pre r10 (A (10)) ) ” 
  &&  “ (qm_lane_match 11 vl_pre r11 (A (11)) ) ” 
  &&  “ (qm_lane_match 12 vl_pre r12 (A (12)) ) ” 
  &&  “ (qm_lane_match 13 vl_pre r13 (A (13)) ) ” 
  &&  “ (qm_lane_match 14 vl_pre r14 (A (14)) ) ” 
  &&  “ (qm_lane_match 15 vl_pre r15 (A (15)) ) ” 
  &&  “ (qm_lane_match 16 vl_pre r16 (A (16)) ) ” 
  &&  “ (qm_lane_match 17 vl_pre r17 (A (17)) ) ” 
  &&  “ (qm_lane_match 18 vl_pre r18 (A (18)) ) ” 
  &&  “ (qm_lane_match 19 vl_pre r19 (A (19)) ) ” 
  &&  “ (qm_lane_match 20 vl_pre r20 (A (20)) ) ” 
  &&  “ (qm_lane_match 21 vl_pre r21 (A (21)) ) ” 
  &&  “ (qm_lane_match 22 vl_pre r22 (A (22)) ) ” 
  &&  “ (qm_lane_match 23 vl_pre r23 (A (23)) ) ” 
  &&  “ (qm_lane_match 24 vl_pre r24 (A (24)) ) ” 
  &&  “ (qm_lane_match 25 vl_pre r25 (A (25)) ) ” 
  &&  “ (qm_lane_match 26 vl_pre r26 (A (26)) ) ” 
  &&  “ (qm_lane_match 27 vl_pre r27 (A (27)) ) ” 
  &&  “ (qm_lane_match 28 vl_pre r28 (A (28)) ) ” 
  &&  “ (qm_lane_match 29 vl_pre r29 (A (29)) ) ” 
  &&  “ (qm_lane_match 30 vl_pre r30 (A (30)) ) ” 
  &&  “ (qm_lane_match 31 vl_pre r31 (A (31)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (qm_lane_match 0 vl_pre a0 (A (0)) ) ” 
  &&  “ (qm_lane_match 1 vl_pre a1 (A (1)) ) ” 
  &&  “ (qm_lane_match 2 vl_pre a2 (A (2)) ) ” 
  &&  “ (qm_lane_match 3 vl_pre a3 (A (3)) ) ” 
  &&  “ (qm_lane_match 4 vl_pre a4 (A (4)) ) ” 
  &&  “ (qm_lane_match 5 vl_pre a5 (A (5)) ) ” 
  &&  “ (qm_lane_match 6 vl_pre a6 (A (6)) ) ” 
  &&  “ (qm_lane_match 7 vl_pre a7 (A (7)) ) ” 
  &&  “ (qm_lane_match 8 vl_pre a8 (A (8)) ) ” 
  &&  “ (qm_lane_match 9 vl_pre a9 (A (9)) ) ” 
  &&  “ (qm_lane_match 10 vl_pre a10 (A (10)) ) ” 
  &&  “ (qm_lane_match 11 vl_pre a11 (A (11)) ) ” 
  &&  “ (qm_lane_match 12 vl_pre a12 (A (12)) ) ” 
  &&  “ (qm_lane_match 13 vl_pre a13 (A (13)) ) ” 
  &&  “ (qm_lane_match 14 vl_pre a14 (A (14)) ) ” 
  &&  “ (qm_lane_match 15 vl_pre a15 (A (15)) ) ” 
  &&  “ (qm_lane_match 16 vl_pre a16 (A (16)) ) ” 
  &&  “ (qm_lane_match 17 vl_pre a17 (A (17)) ) ” 
  &&  “ (qm_lane_match 18 vl_pre a18 (A (18)) ) ” 
  &&  “ (qm_lane_match 19 vl_pre a19 (A (19)) ) ” 
  &&  “ (qm_lane_match 20 vl_pre a20 (A (20)) ) ” 
  &&  “ (qm_lane_match 21 vl_pre a21 (A (21)) ) ” 
  &&  “ (qm_lane_match 22 vl_pre a22 (A (22)) ) ” 
  &&  “ (qm_lane_match 23 vl_pre a23 (A (23)) ) ” 
  &&  “ (qm_lane_match 24 vl_pre a24 (A (24)) ) ” 
  &&  “ (qm_lane_match 25 vl_pre a25 (A (25)) ) ” 
  &&  “ (qm_lane_match 26 vl_pre a26 (A (26)) ) ” 
  &&  “ (qm_lane_match 27 vl_pre a27 (A (27)) ) ” 
  &&  “ (qm_lane_match 28 vl_pre a28 (A (28)) ) ” 
  &&  “ (qm_lane_match 29 vl_pre a29 (A (29)) ) ” 
  &&  “ (qm_lane_match 30 vl_pre a30 (A (30)) ) ” 
  &&  “ (qm_lane_match 31 vl_pre a31 (A (31)) ) ”
  &&  ((&(( &( "s" ) )->ₛ "s0")) # Short  |-> r0)
  **  ((&(( &( "s" ) )->ₛ "s1")) # Short  |-> r1)
  **  ((&(( &( "s" ) )->ₛ "s2")) # Short  |-> r2)
  **  ((&(( &( "s" ) )->ₛ "s3")) # Short  |-> r3)
  **  ((&(( &( "s" ) )->ₛ "s4")) # Short  |-> r4)
  **  ((&(( &( "s" ) )->ₛ "s5")) # Short  |-> r5)
  **  ((&(( &( "s" ) )->ₛ "s6")) # Short  |-> r6)
  **  ((&(( &( "s" ) )->ₛ "s7")) # Short  |-> r7)
  **  ((&(( &( "s" ) )->ₛ "s8")) # Short  |-> r8)
  **  ((&(( &( "s" ) )->ₛ "s9")) # Short  |-> r9)
  **  ((&(( &( "s" ) )->ₛ "s10")) # Short  |-> r10)
  **  ((&(( &( "s" ) )->ₛ "s11")) # Short  |-> r11)
  **  ((&(( &( "s" ) )->ₛ "s12")) # Short  |-> r12)
  **  ((&(( &( "s" ) )->ₛ "s13")) # Short  |-> r13)
  **  ((&(( &( "s" ) )->ₛ "s14")) # Short  |-> r14)
  **  ((&(( &( "s" ) )->ₛ "s15")) # Short  |-> r15)
  **  ((&(( &( "s" ) )->ₛ "s16")) # Short  |-> r16)
  **  ((&(( &( "s" ) )->ₛ "s17")) # Short  |-> r17)
  **  ((&(( &( "s" ) )->ₛ "s18")) # Short  |-> r18)
  **  ((&(( &( "s" ) )->ₛ "s19")) # Short  |-> r19)
  **  ((&(( &( "s" ) )->ₛ "s20")) # Short  |-> r20)
  **  ((&(( &( "s" ) )->ₛ "s21")) # Short  |-> r21)
  **  ((&(( &( "s" ) )->ₛ "s22")) # Short  |-> r22)
  **  ((&(( &( "s" ) )->ₛ "s23")) # Short  |-> r23)
  **  ((&(( &( "s" ) )->ₛ "s24")) # Short  |-> r24)
  **  ((&(( &( "s" ) )->ₛ "s25")) # Short  |-> r25)
  **  ((&(( &( "s" ) )->ₛ "s26")) # Short  |-> r26)
  **  ((&(( &( "s" ) )->ₛ "s27")) # Short  |-> r27)
  **  ((&(( &( "s" ) )->ₛ "s28")) # Short  |-> r28)
  **  ((&(( &( "s" ) )->ₛ "s29")) # Short  |-> r29)
  **  ((&(( &( "s" ) )->ₛ "s30")) # Short  |-> r30)
  **  ((&(( &( "s" ) )->ₛ "s31")) # Short  |-> r31)
  **  (UndefStructPredvint16m4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Char  |-> a0_2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Char  |-> a1_2)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Char  |-> a2_2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Char  |-> a3_2)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Char  |-> a4_2)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Char  |-> a5_2)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Char  |-> a6_2)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Char  |-> a7_2)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Char  |-> a8_2)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Char  |-> a9_2)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Char  |-> a10_2)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Char  |-> a11_2)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Char  |-> a12_2)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Char  |-> a13_2)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Char  |-> a14_2)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Char  |-> a15_2)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Char  |-> a16_2)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Char  |-> a17_2)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Char  |-> a18_2)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Char  |-> a19_2)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Char  |-> a20_2)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Char  |-> a21_2)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Char  |-> a22_2)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Char  |-> a23_2)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Char  |-> a24_2)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Char  |-> a25_2)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Char  |-> a26_2)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Char  |-> a27_2)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Char  |-> a28_2)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Char  |-> a29_2)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Char  |-> a30_2)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Char  |-> a31_2)
.

Definition qm_sext_sub_partial_solve_wit_3 := qm_sext_sub_partial_solve_wit_3_pure -> qm_sext_sub_partial_solve_wit_3_aux.

Definition qm_sext_sub_partial_solve_wit_4 := 
forall (vl_pre: Z) (x_pre: Z) (A: (Z -> Z)) (a0: Z) (a1: Z) (a2: Z) (a3: Z) (a4: Z) (a5: Z) (a6: Z) (a7: Z) (a8: Z) (a9: Z) (a10: Z) (a11: Z) (a12: Z) (a13: Z) (a14: Z) (a15: Z) (a16: Z) (a17: Z) (a18: Z) (a19: Z) (a20: Z) (a21: Z) (a22: Z) (a23: Z) (a24: Z) (a25: Z) (a26: Z) (a27: Z) (a28: Z) (a29: Z) (a30: Z) (a31: Z) (a31_2: Z) (a30_2: Z) (a29_2: Z) (a28_2: Z) (a27_2: Z) (a26_2: Z) (a25_2: Z) (a24_2: Z) (a23_2: Z) (a22_2: Z) (a21_2: Z) (a20_2: Z) (a19_2: Z) (a18_2: Z) (a17_2: Z) (a16_2: Z) (a15_2: Z) (a14_2: Z) (a13_2: Z) (a12_2: Z) (a11_2: Z) (a10_2: Z) (a9_2: Z) (a8_2: Z) (a7_2: Z) (a6_2: Z) (a5_2: Z) (a4_2: Z) (a3_2: Z) (a2_2: Z) (a1_2: Z) (a0_2: Z) (r31: Z) (r30: Z) (r29: Z) (r28: Z) (r27: Z) (r26: Z) (r25: Z) (r24: Z) (r23: Z) (r22: Z) (r21: Z) (r20: Z) (r19: Z) (r18: Z) (r17: Z) (r16: Z) (r15: Z) (r14: Z) (r13: Z) (r12: Z) (r11: Z) (r10: Z) (r9: Z) (r8: Z) (r7: Z) (r6: Z) (r5: Z) (r4: Z) (r3: Z) (r2: Z) (r1: Z) (r0: Z) (a31_3: Z) (a30_3: Z) (a29_3: Z) (a28_3: Z) (a27_3: Z) (a26_3: Z) (a25_3: Z) (a24_3: Z) (a23_3: Z) (a22_3: Z) (a21_3: Z) (a20_3: Z) (a19_3: Z) (a18_3: Z) (a17_3: Z) (a16_3: Z) (a15_3: Z) (a14_3: Z) (a13_3: Z) (a12_3: Z) (a11_3: Z) (a10_3: Z) (a9_3: Z) (a8_3: Z) (a7_3: Z) (a6_3: Z) (a5_3: Z) (a4_3: Z) (a3_3: Z) (a2_3: Z) (a1_3: Z) (a0_3: Z) (r31_2: Z) (r30_2: Z) (r29_2: Z) (r28_2: Z) (r27_2: Z) (r26_2: Z) (r25_2: Z) (r24_2: Z) (r23_2: Z) (r22_2: Z) (r21_2: Z) (r20_2: Z) (r19_2: Z) (r18_2: Z) (r17_2: Z) (r16_2: Z) (r15_2: Z) (r14_2: Z) (r13_2: Z) (r12_2: Z) (r11_2: Z) (r10_2: Z) (r9_2: Z) (r8_2: Z) (r7_2: Z) (r6_2: Z) (r5_2: Z) (r4_2: Z) (r3_2: Z) (r2_2: Z) (r1_2: Z) (r0_2: Z) (retval: Z) (PreH1 : (qm_lane_match 0 vl_pre r0_2 (qm_sub16 ((A (0))) (x_pre)) )) (PreH2 : (qm_lane_match 1 vl_pre r1_2 (qm_sub16 ((A (1))) (x_pre)) )) (PreH3 : (qm_lane_match 2 vl_pre r2_2 (qm_sub16 ((A (2))) (x_pre)) )) (PreH4 : (qm_lane_match 3 vl_pre r3_2 (qm_sub16 ((A (3))) (x_pre)) )) (PreH5 : (qm_lane_match 4 vl_pre r4_2 (qm_sub16 ((A (4))) (x_pre)) )) (PreH6 : (qm_lane_match 5 vl_pre r5_2 (qm_sub16 ((A (5))) (x_pre)) )) (PreH7 : (qm_lane_match 6 vl_pre r6_2 (qm_sub16 ((A (6))) (x_pre)) )) (PreH8 : (qm_lane_match 7 vl_pre r7_2 (qm_sub16 ((A (7))) (x_pre)) )) (PreH9 : (qm_lane_match 8 vl_pre r8_2 (qm_sub16 ((A (8))) (x_pre)) )) (PreH10 : (qm_lane_match 9 vl_pre r9_2 (qm_sub16 ((A (9))) (x_pre)) )) (PreH11 : (qm_lane_match 10 vl_pre r10_2 (qm_sub16 ((A (10))) (x_pre)) )) (PreH12 : (qm_lane_match 11 vl_pre r11_2 (qm_sub16 ((A (11))) (x_pre)) )) (PreH13 : (qm_lane_match 12 vl_pre r12_2 (qm_sub16 ((A (12))) (x_pre)) )) (PreH14 : (qm_lane_match 13 vl_pre r13_2 (qm_sub16 ((A (13))) (x_pre)) )) (PreH15 : (qm_lane_match 14 vl_pre r14_2 (qm_sub16 ((A (14))) (x_pre)) )) (PreH16 : (qm_lane_match 15 vl_pre r15_2 (qm_sub16 ((A (15))) (x_pre)) )) (PreH17 : (qm_lane_match 16 vl_pre r16_2 (qm_sub16 ((A (16))) (x_pre)) )) (PreH18 : (qm_lane_match 17 vl_pre r17_2 (qm_sub16 ((A (17))) (x_pre)) )) (PreH19 : (qm_lane_match 18 vl_pre r18_2 (qm_sub16 ((A (18))) (x_pre)) )) (PreH20 : (qm_lane_match 19 vl_pre r19_2 (qm_sub16 ((A (19))) (x_pre)) )) (PreH21 : (qm_lane_match 20 vl_pre r20_2 (qm_sub16 ((A (20))) (x_pre)) )) (PreH22 : (qm_lane_match 21 vl_pre r21_2 (qm_sub16 ((A (21))) (x_pre)) )) (PreH23 : (qm_lane_match 22 vl_pre r22_2 (qm_sub16 ((A (22))) (x_pre)) )) (PreH24 : (qm_lane_match 23 vl_pre r23_2 (qm_sub16 ((A (23))) (x_pre)) )) (PreH25 : (qm_lane_match 24 vl_pre r24_2 (qm_sub16 ((A (24))) (x_pre)) )) (PreH26 : (qm_lane_match 25 vl_pre r25_2 (qm_sub16 ((A (25))) (x_pre)) )) (PreH27 : (qm_lane_match 26 vl_pre r26_2 (qm_sub16 ((A (26))) (x_pre)) )) (PreH28 : (qm_lane_match 27 vl_pre r27_2 (qm_sub16 ((A (27))) (x_pre)) )) (PreH29 : (qm_lane_match 28 vl_pre r28_2 (qm_sub16 ((A (28))) (x_pre)) )) (PreH30 : (qm_lane_match 29 vl_pre r29_2 (qm_sub16 ((A (29))) (x_pre)) )) (PreH31 : (qm_lane_match 30 vl_pre r30_2 (qm_sub16 ((A (30))) (x_pre)) )) (PreH32 : (qm_lane_match 31 vl_pre r31_2 (qm_sub16 ((A (31))) (x_pre)) )) (PreH33 : (qm_lane_match 0 vl_pre r0 (A (0)) )) (PreH34 : (qm_lane_match 1 vl_pre r1 (A (1)) )) (PreH35 : (qm_lane_match 2 vl_pre r2 (A (2)) )) (PreH36 : (qm_lane_match 3 vl_pre r3 (A (3)) )) (PreH37 : (qm_lane_match 4 vl_pre r4 (A (4)) )) (PreH38 : (qm_lane_match 5 vl_pre r5 (A (5)) )) (PreH39 : (qm_lane_match 6 vl_pre r6 (A (6)) )) (PreH40 : (qm_lane_match 7 vl_pre r7 (A (7)) )) (PreH41 : (qm_lane_match 8 vl_pre r8 (A (8)) )) (PreH42 : (qm_lane_match 9 vl_pre r9 (A (9)) )) (PreH43 : (qm_lane_match 10 vl_pre r10 (A (10)) )) (PreH44 : (qm_lane_match 11 vl_pre r11 (A (11)) )) (PreH45 : (qm_lane_match 12 vl_pre r12 (A (12)) )) (PreH46 : (qm_lane_match 13 vl_pre r13 (A (13)) )) (PreH47 : (qm_lane_match 14 vl_pre r14 (A (14)) )) (PreH48 : (qm_lane_match 15 vl_pre r15 (A (15)) )) (PreH49 : (qm_lane_match 16 vl_pre r16 (A (16)) )) (PreH50 : (qm_lane_match 17 vl_pre r17 (A (17)) )) (PreH51 : (qm_lane_match 18 vl_pre r18 (A (18)) )) (PreH52 : (qm_lane_match 19 vl_pre r19 (A (19)) )) (PreH53 : (qm_lane_match 20 vl_pre r20 (A (20)) )) (PreH54 : (qm_lane_match 21 vl_pre r21 (A (21)) )) (PreH55 : (qm_lane_match 22 vl_pre r22 (A (22)) )) (PreH56 : (qm_lane_match 23 vl_pre r23 (A (23)) )) (PreH57 : (qm_lane_match 24 vl_pre r24 (A (24)) )) (PreH58 : (qm_lane_match 25 vl_pre r25 (A (25)) )) (PreH59 : (qm_lane_match 26 vl_pre r26 (A (26)) )) (PreH60 : (qm_lane_match 27 vl_pre r27 (A (27)) )) (PreH61 : (qm_lane_match 28 vl_pre r28 (A (28)) )) (PreH62 : (qm_lane_match 29 vl_pre r29 (A (29)) )) (PreH63 : (qm_lane_match 30 vl_pre r30 (A (30)) )) (PreH64 : (qm_lane_match 31 vl_pre r31 (A (31)) )) (PreH65 : (0 <= vl_pre)) (PreH66 : (vl_pre <= 32)) (PreH67 : (qm_lane_match 0 vl_pre a0 (A (0)) )) (PreH68 : (qm_lane_match 1 vl_pre a1 (A (1)) )) (PreH69 : (qm_lane_match 2 vl_pre a2 (A (2)) )) (PreH70 : (qm_lane_match 3 vl_pre a3 (A (3)) )) (PreH71 : (qm_lane_match 4 vl_pre a4 (A (4)) )) (PreH72 : (qm_lane_match 5 vl_pre a5 (A (5)) )) (PreH73 : (qm_lane_match 6 vl_pre a6 (A (6)) )) (PreH74 : (qm_lane_match 7 vl_pre a7 (A (7)) )) (PreH75 : (qm_lane_match 8 vl_pre a8 (A (8)) )) (PreH76 : (qm_lane_match 9 vl_pre a9 (A (9)) )) (PreH77 : (qm_lane_match 10 vl_pre a10 (A (10)) )) (PreH78 : (qm_lane_match 11 vl_pre a11 (A (11)) )) (PreH79 : (qm_lane_match 12 vl_pre a12 (A (12)) )) (PreH80 : (qm_lane_match 13 vl_pre a13 (A (13)) )) (PreH81 : (qm_lane_match 14 vl_pre a14 (A (14)) )) (PreH82 : (qm_lane_match 15 vl_pre a15 (A (15)) )) (PreH83 : (qm_lane_match 16 vl_pre a16 (A (16)) )) (PreH84 : (qm_lane_match 17 vl_pre a17 (A (17)) )) (PreH85 : (qm_lane_match 18 vl_pre a18 (A (18)) )) (PreH86 : (qm_lane_match 19 vl_pre a19 (A (19)) )) (PreH87 : (qm_lane_match 20 vl_pre a20 (A (20)) )) (PreH88 : (qm_lane_match 21 vl_pre a21 (A (21)) )) (PreH89 : (qm_lane_match 22 vl_pre a22 (A (22)) )) (PreH90 : (qm_lane_match 23 vl_pre a23 (A (23)) )) (PreH91 : (qm_lane_match 24 vl_pre a24 (A (24)) )) (PreH92 : (qm_lane_match 25 vl_pre a25 (A (25)) )) (PreH93 : (qm_lane_match 26 vl_pre a26 (A (26)) )) (PreH94 : (qm_lane_match 27 vl_pre a27 (A (27)) )) (PreH95 : (qm_lane_match 28 vl_pre a28 (A (28)) )) (PreH96 : (qm_lane_match 29 vl_pre a29 (A (29)) )) (PreH97 : (qm_lane_match 30 vl_pre a30 (A (30)) )) (PreH98 : (qm_lane_match 31 vl_pre a31 (A (31)) )) ,
  ((&((retval)  # "vint16m4_t" ->ₛ "s0")) # Short  |-> r0_2)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s1")) # Short  |-> r1_2)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s2")) # Short  |-> r2_2)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s3")) # Short  |-> r3_2)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s4")) # Short  |-> r4_2)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s5")) # Short  |-> r5_2)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s6")) # Short  |-> r6_2)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s7")) # Short  |-> r7_2)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s8")) # Short  |-> r8_2)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s9")) # Short  |-> r9_2)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s10")) # Short  |-> r10_2)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s11")) # Short  |-> r11_2)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s12")) # Short  |-> r12_2)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s13")) # Short  |-> r13_2)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s14")) # Short  |-> r14_2)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s15")) # Short  |-> r15_2)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s16")) # Short  |-> r16_2)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s17")) # Short  |-> r17_2)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s18")) # Short  |-> r18_2)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s19")) # Short  |-> r19_2)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s20")) # Short  |-> r20_2)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s21")) # Short  |-> r21_2)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s22")) # Short  |-> r22_2)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s23")) # Short  |-> r23_2)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s24")) # Short  |-> r24_2)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s25")) # Short  |-> r25_2)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s26")) # Short  |-> r26_2)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s27")) # Short  |-> r27_2)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s28")) # Short  |-> r28_2)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s29")) # Short  |-> r29_2)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s30")) # Short  |-> r30_2)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s31")) # Short  |-> r31_2)
  **  (UndefStructPredvint16m4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Char  |-> a0_2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Char  |-> a1_2)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Char  |-> a2_2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Char  |-> a3_2)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Char  |-> a4_2)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Char  |-> a5_2)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Char  |-> a6_2)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Char  |-> a7_2)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Char  |-> a8_2)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Char  |-> a9_2)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Char  |-> a10_2)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Char  |-> a11_2)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Char  |-> a12_2)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Char  |-> a13_2)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Char  |-> a14_2)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Char  |-> a15_2)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Char  |-> a16_2)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Char  |-> a17_2)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Char  |-> a18_2)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Char  |-> a19_2)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Char  |-> a20_2)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Char  |-> a21_2)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Char  |-> a22_2)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Char  |-> a23_2)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Char  |-> a24_2)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Char  |-> a25_2)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Char  |-> a26_2)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Char  |-> a27_2)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Char  |-> a28_2)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Char  |-> a29_2)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Char  |-> a30_2)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Char  |-> a31_2)
  **  ((&(( &( "s" ) )->ₛ "s0")) # Short  |-> a0_3)
  **  ((&(( &( "s" ) )->ₛ "s1")) # Short  |-> a1_3)
  **  ((&(( &( "s" ) )->ₛ "s2")) # Short  |-> a2_3)
  **  ((&(( &( "s" ) )->ₛ "s3")) # Short  |-> a3_3)
  **  ((&(( &( "s" ) )->ₛ "s4")) # Short  |-> a4_3)
  **  ((&(( &( "s" ) )->ₛ "s5")) # Short  |-> a5_3)
  **  ((&(( &( "s" ) )->ₛ "s6")) # Short  |-> a6_3)
  **  ((&(( &( "s" ) )->ₛ "s7")) # Short  |-> a7_3)
  **  ((&(( &( "s" ) )->ₛ "s8")) # Short  |-> a8_3)
  **  ((&(( &( "s" ) )->ₛ "s9")) # Short  |-> a9_3)
  **  ((&(( &( "s" ) )->ₛ "s10")) # Short  |-> a10_3)
  **  ((&(( &( "s" ) )->ₛ "s11")) # Short  |-> a11_3)
  **  ((&(( &( "s" ) )->ₛ "s12")) # Short  |-> a12_3)
  **  ((&(( &( "s" ) )->ₛ "s13")) # Short  |-> a13_3)
  **  ((&(( &( "s" ) )->ₛ "s14")) # Short  |-> a14_3)
  **  ((&(( &( "s" ) )->ₛ "s15")) # Short  |-> a15_3)
  **  ((&(( &( "s" ) )->ₛ "s16")) # Short  |-> a16_3)
  **  ((&(( &( "s" ) )->ₛ "s17")) # Short  |-> a17_3)
  **  ((&(( &( "s" ) )->ₛ "s18")) # Short  |-> a18_3)
  **  ((&(( &( "s" ) )->ₛ "s19")) # Short  |-> a19_3)
  **  ((&(( &( "s" ) )->ₛ "s20")) # Short  |-> a20_3)
  **  ((&(( &( "s" ) )->ₛ "s21")) # Short  |-> a21_3)
  **  ((&(( &( "s" ) )->ₛ "s22")) # Short  |-> a22_3)
  **  ((&(( &( "s" ) )->ₛ "s23")) # Short  |-> a23_3)
  **  ((&(( &( "s" ) )->ₛ "s24")) # Short  |-> a24_3)
  **  ((&(( &( "s" ) )->ₛ "s25")) # Short  |-> a25_3)
  **  ((&(( &( "s" ) )->ₛ "s26")) # Short  |-> a26_3)
  **  ((&(( &( "s" ) )->ₛ "s27")) # Short  |-> a27_3)
  **  ((&(( &( "s" ) )->ₛ "s28")) # Short  |-> a28_3)
  **  ((&(( &( "s" ) )->ₛ "s29")) # Short  |-> a29_3)
  **  ((&(( &( "s" ) )->ₛ "s30")) # Short  |-> a30_3)
  **  ((&(( &( "s" ) )->ₛ "s31")) # Short  |-> a31_3)
|--
  “ (qm_lane_match 0 vl_pre r0_2 (qm_sub16 ((A (0))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 1 vl_pre r1_2 (qm_sub16 ((A (1))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 2 vl_pre r2_2 (qm_sub16 ((A (2))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 3 vl_pre r3_2 (qm_sub16 ((A (3))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 4 vl_pre r4_2 (qm_sub16 ((A (4))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 5 vl_pre r5_2 (qm_sub16 ((A (5))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 6 vl_pre r6_2 (qm_sub16 ((A (6))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 7 vl_pre r7_2 (qm_sub16 ((A (7))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 8 vl_pre r8_2 (qm_sub16 ((A (8))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 9 vl_pre r9_2 (qm_sub16 ((A (9))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 10 vl_pre r10_2 (qm_sub16 ((A (10))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 11 vl_pre r11_2 (qm_sub16 ((A (11))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 12 vl_pre r12_2 (qm_sub16 ((A (12))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 13 vl_pre r13_2 (qm_sub16 ((A (13))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 14 vl_pre r14_2 (qm_sub16 ((A (14))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 15 vl_pre r15_2 (qm_sub16 ((A (15))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 16 vl_pre r16_2 (qm_sub16 ((A (16))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 17 vl_pre r17_2 (qm_sub16 ((A (17))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 18 vl_pre r18_2 (qm_sub16 ((A (18))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 19 vl_pre r19_2 (qm_sub16 ((A (19))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 20 vl_pre r20_2 (qm_sub16 ((A (20))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 21 vl_pre r21_2 (qm_sub16 ((A (21))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 22 vl_pre r22_2 (qm_sub16 ((A (22))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 23 vl_pre r23_2 (qm_sub16 ((A (23))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 24 vl_pre r24_2 (qm_sub16 ((A (24))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 25 vl_pre r25_2 (qm_sub16 ((A (25))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 26 vl_pre r26_2 (qm_sub16 ((A (26))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 27 vl_pre r27_2 (qm_sub16 ((A (27))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 28 vl_pre r28_2 (qm_sub16 ((A (28))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 29 vl_pre r29_2 (qm_sub16 ((A (29))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 30 vl_pre r30_2 (qm_sub16 ((A (30))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 31 vl_pre r31_2 (qm_sub16 ((A (31))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 0 vl_pre r0 (A (0)) ) ” 
  &&  “ (qm_lane_match 1 vl_pre r1 (A (1)) ) ” 
  &&  “ (qm_lane_match 2 vl_pre r2 (A (2)) ) ” 
  &&  “ (qm_lane_match 3 vl_pre r3 (A (3)) ) ” 
  &&  “ (qm_lane_match 4 vl_pre r4 (A (4)) ) ” 
  &&  “ (qm_lane_match 5 vl_pre r5 (A (5)) ) ” 
  &&  “ (qm_lane_match 6 vl_pre r6 (A (6)) ) ” 
  &&  “ (qm_lane_match 7 vl_pre r7 (A (7)) ) ” 
  &&  “ (qm_lane_match 8 vl_pre r8 (A (8)) ) ” 
  &&  “ (qm_lane_match 9 vl_pre r9 (A (9)) ) ” 
  &&  “ (qm_lane_match 10 vl_pre r10 (A (10)) ) ” 
  &&  “ (qm_lane_match 11 vl_pre r11 (A (11)) ) ” 
  &&  “ (qm_lane_match 12 vl_pre r12 (A (12)) ) ” 
  &&  “ (qm_lane_match 13 vl_pre r13 (A (13)) ) ” 
  &&  “ (qm_lane_match 14 vl_pre r14 (A (14)) ) ” 
  &&  “ (qm_lane_match 15 vl_pre r15 (A (15)) ) ” 
  &&  “ (qm_lane_match 16 vl_pre r16 (A (16)) ) ” 
  &&  “ (qm_lane_match 17 vl_pre r17 (A (17)) ) ” 
  &&  “ (qm_lane_match 18 vl_pre r18 (A (18)) ) ” 
  &&  “ (qm_lane_match 19 vl_pre r19 (A (19)) ) ” 
  &&  “ (qm_lane_match 20 vl_pre r20 (A (20)) ) ” 
  &&  “ (qm_lane_match 21 vl_pre r21 (A (21)) ) ” 
  &&  “ (qm_lane_match 22 vl_pre r22 (A (22)) ) ” 
  &&  “ (qm_lane_match 23 vl_pre r23 (A (23)) ) ” 
  &&  “ (qm_lane_match 24 vl_pre r24 (A (24)) ) ” 
  &&  “ (qm_lane_match 25 vl_pre r25 (A (25)) ) ” 
  &&  “ (qm_lane_match 26 vl_pre r26 (A (26)) ) ” 
  &&  “ (qm_lane_match 27 vl_pre r27 (A (27)) ) ” 
  &&  “ (qm_lane_match 28 vl_pre r28 (A (28)) ) ” 
  &&  “ (qm_lane_match 29 vl_pre r29 (A (29)) ) ” 
  &&  “ (qm_lane_match 30 vl_pre r30 (A (30)) ) ” 
  &&  “ (qm_lane_match 31 vl_pre r31 (A (31)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (qm_lane_match 0 vl_pre a0 (A (0)) ) ” 
  &&  “ (qm_lane_match 1 vl_pre a1 (A (1)) ) ” 
  &&  “ (qm_lane_match 2 vl_pre a2 (A (2)) ) ” 
  &&  “ (qm_lane_match 3 vl_pre a3 (A (3)) ) ” 
  &&  “ (qm_lane_match 4 vl_pre a4 (A (4)) ) ” 
  &&  “ (qm_lane_match 5 vl_pre a5 (A (5)) ) ” 
  &&  “ (qm_lane_match 6 vl_pre a6 (A (6)) ) ” 
  &&  “ (qm_lane_match 7 vl_pre a7 (A (7)) ) ” 
  &&  “ (qm_lane_match 8 vl_pre a8 (A (8)) ) ” 
  &&  “ (qm_lane_match 9 vl_pre a9 (A (9)) ) ” 
  &&  “ (qm_lane_match 10 vl_pre a10 (A (10)) ) ” 
  &&  “ (qm_lane_match 11 vl_pre a11 (A (11)) ) ” 
  &&  “ (qm_lane_match 12 vl_pre a12 (A (12)) ) ” 
  &&  “ (qm_lane_match 13 vl_pre a13 (A (13)) ) ” 
  &&  “ (qm_lane_match 14 vl_pre a14 (A (14)) ) ” 
  &&  “ (qm_lane_match 15 vl_pre a15 (A (15)) ) ” 
  &&  “ (qm_lane_match 16 vl_pre a16 (A (16)) ) ” 
  &&  “ (qm_lane_match 17 vl_pre a17 (A (17)) ) ” 
  &&  “ (qm_lane_match 18 vl_pre a18 (A (18)) ) ” 
  &&  “ (qm_lane_match 19 vl_pre a19 (A (19)) ) ” 
  &&  “ (qm_lane_match 20 vl_pre a20 (A (20)) ) ” 
  &&  “ (qm_lane_match 21 vl_pre a21 (A (21)) ) ” 
  &&  “ (qm_lane_match 22 vl_pre a22 (A (22)) ) ” 
  &&  “ (qm_lane_match 23 vl_pre a23 (A (23)) ) ” 
  &&  “ (qm_lane_match 24 vl_pre a24 (A (24)) ) ” 
  &&  “ (qm_lane_match 25 vl_pre a25 (A (25)) ) ” 
  &&  “ (qm_lane_match 26 vl_pre a26 (A (26)) ) ” 
  &&  “ (qm_lane_match 27 vl_pre a27 (A (27)) ) ” 
  &&  “ (qm_lane_match 28 vl_pre a28 (A (28)) ) ” 
  &&  “ (qm_lane_match 29 vl_pre a29 (A (29)) ) ” 
  &&  “ (qm_lane_match 30 vl_pre a30 (A (30)) ) ” 
  &&  “ (qm_lane_match 31 vl_pre a31 (A (31)) ) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s31")) # Short  |-> r31_2)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s30")) # Short  |-> r30_2)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s29")) # Short  |-> r29_2)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s28")) # Short  |-> r28_2)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s27")) # Short  |-> r27_2)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s26")) # Short  |-> r26_2)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s25")) # Short  |-> r25_2)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s24")) # Short  |-> r24_2)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s23")) # Short  |-> r23_2)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s22")) # Short  |-> r22_2)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s21")) # Short  |-> r21_2)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s20")) # Short  |-> r20_2)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s19")) # Short  |-> r19_2)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s18")) # Short  |-> r18_2)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s17")) # Short  |-> r17_2)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s16")) # Short  |-> r16_2)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s15")) # Short  |-> r15_2)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s14")) # Short  |-> r14_2)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s13")) # Short  |-> r13_2)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s12")) # Short  |-> r12_2)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s11")) # Short  |-> r11_2)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s10")) # Short  |-> r10_2)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s9")) # Short  |-> r9_2)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s8")) # Short  |-> r8_2)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s7")) # Short  |-> r7_2)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s6")) # Short  |-> r6_2)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s5")) # Short  |-> r5_2)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s4")) # Short  |-> r4_2)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s3")) # Short  |-> r3_2)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s2")) # Short  |-> r2_2)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s1")) # Short  |-> r1_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |->_)
  **  ((&((retval)  # "vint16m4_t" ->ₛ "s0")) # Short  |-> r0_2)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Char  |-> a0_2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Char  |-> a1_2)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Char  |-> a2_2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Char  |-> a3_2)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Char  |-> a4_2)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Char  |-> a5_2)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Char  |-> a6_2)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Char  |-> a7_2)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Char  |-> a8_2)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Char  |-> a9_2)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Char  |-> a10_2)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Char  |-> a11_2)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Char  |-> a12_2)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Char  |-> a13_2)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Char  |-> a14_2)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Char  |-> a15_2)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Char  |-> a16_2)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Char  |-> a17_2)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Char  |-> a18_2)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Char  |-> a19_2)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Char  |-> a20_2)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Char  |-> a21_2)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Char  |-> a22_2)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Char  |-> a23_2)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Char  |-> a24_2)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Char  |-> a25_2)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Char  |-> a26_2)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Char  |-> a27_2)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Char  |-> a28_2)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Char  |-> a29_2)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Char  |-> a30_2)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Char  |-> a31_2)
  **  ((&(( &( "s" ) )->ₛ "s0")) # Short  |-> a0_3)
  **  ((&(( &( "s" ) )->ₛ "s1")) # Short  |-> a1_3)
  **  ((&(( &( "s" ) )->ₛ "s2")) # Short  |-> a2_3)
  **  ((&(( &( "s" ) )->ₛ "s3")) # Short  |-> a3_3)
  **  ((&(( &( "s" ) )->ₛ "s4")) # Short  |-> a4_3)
  **  ((&(( &( "s" ) )->ₛ "s5")) # Short  |-> a5_3)
  **  ((&(( &( "s" ) )->ₛ "s6")) # Short  |-> a6_3)
  **  ((&(( &( "s" ) )->ₛ "s7")) # Short  |-> a7_3)
  **  ((&(( &( "s" ) )->ₛ "s8")) # Short  |-> a8_3)
  **  ((&(( &( "s" ) )->ₛ "s9")) # Short  |-> a9_3)
  **  ((&(( &( "s" ) )->ₛ "s10")) # Short  |-> a10_3)
  **  ((&(( &( "s" ) )->ₛ "s11")) # Short  |-> a11_3)
  **  ((&(( &( "s" ) )->ₛ "s12")) # Short  |-> a12_3)
  **  ((&(( &( "s" ) )->ₛ "s13")) # Short  |-> a13_3)
  **  ((&(( &( "s" ) )->ₛ "s14")) # Short  |-> a14_3)
  **  ((&(( &( "s" ) )->ₛ "s15")) # Short  |-> a15_3)
  **  ((&(( &( "s" ) )->ₛ "s16")) # Short  |-> a16_3)
  **  ((&(( &( "s" ) )->ₛ "s17")) # Short  |-> a17_3)
  **  ((&(( &( "s" ) )->ₛ "s18")) # Short  |-> a18_3)
  **  ((&(( &( "s" ) )->ₛ "s19")) # Short  |-> a19_3)
  **  ((&(( &( "s" ) )->ₛ "s20")) # Short  |-> a20_3)
  **  ((&(( &( "s" ) )->ₛ "s21")) # Short  |-> a21_3)
  **  ((&(( &( "s" ) )->ₛ "s22")) # Short  |-> a22_3)
  **  ((&(( &( "s" ) )->ₛ "s23")) # Short  |-> a23_3)
  **  ((&(( &( "s" ) )->ₛ "s24")) # Short  |-> a24_3)
  **  ((&(( &( "s" ) )->ₛ "s25")) # Short  |-> a25_3)
  **  ((&(( &( "s" ) )->ₛ "s26")) # Short  |-> a26_3)
  **  ((&(( &( "s" ) )->ₛ "s27")) # Short  |-> a27_3)
  **  ((&(( &( "s" ) )->ₛ "s28")) # Short  |-> a28_3)
  **  ((&(( &( "s" ) )->ₛ "s29")) # Short  |-> a29_3)
  **  ((&(( &( "s" ) )->ₛ "s30")) # Short  |-> a30_3)
  **  ((&(( &( "s" ) )->ₛ "s31")) # Short  |-> a31_3)
.

Definition qm_sext_sub_partial_solve_wit_5 := 
forall (vl_pre: Z) (x_pre: Z) (A: (Z -> Z)) (a0: Z) (a1: Z) (a2: Z) (a3: Z) (a4: Z) (a5: Z) (a6: Z) (a7: Z) (a8: Z) (a9: Z) (a10: Z) (a11: Z) (a12: Z) (a13: Z) (a14: Z) (a15: Z) (a16: Z) (a17: Z) (a18: Z) (a19: Z) (a20: Z) (a21: Z) (a22: Z) (a23: Z) (a24: Z) (a25: Z) (a26: Z) (a27: Z) (a28: Z) (a29: Z) (a30: Z) (a31: Z) (a31_2: Z) (a30_2: Z) (a29_2: Z) (a28_2: Z) (a27_2: Z) (a26_2: Z) (a25_2: Z) (a24_2: Z) (a23_2: Z) (a22_2: Z) (a21_2: Z) (a20_2: Z) (a19_2: Z) (a18_2: Z) (a17_2: Z) (a16_2: Z) (a15_2: Z) (a14_2: Z) (a13_2: Z) (a12_2: Z) (a11_2: Z) (a10_2: Z) (a9_2: Z) (a8_2: Z) (a7_2: Z) (a6_2: Z) (a5_2: Z) (a4_2: Z) (a3_2: Z) (a2_2: Z) (a1_2: Z) (a0_2: Z) (r31: Z) (r30: Z) (r29: Z) (r28: Z) (r27: Z) (r26: Z) (r25: Z) (r24: Z) (r23: Z) (r22: Z) (r21: Z) (r20: Z) (r19: Z) (r18: Z) (r17: Z) (r16: Z) (r15: Z) (r14: Z) (r13: Z) (r12: Z) (r11: Z) (r10: Z) (r9: Z) (r8: Z) (r7: Z) (r6: Z) (r5: Z) (r4: Z) (r3: Z) (r2: Z) (r1: Z) (r0: Z) (a31_3: Z) (a30_3: Z) (a29_3: Z) (a28_3: Z) (a27_3: Z) (a26_3: Z) (a25_3: Z) (a24_3: Z) (a23_3: Z) (a22_3: Z) (a21_3: Z) (a20_3: Z) (a19_3: Z) (a18_3: Z) (a17_3: Z) (a16_3: Z) (a15_3: Z) (a14_3: Z) (a13_3: Z) (a12_3: Z) (a11_3: Z) (a10_3: Z) (a9_3: Z) (a8_3: Z) (a7_3: Z) (a6_3: Z) (a5_3: Z) (a4_3: Z) (a3_3: Z) (a2_3: Z) (a1_3: Z) (a0_3: Z) (r31_2: Z) (r30_2: Z) (r29_2: Z) (r28_2: Z) (r27_2: Z) (r26_2: Z) (r25_2: Z) (r24_2: Z) (r23_2: Z) (r22_2: Z) (r21_2: Z) (r20_2: Z) (r19_2: Z) (r18_2: Z) (r17_2: Z) (r16_2: Z) (r15_2: Z) (r14_2: Z) (r13_2: Z) (r12_2: Z) (r11_2: Z) (r10_2: Z) (r9_2: Z) (r8_2: Z) (r7_2: Z) (r6_2: Z) (r5_2: Z) (r4_2: Z) (r3_2: Z) (r2_2: Z) (r1_2: Z) (r0_2: Z) (record_return: Z) (PreH1 : (qm_lane_match 0 vl_pre r0_2 (qm_sub16 ((A (0))) (x_pre)) )) (PreH2 : (qm_lane_match 1 vl_pre r1_2 (qm_sub16 ((A (1))) (x_pre)) )) (PreH3 : (qm_lane_match 2 vl_pre r2_2 (qm_sub16 ((A (2))) (x_pre)) )) (PreH4 : (qm_lane_match 3 vl_pre r3_2 (qm_sub16 ((A (3))) (x_pre)) )) (PreH5 : (qm_lane_match 4 vl_pre r4_2 (qm_sub16 ((A (4))) (x_pre)) )) (PreH6 : (qm_lane_match 5 vl_pre r5_2 (qm_sub16 ((A (5))) (x_pre)) )) (PreH7 : (qm_lane_match 6 vl_pre r6_2 (qm_sub16 ((A (6))) (x_pre)) )) (PreH8 : (qm_lane_match 7 vl_pre r7_2 (qm_sub16 ((A (7))) (x_pre)) )) (PreH9 : (qm_lane_match 8 vl_pre r8_2 (qm_sub16 ((A (8))) (x_pre)) )) (PreH10 : (qm_lane_match 9 vl_pre r9_2 (qm_sub16 ((A (9))) (x_pre)) )) (PreH11 : (qm_lane_match 10 vl_pre r10_2 (qm_sub16 ((A (10))) (x_pre)) )) (PreH12 : (qm_lane_match 11 vl_pre r11_2 (qm_sub16 ((A (11))) (x_pre)) )) (PreH13 : (qm_lane_match 12 vl_pre r12_2 (qm_sub16 ((A (12))) (x_pre)) )) (PreH14 : (qm_lane_match 13 vl_pre r13_2 (qm_sub16 ((A (13))) (x_pre)) )) (PreH15 : (qm_lane_match 14 vl_pre r14_2 (qm_sub16 ((A (14))) (x_pre)) )) (PreH16 : (qm_lane_match 15 vl_pre r15_2 (qm_sub16 ((A (15))) (x_pre)) )) (PreH17 : (qm_lane_match 16 vl_pre r16_2 (qm_sub16 ((A (16))) (x_pre)) )) (PreH18 : (qm_lane_match 17 vl_pre r17_2 (qm_sub16 ((A (17))) (x_pre)) )) (PreH19 : (qm_lane_match 18 vl_pre r18_2 (qm_sub16 ((A (18))) (x_pre)) )) (PreH20 : (qm_lane_match 19 vl_pre r19_2 (qm_sub16 ((A (19))) (x_pre)) )) (PreH21 : (qm_lane_match 20 vl_pre r20_2 (qm_sub16 ((A (20))) (x_pre)) )) (PreH22 : (qm_lane_match 21 vl_pre r21_2 (qm_sub16 ((A (21))) (x_pre)) )) (PreH23 : (qm_lane_match 22 vl_pre r22_2 (qm_sub16 ((A (22))) (x_pre)) )) (PreH24 : (qm_lane_match 23 vl_pre r23_2 (qm_sub16 ((A (23))) (x_pre)) )) (PreH25 : (qm_lane_match 24 vl_pre r24_2 (qm_sub16 ((A (24))) (x_pre)) )) (PreH26 : (qm_lane_match 25 vl_pre r25_2 (qm_sub16 ((A (25))) (x_pre)) )) (PreH27 : (qm_lane_match 26 vl_pre r26_2 (qm_sub16 ((A (26))) (x_pre)) )) (PreH28 : (qm_lane_match 27 vl_pre r27_2 (qm_sub16 ((A (27))) (x_pre)) )) (PreH29 : (qm_lane_match 28 vl_pre r28_2 (qm_sub16 ((A (28))) (x_pre)) )) (PreH30 : (qm_lane_match 29 vl_pre r29_2 (qm_sub16 ((A (29))) (x_pre)) )) (PreH31 : (qm_lane_match 30 vl_pre r30_2 (qm_sub16 ((A (30))) (x_pre)) )) (PreH32 : (qm_lane_match 31 vl_pre r31_2 (qm_sub16 ((A (31))) (x_pre)) )) (PreH33 : (qm_lane_match 0 vl_pre r0 (A (0)) )) (PreH34 : (qm_lane_match 1 vl_pre r1 (A (1)) )) (PreH35 : (qm_lane_match 2 vl_pre r2 (A (2)) )) (PreH36 : (qm_lane_match 3 vl_pre r3 (A (3)) )) (PreH37 : (qm_lane_match 4 vl_pre r4 (A (4)) )) (PreH38 : (qm_lane_match 5 vl_pre r5 (A (5)) )) (PreH39 : (qm_lane_match 6 vl_pre r6 (A (6)) )) (PreH40 : (qm_lane_match 7 vl_pre r7 (A (7)) )) (PreH41 : (qm_lane_match 8 vl_pre r8 (A (8)) )) (PreH42 : (qm_lane_match 9 vl_pre r9 (A (9)) )) (PreH43 : (qm_lane_match 10 vl_pre r10 (A (10)) )) (PreH44 : (qm_lane_match 11 vl_pre r11 (A (11)) )) (PreH45 : (qm_lane_match 12 vl_pre r12 (A (12)) )) (PreH46 : (qm_lane_match 13 vl_pre r13 (A (13)) )) (PreH47 : (qm_lane_match 14 vl_pre r14 (A (14)) )) (PreH48 : (qm_lane_match 15 vl_pre r15 (A (15)) )) (PreH49 : (qm_lane_match 16 vl_pre r16 (A (16)) )) (PreH50 : (qm_lane_match 17 vl_pre r17 (A (17)) )) (PreH51 : (qm_lane_match 18 vl_pre r18 (A (18)) )) (PreH52 : (qm_lane_match 19 vl_pre r19 (A (19)) )) (PreH53 : (qm_lane_match 20 vl_pre r20 (A (20)) )) (PreH54 : (qm_lane_match 21 vl_pre r21 (A (21)) )) (PreH55 : (qm_lane_match 22 vl_pre r22 (A (22)) )) (PreH56 : (qm_lane_match 23 vl_pre r23 (A (23)) )) (PreH57 : (qm_lane_match 24 vl_pre r24 (A (24)) )) (PreH58 : (qm_lane_match 25 vl_pre r25 (A (25)) )) (PreH59 : (qm_lane_match 26 vl_pre r26 (A (26)) )) (PreH60 : (qm_lane_match 27 vl_pre r27 (A (27)) )) (PreH61 : (qm_lane_match 28 vl_pre r28 (A (28)) )) (PreH62 : (qm_lane_match 29 vl_pre r29 (A (29)) )) (PreH63 : (qm_lane_match 30 vl_pre r30 (A (30)) )) (PreH64 : (qm_lane_match 31 vl_pre r31 (A (31)) )) (PreH65 : (0 <= vl_pre)) (PreH66 : (vl_pre <= 32)) (PreH67 : (qm_lane_match 0 vl_pre a0 (A (0)) )) (PreH68 : (qm_lane_match 1 vl_pre a1 (A (1)) )) (PreH69 : (qm_lane_match 2 vl_pre a2 (A (2)) )) (PreH70 : (qm_lane_match 3 vl_pre a3 (A (3)) )) (PreH71 : (qm_lane_match 4 vl_pre a4 (A (4)) )) (PreH72 : (qm_lane_match 5 vl_pre a5 (A (5)) )) (PreH73 : (qm_lane_match 6 vl_pre a6 (A (6)) )) (PreH74 : (qm_lane_match 7 vl_pre a7 (A (7)) )) (PreH75 : (qm_lane_match 8 vl_pre a8 (A (8)) )) (PreH76 : (qm_lane_match 9 vl_pre a9 (A (9)) )) (PreH77 : (qm_lane_match 10 vl_pre a10 (A (10)) )) (PreH78 : (qm_lane_match 11 vl_pre a11 (A (11)) )) (PreH79 : (qm_lane_match 12 vl_pre a12 (A (12)) )) (PreH80 : (qm_lane_match 13 vl_pre a13 (A (13)) )) (PreH81 : (qm_lane_match 14 vl_pre a14 (A (14)) )) (PreH82 : (qm_lane_match 15 vl_pre a15 (A (15)) )) (PreH83 : (qm_lane_match 16 vl_pre a16 (A (16)) )) (PreH84 : (qm_lane_match 17 vl_pre a17 (A (17)) )) (PreH85 : (qm_lane_match 18 vl_pre a18 (A (18)) )) (PreH86 : (qm_lane_match 19 vl_pre a19 (A (19)) )) (PreH87 : (qm_lane_match 20 vl_pre a20 (A (20)) )) (PreH88 : (qm_lane_match 21 vl_pre a21 (A (21)) )) (PreH89 : (qm_lane_match 22 vl_pre a22 (A (22)) )) (PreH90 : (qm_lane_match 23 vl_pre a23 (A (23)) )) (PreH91 : (qm_lane_match 24 vl_pre a24 (A (24)) )) (PreH92 : (qm_lane_match 25 vl_pre a25 (A (25)) )) (PreH93 : (qm_lane_match 26 vl_pre a26 (A (26)) )) (PreH94 : (qm_lane_match 27 vl_pre a27 (A (27)) )) (PreH95 : (qm_lane_match 28 vl_pre a28 (A (28)) )) (PreH96 : (qm_lane_match 29 vl_pre a29 (A (29)) )) (PreH97 : (qm_lane_match 30 vl_pre a30 (A (30)) )) (PreH98 : (qm_lane_match 31 vl_pre a31 (A (31)) )) ,
  (UndefStructPredvint16m4_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Short  |-> r31_2)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |-> r30_2)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |-> r29_2)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |-> r28_2)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |-> r27_2)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |-> r26_2)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |-> r25_2)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |-> r24_2)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |-> r23_2)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |-> r22_2)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> r21_2)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> r20_2)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> r19_2)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> r18_2)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> r17_2)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> r16_2)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> r15_2)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> r14_2)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> r13_2)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> r12_2)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> r11_2)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> r10_2)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> r9_2)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> r8_2)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> r7_2)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> r6_2)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> r5_2)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> r4_2)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> r3_2)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> r2_2)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> r1_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> r0_2)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Char  |-> a0_2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Char  |-> a1_2)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Char  |-> a2_2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Char  |-> a3_2)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Char  |-> a4_2)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Char  |-> a5_2)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Char  |-> a6_2)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Char  |-> a7_2)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Char  |-> a8_2)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Char  |-> a9_2)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Char  |-> a10_2)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Char  |-> a11_2)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Char  |-> a12_2)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Char  |-> a13_2)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Char  |-> a14_2)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Char  |-> a15_2)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Char  |-> a16_2)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Char  |-> a17_2)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Char  |-> a18_2)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Char  |-> a19_2)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Char  |-> a20_2)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Char  |-> a21_2)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Char  |-> a22_2)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Char  |-> a23_2)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Char  |-> a24_2)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Char  |-> a25_2)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Char  |-> a26_2)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Char  |-> a27_2)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Char  |-> a28_2)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Char  |-> a29_2)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Char  |-> a30_2)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Char  |-> a31_2)
  **  ((&(( &( "s" ) )->ₛ "s0")) # Short  |-> a0_3)
  **  ((&(( &( "s" ) )->ₛ "s1")) # Short  |-> a1_3)
  **  ((&(( &( "s" ) )->ₛ "s2")) # Short  |-> a2_3)
  **  ((&(( &( "s" ) )->ₛ "s3")) # Short  |-> a3_3)
  **  ((&(( &( "s" ) )->ₛ "s4")) # Short  |-> a4_3)
  **  ((&(( &( "s" ) )->ₛ "s5")) # Short  |-> a5_3)
  **  ((&(( &( "s" ) )->ₛ "s6")) # Short  |-> a6_3)
  **  ((&(( &( "s" ) )->ₛ "s7")) # Short  |-> a7_3)
  **  ((&(( &( "s" ) )->ₛ "s8")) # Short  |-> a8_3)
  **  ((&(( &( "s" ) )->ₛ "s9")) # Short  |-> a9_3)
  **  ((&(( &( "s" ) )->ₛ "s10")) # Short  |-> a10_3)
  **  ((&(( &( "s" ) )->ₛ "s11")) # Short  |-> a11_3)
  **  ((&(( &( "s" ) )->ₛ "s12")) # Short  |-> a12_3)
  **  ((&(( &( "s" ) )->ₛ "s13")) # Short  |-> a13_3)
  **  ((&(( &( "s" ) )->ₛ "s14")) # Short  |-> a14_3)
  **  ((&(( &( "s" ) )->ₛ "s15")) # Short  |-> a15_3)
  **  ((&(( &( "s" ) )->ₛ "s16")) # Short  |-> a16_3)
  **  ((&(( &( "s" ) )->ₛ "s17")) # Short  |-> a17_3)
  **  ((&(( &( "s" ) )->ₛ "s18")) # Short  |-> a18_3)
  **  ((&(( &( "s" ) )->ₛ "s19")) # Short  |-> a19_3)
  **  ((&(( &( "s" ) )->ₛ "s20")) # Short  |-> a20_3)
  **  ((&(( &( "s" ) )->ₛ "s21")) # Short  |-> a21_3)
  **  ((&(( &( "s" ) )->ₛ "s22")) # Short  |-> a22_3)
  **  ((&(( &( "s" ) )->ₛ "s23")) # Short  |-> a23_3)
  **  ((&(( &( "s" ) )->ₛ "s24")) # Short  |-> a24_3)
  **  ((&(( &( "s" ) )->ₛ "s25")) # Short  |-> a25_3)
  **  ((&(( &( "s" ) )->ₛ "s26")) # Short  |-> a26_3)
  **  ((&(( &( "s" ) )->ₛ "s27")) # Short  |-> a27_3)
  **  ((&(( &( "s" ) )->ₛ "s28")) # Short  |-> a28_3)
  **  ((&(( &( "s" ) )->ₛ "s29")) # Short  |-> a29_3)
  **  ((&(( &( "s" ) )->ₛ "s30")) # Short  |-> a30_3)
  **  ((&(( &( "s" ) )->ₛ "s31")) # Short  |-> a31_3)
|--
  “ (qm_lane_match 0 vl_pre r0_2 (qm_sub16 ((A (0))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 1 vl_pre r1_2 (qm_sub16 ((A (1))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 2 vl_pre r2_2 (qm_sub16 ((A (2))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 3 vl_pre r3_2 (qm_sub16 ((A (3))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 4 vl_pre r4_2 (qm_sub16 ((A (4))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 5 vl_pre r5_2 (qm_sub16 ((A (5))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 6 vl_pre r6_2 (qm_sub16 ((A (6))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 7 vl_pre r7_2 (qm_sub16 ((A (7))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 8 vl_pre r8_2 (qm_sub16 ((A (8))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 9 vl_pre r9_2 (qm_sub16 ((A (9))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 10 vl_pre r10_2 (qm_sub16 ((A (10))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 11 vl_pre r11_2 (qm_sub16 ((A (11))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 12 vl_pre r12_2 (qm_sub16 ((A (12))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 13 vl_pre r13_2 (qm_sub16 ((A (13))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 14 vl_pre r14_2 (qm_sub16 ((A (14))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 15 vl_pre r15_2 (qm_sub16 ((A (15))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 16 vl_pre r16_2 (qm_sub16 ((A (16))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 17 vl_pre r17_2 (qm_sub16 ((A (17))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 18 vl_pre r18_2 (qm_sub16 ((A (18))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 19 vl_pre r19_2 (qm_sub16 ((A (19))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 20 vl_pre r20_2 (qm_sub16 ((A (20))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 21 vl_pre r21_2 (qm_sub16 ((A (21))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 22 vl_pre r22_2 (qm_sub16 ((A (22))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 23 vl_pre r23_2 (qm_sub16 ((A (23))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 24 vl_pre r24_2 (qm_sub16 ((A (24))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 25 vl_pre r25_2 (qm_sub16 ((A (25))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 26 vl_pre r26_2 (qm_sub16 ((A (26))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 27 vl_pre r27_2 (qm_sub16 ((A (27))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 28 vl_pre r28_2 (qm_sub16 ((A (28))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 29 vl_pre r29_2 (qm_sub16 ((A (29))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 30 vl_pre r30_2 (qm_sub16 ((A (30))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 31 vl_pre r31_2 (qm_sub16 ((A (31))) (x_pre)) ) ” 
  &&  “ (qm_lane_match 0 vl_pre r0 (A (0)) ) ” 
  &&  “ (qm_lane_match 1 vl_pre r1 (A (1)) ) ” 
  &&  “ (qm_lane_match 2 vl_pre r2 (A (2)) ) ” 
  &&  “ (qm_lane_match 3 vl_pre r3 (A (3)) ) ” 
  &&  “ (qm_lane_match 4 vl_pre r4 (A (4)) ) ” 
  &&  “ (qm_lane_match 5 vl_pre r5 (A (5)) ) ” 
  &&  “ (qm_lane_match 6 vl_pre r6 (A (6)) ) ” 
  &&  “ (qm_lane_match 7 vl_pre r7 (A (7)) ) ” 
  &&  “ (qm_lane_match 8 vl_pre r8 (A (8)) ) ” 
  &&  “ (qm_lane_match 9 vl_pre r9 (A (9)) ) ” 
  &&  “ (qm_lane_match 10 vl_pre r10 (A (10)) ) ” 
  &&  “ (qm_lane_match 11 vl_pre r11 (A (11)) ) ” 
  &&  “ (qm_lane_match 12 vl_pre r12 (A (12)) ) ” 
  &&  “ (qm_lane_match 13 vl_pre r13 (A (13)) ) ” 
  &&  “ (qm_lane_match 14 vl_pre r14 (A (14)) ) ” 
  &&  “ (qm_lane_match 15 vl_pre r15 (A (15)) ) ” 
  &&  “ (qm_lane_match 16 vl_pre r16 (A (16)) ) ” 
  &&  “ (qm_lane_match 17 vl_pre r17 (A (17)) ) ” 
  &&  “ (qm_lane_match 18 vl_pre r18 (A (18)) ) ” 
  &&  “ (qm_lane_match 19 vl_pre r19 (A (19)) ) ” 
  &&  “ (qm_lane_match 20 vl_pre r20 (A (20)) ) ” 
  &&  “ (qm_lane_match 21 vl_pre r21 (A (21)) ) ” 
  &&  “ (qm_lane_match 22 vl_pre r22 (A (22)) ) ” 
  &&  “ (qm_lane_match 23 vl_pre r23 (A (23)) ) ” 
  &&  “ (qm_lane_match 24 vl_pre r24 (A (24)) ) ” 
  &&  “ (qm_lane_match 25 vl_pre r25 (A (25)) ) ” 
  &&  “ (qm_lane_match 26 vl_pre r26 (A (26)) ) ” 
  &&  “ (qm_lane_match 27 vl_pre r27 (A (27)) ) ” 
  &&  “ (qm_lane_match 28 vl_pre r28 (A (28)) ) ” 
  &&  “ (qm_lane_match 29 vl_pre r29 (A (29)) ) ” 
  &&  “ (qm_lane_match 30 vl_pre r30 (A (30)) ) ” 
  &&  “ (qm_lane_match 31 vl_pre r31 (A (31)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (qm_lane_match 0 vl_pre a0 (A (0)) ) ” 
  &&  “ (qm_lane_match 1 vl_pre a1 (A (1)) ) ” 
  &&  “ (qm_lane_match 2 vl_pre a2 (A (2)) ) ” 
  &&  “ (qm_lane_match 3 vl_pre a3 (A (3)) ) ” 
  &&  “ (qm_lane_match 4 vl_pre a4 (A (4)) ) ” 
  &&  “ (qm_lane_match 5 vl_pre a5 (A (5)) ) ” 
  &&  “ (qm_lane_match 6 vl_pre a6 (A (6)) ) ” 
  &&  “ (qm_lane_match 7 vl_pre a7 (A (7)) ) ” 
  &&  “ (qm_lane_match 8 vl_pre a8 (A (8)) ) ” 
  &&  “ (qm_lane_match 9 vl_pre a9 (A (9)) ) ” 
  &&  “ (qm_lane_match 10 vl_pre a10 (A (10)) ) ” 
  &&  “ (qm_lane_match 11 vl_pre a11 (A (11)) ) ” 
  &&  “ (qm_lane_match 12 vl_pre a12 (A (12)) ) ” 
  &&  “ (qm_lane_match 13 vl_pre a13 (A (13)) ) ” 
  &&  “ (qm_lane_match 14 vl_pre a14 (A (14)) ) ” 
  &&  “ (qm_lane_match 15 vl_pre a15 (A (15)) ) ” 
  &&  “ (qm_lane_match 16 vl_pre a16 (A (16)) ) ” 
  &&  “ (qm_lane_match 17 vl_pre a17 (A (17)) ) ” 
  &&  “ (qm_lane_match 18 vl_pre a18 (A (18)) ) ” 
  &&  “ (qm_lane_match 19 vl_pre a19 (A (19)) ) ” 
  &&  “ (qm_lane_match 20 vl_pre a20 (A (20)) ) ” 
  &&  “ (qm_lane_match 21 vl_pre a21 (A (21)) ) ” 
  &&  “ (qm_lane_match 22 vl_pre a22 (A (22)) ) ” 
  &&  “ (qm_lane_match 23 vl_pre a23 (A (23)) ) ” 
  &&  “ (qm_lane_match 24 vl_pre a24 (A (24)) ) ” 
  &&  “ (qm_lane_match 25 vl_pre a25 (A (25)) ) ” 
  &&  “ (qm_lane_match 26 vl_pre a26 (A (26)) ) ” 
  &&  “ (qm_lane_match 27 vl_pre a27 (A (27)) ) ” 
  &&  “ (qm_lane_match 28 vl_pre a28 (A (28)) ) ” 
  &&  “ (qm_lane_match 29 vl_pre a29 (A (29)) ) ” 
  &&  “ (qm_lane_match 30 vl_pre a30 (A (30)) ) ” 
  &&  “ (qm_lane_match 31 vl_pre a31 (A (31)) ) ”
  &&  ((&((record_return)  # "vint16m4_t" ->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s31")) # Short  |-> r31_2)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |-> r30_2)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |-> r29_2)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |-> r28_2)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |-> r27_2)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |-> r26_2)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |-> r25_2)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |-> r24_2)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |-> r23_2)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |-> r22_2)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> r21_2)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> r20_2)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> r19_2)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> r18_2)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> r17_2)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> r16_2)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> r15_2)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> r14_2)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> r13_2)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> r12_2)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> r11_2)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> r10_2)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s9")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> r9_2)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s8")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> r8_2)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> r7_2)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> r6_2)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> r5_2)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> r4_2)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> r3_2)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> r2_2)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s1")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> r1_2)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s0")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> r0_2)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Char  |-> a0_2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Char  |-> a1_2)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Char  |-> a2_2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Char  |-> a3_2)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Char  |-> a4_2)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Char  |-> a5_2)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Char  |-> a6_2)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Char  |-> a7_2)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Char  |-> a8_2)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Char  |-> a9_2)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Char  |-> a10_2)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Char  |-> a11_2)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Char  |-> a12_2)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Char  |-> a13_2)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Char  |-> a14_2)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Char  |-> a15_2)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Char  |-> a16_2)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Char  |-> a17_2)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Char  |-> a18_2)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Char  |-> a19_2)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Char  |-> a20_2)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Char  |-> a21_2)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Char  |-> a22_2)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Char  |-> a23_2)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Char  |-> a24_2)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Char  |-> a25_2)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Char  |-> a26_2)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Char  |-> a27_2)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Char  |-> a28_2)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Char  |-> a29_2)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Char  |-> a30_2)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Char  |-> a31_2)
  **  ((&(( &( "s" ) )->ₛ "s0")) # Short  |-> a0_3)
  **  ((&(( &( "s" ) )->ₛ "s1")) # Short  |-> a1_3)
  **  ((&(( &( "s" ) )->ₛ "s2")) # Short  |-> a2_3)
  **  ((&(( &( "s" ) )->ₛ "s3")) # Short  |-> a3_3)
  **  ((&(( &( "s" ) )->ₛ "s4")) # Short  |-> a4_3)
  **  ((&(( &( "s" ) )->ₛ "s5")) # Short  |-> a5_3)
  **  ((&(( &( "s" ) )->ₛ "s6")) # Short  |-> a6_3)
  **  ((&(( &( "s" ) )->ₛ "s7")) # Short  |-> a7_3)
  **  ((&(( &( "s" ) )->ₛ "s8")) # Short  |-> a8_3)
  **  ((&(( &( "s" ) )->ₛ "s9")) # Short  |-> a9_3)
  **  ((&(( &( "s" ) )->ₛ "s10")) # Short  |-> a10_3)
  **  ((&(( &( "s" ) )->ₛ "s11")) # Short  |-> a11_3)
  **  ((&(( &( "s" ) )->ₛ "s12")) # Short  |-> a12_3)
  **  ((&(( &( "s" ) )->ₛ "s13")) # Short  |-> a13_3)
  **  ((&(( &( "s" ) )->ₛ "s14")) # Short  |-> a14_3)
  **  ((&(( &( "s" ) )->ₛ "s15")) # Short  |-> a15_3)
  **  ((&(( &( "s" ) )->ₛ "s16")) # Short  |-> a16_3)
  **  ((&(( &( "s" ) )->ₛ "s17")) # Short  |-> a17_3)
  **  ((&(( &( "s" ) )->ₛ "s18")) # Short  |-> a18_3)
  **  ((&(( &( "s" ) )->ₛ "s19")) # Short  |-> a19_3)
  **  ((&(( &( "s" ) )->ₛ "s20")) # Short  |-> a20_3)
  **  ((&(( &( "s" ) )->ₛ "s21")) # Short  |-> a21_3)
  **  ((&(( &( "s" ) )->ₛ "s22")) # Short  |-> a22_3)
  **  ((&(( &( "s" ) )->ₛ "s23")) # Short  |-> a23_3)
  **  ((&(( &( "s" ) )->ₛ "s24")) # Short  |-> a24_3)
  **  ((&(( &( "s" ) )->ₛ "s25")) # Short  |-> a25_3)
  **  ((&(( &( "s" ) )->ₛ "s26")) # Short  |-> a26_3)
  **  ((&(( &( "s" ) )->ₛ "s27")) # Short  |-> a27_3)
  **  ((&(( &( "s" ) )->ₛ "s28")) # Short  |-> a28_3)
  **  ((&(( &( "s" ) )->ₛ "s29")) # Short  |-> a29_3)
  **  ((&(( &( "s" ) )->ₛ "s30")) # Short  |-> a30_3)
  **  ((&(( &( "s" ) )->ₛ "s31")) # Short  |-> a31_3)
.

Module Type VC_Correct.


Axiom proof_of_qm_sext_sub_return_wit_1 : qm_sext_sub_return_wit_1.
Axiom proof_of_qm_sext_sub_partial_solve_wit_1_pure : qm_sext_sub_partial_solve_wit_1_pure.
Axiom proof_of_qm_sext_sub_partial_solve_wit_1 : qm_sext_sub_partial_solve_wit_1.
Axiom proof_of_qm_sext_sub_partial_solve_wit_2 : qm_sext_sub_partial_solve_wit_2.
Axiom proof_of_qm_sext_sub_partial_solve_wit_3_pure : qm_sext_sub_partial_solve_wit_3_pure.
Axiom proof_of_qm_sext_sub_partial_solve_wit_3 : qm_sext_sub_partial_solve_wit_3.
Axiom proof_of_qm_sext_sub_partial_solve_wit_4 : qm_sext_sub_partial_solve_wit_4.
Axiom proof_of_qm_sext_sub_partial_solve_wit_5 : qm_sext_sub_partial_solve_wit_5.

End VC_Correct.
