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

(*----- Function qm_load_into32 -----*)

Definition qm_load_into32_return_wit_1 := 
forall (vl_pre: Z) (p_pre: Z) (out_pre: Z) (M: RDMap) (r31_2: Z) (r30_2: Z) (r29_2: Z) (r28_2: Z) (r27_2: Z) (r26_2: Z) (r25_2: Z) (r24_2: Z) (r23_2: Z) (r22_2: Z) (r21_2: Z) (r20_2: Z) (r19_2: Z) (r18_2: Z) (r17_2: Z) (r16_2: Z) (r15_2: Z) (r14_2: Z) (r13_2: Z) (r12_2: Z) (r11_2: Z) (r10_2: Z) (r9_2: Z) (r8_2: Z) (r7_2: Z) (r6_2: Z) (r5_2: Z) (r4_2: Z) (r3_2: Z) (r2_2: Z) (r1_2: Z) (r0_2: Z) (PreH1 : (qm_lane_match 0 vl_pre r0_2 (rd_get (M) ((p_pre + (0 * sizeof(CHAR))))) )) (PreH2 : (qm_lane_match 1 vl_pre r1_2 (rd_get (M) ((p_pre + (1 * sizeof(CHAR))))) )) (PreH3 : (qm_lane_match 2 vl_pre r2_2 (rd_get (M) ((p_pre + (2 * sizeof(CHAR))))) )) (PreH4 : (qm_lane_match 3 vl_pre r3_2 (rd_get (M) ((p_pre + (3 * sizeof(CHAR))))) )) (PreH5 : (qm_lane_match 4 vl_pre r4_2 (rd_get (M) ((p_pre + (4 * sizeof(CHAR))))) )) (PreH6 : (qm_lane_match 5 vl_pre r5_2 (rd_get (M) ((p_pre + (5 * sizeof(CHAR))))) )) (PreH7 : (qm_lane_match 6 vl_pre r6_2 (rd_get (M) ((p_pre + (6 * sizeof(CHAR))))) )) (PreH8 : (qm_lane_match 7 vl_pre r7_2 (rd_get (M) ((p_pre + (7 * sizeof(CHAR))))) )) (PreH9 : (qm_lane_match 8 vl_pre r8_2 (rd_get (M) ((p_pre + (8 * sizeof(CHAR))))) )) (PreH10 : (qm_lane_match 9 vl_pre r9_2 (rd_get (M) ((p_pre + (9 * sizeof(CHAR))))) )) (PreH11 : (qm_lane_match 10 vl_pre r10_2 (rd_get (M) ((p_pre + (10 * sizeof(CHAR))))) )) (PreH12 : (qm_lane_match 11 vl_pre r11_2 (rd_get (M) ((p_pre + (11 * sizeof(CHAR))))) )) (PreH13 : (qm_lane_match 12 vl_pre r12_2 (rd_get (M) ((p_pre + (12 * sizeof(CHAR))))) )) (PreH14 : (qm_lane_match 13 vl_pre r13_2 (rd_get (M) ((p_pre + (13 * sizeof(CHAR))))) )) (PreH15 : (qm_lane_match 14 vl_pre r14_2 (rd_get (M) ((p_pre + (14 * sizeof(CHAR))))) )) (PreH16 : (qm_lane_match 15 vl_pre r15_2 (rd_get (M) ((p_pre + (15 * sizeof(CHAR))))) )) (PreH17 : (qm_lane_match 16 vl_pre r16_2 (rd_get (M) ((p_pre + (16 * sizeof(CHAR))))) )) (PreH18 : (qm_lane_match 17 vl_pre r17_2 (rd_get (M) ((p_pre + (17 * sizeof(CHAR))))) )) (PreH19 : (qm_lane_match 18 vl_pre r18_2 (rd_get (M) ((p_pre + (18 * sizeof(CHAR))))) )) (PreH20 : (qm_lane_match 19 vl_pre r19_2 (rd_get (M) ((p_pre + (19 * sizeof(CHAR))))) )) (PreH21 : (qm_lane_match 20 vl_pre r20_2 (rd_get (M) ((p_pre + (20 * sizeof(CHAR))))) )) (PreH22 : (qm_lane_match 21 vl_pre r21_2 (rd_get (M) ((p_pre + (21 * sizeof(CHAR))))) )) (PreH23 : (qm_lane_match 22 vl_pre r22_2 (rd_get (M) ((p_pre + (22 * sizeof(CHAR))))) )) (PreH24 : (qm_lane_match 23 vl_pre r23_2 (rd_get (M) ((p_pre + (23 * sizeof(CHAR))))) )) (PreH25 : (qm_lane_match 24 vl_pre r24_2 (rd_get (M) ((p_pre + (24 * sizeof(CHAR))))) )) (PreH26 : (qm_lane_match 25 vl_pre r25_2 (rd_get (M) ((p_pre + (25 * sizeof(CHAR))))) )) (PreH27 : (qm_lane_match 26 vl_pre r26_2 (rd_get (M) ((p_pre + (26 * sizeof(CHAR))))) )) (PreH28 : (qm_lane_match 27 vl_pre r27_2 (rd_get (M) ((p_pre + (27 * sizeof(CHAR))))) )) (PreH29 : (qm_lane_match 28 vl_pre r28_2 (rd_get (M) ((p_pre + (28 * sizeof(CHAR))))) )) (PreH30 : (qm_lane_match 29 vl_pre r29_2 (rd_get (M) ((p_pre + (29 * sizeof(CHAR))))) )) (PreH31 : (qm_lane_match 30 vl_pre r30_2 (rd_get (M) ((p_pre + (30 * sizeof(CHAR))))) )) (PreH32 : (qm_lane_match 31 vl_pre r31_2 (rd_get (M) ((p_pre + (31 * sizeof(CHAR))))) )) (PreH33 : (0 <= vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (rd_window M p_pre vl_pre )) ,
  ((&((out_pre)  # "vint8m2_t" ->ₛ "s31")) # Char  |-> r31_2)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s30")) # Char  |-> r30_2)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s29")) # Char  |-> r29_2)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s28")) # Char  |-> r28_2)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s27")) # Char  |-> r27_2)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s26")) # Char  |-> r26_2)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s25")) # Char  |-> r25_2)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s24")) # Char  |-> r24_2)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s23")) # Char  |-> r23_2)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s22")) # Char  |-> r22_2)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s21")) # Char  |-> r21_2)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s20")) # Char  |-> r20_2)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s19")) # Char  |-> r19_2)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s18")) # Char  |-> r18_2)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s17")) # Char  |-> r17_2)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s16")) # Char  |-> r16_2)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s15")) # Char  |-> r15_2)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s14")) # Char  |-> r14_2)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s13")) # Char  |-> r13_2)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s12")) # Char  |-> r12_2)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s11")) # Char  |-> r11_2)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s10")) # Char  |-> r10_2)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s9")) # Char  |-> r9_2)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s8")) # Char  |-> r8_2)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s7")) # Char  |-> r7_2)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s6")) # Char  |-> r6_2)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s5")) # Char  |-> r5_2)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s4")) # Char  |-> r4_2)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s3")) # Char  |-> r3_2)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s2")) # Char  |-> r2_2)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s1")) # Char  |-> r1_2)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s0")) # Char  |-> r0_2)
  **  (rd_mem M )
|--
  EX (r31: Z)  (r30: Z)  (r29: Z)  (r28: Z)  (r27: Z)  (r26: Z)  (r25: Z)  (r24: Z)  (r23: Z)  (r22: Z)  (r21: Z)  (r20: Z)  (r19: Z)  (r18: Z)  (r17: Z)  (r16: Z)  (r15: Z)  (r14: Z)  (r13: Z)  (r12: Z)  (r11: Z)  (r10: Z)  (r9: Z)  (r8: Z)  (r7: Z)  (r6: Z)  (r5: Z)  (r4: Z)  (r3: Z)  (r2: Z)  (r1: Z)  (r0: Z) ,
  “ (qm_lane_match 0 vl_pre r0 (rd_get (M) ((p_pre + (0 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 1 vl_pre r1 (rd_get (M) ((p_pre + (1 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 2 vl_pre r2 (rd_get (M) ((p_pre + (2 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 3 vl_pre r3 (rd_get (M) ((p_pre + (3 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 4 vl_pre r4 (rd_get (M) ((p_pre + (4 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 5 vl_pre r5 (rd_get (M) ((p_pre + (5 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 6 vl_pre r6 (rd_get (M) ((p_pre + (6 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 7 vl_pre r7 (rd_get (M) ((p_pre + (7 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 8 vl_pre r8 (rd_get (M) ((p_pre + (8 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 9 vl_pre r9 (rd_get (M) ((p_pre + (9 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 10 vl_pre r10 (rd_get (M) ((p_pre + (10 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 11 vl_pre r11 (rd_get (M) ((p_pre + (11 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 12 vl_pre r12 (rd_get (M) ((p_pre + (12 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 13 vl_pre r13 (rd_get (M) ((p_pre + (13 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 14 vl_pre r14 (rd_get (M) ((p_pre + (14 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 15 vl_pre r15 (rd_get (M) ((p_pre + (15 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 16 vl_pre r16 (rd_get (M) ((p_pre + (16 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 17 vl_pre r17 (rd_get (M) ((p_pre + (17 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 18 vl_pre r18 (rd_get (M) ((p_pre + (18 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 19 vl_pre r19 (rd_get (M) ((p_pre + (19 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 20 vl_pre r20 (rd_get (M) ((p_pre + (20 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 21 vl_pre r21 (rd_get (M) ((p_pre + (21 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 22 vl_pre r22 (rd_get (M) ((p_pre + (22 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 23 vl_pre r23 (rd_get (M) ((p_pre + (23 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 24 vl_pre r24 (rd_get (M) ((p_pre + (24 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 25 vl_pre r25 (rd_get (M) ((p_pre + (25 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 26 vl_pre r26 (rd_get (M) ((p_pre + (26 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 27 vl_pre r27 (rd_get (M) ((p_pre + (27 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 28 vl_pre r28 (rd_get (M) ((p_pre + (28 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 29 vl_pre r29 (rd_get (M) ((p_pre + (29 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 30 vl_pre r30 (rd_get (M) ((p_pre + (30 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 31 vl_pre r31 (rd_get (M) ((p_pre + (31 * sizeof(CHAR))))) ) ”
  &&  (rd_mem M )
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s0")) # Char  |-> r0)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s1")) # Char  |-> r1)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s2")) # Char  |-> r2)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s3")) # Char  |-> r3)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s4")) # Char  |-> r4)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s5")) # Char  |-> r5)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s6")) # Char  |-> r6)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s7")) # Char  |-> r7)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s8")) # Char  |-> r8)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s9")) # Char  |-> r9)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s10")) # Char  |-> r10)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s11")) # Char  |-> r11)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s12")) # Char  |-> r12)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s13")) # Char  |-> r13)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s14")) # Char  |-> r14)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s15")) # Char  |-> r15)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s16")) # Char  |-> r16)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s17")) # Char  |-> r17)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s18")) # Char  |-> r18)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s19")) # Char  |-> r19)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s20")) # Char  |-> r20)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s21")) # Char  |-> r21)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s22")) # Char  |-> r22)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s23")) # Char  |-> r23)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s24")) # Char  |-> r24)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s25")) # Char  |-> r25)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s26")) # Char  |-> r26)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s27")) # Char  |-> r27)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s28")) # Char  |-> r28)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s29")) # Char  |-> r29)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s30")) # Char  |-> r30)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s31")) # Char  |-> r31)
.

Definition qm_load_into32_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (p_pre: Z) (out_pre: Z) (M: RDMap) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (rd_window M p_pre vl_pre )) ,
  ((( &( "out" ) )) # Ptr  |-> out_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (UndefStructPredvint8m2_t out_pre )
  **  (rd_mem M )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (rd_window M p_pre vl_pre ) ”
.

Definition qm_load_into32_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (p_pre: Z) (out_pre: Z) (M: RDMap) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (rd_window M p_pre vl_pre )) ,
  (UndefStructPredvint8m2_t out_pre )
  **  (rd_mem M )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (rd_window M p_pre vl_pre ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (rd_window M p_pre vl_pre ) ”
  &&  (rd_mem M )
  **  (UndefStructPredvint8m2_t out_pre )
.

Definition qm_load_into32_partial_solve_wit_1 := qm_load_into32_partial_solve_wit_1_pure -> qm_load_into32_partial_solve_wit_1_aux.

Definition qm_load_into32_partial_solve_wit_2 := 
forall (vl_pre: Z) (p_pre: Z) (out_pre: Z) (M: RDMap) (r31: Z) (r30: Z) (r29: Z) (r28: Z) (r27: Z) (r26: Z) (r25: Z) (r24: Z) (r23: Z) (r22: Z) (r21: Z) (r20: Z) (r19: Z) (r18: Z) (r17: Z) (r16: Z) (r15: Z) (r14: Z) (r13: Z) (r12: Z) (r11: Z) (r10: Z) (r9: Z) (r8: Z) (r7: Z) (r6: Z) (r5: Z) (r4: Z) (r3: Z) (r2: Z) (r1: Z) (r0: Z) (retval: Z) (PreH1 : (qm_lane_match 0 vl_pre r0 (rd_get (M) ((p_pre + (0 * sizeof(CHAR))))) )) (PreH2 : (qm_lane_match 1 vl_pre r1 (rd_get (M) ((p_pre + (1 * sizeof(CHAR))))) )) (PreH3 : (qm_lane_match 2 vl_pre r2 (rd_get (M) ((p_pre + (2 * sizeof(CHAR))))) )) (PreH4 : (qm_lane_match 3 vl_pre r3 (rd_get (M) ((p_pre + (3 * sizeof(CHAR))))) )) (PreH5 : (qm_lane_match 4 vl_pre r4 (rd_get (M) ((p_pre + (4 * sizeof(CHAR))))) )) (PreH6 : (qm_lane_match 5 vl_pre r5 (rd_get (M) ((p_pre + (5 * sizeof(CHAR))))) )) (PreH7 : (qm_lane_match 6 vl_pre r6 (rd_get (M) ((p_pre + (6 * sizeof(CHAR))))) )) (PreH8 : (qm_lane_match 7 vl_pre r7 (rd_get (M) ((p_pre + (7 * sizeof(CHAR))))) )) (PreH9 : (qm_lane_match 8 vl_pre r8 (rd_get (M) ((p_pre + (8 * sizeof(CHAR))))) )) (PreH10 : (qm_lane_match 9 vl_pre r9 (rd_get (M) ((p_pre + (9 * sizeof(CHAR))))) )) (PreH11 : (qm_lane_match 10 vl_pre r10 (rd_get (M) ((p_pre + (10 * sizeof(CHAR))))) )) (PreH12 : (qm_lane_match 11 vl_pre r11 (rd_get (M) ((p_pre + (11 * sizeof(CHAR))))) )) (PreH13 : (qm_lane_match 12 vl_pre r12 (rd_get (M) ((p_pre + (12 * sizeof(CHAR))))) )) (PreH14 : (qm_lane_match 13 vl_pre r13 (rd_get (M) ((p_pre + (13 * sizeof(CHAR))))) )) (PreH15 : (qm_lane_match 14 vl_pre r14 (rd_get (M) ((p_pre + (14 * sizeof(CHAR))))) )) (PreH16 : (qm_lane_match 15 vl_pre r15 (rd_get (M) ((p_pre + (15 * sizeof(CHAR))))) )) (PreH17 : (qm_lane_match 16 vl_pre r16 (rd_get (M) ((p_pre + (16 * sizeof(CHAR))))) )) (PreH18 : (qm_lane_match 17 vl_pre r17 (rd_get (M) ((p_pre + (17 * sizeof(CHAR))))) )) (PreH19 : (qm_lane_match 18 vl_pre r18 (rd_get (M) ((p_pre + (18 * sizeof(CHAR))))) )) (PreH20 : (qm_lane_match 19 vl_pre r19 (rd_get (M) ((p_pre + (19 * sizeof(CHAR))))) )) (PreH21 : (qm_lane_match 20 vl_pre r20 (rd_get (M) ((p_pre + (20 * sizeof(CHAR))))) )) (PreH22 : (qm_lane_match 21 vl_pre r21 (rd_get (M) ((p_pre + (21 * sizeof(CHAR))))) )) (PreH23 : (qm_lane_match 22 vl_pre r22 (rd_get (M) ((p_pre + (22 * sizeof(CHAR))))) )) (PreH24 : (qm_lane_match 23 vl_pre r23 (rd_get (M) ((p_pre + (23 * sizeof(CHAR))))) )) (PreH25 : (qm_lane_match 24 vl_pre r24 (rd_get (M) ((p_pre + (24 * sizeof(CHAR))))) )) (PreH26 : (qm_lane_match 25 vl_pre r25 (rd_get (M) ((p_pre + (25 * sizeof(CHAR))))) )) (PreH27 : (qm_lane_match 26 vl_pre r26 (rd_get (M) ((p_pre + (26 * sizeof(CHAR))))) )) (PreH28 : (qm_lane_match 27 vl_pre r27 (rd_get (M) ((p_pre + (27 * sizeof(CHAR))))) )) (PreH29 : (qm_lane_match 28 vl_pre r28 (rd_get (M) ((p_pre + (28 * sizeof(CHAR))))) )) (PreH30 : (qm_lane_match 29 vl_pre r29 (rd_get (M) ((p_pre + (29 * sizeof(CHAR))))) )) (PreH31 : (qm_lane_match 30 vl_pre r30 (rd_get (M) ((p_pre + (30 * sizeof(CHAR))))) )) (PreH32 : (qm_lane_match 31 vl_pre r31 (rd_get (M) ((p_pre + (31 * sizeof(CHAR))))) )) (PreH33 : (0 <= vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (rd_window M p_pre vl_pre )) ,
  (UndefStructPredvint8m2_t out_pre )
  **  (rd_mem M )
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s0")) # Char  |-> r0)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s1")) # Char  |-> r1)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s2")) # Char  |-> r2)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s3")) # Char  |-> r3)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s4")) # Char  |-> r4)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s5")) # Char  |-> r5)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s6")) # Char  |-> r6)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s7")) # Char  |-> r7)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s8")) # Char  |-> r8)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s9")) # Char  |-> r9)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s10")) # Char  |-> r10)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s11")) # Char  |-> r11)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s12")) # Char  |-> r12)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s13")) # Char  |-> r13)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s14")) # Char  |-> r14)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s15")) # Char  |-> r15)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s16")) # Char  |-> r16)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s17")) # Char  |-> r17)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s18")) # Char  |-> r18)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s19")) # Char  |-> r19)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s20")) # Char  |-> r20)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s21")) # Char  |-> r21)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s22")) # Char  |-> r22)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s23")) # Char  |-> r23)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s24")) # Char  |-> r24)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s25")) # Char  |-> r25)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s26")) # Char  |-> r26)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s27")) # Char  |-> r27)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s28")) # Char  |-> r28)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s29")) # Char  |-> r29)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s30")) # Char  |-> r30)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s31")) # Char  |-> r31)
|--
  “ (qm_lane_match 0 vl_pre r0 (rd_get (M) ((p_pre + (0 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 1 vl_pre r1 (rd_get (M) ((p_pre + (1 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 2 vl_pre r2 (rd_get (M) ((p_pre + (2 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 3 vl_pre r3 (rd_get (M) ((p_pre + (3 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 4 vl_pre r4 (rd_get (M) ((p_pre + (4 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 5 vl_pre r5 (rd_get (M) ((p_pre + (5 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 6 vl_pre r6 (rd_get (M) ((p_pre + (6 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 7 vl_pre r7 (rd_get (M) ((p_pre + (7 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 8 vl_pre r8 (rd_get (M) ((p_pre + (8 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 9 vl_pre r9 (rd_get (M) ((p_pre + (9 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 10 vl_pre r10 (rd_get (M) ((p_pre + (10 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 11 vl_pre r11 (rd_get (M) ((p_pre + (11 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 12 vl_pre r12 (rd_get (M) ((p_pre + (12 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 13 vl_pre r13 (rd_get (M) ((p_pre + (13 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 14 vl_pre r14 (rd_get (M) ((p_pre + (14 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 15 vl_pre r15 (rd_get (M) ((p_pre + (15 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 16 vl_pre r16 (rd_get (M) ((p_pre + (16 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 17 vl_pre r17 (rd_get (M) ((p_pre + (17 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 18 vl_pre r18 (rd_get (M) ((p_pre + (18 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 19 vl_pre r19 (rd_get (M) ((p_pre + (19 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 20 vl_pre r20 (rd_get (M) ((p_pre + (20 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 21 vl_pre r21 (rd_get (M) ((p_pre + (21 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 22 vl_pre r22 (rd_get (M) ((p_pre + (22 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 23 vl_pre r23 (rd_get (M) ((p_pre + (23 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 24 vl_pre r24 (rd_get (M) ((p_pre + (24 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 25 vl_pre r25 (rd_get (M) ((p_pre + (25 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 26 vl_pre r26 (rd_get (M) ((p_pre + (26 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 27 vl_pre r27 (rd_get (M) ((p_pre + (27 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 28 vl_pre r28 (rd_get (M) ((p_pre + (28 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 29 vl_pre r29 (rd_get (M) ((p_pre + (29 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 30 vl_pre r30 (rd_get (M) ((p_pre + (30 * sizeof(CHAR))))) ) ” 
  &&  “ (qm_lane_match 31 vl_pre r31 (rd_get (M) ((p_pre + (31 * sizeof(CHAR))))) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (rd_window M p_pre vl_pre ) ”
  &&  ((&((out_pre)  # "vint8m2_t" ->ₛ "s31")) # Char  |->_)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s31")) # Char  |-> r31)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s30")) # Char  |->_)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s30")) # Char  |-> r30)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s29")) # Char  |->_)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s29")) # Char  |-> r29)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s28")) # Char  |->_)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s28")) # Char  |-> r28)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s27")) # Char  |->_)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s27")) # Char  |-> r27)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s26")) # Char  |->_)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s26")) # Char  |-> r26)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s25")) # Char  |->_)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s25")) # Char  |-> r25)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s24")) # Char  |->_)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s24")) # Char  |-> r24)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s23")) # Char  |->_)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s23")) # Char  |-> r23)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s22")) # Char  |->_)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s22")) # Char  |-> r22)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s21")) # Char  |->_)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s21")) # Char  |-> r21)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s20")) # Char  |->_)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s20")) # Char  |-> r20)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s19")) # Char  |->_)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s19")) # Char  |-> r19)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s18")) # Char  |->_)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s18")) # Char  |-> r18)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s17")) # Char  |->_)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s17")) # Char  |-> r17)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s16")) # Char  |->_)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s16")) # Char  |-> r16)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s15")) # Char  |->_)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s15")) # Char  |-> r15)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s14")) # Char  |->_)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s14")) # Char  |-> r14)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s13")) # Char  |->_)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s13")) # Char  |-> r13)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s12")) # Char  |->_)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s12")) # Char  |-> r12)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s11")) # Char  |->_)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s11")) # Char  |-> r11)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s10")) # Char  |->_)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s10")) # Char  |-> r10)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s9")) # Char  |->_)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s9")) # Char  |-> r9)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s8")) # Char  |->_)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s8")) # Char  |-> r8)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s7")) # Char  |->_)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s7")) # Char  |-> r7)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s6")) # Char  |->_)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s6")) # Char  |-> r6)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s5")) # Char  |->_)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s5")) # Char  |-> r5)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s4")) # Char  |->_)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s4")) # Char  |-> r4)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s3")) # Char  |->_)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s3")) # Char  |-> r3)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s2")) # Char  |->_)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s2")) # Char  |-> r2)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s1")) # Char  |->_)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s1")) # Char  |-> r1)
  **  ((&((out_pre)  # "vint8m2_t" ->ₛ "s0")) # Char  |->_)
  **  ((&((retval)  # "vint8m2_t" ->ₛ "s0")) # Char  |-> r0)
  **  (rd_mem M )
.

Module Type VC_Correct.


Axiom proof_of_qm_load_into32_return_wit_1 : qm_load_into32_return_wit_1.
Axiom proof_of_qm_load_into32_partial_solve_wit_1_pure : qm_load_into32_partial_solve_wit_1_pure.
Axiom proof_of_qm_load_into32_partial_solve_wit_1 : qm_load_into32_partial_solve_wit_1.
Axiom proof_of_qm_load_into32_partial_solve_wit_2 : qm_load_into32_partial_solve_wit_2.

End VC_Correct.
