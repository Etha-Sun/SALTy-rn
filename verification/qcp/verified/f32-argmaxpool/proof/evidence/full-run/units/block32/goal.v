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
From ArgmaxPool Require Import block32_def.
Import Snaive_C_Rules64.
Require Import ArgmaxPool.Model ArgmaxPool.MemoryModel.
Require Import ArgmaxPool.Types.
Require Import ArgmaxPool.ProgramModel ArgmaxPool.MemoryFacts.
Require Import ArgmaxPool.APKernelModel.
Require Import ArgmaxPool.RvvKernelModel.
Require Import ArgmaxPool.RvvVectorRecords.
Require Import ArgmaxPool.RvvUpdateIntoModel.
Require Import ArgmaxPool.APBlock32Model.
Require Import ArgmaxPool.APBlock32StageModel.
Local Open Scope sac.

(*----- Function ap_rvv_block32 -----*)

Definition ap_rvv_block32_safety_wit_1 := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (PreH1 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p1_pre) (0)) )) (PreH2 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p1_pre) (1)) )) (PreH3 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p1_pre) (2)) )) (PreH4 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p1_pre) (3)) )) (PreH5 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p1_pre) (4)) )) (PreH6 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p1_pre) (5)) )) (PreH7 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p1_pre) (6)) )) (PreH8 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p1_pre) (7)) )) (PreH9 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p1_pre) (8)) )) (PreH10 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p1_pre) (9)) )) (PreH11 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p1_pre) (10)) )) (PreH12 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p1_pre) (11)) )) (PreH13 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p1_pre) (12)) )) (PreH14 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p1_pre) (13)) )) (PreH15 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p1_pre) (14)) )) (PreH16 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p1_pre) (15)) )) (PreH17 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p1_pre) (16)) )) (PreH18 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p1_pre) (17)) )) (PreH19 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p1_pre) (18)) )) (PreH20 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p1_pre) (19)) )) (PreH21 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p1_pre) (20)) )) (PreH22 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p1_pre) (21)) )) (PreH23 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p1_pre) (22)) )) (PreH24 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p1_pre) (23)) )) (PreH25 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p1_pre) (24)) )) (PreH26 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p1_pre) (25)) )) (PreH27 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p1_pre) (26)) )) (PreH28 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p1_pre) (27)) )) (PreH29 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p1_pre) (28)) )) (PreH30 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p1_pre) (29)) )) (PreH31 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p1_pre) (30)) )) (PreH32 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p1_pre) (31)) )) (PreH33 : (0 < vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (ap_window F p0_pre vl_pre )) (PreH36 : (ap_window F p1_pre vl_pre )) (PreH37 : (ap_window F p2_pre vl_pre )) (PreH38 : (ap_window F p3_pre vl_pre )) (PreH39 : (ap_window F p4_pre vl_pre )) (PreH40 : (ap_window F p5_pre vl_pre )) (PreH41 : (ap_window F p6_pre vl_pre )) (PreH42 : (ap_window F p7_pre vl_pre )) (PreH43 : (ap_window F p8_pre vl_pre )) (PreH44 : (ap_write_window W output_pre vl_pre )) (PreH45 : (ap_write_window WI index_pre vl_pre )) (PreH46 : (ap_block32_previous ab_pre ib_pre )) (PreH47 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH48 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH49 : (ap_optional_write_window W ab_pre vl_pre )) (PreH50 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH51 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 0 )) ,
  ((&(( &( "b" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_data F )
  **  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "p3" ) )) # Ptr  |-> p3_pre)
  **  ((( &( "p4" ) )) # Ptr  |-> p4_pre)
  **  ((( &( "p5" ) )) # Ptr  |-> p5_pre)
  **  ((( &( "p6" ) )) # Ptr  |-> p6_pre)
  **  ((( &( "p7" ) )) # Ptr  |-> p7_pre)
  **  ((( &( "p8" ) )) # Ptr  |-> p8_pre)
  **  ((( &( "ab" ) )) # Ptr  |-> ab_pre)
  **  ((( &( "ib" ) )) # Ptr  |-> ib_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "index" ) )) # Ptr  |-> index_pre)
  **  ((( &( "idx" ) )) # UInt  |-> idx_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition ap_rvv_block32_safety_wit_2 := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (PreH1 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p2_pre) (0)) )) (PreH2 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p2_pre) (1)) )) (PreH3 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p2_pre) (2)) )) (PreH4 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p2_pre) (3)) )) (PreH5 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p2_pre) (4)) )) (PreH6 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p2_pre) (5)) )) (PreH7 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p2_pre) (6)) )) (PreH8 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p2_pre) (7)) )) (PreH9 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p2_pre) (8)) )) (PreH10 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p2_pre) (9)) )) (PreH11 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p2_pre) (10)) )) (PreH12 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p2_pre) (11)) )) (PreH13 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p2_pre) (12)) )) (PreH14 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p2_pre) (13)) )) (PreH15 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p2_pre) (14)) )) (PreH16 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p2_pre) (15)) )) (PreH17 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p2_pre) (16)) )) (PreH18 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p2_pre) (17)) )) (PreH19 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p2_pre) (18)) )) (PreH20 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p2_pre) (19)) )) (PreH21 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p2_pre) (20)) )) (PreH22 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p2_pre) (21)) )) (PreH23 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p2_pre) (22)) )) (PreH24 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p2_pre) (23)) )) (PreH25 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p2_pre) (24)) )) (PreH26 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p2_pre) (25)) )) (PreH27 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p2_pre) (26)) )) (PreH28 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p2_pre) (27)) )) (PreH29 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p2_pre) (28)) )) (PreH30 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p2_pre) (29)) )) (PreH31 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p2_pre) (30)) )) (PreH32 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p2_pre) (31)) )) (PreH33 : (0 < vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (ap_window F p0_pre vl_pre )) (PreH36 : (ap_window F p1_pre vl_pre )) (PreH37 : (ap_window F p2_pre vl_pre )) (PreH38 : (ap_window F p3_pre vl_pre )) (PreH39 : (ap_window F p4_pre vl_pre )) (PreH40 : (ap_window F p5_pre vl_pre )) (PreH41 : (ap_window F p6_pre vl_pre )) (PreH42 : (ap_window F p7_pre vl_pre )) (PreH43 : (ap_window F p8_pre vl_pre )) (PreH44 : (ap_write_window W output_pre vl_pre )) (PreH45 : (ap_write_window WI index_pre vl_pre )) (PreH46 : (ap_block32_previous ab_pre ib_pre )) (PreH47 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH48 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH49 : (ap_optional_write_window W ab_pre vl_pre )) (PreH50 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH51 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 1 )) ,
  ((&(( &( "b" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_data F )
  **  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "p3" ) )) # Ptr  |-> p3_pre)
  **  ((( &( "p4" ) )) # Ptr  |-> p4_pre)
  **  ((( &( "p5" ) )) # Ptr  |-> p5_pre)
  **  ((( &( "p6" ) )) # Ptr  |-> p6_pre)
  **  ((( &( "p7" ) )) # Ptr  |-> p7_pre)
  **  ((( &( "p8" ) )) # Ptr  |-> p8_pre)
  **  ((( &( "ab" ) )) # Ptr  |-> ab_pre)
  **  ((( &( "ib" ) )) # Ptr  |-> ib_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "index" ) )) # Ptr  |-> index_pre)
  **  ((( &( "idx" ) )) # UInt  |-> idx_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition ap_rvv_block32_safety_wit_3 := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (PreH1 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p3_pre) (0)) )) (PreH2 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p3_pre) (1)) )) (PreH3 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p3_pre) (2)) )) (PreH4 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p3_pre) (3)) )) (PreH5 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p3_pre) (4)) )) (PreH6 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p3_pre) (5)) )) (PreH7 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p3_pre) (6)) )) (PreH8 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p3_pre) (7)) )) (PreH9 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p3_pre) (8)) )) (PreH10 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p3_pre) (9)) )) (PreH11 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p3_pre) (10)) )) (PreH12 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p3_pre) (11)) )) (PreH13 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p3_pre) (12)) )) (PreH14 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p3_pre) (13)) )) (PreH15 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p3_pre) (14)) )) (PreH16 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p3_pre) (15)) )) (PreH17 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p3_pre) (16)) )) (PreH18 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p3_pre) (17)) )) (PreH19 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p3_pre) (18)) )) (PreH20 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p3_pre) (19)) )) (PreH21 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p3_pre) (20)) )) (PreH22 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p3_pre) (21)) )) (PreH23 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p3_pre) (22)) )) (PreH24 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p3_pre) (23)) )) (PreH25 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p3_pre) (24)) )) (PreH26 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p3_pre) (25)) )) (PreH27 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p3_pre) (26)) )) (PreH28 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p3_pre) (27)) )) (PreH29 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p3_pre) (28)) )) (PreH30 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p3_pre) (29)) )) (PreH31 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p3_pre) (30)) )) (PreH32 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p3_pre) (31)) )) (PreH33 : (0 < vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (ap_window F p0_pre vl_pre )) (PreH36 : (ap_window F p1_pre vl_pre )) (PreH37 : (ap_window F p2_pre vl_pre )) (PreH38 : (ap_window F p3_pre vl_pre )) (PreH39 : (ap_window F p4_pre vl_pre )) (PreH40 : (ap_window F p5_pre vl_pre )) (PreH41 : (ap_window F p6_pre vl_pre )) (PreH42 : (ap_window F p7_pre vl_pre )) (PreH43 : (ap_window F p8_pre vl_pre )) (PreH44 : (ap_write_window W output_pre vl_pre )) (PreH45 : (ap_write_window WI index_pre vl_pre )) (PreH46 : (ap_block32_previous ab_pre ib_pre )) (PreH47 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH48 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH49 : (ap_optional_write_window W ab_pre vl_pre )) (PreH50 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH51 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 2 )) ,
  ((&(( &( "b" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_data F )
  **  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "p3" ) )) # Ptr  |-> p3_pre)
  **  ((( &( "p4" ) )) # Ptr  |-> p4_pre)
  **  ((( &( "p5" ) )) # Ptr  |-> p5_pre)
  **  ((( &( "p6" ) )) # Ptr  |-> p6_pre)
  **  ((( &( "p7" ) )) # Ptr  |-> p7_pre)
  **  ((( &( "p8" ) )) # Ptr  |-> p8_pre)
  **  ((( &( "ab" ) )) # Ptr  |-> ab_pre)
  **  ((( &( "ib" ) )) # Ptr  |-> ib_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "index" ) )) # Ptr  |-> index_pre)
  **  ((( &( "idx" ) )) # UInt  |-> idx_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition ap_rvv_block32_safety_wit_4 := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (PreH1 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p4_pre) (0)) )) (PreH2 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p4_pre) (1)) )) (PreH3 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p4_pre) (2)) )) (PreH4 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p4_pre) (3)) )) (PreH5 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p4_pre) (4)) )) (PreH6 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p4_pre) (5)) )) (PreH7 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p4_pre) (6)) )) (PreH8 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p4_pre) (7)) )) (PreH9 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p4_pre) (8)) )) (PreH10 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p4_pre) (9)) )) (PreH11 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p4_pre) (10)) )) (PreH12 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p4_pre) (11)) )) (PreH13 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p4_pre) (12)) )) (PreH14 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p4_pre) (13)) )) (PreH15 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p4_pre) (14)) )) (PreH16 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p4_pre) (15)) )) (PreH17 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p4_pre) (16)) )) (PreH18 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p4_pre) (17)) )) (PreH19 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p4_pre) (18)) )) (PreH20 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p4_pre) (19)) )) (PreH21 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p4_pre) (20)) )) (PreH22 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p4_pre) (21)) )) (PreH23 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p4_pre) (22)) )) (PreH24 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p4_pre) (23)) )) (PreH25 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p4_pre) (24)) )) (PreH26 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p4_pre) (25)) )) (PreH27 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p4_pre) (26)) )) (PreH28 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p4_pre) (27)) )) (PreH29 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p4_pre) (28)) )) (PreH30 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p4_pre) (29)) )) (PreH31 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p4_pre) (30)) )) (PreH32 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p4_pre) (31)) )) (PreH33 : (0 < vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (ap_window F p0_pre vl_pre )) (PreH36 : (ap_window F p1_pre vl_pre )) (PreH37 : (ap_window F p2_pre vl_pre )) (PreH38 : (ap_window F p3_pre vl_pre )) (PreH39 : (ap_window F p4_pre vl_pre )) (PreH40 : (ap_window F p5_pre vl_pre )) (PreH41 : (ap_window F p6_pre vl_pre )) (PreH42 : (ap_window F p7_pre vl_pre )) (PreH43 : (ap_window F p8_pre vl_pre )) (PreH44 : (ap_write_window W output_pre vl_pre )) (PreH45 : (ap_write_window WI index_pre vl_pre )) (PreH46 : (ap_block32_previous ab_pre ib_pre )) (PreH47 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH48 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH49 : (ap_optional_write_window W ab_pre vl_pre )) (PreH50 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH51 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 3 )) ,
  ((&(( &( "b" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_data F )
  **  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "p3" ) )) # Ptr  |-> p3_pre)
  **  ((( &( "p4" ) )) # Ptr  |-> p4_pre)
  **  ((( &( "p5" ) )) # Ptr  |-> p5_pre)
  **  ((( &( "p6" ) )) # Ptr  |-> p6_pre)
  **  ((( &( "p7" ) )) # Ptr  |-> p7_pre)
  **  ((( &( "p8" ) )) # Ptr  |-> p8_pre)
  **  ((( &( "ab" ) )) # Ptr  |-> ab_pre)
  **  ((( &( "ib" ) )) # Ptr  |-> ib_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "index" ) )) # Ptr  |-> index_pre)
  **  ((( &( "idx" ) )) # UInt  |-> idx_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition ap_rvv_block32_safety_wit_5 := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (PreH1 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p5_pre) (0)) )) (PreH2 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p5_pre) (1)) )) (PreH3 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p5_pre) (2)) )) (PreH4 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p5_pre) (3)) )) (PreH5 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p5_pre) (4)) )) (PreH6 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p5_pre) (5)) )) (PreH7 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p5_pre) (6)) )) (PreH8 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p5_pre) (7)) )) (PreH9 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p5_pre) (8)) )) (PreH10 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p5_pre) (9)) )) (PreH11 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p5_pre) (10)) )) (PreH12 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p5_pre) (11)) )) (PreH13 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p5_pre) (12)) )) (PreH14 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p5_pre) (13)) )) (PreH15 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p5_pre) (14)) )) (PreH16 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p5_pre) (15)) )) (PreH17 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p5_pre) (16)) )) (PreH18 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p5_pre) (17)) )) (PreH19 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p5_pre) (18)) )) (PreH20 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p5_pre) (19)) )) (PreH21 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p5_pre) (20)) )) (PreH22 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p5_pre) (21)) )) (PreH23 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p5_pre) (22)) )) (PreH24 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p5_pre) (23)) )) (PreH25 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p5_pre) (24)) )) (PreH26 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p5_pre) (25)) )) (PreH27 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p5_pre) (26)) )) (PreH28 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p5_pre) (27)) )) (PreH29 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p5_pre) (28)) )) (PreH30 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p5_pre) (29)) )) (PreH31 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p5_pre) (30)) )) (PreH32 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p5_pre) (31)) )) (PreH33 : (0 < vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (ap_window F p0_pre vl_pre )) (PreH36 : (ap_window F p1_pre vl_pre )) (PreH37 : (ap_window F p2_pre vl_pre )) (PreH38 : (ap_window F p3_pre vl_pre )) (PreH39 : (ap_window F p4_pre vl_pre )) (PreH40 : (ap_window F p5_pre vl_pre )) (PreH41 : (ap_window F p6_pre vl_pre )) (PreH42 : (ap_window F p7_pre vl_pre )) (PreH43 : (ap_window F p8_pre vl_pre )) (PreH44 : (ap_write_window W output_pre vl_pre )) (PreH45 : (ap_write_window WI index_pre vl_pre )) (PreH46 : (ap_block32_previous ab_pre ib_pre )) (PreH47 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH48 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH49 : (ap_optional_write_window W ab_pre vl_pre )) (PreH50 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH51 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 4 )) ,
  ((&(( &( "b" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_data F )
  **  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "p3" ) )) # Ptr  |-> p3_pre)
  **  ((( &( "p4" ) )) # Ptr  |-> p4_pre)
  **  ((( &( "p5" ) )) # Ptr  |-> p5_pre)
  **  ((( &( "p6" ) )) # Ptr  |-> p6_pre)
  **  ((( &( "p7" ) )) # Ptr  |-> p7_pre)
  **  ((( &( "p8" ) )) # Ptr  |-> p8_pre)
  **  ((( &( "ab" ) )) # Ptr  |-> ab_pre)
  **  ((( &( "ib" ) )) # Ptr  |-> ib_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "index" ) )) # Ptr  |-> index_pre)
  **  ((( &( "idx" ) )) # UInt  |-> idx_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 5) ”
.

Definition ap_rvv_block32_safety_wit_6 := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (PreH1 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p6_pre) (0)) )) (PreH2 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p6_pre) (1)) )) (PreH3 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p6_pre) (2)) )) (PreH4 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p6_pre) (3)) )) (PreH5 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p6_pre) (4)) )) (PreH6 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p6_pre) (5)) )) (PreH7 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p6_pre) (6)) )) (PreH8 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p6_pre) (7)) )) (PreH9 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p6_pre) (8)) )) (PreH10 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p6_pre) (9)) )) (PreH11 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p6_pre) (10)) )) (PreH12 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p6_pre) (11)) )) (PreH13 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p6_pre) (12)) )) (PreH14 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p6_pre) (13)) )) (PreH15 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p6_pre) (14)) )) (PreH16 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p6_pre) (15)) )) (PreH17 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p6_pre) (16)) )) (PreH18 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p6_pre) (17)) )) (PreH19 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p6_pre) (18)) )) (PreH20 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p6_pre) (19)) )) (PreH21 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p6_pre) (20)) )) (PreH22 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p6_pre) (21)) )) (PreH23 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p6_pre) (22)) )) (PreH24 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p6_pre) (23)) )) (PreH25 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p6_pre) (24)) )) (PreH26 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p6_pre) (25)) )) (PreH27 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p6_pre) (26)) )) (PreH28 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p6_pre) (27)) )) (PreH29 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p6_pre) (28)) )) (PreH30 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p6_pre) (29)) )) (PreH31 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p6_pre) (30)) )) (PreH32 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p6_pre) (31)) )) (PreH33 : (0 < vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (ap_window F p0_pre vl_pre )) (PreH36 : (ap_window F p1_pre vl_pre )) (PreH37 : (ap_window F p2_pre vl_pre )) (PreH38 : (ap_window F p3_pre vl_pre )) (PreH39 : (ap_window F p4_pre vl_pre )) (PreH40 : (ap_window F p5_pre vl_pre )) (PreH41 : (ap_window F p6_pre vl_pre )) (PreH42 : (ap_window F p7_pre vl_pre )) (PreH43 : (ap_window F p8_pre vl_pre )) (PreH44 : (ap_write_window W output_pre vl_pre )) (PreH45 : (ap_write_window WI index_pre vl_pre )) (PreH46 : (ap_block32_previous ab_pre ib_pre )) (PreH47 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH48 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH49 : (ap_optional_write_window W ab_pre vl_pre )) (PreH50 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH51 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 5 )) ,
  ((&(( &( "b" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_data F )
  **  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "p3" ) )) # Ptr  |-> p3_pre)
  **  ((( &( "p4" ) )) # Ptr  |-> p4_pre)
  **  ((( &( "p5" ) )) # Ptr  |-> p5_pre)
  **  ((( &( "p6" ) )) # Ptr  |-> p6_pre)
  **  ((( &( "p7" ) )) # Ptr  |-> p7_pre)
  **  ((( &( "p8" ) )) # Ptr  |-> p8_pre)
  **  ((( &( "ab" ) )) # Ptr  |-> ab_pre)
  **  ((( &( "ib" ) )) # Ptr  |-> ib_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "index" ) )) # Ptr  |-> index_pre)
  **  ((( &( "idx" ) )) # UInt  |-> idx_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 6) ”
.

Definition ap_rvv_block32_safety_wit_7 := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (PreH1 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p7_pre) (0)) )) (PreH2 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p7_pre) (1)) )) (PreH3 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p7_pre) (2)) )) (PreH4 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p7_pre) (3)) )) (PreH5 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p7_pre) (4)) )) (PreH6 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p7_pre) (5)) )) (PreH7 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p7_pre) (6)) )) (PreH8 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p7_pre) (7)) )) (PreH9 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p7_pre) (8)) )) (PreH10 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p7_pre) (9)) )) (PreH11 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p7_pre) (10)) )) (PreH12 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p7_pre) (11)) )) (PreH13 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p7_pre) (12)) )) (PreH14 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p7_pre) (13)) )) (PreH15 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p7_pre) (14)) )) (PreH16 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p7_pre) (15)) )) (PreH17 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p7_pre) (16)) )) (PreH18 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p7_pre) (17)) )) (PreH19 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p7_pre) (18)) )) (PreH20 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p7_pre) (19)) )) (PreH21 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p7_pre) (20)) )) (PreH22 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p7_pre) (21)) )) (PreH23 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p7_pre) (22)) )) (PreH24 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p7_pre) (23)) )) (PreH25 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p7_pre) (24)) )) (PreH26 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p7_pre) (25)) )) (PreH27 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p7_pre) (26)) )) (PreH28 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p7_pre) (27)) )) (PreH29 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p7_pre) (28)) )) (PreH30 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p7_pre) (29)) )) (PreH31 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p7_pre) (30)) )) (PreH32 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p7_pre) (31)) )) (PreH33 : (0 < vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (ap_window F p0_pre vl_pre )) (PreH36 : (ap_window F p1_pre vl_pre )) (PreH37 : (ap_window F p2_pre vl_pre )) (PreH38 : (ap_window F p3_pre vl_pre )) (PreH39 : (ap_window F p4_pre vl_pre )) (PreH40 : (ap_window F p5_pre vl_pre )) (PreH41 : (ap_window F p6_pre vl_pre )) (PreH42 : (ap_window F p7_pre vl_pre )) (PreH43 : (ap_window F p8_pre vl_pre )) (PreH44 : (ap_write_window W output_pre vl_pre )) (PreH45 : (ap_write_window WI index_pre vl_pre )) (PreH46 : (ap_block32_previous ab_pre ib_pre )) (PreH47 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH48 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH49 : (ap_optional_write_window W ab_pre vl_pre )) (PreH50 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH51 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 6 )) ,
  ((&(( &( "b" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_data F )
  **  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "p3" ) )) # Ptr  |-> p3_pre)
  **  ((( &( "p4" ) )) # Ptr  |-> p4_pre)
  **  ((( &( "p5" ) )) # Ptr  |-> p5_pre)
  **  ((( &( "p6" ) )) # Ptr  |-> p6_pre)
  **  ((( &( "p7" ) )) # Ptr  |-> p7_pre)
  **  ((( &( "p8" ) )) # Ptr  |-> p8_pre)
  **  ((( &( "ab" ) )) # Ptr  |-> ab_pre)
  **  ((( &( "ib" ) )) # Ptr  |-> ib_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "index" ) )) # Ptr  |-> index_pre)
  **  ((( &( "idx" ) )) # UInt  |-> idx_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 7) ”
.

Definition ap_rvv_block32_safety_wit_8 := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (PreH1 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p8_pre) (0)) )) (PreH2 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p8_pre) (1)) )) (PreH3 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p8_pre) (2)) )) (PreH4 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p8_pre) (3)) )) (PreH5 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p8_pre) (4)) )) (PreH6 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p8_pre) (5)) )) (PreH7 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p8_pre) (6)) )) (PreH8 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p8_pre) (7)) )) (PreH9 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p8_pre) (8)) )) (PreH10 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p8_pre) (9)) )) (PreH11 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p8_pre) (10)) )) (PreH12 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p8_pre) (11)) )) (PreH13 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p8_pre) (12)) )) (PreH14 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p8_pre) (13)) )) (PreH15 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p8_pre) (14)) )) (PreH16 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p8_pre) (15)) )) (PreH17 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p8_pre) (16)) )) (PreH18 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p8_pre) (17)) )) (PreH19 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p8_pre) (18)) )) (PreH20 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p8_pre) (19)) )) (PreH21 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p8_pre) (20)) )) (PreH22 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p8_pre) (21)) )) (PreH23 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p8_pre) (22)) )) (PreH24 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p8_pre) (23)) )) (PreH25 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p8_pre) (24)) )) (PreH26 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p8_pre) (25)) )) (PreH27 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p8_pre) (26)) )) (PreH28 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p8_pre) (27)) )) (PreH29 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p8_pre) (28)) )) (PreH30 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p8_pre) (29)) )) (PreH31 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p8_pre) (30)) )) (PreH32 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p8_pre) (31)) )) (PreH33 : (0 < vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (ap_window F p0_pre vl_pre )) (PreH36 : (ap_window F p1_pre vl_pre )) (PreH37 : (ap_window F p2_pre vl_pre )) (PreH38 : (ap_window F p3_pre vl_pre )) (PreH39 : (ap_window F p4_pre vl_pre )) (PreH40 : (ap_window F p5_pre vl_pre )) (PreH41 : (ap_window F p6_pre vl_pre )) (PreH42 : (ap_window F p7_pre vl_pre )) (PreH43 : (ap_window F p8_pre vl_pre )) (PreH44 : (ap_write_window W output_pre vl_pre )) (PreH45 : (ap_write_window WI index_pre vl_pre )) (PreH46 : (ap_block32_previous ab_pre ib_pre )) (PreH47 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH48 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH49 : (ap_optional_write_window W ab_pre vl_pre )) (PreH50 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH51 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 7 )) ,
  ((&(( &( "b" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_data F )
  **  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "p3" ) )) # Ptr  |-> p3_pre)
  **  ((( &( "p4" ) )) # Ptr  |-> p4_pre)
  **  ((( &( "p5" ) )) # Ptr  |-> p5_pre)
  **  ((( &( "p6" ) )) # Ptr  |-> p6_pre)
  **  ((( &( "p7" ) )) # Ptr  |-> p7_pre)
  **  ((( &( "p8" ) )) # Ptr  |-> p8_pre)
  **  ((( &( "ab" ) )) # Ptr  |-> ab_pre)
  **  ((( &( "ib" ) )) # Ptr  |-> ib_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "index" ) )) # Ptr  |-> index_pre)
  **  ((( &( "idx" ) )) # UInt  |-> idx_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition ap_rvv_block32_entail_wit_1_1 := 
(
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (r31_2: Z) (r30_2: Z) (r29_2: Z) (r28_2: Z) (r27_2: Z) (r26_2: Z) (r25_2: Z) (r24_2: Z) (r23_2: Z) (r22_2: Z) (r21_2: Z) (r20_2: Z) (r19_2: Z) (r18_2: Z) (r17_2: Z) (r16_2: Z) (r15_2: Z) (r14_2: Z) (r13_2: Z) (r12_2: Z) (r11_2: Z) (r10_2: Z) (r9_2: Z) (r8_2: Z) (r7_2: Z) (r6_2: Z) (r5_2: Z) (r4_2: Z) (r3_2: Z) (r2_2: Z) (r1_2: Z) (r0_2: Z) (r31_3: fp32) (r30_3: fp32) (r29_3: fp32) (r28_3: fp32) (r27_3: fp32) (r26_3: fp32) (r25_3: fp32) (r24_3: fp32) (r23_3: fp32) (r22_3: fp32) (r21_3: fp32) (r20_3: fp32) (r19_3: fp32) (r18_3: fp32) (r17_3: fp32) (r16_3: fp32) (r15_3: fp32) (r14_3: fp32) (r13_3: fp32) (r12_3: fp32) (r11_3: fp32) (r10_3: fp32) (r9_3: fp32) (r8_3: fp32) (r7_3: fp32) (r6_3: fp32) (r5_3: fp32) (r4_3: fp32) (r3_3: fp32) (r2_3: fp32) (r1_3: fp32) (r0_3: fp32) (R: Recordvfloat32m8_t) (J_2: Recordvuint32m8_t) (PreH1 : (ap_rvv_update32 R J_2 (make_record_vfloat32m8_t (r0) (r1) (r2) (r3) (r4) (r5) (r6) (r7) (r8) (r9) (r10) (r11) (r12) (r13) (r14) (r15) (r16) (r17) (r18) (r19) (r20) (r21) (r22) (r23) (r24) (r25) (r26) (r27) (r28) (r29) (r30) (r31)) (make_record_vuint32m8_t (r0_2) (r1_2) (r2_2) (r3_2) (r4_2) (r5_2) (r6_2) (r7_2) (r8_2) (r9_2) (r10_2) (r11_2) (r12_2) (r13_2) (r14_2) (r15_2) (r16_2) (r17_2) (r18_2) (r19_2) (r20_2) (r21_2) (r22_2) (r23_2) (r24_2) (r25_2) (r26_2) (r27_2) (r28_2) (r29_2) (r30_2) (r31_2)) (make_record_vfloat32m8_t (r0_3) (r1_3) (r2_3) (r3_3) (r4_3) (r5_3) (r6_3) (r7_3) (r8_3) (r9_3) (r10_3) (r11_3) (r12_3) (r13_3) (r14_3) (r15_3) (r16_3) (r17_3) (r18_3) (r19_3) (r20_3) (r21_3) (r22_3) (r23_3) (r24_3) (r25_3) (r26_3) (r27_3) (r28_3) (r29_3) (r30_3) (r31_3)) idx_pre vl_pre )) (PreH2 : (apr_float_lane 0 vl_pre r0_3 (ap_load_lane (F) (p0_pre) (0)) )) (PreH3 : (apr_float_lane 1 vl_pre r1_3 (ap_load_lane (F) (p0_pre) (1)) )) (PreH4 : (apr_float_lane 2 vl_pre r2_3 (ap_load_lane (F) (p0_pre) (2)) )) (PreH5 : (apr_float_lane 3 vl_pre r3_3 (ap_load_lane (F) (p0_pre) (3)) )) (PreH6 : (apr_float_lane 4 vl_pre r4_3 (ap_load_lane (F) (p0_pre) (4)) )) (PreH7 : (apr_float_lane 5 vl_pre r5_3 (ap_load_lane (F) (p0_pre) (5)) )) (PreH8 : (apr_float_lane 6 vl_pre r6_3 (ap_load_lane (F) (p0_pre) (6)) )) (PreH9 : (apr_float_lane 7 vl_pre r7_3 (ap_load_lane (F) (p0_pre) (7)) )) (PreH10 : (apr_float_lane 8 vl_pre r8_3 (ap_load_lane (F) (p0_pre) (8)) )) (PreH11 : (apr_float_lane 9 vl_pre r9_3 (ap_load_lane (F) (p0_pre) (9)) )) (PreH12 : (apr_float_lane 10 vl_pre r10_3 (ap_load_lane (F) (p0_pre) (10)) )) (PreH13 : (apr_float_lane 11 vl_pre r11_3 (ap_load_lane (F) (p0_pre) (11)) )) (PreH14 : (apr_float_lane 12 vl_pre r12_3 (ap_load_lane (F) (p0_pre) (12)) )) (PreH15 : (apr_float_lane 13 vl_pre r13_3 (ap_load_lane (F) (p0_pre) (13)) )) (PreH16 : (apr_float_lane 14 vl_pre r14_3 (ap_load_lane (F) (p0_pre) (14)) )) (PreH17 : (apr_float_lane 15 vl_pre r15_3 (ap_load_lane (F) (p0_pre) (15)) )) (PreH18 : (apr_float_lane 16 vl_pre r16_3 (ap_load_lane (F) (p0_pre) (16)) )) (PreH19 : (apr_float_lane 17 vl_pre r17_3 (ap_load_lane (F) (p0_pre) (17)) )) (PreH20 : (apr_float_lane 18 vl_pre r18_3 (ap_load_lane (F) (p0_pre) (18)) )) (PreH21 : (apr_float_lane 19 vl_pre r19_3 (ap_load_lane (F) (p0_pre) (19)) )) (PreH22 : (apr_float_lane 20 vl_pre r20_3 (ap_load_lane (F) (p0_pre) (20)) )) (PreH23 : (apr_float_lane 21 vl_pre r21_3 (ap_load_lane (F) (p0_pre) (21)) )) (PreH24 : (apr_float_lane 22 vl_pre r22_3 (ap_load_lane (F) (p0_pre) (22)) )) (PreH25 : (apr_float_lane 23 vl_pre r23_3 (ap_load_lane (F) (p0_pre) (23)) )) (PreH26 : (apr_float_lane 24 vl_pre r24_3 (ap_load_lane (F) (p0_pre) (24)) )) (PreH27 : (apr_float_lane 25 vl_pre r25_3 (ap_load_lane (F) (p0_pre) (25)) )) (PreH28 : (apr_float_lane 26 vl_pre r26_3 (ap_load_lane (F) (p0_pre) (26)) )) (PreH29 : (apr_float_lane 27 vl_pre r27_3 (ap_load_lane (F) (p0_pre) (27)) )) (PreH30 : (apr_float_lane 28 vl_pre r28_3 (ap_load_lane (F) (p0_pre) (28)) )) (PreH31 : (apr_float_lane 29 vl_pre r29_3 (ap_load_lane (F) (p0_pre) (29)) )) (PreH32 : (apr_float_lane 30 vl_pre r30_3 (ap_load_lane (F) (p0_pre) (30)) )) (PreH33 : (apr_float_lane 31 vl_pre r31_3 (ap_load_lane (F) (p0_pre) (31)) )) (PreH34 : (ap_index_active_loaded 0 vl_pre I ib_pre r0_2 )) (PreH35 : (ap_index_active_loaded 1 vl_pre I ib_pre r1_2 )) (PreH36 : (ap_index_active_loaded 2 vl_pre I ib_pre r2_2 )) (PreH37 : (ap_index_active_loaded 3 vl_pre I ib_pre r3_2 )) (PreH38 : (ap_index_active_loaded 4 vl_pre I ib_pre r4_2 )) (PreH39 : (ap_index_active_loaded 5 vl_pre I ib_pre r5_2 )) (PreH40 : (ap_index_active_loaded 6 vl_pre I ib_pre r6_2 )) (PreH41 : (ap_index_active_loaded 7 vl_pre I ib_pre r7_2 )) (PreH42 : (ap_index_active_loaded 8 vl_pre I ib_pre r8_2 )) (PreH43 : (ap_index_active_loaded 9 vl_pre I ib_pre r9_2 )) (PreH44 : (ap_index_active_loaded 10 vl_pre I ib_pre r10_2 )) (PreH45 : (ap_index_active_loaded 11 vl_pre I ib_pre r11_2 )) (PreH46 : (ap_index_active_loaded 12 vl_pre I ib_pre r12_2 )) (PreH47 : (ap_index_active_loaded 13 vl_pre I ib_pre r13_2 )) (PreH48 : (ap_index_active_loaded 14 vl_pre I ib_pre r14_2 )) (PreH49 : (ap_index_active_loaded 15 vl_pre I ib_pre r15_2 )) (PreH50 : (ap_index_active_loaded 16 vl_pre I ib_pre r16_2 )) (PreH51 : (ap_index_active_loaded 17 vl_pre I ib_pre r17_2 )) (PreH52 : (ap_index_active_loaded 18 vl_pre I ib_pre r18_2 )) (PreH53 : (ap_index_active_loaded 19 vl_pre I ib_pre r19_2 )) (PreH54 : (ap_index_active_loaded 20 vl_pre I ib_pre r20_2 )) (PreH55 : (ap_index_active_loaded 21 vl_pre I ib_pre r21_2 )) (PreH56 : (ap_index_active_loaded 22 vl_pre I ib_pre r22_2 )) (PreH57 : (ap_index_active_loaded 23 vl_pre I ib_pre r23_2 )) (PreH58 : (ap_index_active_loaded 24 vl_pre I ib_pre r24_2 )) (PreH59 : (ap_index_active_loaded 25 vl_pre I ib_pre r25_2 )) (PreH60 : (ap_index_active_loaded 26 vl_pre I ib_pre r26_2 )) (PreH61 : (ap_index_active_loaded 27 vl_pre I ib_pre r27_2 )) (PreH62 : (ap_index_active_loaded 28 vl_pre I ib_pre r28_2 )) (PreH63 : (ap_index_active_loaded 29 vl_pre I ib_pre r29_2 )) (PreH64 : (ap_index_active_loaded 30 vl_pre I ib_pre r30_2 )) (PreH65 : (ap_index_active_loaded 31 vl_pre I ib_pre r31_2 )) (PreH66 : (ap_output_active_loaded 0 vl_pre O ab_pre r0 )) (PreH67 : (ap_output_active_loaded 1 vl_pre O ab_pre r1 )) (PreH68 : (ap_output_active_loaded 2 vl_pre O ab_pre r2 )) (PreH69 : (ap_output_active_loaded 3 vl_pre O ab_pre r3 )) (PreH70 : (ap_output_active_loaded 4 vl_pre O ab_pre r4 )) (PreH71 : (ap_output_active_loaded 5 vl_pre O ab_pre r5 )) (PreH72 : (ap_output_active_loaded 6 vl_pre O ab_pre r6 )) (PreH73 : (ap_output_active_loaded 7 vl_pre O ab_pre r7 )) (PreH74 : (ap_output_active_loaded 8 vl_pre O ab_pre r8 )) (PreH75 : (ap_output_active_loaded 9 vl_pre O ab_pre r9 )) (PreH76 : (ap_output_active_loaded 10 vl_pre O ab_pre r10 )) (PreH77 : (ap_output_active_loaded 11 vl_pre O ab_pre r11 )) (PreH78 : (ap_output_active_loaded 12 vl_pre O ab_pre r12 )) (PreH79 : (ap_output_active_loaded 13 vl_pre O ab_pre r13 )) (PreH80 : (ap_output_active_loaded 14 vl_pre O ab_pre r14 )) (PreH81 : (ap_output_active_loaded 15 vl_pre O ab_pre r15 )) (PreH82 : (ap_output_active_loaded 16 vl_pre O ab_pre r16 )) (PreH83 : (ap_output_active_loaded 17 vl_pre O ab_pre r17 )) (PreH84 : (ap_output_active_loaded 18 vl_pre O ab_pre r18 )) (PreH85 : (ap_output_active_loaded 19 vl_pre O ab_pre r19 )) (PreH86 : (ap_output_active_loaded 20 vl_pre O ab_pre r20 )) (PreH87 : (ap_output_active_loaded 21 vl_pre O ab_pre r21 )) (PreH88 : (ap_output_active_loaded 22 vl_pre O ab_pre r22 )) (PreH89 : (ap_output_active_loaded 23 vl_pre O ab_pre r23 )) (PreH90 : (ap_output_active_loaded 24 vl_pre O ab_pre r24 )) (PreH91 : (ap_output_active_loaded 25 vl_pre O ab_pre r25 )) (PreH92 : (ap_output_active_loaded 26 vl_pre O ab_pre r26 )) (PreH93 : (ap_output_active_loaded 27 vl_pre O ab_pre r27 )) (PreH94 : (ap_output_active_loaded 28 vl_pre O ab_pre r28 )) (PreH95 : (ap_output_active_loaded 29 vl_pre O ab_pre r29 )) (PreH96 : (ap_output_active_loaded 30 vl_pre O ab_pre r30 )) (PreH97 : (ap_output_active_loaded 31 vl_pre O ab_pre r31 )) (PreH98 : (0 < vl_pre)) (PreH99 : (vl_pre <= 32)) (PreH100 : (ap_window F p0_pre vl_pre )) (PreH101 : (ap_window F p1_pre vl_pre )) (PreH102 : (ap_window F p2_pre vl_pre )) (PreH103 : (ap_window F p3_pre vl_pre )) (PreH104 : (ap_window F p4_pre vl_pre )) (PreH105 : (ap_window F p5_pre vl_pre )) (PreH106 : (ap_window F p6_pre vl_pre )) (PreH107 : (ap_window F p7_pre vl_pre )) (PreH108 : (ap_window F p8_pre vl_pre )) (PreH109 : (ap_write_window W output_pre vl_pre )) (PreH110 : (ap_write_window WI index_pre vl_pre )) (PreH111 : (ap_block32_previous ab_pre ib_pre )) (PreH112 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH113 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH114 : (ap_optional_write_window W ab_pre vl_pre )) (PreH115 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH116 : (ab_pre <> 0)) ,
  (StructPredvfloat32m8_t ( &( "a" ) ) R )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J_2 )
  **  (ap_data F )
  **  (ap_index WI I )
  **  (ap_output W O )
|--
  EX (A: Recordvfloat32m8_t)  (J: Recordvuint32m8_t) ,
  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 0 ) ”
  &&  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
) \/
(
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (r31_2: Z) (r30_2: Z) (r29_2: Z) (r28_2: Z) (r27_2: Z) (r26_2: Z) (r25_2: Z) (r24_2: Z) (r23_2: Z) (r22_2: Z) (r21_2: Z) (r20_2: Z) (r19_2: Z) (r18_2: Z) (r17_2: Z) (r16_2: Z) (r15_2: Z) (r14_2: Z) (r13_2: Z) (r12_2: Z) (r11_2: Z) (r10_2: Z) (r9_2: Z) (r8_2: Z) (r7_2: Z) (r6_2: Z) (r5_2: Z) (r4_2: Z) (r3_2: Z) (r2_2: Z) (r1_2: Z) (r0_2: Z) (r31_3: fp32) (r30_3: fp32) (r29_3: fp32) (r28_3: fp32) (r27_3: fp32) (r26_3: fp32) (r25_3: fp32) (r24_3: fp32) (r23_3: fp32) (r22_3: fp32) (r21_3: fp32) (r20_3: fp32) (r19_3: fp32) (r18_3: fp32) (r17_3: fp32) (r16_3: fp32) (r15_3: fp32) (r14_3: fp32) (r13_3: fp32) (r12_3: fp32) (r11_3: fp32) (r10_3: fp32) (r9_3: fp32) (r8_3: fp32) (r7_3: fp32) (r6_3: fp32) (r5_3: fp32) (r4_3: fp32) (r3_3: fp32) (r2_3: fp32) (r1_3: fp32) (r0_3: fp32) (R: Recordvfloat32m8_t) (J_2: Recordvuint32m8_t) (PreH1 : (ap_rvv_update32 R J_2 (make_record_vfloat32m8_t (r0) (r1) (r2) (r3) (r4) (r5) (r6) (r7) (r8) (r9) (r10) (r11) (r12) (r13) (r14) (r15) (r16) (r17) (r18) (r19) (r20) (r21) (r22) (r23) (r24) (r25) (r26) (r27) (r28) (r29) (r30) (r31)) (make_record_vuint32m8_t (r0_2) (r1_2) (r2_2) (r3_2) (r4_2) (r5_2) (r6_2) (r7_2) (r8_2) (r9_2) (r10_2) (r11_2) (r12_2) (r13_2) (r14_2) (r15_2) (r16_2) (r17_2) (r18_2) (r19_2) (r20_2) (r21_2) (r22_2) (r23_2) (r24_2) (r25_2) (r26_2) (r27_2) (r28_2) (r29_2) (r30_2) (r31_2)) (make_record_vfloat32m8_t (r0_3) (r1_3) (r2_3) (r3_3) (r4_3) (r5_3) (r6_3) (r7_3) (r8_3) (r9_3) (r10_3) (r11_3) (r12_3) (r13_3) (r14_3) (r15_3) (r16_3) (r17_3) (r18_3) (r19_3) (r20_3) (r21_3) (r22_3) (r23_3) (r24_3) (r25_3) (r26_3) (r27_3) (r28_3) (r29_3) (r30_3) (r31_3)) idx_pre vl_pre )) (PreH2 : (apr_float_lane 0 vl_pre r0_3 (ap_load_lane (F) (p0_pre) (0)) )) (PreH3 : (apr_float_lane 1 vl_pre r1_3 (ap_load_lane (F) (p0_pre) (1)) )) (PreH4 : (apr_float_lane 2 vl_pre r2_3 (ap_load_lane (F) (p0_pre) (2)) )) (PreH5 : (apr_float_lane 3 vl_pre r3_3 (ap_load_lane (F) (p0_pre) (3)) )) (PreH6 : (apr_float_lane 4 vl_pre r4_3 (ap_load_lane (F) (p0_pre) (4)) )) (PreH7 : (apr_float_lane 5 vl_pre r5_3 (ap_load_lane (F) (p0_pre) (5)) )) (PreH8 : (apr_float_lane 6 vl_pre r6_3 (ap_load_lane (F) (p0_pre) (6)) )) (PreH9 : (apr_float_lane 7 vl_pre r7_3 (ap_load_lane (F) (p0_pre) (7)) )) (PreH10 : (apr_float_lane 8 vl_pre r8_3 (ap_load_lane (F) (p0_pre) (8)) )) (PreH11 : (apr_float_lane 9 vl_pre r9_3 (ap_load_lane (F) (p0_pre) (9)) )) (PreH12 : (apr_float_lane 10 vl_pre r10_3 (ap_load_lane (F) (p0_pre) (10)) )) (PreH13 : (apr_float_lane 11 vl_pre r11_3 (ap_load_lane (F) (p0_pre) (11)) )) (PreH14 : (apr_float_lane 12 vl_pre r12_3 (ap_load_lane (F) (p0_pre) (12)) )) (PreH15 : (apr_float_lane 13 vl_pre r13_3 (ap_load_lane (F) (p0_pre) (13)) )) (PreH16 : (apr_float_lane 14 vl_pre r14_3 (ap_load_lane (F) (p0_pre) (14)) )) (PreH17 : (apr_float_lane 15 vl_pre r15_3 (ap_load_lane (F) (p0_pre) (15)) )) (PreH18 : (apr_float_lane 16 vl_pre r16_3 (ap_load_lane (F) (p0_pre) (16)) )) (PreH19 : (apr_float_lane 17 vl_pre r17_3 (ap_load_lane (F) (p0_pre) (17)) )) (PreH20 : (apr_float_lane 18 vl_pre r18_3 (ap_load_lane (F) (p0_pre) (18)) )) (PreH21 : (apr_float_lane 19 vl_pre r19_3 (ap_load_lane (F) (p0_pre) (19)) )) (PreH22 : (apr_float_lane 20 vl_pre r20_3 (ap_load_lane (F) (p0_pre) (20)) )) (PreH23 : (apr_float_lane 21 vl_pre r21_3 (ap_load_lane (F) (p0_pre) (21)) )) (PreH24 : (apr_float_lane 22 vl_pre r22_3 (ap_load_lane (F) (p0_pre) (22)) )) (PreH25 : (apr_float_lane 23 vl_pre r23_3 (ap_load_lane (F) (p0_pre) (23)) )) (PreH26 : (apr_float_lane 24 vl_pre r24_3 (ap_load_lane (F) (p0_pre) (24)) )) (PreH27 : (apr_float_lane 25 vl_pre r25_3 (ap_load_lane (F) (p0_pre) (25)) )) (PreH28 : (apr_float_lane 26 vl_pre r26_3 (ap_load_lane (F) (p0_pre) (26)) )) (PreH29 : (apr_float_lane 27 vl_pre r27_3 (ap_load_lane (F) (p0_pre) (27)) )) (PreH30 : (apr_float_lane 28 vl_pre r28_3 (ap_load_lane (F) (p0_pre) (28)) )) (PreH31 : (apr_float_lane 29 vl_pre r29_3 (ap_load_lane (F) (p0_pre) (29)) )) (PreH32 : (apr_float_lane 30 vl_pre r30_3 (ap_load_lane (F) (p0_pre) (30)) )) (PreH33 : (apr_float_lane 31 vl_pre r31_3 (ap_load_lane (F) (p0_pre) (31)) )) (PreH34 : (ap_index_active_loaded 0 vl_pre I ib_pre r0_2 )) (PreH35 : (ap_index_active_loaded 1 vl_pre I ib_pre r1_2 )) (PreH36 : (ap_index_active_loaded 2 vl_pre I ib_pre r2_2 )) (PreH37 : (ap_index_active_loaded 3 vl_pre I ib_pre r3_2 )) (PreH38 : (ap_index_active_loaded 4 vl_pre I ib_pre r4_2 )) (PreH39 : (ap_index_active_loaded 5 vl_pre I ib_pre r5_2 )) (PreH40 : (ap_index_active_loaded 6 vl_pre I ib_pre r6_2 )) (PreH41 : (ap_index_active_loaded 7 vl_pre I ib_pre r7_2 )) (PreH42 : (ap_index_active_loaded 8 vl_pre I ib_pre r8_2 )) (PreH43 : (ap_index_active_loaded 9 vl_pre I ib_pre r9_2 )) (PreH44 : (ap_index_active_loaded 10 vl_pre I ib_pre r10_2 )) (PreH45 : (ap_index_active_loaded 11 vl_pre I ib_pre r11_2 )) (PreH46 : (ap_index_active_loaded 12 vl_pre I ib_pre r12_2 )) (PreH47 : (ap_index_active_loaded 13 vl_pre I ib_pre r13_2 )) (PreH48 : (ap_index_active_loaded 14 vl_pre I ib_pre r14_2 )) (PreH49 : (ap_index_active_loaded 15 vl_pre I ib_pre r15_2 )) (PreH50 : (ap_index_active_loaded 16 vl_pre I ib_pre r16_2 )) (PreH51 : (ap_index_active_loaded 17 vl_pre I ib_pre r17_2 )) (PreH52 : (ap_index_active_loaded 18 vl_pre I ib_pre r18_2 )) (PreH53 : (ap_index_active_loaded 19 vl_pre I ib_pre r19_2 )) (PreH54 : (ap_index_active_loaded 20 vl_pre I ib_pre r20_2 )) (PreH55 : (ap_index_active_loaded 21 vl_pre I ib_pre r21_2 )) (PreH56 : (ap_index_active_loaded 22 vl_pre I ib_pre r22_2 )) (PreH57 : (ap_index_active_loaded 23 vl_pre I ib_pre r23_2 )) (PreH58 : (ap_index_active_loaded 24 vl_pre I ib_pre r24_2 )) (PreH59 : (ap_index_active_loaded 25 vl_pre I ib_pre r25_2 )) (PreH60 : (ap_index_active_loaded 26 vl_pre I ib_pre r26_2 )) (PreH61 : (ap_index_active_loaded 27 vl_pre I ib_pre r27_2 )) (PreH62 : (ap_index_active_loaded 28 vl_pre I ib_pre r28_2 )) (PreH63 : (ap_index_active_loaded 29 vl_pre I ib_pre r29_2 )) (PreH64 : (ap_index_active_loaded 30 vl_pre I ib_pre r30_2 )) (PreH65 : (ap_index_active_loaded 31 vl_pre I ib_pre r31_2 )) (PreH66 : (ap_output_active_loaded 0 vl_pre O ab_pre r0 )) (PreH67 : (ap_output_active_loaded 1 vl_pre O ab_pre r1 )) (PreH68 : (ap_output_active_loaded 2 vl_pre O ab_pre r2 )) (PreH69 : (ap_output_active_loaded 3 vl_pre O ab_pre r3 )) (PreH70 : (ap_output_active_loaded 4 vl_pre O ab_pre r4 )) (PreH71 : (ap_output_active_loaded 5 vl_pre O ab_pre r5 )) (PreH72 : (ap_output_active_loaded 6 vl_pre O ab_pre r6 )) (PreH73 : (ap_output_active_loaded 7 vl_pre O ab_pre r7 )) (PreH74 : (ap_output_active_loaded 8 vl_pre O ab_pre r8 )) (PreH75 : (ap_output_active_loaded 9 vl_pre O ab_pre r9 )) (PreH76 : (ap_output_active_loaded 10 vl_pre O ab_pre r10 )) (PreH77 : (ap_output_active_loaded 11 vl_pre O ab_pre r11 )) (PreH78 : (ap_output_active_loaded 12 vl_pre O ab_pre r12 )) (PreH79 : (ap_output_active_loaded 13 vl_pre O ab_pre r13 )) (PreH80 : (ap_output_active_loaded 14 vl_pre O ab_pre r14 )) (PreH81 : (ap_output_active_loaded 15 vl_pre O ab_pre r15 )) (PreH82 : (ap_output_active_loaded 16 vl_pre O ab_pre r16 )) (PreH83 : (ap_output_active_loaded 17 vl_pre O ab_pre r17 )) (PreH84 : (ap_output_active_loaded 18 vl_pre O ab_pre r18 )) (PreH85 : (ap_output_active_loaded 19 vl_pre O ab_pre r19 )) (PreH86 : (ap_output_active_loaded 20 vl_pre O ab_pre r20 )) (PreH87 : (ap_output_active_loaded 21 vl_pre O ab_pre r21 )) (PreH88 : (ap_output_active_loaded 22 vl_pre O ab_pre r22 )) (PreH89 : (ap_output_active_loaded 23 vl_pre O ab_pre r23 )) (PreH90 : (ap_output_active_loaded 24 vl_pre O ab_pre r24 )) (PreH91 : (ap_output_active_loaded 25 vl_pre O ab_pre r25 )) (PreH92 : (ap_output_active_loaded 26 vl_pre O ab_pre r26 )) (PreH93 : (ap_output_active_loaded 27 vl_pre O ab_pre r27 )) (PreH94 : (ap_output_active_loaded 28 vl_pre O ab_pre r28 )) (PreH95 : (ap_output_active_loaded 29 vl_pre O ab_pre r29 )) (PreH96 : (ap_output_active_loaded 30 vl_pre O ab_pre r30 )) (PreH97 : (ap_output_active_loaded 31 vl_pre O ab_pre r31 )) (PreH98 : (0 < vl_pre)) (PreH99 : (vl_pre <= 32)) (PreH100 : (ap_window F p0_pre vl_pre )) (PreH101 : (ap_window F p1_pre vl_pre )) (PreH102 : (ap_window F p2_pre vl_pre )) (PreH103 : (ap_window F p3_pre vl_pre )) (PreH104 : (ap_window F p4_pre vl_pre )) (PreH105 : (ap_window F p5_pre vl_pre )) (PreH106 : (ap_window F p6_pre vl_pre )) (PreH107 : (ap_window F p7_pre vl_pre )) (PreH108 : (ap_window F p8_pre vl_pre )) (PreH109 : (ap_write_window W output_pre vl_pre )) (PreH110 : (ap_write_window WI index_pre vl_pre )) (PreH111 : (ap_block32_previous ab_pre ib_pre )) (PreH112 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH113 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH114 : (ap_optional_write_window W ab_pre vl_pre )) (PreH115 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH116 : (ab_pre <> 0)) ,
  TT && emp 
|--
  “ (ap_block32_acc R J_2 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 0 ) ”
  &&  emp
).

Definition ap_rvv_block32_entail_wit_1_1_split_goal_1 := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (r31_2: Z) (r30_2: Z) (r29_2: Z) (r28_2: Z) (r27_2: Z) (r26_2: Z) (r25_2: Z) (r24_2: Z) (r23_2: Z) (r22_2: Z) (r21_2: Z) (r20_2: Z) (r19_2: Z) (r18_2: Z) (r17_2: Z) (r16_2: Z) (r15_2: Z) (r14_2: Z) (r13_2: Z) (r12_2: Z) (r11_2: Z) (r10_2: Z) (r9_2: Z) (r8_2: Z) (r7_2: Z) (r6_2: Z) (r5_2: Z) (r4_2: Z) (r3_2: Z) (r2_2: Z) (r1_2: Z) (r0_2: Z) (r31_3: fp32) (r30_3: fp32) (r29_3: fp32) (r28_3: fp32) (r27_3: fp32) (r26_3: fp32) (r25_3: fp32) (r24_3: fp32) (r23_3: fp32) (r22_3: fp32) (r21_3: fp32) (r20_3: fp32) (r19_3: fp32) (r18_3: fp32) (r17_3: fp32) (r16_3: fp32) (r15_3: fp32) (r14_3: fp32) (r13_3: fp32) (r12_3: fp32) (r11_3: fp32) (r10_3: fp32) (r9_3: fp32) (r8_3: fp32) (r7_3: fp32) (r6_3: fp32) (r5_3: fp32) (r4_3: fp32) (r3_3: fp32) (r2_3: fp32) (r1_3: fp32) (r0_3: fp32) (R: Recordvfloat32m8_t) (J_2: Recordvuint32m8_t) (PreH1 : (ap_rvv_update32 R J_2 (make_record_vfloat32m8_t (r0) (r1) (r2) (r3) (r4) (r5) (r6) (r7) (r8) (r9) (r10) (r11) (r12) (r13) (r14) (r15) (r16) (r17) (r18) (r19) (r20) (r21) (r22) (r23) (r24) (r25) (r26) (r27) (r28) (r29) (r30) (r31)) (make_record_vuint32m8_t (r0_2) (r1_2) (r2_2) (r3_2) (r4_2) (r5_2) (r6_2) (r7_2) (r8_2) (r9_2) (r10_2) (r11_2) (r12_2) (r13_2) (r14_2) (r15_2) (r16_2) (r17_2) (r18_2) (r19_2) (r20_2) (r21_2) (r22_2) (r23_2) (r24_2) (r25_2) (r26_2) (r27_2) (r28_2) (r29_2) (r30_2) (r31_2)) (make_record_vfloat32m8_t (r0_3) (r1_3) (r2_3) (r3_3) (r4_3) (r5_3) (r6_3) (r7_3) (r8_3) (r9_3) (r10_3) (r11_3) (r12_3) (r13_3) (r14_3) (r15_3) (r16_3) (r17_3) (r18_3) (r19_3) (r20_3) (r21_3) (r22_3) (r23_3) (r24_3) (r25_3) (r26_3) (r27_3) (r28_3) (r29_3) (r30_3) (r31_3)) idx_pre vl_pre )) (PreH2 : (apr_float_lane 0 vl_pre r0_3 (ap_load_lane (F) (p0_pre) (0)) )) (PreH3 : (apr_float_lane 1 vl_pre r1_3 (ap_load_lane (F) (p0_pre) (1)) )) (PreH4 : (apr_float_lane 2 vl_pre r2_3 (ap_load_lane (F) (p0_pre) (2)) )) (PreH5 : (apr_float_lane 3 vl_pre r3_3 (ap_load_lane (F) (p0_pre) (3)) )) (PreH6 : (apr_float_lane 4 vl_pre r4_3 (ap_load_lane (F) (p0_pre) (4)) )) (PreH7 : (apr_float_lane 5 vl_pre r5_3 (ap_load_lane (F) (p0_pre) (5)) )) (PreH8 : (apr_float_lane 6 vl_pre r6_3 (ap_load_lane (F) (p0_pre) (6)) )) (PreH9 : (apr_float_lane 7 vl_pre r7_3 (ap_load_lane (F) (p0_pre) (7)) )) (PreH10 : (apr_float_lane 8 vl_pre r8_3 (ap_load_lane (F) (p0_pre) (8)) )) (PreH11 : (apr_float_lane 9 vl_pre r9_3 (ap_load_lane (F) (p0_pre) (9)) )) (PreH12 : (apr_float_lane 10 vl_pre r10_3 (ap_load_lane (F) (p0_pre) (10)) )) (PreH13 : (apr_float_lane 11 vl_pre r11_3 (ap_load_lane (F) (p0_pre) (11)) )) (PreH14 : (apr_float_lane 12 vl_pre r12_3 (ap_load_lane (F) (p0_pre) (12)) )) (PreH15 : (apr_float_lane 13 vl_pre r13_3 (ap_load_lane (F) (p0_pre) (13)) )) (PreH16 : (apr_float_lane 14 vl_pre r14_3 (ap_load_lane (F) (p0_pre) (14)) )) (PreH17 : (apr_float_lane 15 vl_pre r15_3 (ap_load_lane (F) (p0_pre) (15)) )) (PreH18 : (apr_float_lane 16 vl_pre r16_3 (ap_load_lane (F) (p0_pre) (16)) )) (PreH19 : (apr_float_lane 17 vl_pre r17_3 (ap_load_lane (F) (p0_pre) (17)) )) (PreH20 : (apr_float_lane 18 vl_pre r18_3 (ap_load_lane (F) (p0_pre) (18)) )) (PreH21 : (apr_float_lane 19 vl_pre r19_3 (ap_load_lane (F) (p0_pre) (19)) )) (PreH22 : (apr_float_lane 20 vl_pre r20_3 (ap_load_lane (F) (p0_pre) (20)) )) (PreH23 : (apr_float_lane 21 vl_pre r21_3 (ap_load_lane (F) (p0_pre) (21)) )) (PreH24 : (apr_float_lane 22 vl_pre r22_3 (ap_load_lane (F) (p0_pre) (22)) )) (PreH25 : (apr_float_lane 23 vl_pre r23_3 (ap_load_lane (F) (p0_pre) (23)) )) (PreH26 : (apr_float_lane 24 vl_pre r24_3 (ap_load_lane (F) (p0_pre) (24)) )) (PreH27 : (apr_float_lane 25 vl_pre r25_3 (ap_load_lane (F) (p0_pre) (25)) )) (PreH28 : (apr_float_lane 26 vl_pre r26_3 (ap_load_lane (F) (p0_pre) (26)) )) (PreH29 : (apr_float_lane 27 vl_pre r27_3 (ap_load_lane (F) (p0_pre) (27)) )) (PreH30 : (apr_float_lane 28 vl_pre r28_3 (ap_load_lane (F) (p0_pre) (28)) )) (PreH31 : (apr_float_lane 29 vl_pre r29_3 (ap_load_lane (F) (p0_pre) (29)) )) (PreH32 : (apr_float_lane 30 vl_pre r30_3 (ap_load_lane (F) (p0_pre) (30)) )) (PreH33 : (apr_float_lane 31 vl_pre r31_3 (ap_load_lane (F) (p0_pre) (31)) )) (PreH34 : (ap_index_active_loaded 0 vl_pre I ib_pre r0_2 )) (PreH35 : (ap_index_active_loaded 1 vl_pre I ib_pre r1_2 )) (PreH36 : (ap_index_active_loaded 2 vl_pre I ib_pre r2_2 )) (PreH37 : (ap_index_active_loaded 3 vl_pre I ib_pre r3_2 )) (PreH38 : (ap_index_active_loaded 4 vl_pre I ib_pre r4_2 )) (PreH39 : (ap_index_active_loaded 5 vl_pre I ib_pre r5_2 )) (PreH40 : (ap_index_active_loaded 6 vl_pre I ib_pre r6_2 )) (PreH41 : (ap_index_active_loaded 7 vl_pre I ib_pre r7_2 )) (PreH42 : (ap_index_active_loaded 8 vl_pre I ib_pre r8_2 )) (PreH43 : (ap_index_active_loaded 9 vl_pre I ib_pre r9_2 )) (PreH44 : (ap_index_active_loaded 10 vl_pre I ib_pre r10_2 )) (PreH45 : (ap_index_active_loaded 11 vl_pre I ib_pre r11_2 )) (PreH46 : (ap_index_active_loaded 12 vl_pre I ib_pre r12_2 )) (PreH47 : (ap_index_active_loaded 13 vl_pre I ib_pre r13_2 )) (PreH48 : (ap_index_active_loaded 14 vl_pre I ib_pre r14_2 )) (PreH49 : (ap_index_active_loaded 15 vl_pre I ib_pre r15_2 )) (PreH50 : (ap_index_active_loaded 16 vl_pre I ib_pre r16_2 )) (PreH51 : (ap_index_active_loaded 17 vl_pre I ib_pre r17_2 )) (PreH52 : (ap_index_active_loaded 18 vl_pre I ib_pre r18_2 )) (PreH53 : (ap_index_active_loaded 19 vl_pre I ib_pre r19_2 )) (PreH54 : (ap_index_active_loaded 20 vl_pre I ib_pre r20_2 )) (PreH55 : (ap_index_active_loaded 21 vl_pre I ib_pre r21_2 )) (PreH56 : (ap_index_active_loaded 22 vl_pre I ib_pre r22_2 )) (PreH57 : (ap_index_active_loaded 23 vl_pre I ib_pre r23_2 )) (PreH58 : (ap_index_active_loaded 24 vl_pre I ib_pre r24_2 )) (PreH59 : (ap_index_active_loaded 25 vl_pre I ib_pre r25_2 )) (PreH60 : (ap_index_active_loaded 26 vl_pre I ib_pre r26_2 )) (PreH61 : (ap_index_active_loaded 27 vl_pre I ib_pre r27_2 )) (PreH62 : (ap_index_active_loaded 28 vl_pre I ib_pre r28_2 )) (PreH63 : (ap_index_active_loaded 29 vl_pre I ib_pre r29_2 )) (PreH64 : (ap_index_active_loaded 30 vl_pre I ib_pre r30_2 )) (PreH65 : (ap_index_active_loaded 31 vl_pre I ib_pre r31_2 )) (PreH66 : (ap_output_active_loaded 0 vl_pre O ab_pre r0 )) (PreH67 : (ap_output_active_loaded 1 vl_pre O ab_pre r1 )) (PreH68 : (ap_output_active_loaded 2 vl_pre O ab_pre r2 )) (PreH69 : (ap_output_active_loaded 3 vl_pre O ab_pre r3 )) (PreH70 : (ap_output_active_loaded 4 vl_pre O ab_pre r4 )) (PreH71 : (ap_output_active_loaded 5 vl_pre O ab_pre r5 )) (PreH72 : (ap_output_active_loaded 6 vl_pre O ab_pre r6 )) (PreH73 : (ap_output_active_loaded 7 vl_pre O ab_pre r7 )) (PreH74 : (ap_output_active_loaded 8 vl_pre O ab_pre r8 )) (PreH75 : (ap_output_active_loaded 9 vl_pre O ab_pre r9 )) (PreH76 : (ap_output_active_loaded 10 vl_pre O ab_pre r10 )) (PreH77 : (ap_output_active_loaded 11 vl_pre O ab_pre r11 )) (PreH78 : (ap_output_active_loaded 12 vl_pre O ab_pre r12 )) (PreH79 : (ap_output_active_loaded 13 vl_pre O ab_pre r13 )) (PreH80 : (ap_output_active_loaded 14 vl_pre O ab_pre r14 )) (PreH81 : (ap_output_active_loaded 15 vl_pre O ab_pre r15 )) (PreH82 : (ap_output_active_loaded 16 vl_pre O ab_pre r16 )) (PreH83 : (ap_output_active_loaded 17 vl_pre O ab_pre r17 )) (PreH84 : (ap_output_active_loaded 18 vl_pre O ab_pre r18 )) (PreH85 : (ap_output_active_loaded 19 vl_pre O ab_pre r19 )) (PreH86 : (ap_output_active_loaded 20 vl_pre O ab_pre r20 )) (PreH87 : (ap_output_active_loaded 21 vl_pre O ab_pre r21 )) (PreH88 : (ap_output_active_loaded 22 vl_pre O ab_pre r22 )) (PreH89 : (ap_output_active_loaded 23 vl_pre O ab_pre r23 )) (PreH90 : (ap_output_active_loaded 24 vl_pre O ab_pre r24 )) (PreH91 : (ap_output_active_loaded 25 vl_pre O ab_pre r25 )) (PreH92 : (ap_output_active_loaded 26 vl_pre O ab_pre r26 )) (PreH93 : (ap_output_active_loaded 27 vl_pre O ab_pre r27 )) (PreH94 : (ap_output_active_loaded 28 vl_pre O ab_pre r28 )) (PreH95 : (ap_output_active_loaded 29 vl_pre O ab_pre r29 )) (PreH96 : (ap_output_active_loaded 30 vl_pre O ab_pre r30 )) (PreH97 : (ap_output_active_loaded 31 vl_pre O ab_pre r31 )) (PreH98 : (0 < vl_pre)) (PreH99 : (vl_pre <= 32)) (PreH100 : (ap_window F p0_pre vl_pre )) (PreH101 : (ap_window F p1_pre vl_pre )) (PreH102 : (ap_window F p2_pre vl_pre )) (PreH103 : (ap_window F p3_pre vl_pre )) (PreH104 : (ap_window F p4_pre vl_pre )) (PreH105 : (ap_window F p5_pre vl_pre )) (PreH106 : (ap_window F p6_pre vl_pre )) (PreH107 : (ap_window F p7_pre vl_pre )) (PreH108 : (ap_window F p8_pre vl_pre )) (PreH109 : (ap_write_window W output_pre vl_pre )) (PreH110 : (ap_write_window WI index_pre vl_pre )) (PreH111 : (ap_block32_previous ab_pre ib_pre )) (PreH112 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH113 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH114 : (ap_optional_write_window W ab_pre vl_pre )) (PreH115 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH116 : (ab_pre <> 0)) ,
  (ap_block32_acc R J_2 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 0 )
.

Definition ap_rvv_block32_entail_wit_1_2 := 
(
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (r31_2: Z) (r30_2: Z) (r29_2: Z) (r28_2: Z) (r27_2: Z) (r26_2: Z) (r25_2: Z) (r24_2: Z) (r23_2: Z) (r22_2: Z) (r21_2: Z) (r20_2: Z) (r19_2: Z) (r18_2: Z) (r17_2: Z) (r16_2: Z) (r15_2: Z) (r14_2: Z) (r13_2: Z) (r12_2: Z) (r11_2: Z) (r10_2: Z) (r9_2: Z) (r8_2: Z) (r7_2: Z) (r6_2: Z) (r5_2: Z) (r4_2: Z) (r3_2: Z) (r2_2: Z) (r1_2: Z) (r0_2: Z) (PreH1 : (apr_int_lane 0 vl_pre r0_2 (ap_u32 (idx_pre)) )) (PreH2 : (apr_int_lane 1 vl_pre r1_2 (ap_u32 (idx_pre)) )) (PreH3 : (apr_int_lane 2 vl_pre r2_2 (ap_u32 (idx_pre)) )) (PreH4 : (apr_int_lane 3 vl_pre r3_2 (ap_u32 (idx_pre)) )) (PreH5 : (apr_int_lane 4 vl_pre r4_2 (ap_u32 (idx_pre)) )) (PreH6 : (apr_int_lane 5 vl_pre r5_2 (ap_u32 (idx_pre)) )) (PreH7 : (apr_int_lane 6 vl_pre r6_2 (ap_u32 (idx_pre)) )) (PreH8 : (apr_int_lane 7 vl_pre r7_2 (ap_u32 (idx_pre)) )) (PreH9 : (apr_int_lane 8 vl_pre r8_2 (ap_u32 (idx_pre)) )) (PreH10 : (apr_int_lane 9 vl_pre r9_2 (ap_u32 (idx_pre)) )) (PreH11 : (apr_int_lane 10 vl_pre r10_2 (ap_u32 (idx_pre)) )) (PreH12 : (apr_int_lane 11 vl_pre r11_2 (ap_u32 (idx_pre)) )) (PreH13 : (apr_int_lane 12 vl_pre r12_2 (ap_u32 (idx_pre)) )) (PreH14 : (apr_int_lane 13 vl_pre r13_2 (ap_u32 (idx_pre)) )) (PreH15 : (apr_int_lane 14 vl_pre r14_2 (ap_u32 (idx_pre)) )) (PreH16 : (apr_int_lane 15 vl_pre r15_2 (ap_u32 (idx_pre)) )) (PreH17 : (apr_int_lane 16 vl_pre r16_2 (ap_u32 (idx_pre)) )) (PreH18 : (apr_int_lane 17 vl_pre r17_2 (ap_u32 (idx_pre)) )) (PreH19 : (apr_int_lane 18 vl_pre r18_2 (ap_u32 (idx_pre)) )) (PreH20 : (apr_int_lane 19 vl_pre r19_2 (ap_u32 (idx_pre)) )) (PreH21 : (apr_int_lane 20 vl_pre r20_2 (ap_u32 (idx_pre)) )) (PreH22 : (apr_int_lane 21 vl_pre r21_2 (ap_u32 (idx_pre)) )) (PreH23 : (apr_int_lane 22 vl_pre r22_2 (ap_u32 (idx_pre)) )) (PreH24 : (apr_int_lane 23 vl_pre r23_2 (ap_u32 (idx_pre)) )) (PreH25 : (apr_int_lane 24 vl_pre r24_2 (ap_u32 (idx_pre)) )) (PreH26 : (apr_int_lane 25 vl_pre r25_2 (ap_u32 (idx_pre)) )) (PreH27 : (apr_int_lane 26 vl_pre r26_2 (ap_u32 (idx_pre)) )) (PreH28 : (apr_int_lane 27 vl_pre r27_2 (ap_u32 (idx_pre)) )) (PreH29 : (apr_int_lane 28 vl_pre r28_2 (ap_u32 (idx_pre)) )) (PreH30 : (apr_int_lane 29 vl_pre r29_2 (ap_u32 (idx_pre)) )) (PreH31 : (apr_int_lane 30 vl_pre r30_2 (ap_u32 (idx_pre)) )) (PreH32 : (apr_int_lane 31 vl_pre r31_2 (ap_u32 (idx_pre)) )) (PreH33 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p0_pre) (0)) )) (PreH34 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p0_pre) (1)) )) (PreH35 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p0_pre) (2)) )) (PreH36 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p0_pre) (3)) )) (PreH37 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p0_pre) (4)) )) (PreH38 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p0_pre) (5)) )) (PreH39 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p0_pre) (6)) )) (PreH40 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p0_pre) (7)) )) (PreH41 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p0_pre) (8)) )) (PreH42 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p0_pre) (9)) )) (PreH43 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p0_pre) (10)) )) (PreH44 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p0_pre) (11)) )) (PreH45 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p0_pre) (12)) )) (PreH46 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p0_pre) (13)) )) (PreH47 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p0_pre) (14)) )) (PreH48 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p0_pre) (15)) )) (PreH49 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p0_pre) (16)) )) (PreH50 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p0_pre) (17)) )) (PreH51 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p0_pre) (18)) )) (PreH52 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p0_pre) (19)) )) (PreH53 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p0_pre) (20)) )) (PreH54 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p0_pre) (21)) )) (PreH55 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p0_pre) (22)) )) (PreH56 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p0_pre) (23)) )) (PreH57 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p0_pre) (24)) )) (PreH58 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p0_pre) (25)) )) (PreH59 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p0_pre) (26)) )) (PreH60 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p0_pre) (27)) )) (PreH61 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p0_pre) (28)) )) (PreH62 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p0_pre) (29)) )) (PreH63 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p0_pre) (30)) )) (PreH64 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p0_pre) (31)) )) (PreH65 : (0 < vl_pre)) (PreH66 : (vl_pre <= 32)) (PreH67 : (ap_window F p0_pre vl_pre )) (PreH68 : (ap_window F p1_pre vl_pre )) (PreH69 : (ap_window F p2_pre vl_pre )) (PreH70 : (ap_window F p3_pre vl_pre )) (PreH71 : (ap_window F p4_pre vl_pre )) (PreH72 : (ap_window F p5_pre vl_pre )) (PreH73 : (ap_window F p6_pre vl_pre )) (PreH74 : (ap_window F p7_pre vl_pre )) (PreH75 : (ap_window F p8_pre vl_pre )) (PreH76 : (ap_write_window W output_pre vl_pre )) (PreH77 : (ap_write_window WI index_pre vl_pre )) (PreH78 : (ap_block32_previous ab_pre ib_pre )) (PreH79 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH80 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH81 : (ap_optional_write_window W ab_pre vl_pre )) (PreH82 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH83 : (ab_pre = 0)) ,
  ((&(( &( "i" ) )->ₛ "s31")) # UInt  |-> r31_2)
  **  ((&(( &( "i" ) )->ₛ "s30")) # UInt  |-> r30_2)
  **  ((&(( &( "i" ) )->ₛ "s29")) # UInt  |-> r29_2)
  **  ((&(( &( "i" ) )->ₛ "s28")) # UInt  |-> r28_2)
  **  ((&(( &( "i" ) )->ₛ "s27")) # UInt  |-> r27_2)
  **  ((&(( &( "i" ) )->ₛ "s26")) # UInt  |-> r26_2)
  **  ((&(( &( "i" ) )->ₛ "s25")) # UInt  |-> r25_2)
  **  ((&(( &( "i" ) )->ₛ "s24")) # UInt  |-> r24_2)
  **  ((&(( &( "i" ) )->ₛ "s23")) # UInt  |-> r23_2)
  **  ((&(( &( "i" ) )->ₛ "s22")) # UInt  |-> r22_2)
  **  ((&(( &( "i" ) )->ₛ "s21")) # UInt  |-> r21_2)
  **  ((&(( &( "i" ) )->ₛ "s20")) # UInt  |-> r20_2)
  **  ((&(( &( "i" ) )->ₛ "s19")) # UInt  |-> r19_2)
  **  ((&(( &( "i" ) )->ₛ "s18")) # UInt  |-> r18_2)
  **  ((&(( &( "i" ) )->ₛ "s17")) # UInt  |-> r17_2)
  **  ((&(( &( "i" ) )->ₛ "s16")) # UInt  |-> r16_2)
  **  ((&(( &( "i" ) )->ₛ "s15")) # UInt  |-> r15_2)
  **  ((&(( &( "i" ) )->ₛ "s14")) # UInt  |-> r14_2)
  **  ((&(( &( "i" ) )->ₛ "s13")) # UInt  |-> r13_2)
  **  ((&(( &( "i" ) )->ₛ "s12")) # UInt  |-> r12_2)
  **  ((&(( &( "i" ) )->ₛ "s11")) # UInt  |-> r11_2)
  **  ((&(( &( "i" ) )->ₛ "s10")) # UInt  |-> r10_2)
  **  ((&(( &( "i" ) )->ₛ "s9")) # UInt  |-> r9_2)
  **  ((&(( &( "i" ) )->ₛ "s8")) # UInt  |-> r8_2)
  **  ((&(( &( "i" ) )->ₛ "s7")) # UInt  |-> r7_2)
  **  ((&(( &( "i" ) )->ₛ "s6")) # UInt  |-> r6_2)
  **  ((&(( &( "i" ) )->ₛ "s5")) # UInt  |-> r5_2)
  **  ((&(( &( "i" ) )->ₛ "s4")) # UInt  |-> r4_2)
  **  ((&(( &( "i" ) )->ₛ "s3")) # UInt  |-> r3_2)
  **  ((&(( &( "i" ) )->ₛ "s2")) # UInt  |-> r2_2)
  **  ((&(( &( "i" ) )->ₛ "s1")) # UInt  |-> r1_2)
  **  ((&(( &( "i" ) )->ₛ "s0")) # UInt  |-> r0_2)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
|--
  EX (A: Recordvfloat32m8_t)  (J: Recordvuint32m8_t) ,
  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 0 ) ”
  &&  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
) \/
(
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (r31_2: Z) (r30_2: Z) (r29_2: Z) (r28_2: Z) (r27_2: Z) (r26_2: Z) (r25_2: Z) (r24_2: Z) (r23_2: Z) (r22_2: Z) (r21_2: Z) (r20_2: Z) (r19_2: Z) (r18_2: Z) (r17_2: Z) (r16_2: Z) (r15_2: Z) (r14_2: Z) (r13_2: Z) (r12_2: Z) (r11_2: Z) (r10_2: Z) (r9_2: Z) (r8_2: Z) (r7_2: Z) (r6_2: Z) (r5_2: Z) (r4_2: Z) (r3_2: Z) (r2_2: Z) (r1_2: Z) (r0_2: Z) (PreH1 : (apr_int_lane 0 vl_pre r0_2 (ap_u32 (idx_pre)) )) (PreH2 : (apr_int_lane 1 vl_pre r1_2 (ap_u32 (idx_pre)) )) (PreH3 : (apr_int_lane 2 vl_pre r2_2 (ap_u32 (idx_pre)) )) (PreH4 : (apr_int_lane 3 vl_pre r3_2 (ap_u32 (idx_pre)) )) (PreH5 : (apr_int_lane 4 vl_pre r4_2 (ap_u32 (idx_pre)) )) (PreH6 : (apr_int_lane 5 vl_pre r5_2 (ap_u32 (idx_pre)) )) (PreH7 : (apr_int_lane 6 vl_pre r6_2 (ap_u32 (idx_pre)) )) (PreH8 : (apr_int_lane 7 vl_pre r7_2 (ap_u32 (idx_pre)) )) (PreH9 : (apr_int_lane 8 vl_pre r8_2 (ap_u32 (idx_pre)) )) (PreH10 : (apr_int_lane 9 vl_pre r9_2 (ap_u32 (idx_pre)) )) (PreH11 : (apr_int_lane 10 vl_pre r10_2 (ap_u32 (idx_pre)) )) (PreH12 : (apr_int_lane 11 vl_pre r11_2 (ap_u32 (idx_pre)) )) (PreH13 : (apr_int_lane 12 vl_pre r12_2 (ap_u32 (idx_pre)) )) (PreH14 : (apr_int_lane 13 vl_pre r13_2 (ap_u32 (idx_pre)) )) (PreH15 : (apr_int_lane 14 vl_pre r14_2 (ap_u32 (idx_pre)) )) (PreH16 : (apr_int_lane 15 vl_pre r15_2 (ap_u32 (idx_pre)) )) (PreH17 : (apr_int_lane 16 vl_pre r16_2 (ap_u32 (idx_pre)) )) (PreH18 : (apr_int_lane 17 vl_pre r17_2 (ap_u32 (idx_pre)) )) (PreH19 : (apr_int_lane 18 vl_pre r18_2 (ap_u32 (idx_pre)) )) (PreH20 : (apr_int_lane 19 vl_pre r19_2 (ap_u32 (idx_pre)) )) (PreH21 : (apr_int_lane 20 vl_pre r20_2 (ap_u32 (idx_pre)) )) (PreH22 : (apr_int_lane 21 vl_pre r21_2 (ap_u32 (idx_pre)) )) (PreH23 : (apr_int_lane 22 vl_pre r22_2 (ap_u32 (idx_pre)) )) (PreH24 : (apr_int_lane 23 vl_pre r23_2 (ap_u32 (idx_pre)) )) (PreH25 : (apr_int_lane 24 vl_pre r24_2 (ap_u32 (idx_pre)) )) (PreH26 : (apr_int_lane 25 vl_pre r25_2 (ap_u32 (idx_pre)) )) (PreH27 : (apr_int_lane 26 vl_pre r26_2 (ap_u32 (idx_pre)) )) (PreH28 : (apr_int_lane 27 vl_pre r27_2 (ap_u32 (idx_pre)) )) (PreH29 : (apr_int_lane 28 vl_pre r28_2 (ap_u32 (idx_pre)) )) (PreH30 : (apr_int_lane 29 vl_pre r29_2 (ap_u32 (idx_pre)) )) (PreH31 : (apr_int_lane 30 vl_pre r30_2 (ap_u32 (idx_pre)) )) (PreH32 : (apr_int_lane 31 vl_pre r31_2 (ap_u32 (idx_pre)) )) (PreH33 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p0_pre) (0)) )) (PreH34 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p0_pre) (1)) )) (PreH35 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p0_pre) (2)) )) (PreH36 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p0_pre) (3)) )) (PreH37 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p0_pre) (4)) )) (PreH38 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p0_pre) (5)) )) (PreH39 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p0_pre) (6)) )) (PreH40 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p0_pre) (7)) )) (PreH41 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p0_pre) (8)) )) (PreH42 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p0_pre) (9)) )) (PreH43 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p0_pre) (10)) )) (PreH44 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p0_pre) (11)) )) (PreH45 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p0_pre) (12)) )) (PreH46 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p0_pre) (13)) )) (PreH47 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p0_pre) (14)) )) (PreH48 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p0_pre) (15)) )) (PreH49 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p0_pre) (16)) )) (PreH50 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p0_pre) (17)) )) (PreH51 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p0_pre) (18)) )) (PreH52 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p0_pre) (19)) )) (PreH53 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p0_pre) (20)) )) (PreH54 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p0_pre) (21)) )) (PreH55 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p0_pre) (22)) )) (PreH56 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p0_pre) (23)) )) (PreH57 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p0_pre) (24)) )) (PreH58 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p0_pre) (25)) )) (PreH59 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p0_pre) (26)) )) (PreH60 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p0_pre) (27)) )) (PreH61 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p0_pre) (28)) )) (PreH62 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p0_pre) (29)) )) (PreH63 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p0_pre) (30)) )) (PreH64 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p0_pre) (31)) )) (PreH65 : (0 < vl_pre)) (PreH66 : (vl_pre <= 32)) (PreH67 : (ap_window F p0_pre vl_pre )) (PreH68 : (ap_window F p1_pre vl_pre )) (PreH69 : (ap_window F p2_pre vl_pre )) (PreH70 : (ap_window F p3_pre vl_pre )) (PreH71 : (ap_window F p4_pre vl_pre )) (PreH72 : (ap_window F p5_pre vl_pre )) (PreH73 : (ap_window F p6_pre vl_pre )) (PreH74 : (ap_window F p7_pre vl_pre )) (PreH75 : (ap_window F p8_pre vl_pre )) (PreH76 : (ap_write_window W output_pre vl_pre )) (PreH77 : (ap_write_window WI index_pre vl_pre )) (PreH78 : (ap_block32_previous ab_pre ib_pre )) (PreH79 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH80 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH81 : (ap_optional_write_window W ab_pre vl_pre )) (PreH82 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH83 : (ab_pre = 0)) ,
  TT && emp 
|--
  “ (ap_block32_acc (make_record_vfloat32m8_t (r0) (r1) (r2) (r3) (r4) (r5) (r6) (r7) (r8) (r9) (r10) (r11) (r12) (r13) (r14) (r15) (r16) (r17) (r18) (r19) (r20) (r21) (r22) (r23) (r24) (r25) (r26) (r27) (r28) (r29) (r30) (r31)) (make_record_vuint32m8_t (r0_2) (r1_2) (r2_2) (r3_2) (r4_2) (r5_2) (r6_2) (r7_2) (r8_2) (r9_2) (r10_2) (r11_2) (r12_2) (r13_2) (r14_2) (r15_2) (r16_2) (r17_2) (r18_2) (r19_2) (r20_2) (r21_2) (r22_2) (r23_2) (r24_2) (r25_2) (r26_2) (r27_2) (r28_2) (r29_2) (r30_2) (r31_2)) F O I 0 ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 0 ) ”
  &&  emp
).

Definition ap_rvv_block32_entail_wit_1_2_split_goal_1 := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (r31_2: Z) (r30_2: Z) (r29_2: Z) (r28_2: Z) (r27_2: Z) (r26_2: Z) (r25_2: Z) (r24_2: Z) (r23_2: Z) (r22_2: Z) (r21_2: Z) (r20_2: Z) (r19_2: Z) (r18_2: Z) (r17_2: Z) (r16_2: Z) (r15_2: Z) (r14_2: Z) (r13_2: Z) (r12_2: Z) (r11_2: Z) (r10_2: Z) (r9_2: Z) (r8_2: Z) (r7_2: Z) (r6_2: Z) (r5_2: Z) (r4_2: Z) (r3_2: Z) (r2_2: Z) (r1_2: Z) (r0_2: Z) (PreH1 : (apr_int_lane 0 vl_pre r0_2 (ap_u32 (idx_pre)) )) (PreH2 : (apr_int_lane 1 vl_pre r1_2 (ap_u32 (idx_pre)) )) (PreH3 : (apr_int_lane 2 vl_pre r2_2 (ap_u32 (idx_pre)) )) (PreH4 : (apr_int_lane 3 vl_pre r3_2 (ap_u32 (idx_pre)) )) (PreH5 : (apr_int_lane 4 vl_pre r4_2 (ap_u32 (idx_pre)) )) (PreH6 : (apr_int_lane 5 vl_pre r5_2 (ap_u32 (idx_pre)) )) (PreH7 : (apr_int_lane 6 vl_pre r6_2 (ap_u32 (idx_pre)) )) (PreH8 : (apr_int_lane 7 vl_pre r7_2 (ap_u32 (idx_pre)) )) (PreH9 : (apr_int_lane 8 vl_pre r8_2 (ap_u32 (idx_pre)) )) (PreH10 : (apr_int_lane 9 vl_pre r9_2 (ap_u32 (idx_pre)) )) (PreH11 : (apr_int_lane 10 vl_pre r10_2 (ap_u32 (idx_pre)) )) (PreH12 : (apr_int_lane 11 vl_pre r11_2 (ap_u32 (idx_pre)) )) (PreH13 : (apr_int_lane 12 vl_pre r12_2 (ap_u32 (idx_pre)) )) (PreH14 : (apr_int_lane 13 vl_pre r13_2 (ap_u32 (idx_pre)) )) (PreH15 : (apr_int_lane 14 vl_pre r14_2 (ap_u32 (idx_pre)) )) (PreH16 : (apr_int_lane 15 vl_pre r15_2 (ap_u32 (idx_pre)) )) (PreH17 : (apr_int_lane 16 vl_pre r16_2 (ap_u32 (idx_pre)) )) (PreH18 : (apr_int_lane 17 vl_pre r17_2 (ap_u32 (idx_pre)) )) (PreH19 : (apr_int_lane 18 vl_pre r18_2 (ap_u32 (idx_pre)) )) (PreH20 : (apr_int_lane 19 vl_pre r19_2 (ap_u32 (idx_pre)) )) (PreH21 : (apr_int_lane 20 vl_pre r20_2 (ap_u32 (idx_pre)) )) (PreH22 : (apr_int_lane 21 vl_pre r21_2 (ap_u32 (idx_pre)) )) (PreH23 : (apr_int_lane 22 vl_pre r22_2 (ap_u32 (idx_pre)) )) (PreH24 : (apr_int_lane 23 vl_pre r23_2 (ap_u32 (idx_pre)) )) (PreH25 : (apr_int_lane 24 vl_pre r24_2 (ap_u32 (idx_pre)) )) (PreH26 : (apr_int_lane 25 vl_pre r25_2 (ap_u32 (idx_pre)) )) (PreH27 : (apr_int_lane 26 vl_pre r26_2 (ap_u32 (idx_pre)) )) (PreH28 : (apr_int_lane 27 vl_pre r27_2 (ap_u32 (idx_pre)) )) (PreH29 : (apr_int_lane 28 vl_pre r28_2 (ap_u32 (idx_pre)) )) (PreH30 : (apr_int_lane 29 vl_pre r29_2 (ap_u32 (idx_pre)) )) (PreH31 : (apr_int_lane 30 vl_pre r30_2 (ap_u32 (idx_pre)) )) (PreH32 : (apr_int_lane 31 vl_pre r31_2 (ap_u32 (idx_pre)) )) (PreH33 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p0_pre) (0)) )) (PreH34 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p0_pre) (1)) )) (PreH35 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p0_pre) (2)) )) (PreH36 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p0_pre) (3)) )) (PreH37 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p0_pre) (4)) )) (PreH38 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p0_pre) (5)) )) (PreH39 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p0_pre) (6)) )) (PreH40 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p0_pre) (7)) )) (PreH41 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p0_pre) (8)) )) (PreH42 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p0_pre) (9)) )) (PreH43 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p0_pre) (10)) )) (PreH44 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p0_pre) (11)) )) (PreH45 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p0_pre) (12)) )) (PreH46 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p0_pre) (13)) )) (PreH47 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p0_pre) (14)) )) (PreH48 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p0_pre) (15)) )) (PreH49 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p0_pre) (16)) )) (PreH50 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p0_pre) (17)) )) (PreH51 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p0_pre) (18)) )) (PreH52 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p0_pre) (19)) )) (PreH53 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p0_pre) (20)) )) (PreH54 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p0_pre) (21)) )) (PreH55 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p0_pre) (22)) )) (PreH56 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p0_pre) (23)) )) (PreH57 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p0_pre) (24)) )) (PreH58 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p0_pre) (25)) )) (PreH59 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p0_pre) (26)) )) (PreH60 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p0_pre) (27)) )) (PreH61 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p0_pre) (28)) )) (PreH62 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p0_pre) (29)) )) (PreH63 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p0_pre) (30)) )) (PreH64 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p0_pre) (31)) )) (PreH65 : (0 < vl_pre)) (PreH66 : (vl_pre <= 32)) (PreH67 : (ap_window F p0_pre vl_pre )) (PreH68 : (ap_window F p1_pre vl_pre )) (PreH69 : (ap_window F p2_pre vl_pre )) (PreH70 : (ap_window F p3_pre vl_pre )) (PreH71 : (ap_window F p4_pre vl_pre )) (PreH72 : (ap_window F p5_pre vl_pre )) (PreH73 : (ap_window F p6_pre vl_pre )) (PreH74 : (ap_window F p7_pre vl_pre )) (PreH75 : (ap_window F p8_pre vl_pre )) (PreH76 : (ap_write_window W output_pre vl_pre )) (PreH77 : (ap_write_window WI index_pre vl_pre )) (PreH78 : (ap_block32_previous ab_pre ib_pre )) (PreH79 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH80 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH81 : (ap_optional_write_window W ab_pre vl_pre )) (PreH82 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH83 : (ab_pre = 0)) ,
  (ap_block32_acc (make_record_vfloat32m8_t (r0) (r1) (r2) (r3) (r4) (r5) (r6) (r7) (r8) (r9) (r10) (r11) (r12) (r13) (r14) (r15) (r16) (r17) (r18) (r19) (r20) (r21) (r22) (r23) (r24) (r25) (r26) (r27) (r28) (r29) (r30) (r31)) (make_record_vuint32m8_t (r0_2) (r1_2) (r2_2) (r3_2) (r4_2) (r5_2) (r6_2) (r7_2) (r8_2) (r9_2) (r10_2) (r11_2) (r12_2) (r13_2) (r14_2) (r15_2) (r16_2) (r17_2) (r18_2) (r19_2) (r20_2) (r21_2) (r22_2) (r23_2) (r24_2) (r25_2) (r26_2) (r27_2) (r28_2) (r29_2) (r30_2) (r31_2)) F O I 0 ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 0 )
.

Definition ap_rvv_block32_entail_wit_2 := 
(
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A_2: Recordvfloat32m8_t) (J_2: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (R: Recordvfloat32m8_t) (J_3: Recordvuint32m8_t) (PreH1 : (ap_rvv_update32 R J_3 A_2 J_2 (make_record_vfloat32m8_t (r0) (r1) (r2) (r3) (r4) (r5) (r6) (r7) (r8) (r9) (r10) (r11) (r12) (r13) (r14) (r15) (r16) (r17) (r18) (r19) (r20) (r21) (r22) (r23) (r24) (r25) (r26) (r27) (r28) (r29) (r30) (r31)) (unsigned_last_nbits ((idx_pre + 1 )) (32)) vl_pre )) (PreH2 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p1_pre) (0)) )) (PreH3 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p1_pre) (1)) )) (PreH4 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p1_pre) (2)) )) (PreH5 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p1_pre) (3)) )) (PreH6 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p1_pre) (4)) )) (PreH7 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p1_pre) (5)) )) (PreH8 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p1_pre) (6)) )) (PreH9 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p1_pre) (7)) )) (PreH10 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p1_pre) (8)) )) (PreH11 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p1_pre) (9)) )) (PreH12 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p1_pre) (10)) )) (PreH13 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p1_pre) (11)) )) (PreH14 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p1_pre) (12)) )) (PreH15 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p1_pre) (13)) )) (PreH16 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p1_pre) (14)) )) (PreH17 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p1_pre) (15)) )) (PreH18 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p1_pre) (16)) )) (PreH19 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p1_pre) (17)) )) (PreH20 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p1_pre) (18)) )) (PreH21 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p1_pre) (19)) )) (PreH22 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p1_pre) (20)) )) (PreH23 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p1_pre) (21)) )) (PreH24 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p1_pre) (22)) )) (PreH25 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p1_pre) (23)) )) (PreH26 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p1_pre) (24)) )) (PreH27 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p1_pre) (25)) )) (PreH28 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p1_pre) (26)) )) (PreH29 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p1_pre) (27)) )) (PreH30 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p1_pre) (28)) )) (PreH31 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p1_pre) (29)) )) (PreH32 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p1_pre) (30)) )) (PreH33 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p1_pre) (31)) )) (PreH34 : (0 < vl_pre)) (PreH35 : (vl_pre <= 32)) (PreH36 : (ap_window F p0_pre vl_pre )) (PreH37 : (ap_window F p1_pre vl_pre )) (PreH38 : (ap_window F p2_pre vl_pre )) (PreH39 : (ap_window F p3_pre vl_pre )) (PreH40 : (ap_window F p4_pre vl_pre )) (PreH41 : (ap_window F p5_pre vl_pre )) (PreH42 : (ap_window F p6_pre vl_pre )) (PreH43 : (ap_window F p7_pre vl_pre )) (PreH44 : (ap_window F p8_pre vl_pre )) (PreH45 : (ap_write_window W output_pre vl_pre )) (PreH46 : (ap_write_window WI index_pre vl_pre )) (PreH47 : (ap_block32_previous ab_pre ib_pre )) (PreH48 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH49 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH50 : (ap_optional_write_window W ab_pre vl_pre )) (PreH51 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH52 : (ap_block32_acc A_2 J_2 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 0 )) ,
  (StructPredvfloat32m8_t ( &( "a" ) ) R )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J_3 )
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
|--
  EX (A: Recordvfloat32m8_t)  (J: Recordvuint32m8_t) ,
  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 1 ) ”
  &&  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
) \/
(
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A_2: Recordvfloat32m8_t) (J_2: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (R: Recordvfloat32m8_t) (J_3: Recordvuint32m8_t) (PreH1 : (ap_rvv_update32 R J_3 A_2 J_2 (make_record_vfloat32m8_t (r0) (r1) (r2) (r3) (r4) (r5) (r6) (r7) (r8) (r9) (r10) (r11) (r12) (r13) (r14) (r15) (r16) (r17) (r18) (r19) (r20) (r21) (r22) (r23) (r24) (r25) (r26) (r27) (r28) (r29) (r30) (r31)) (unsigned_last_nbits ((idx_pre + 1 )) (32)) vl_pre )) (PreH2 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p1_pre) (0)) )) (PreH3 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p1_pre) (1)) )) (PreH4 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p1_pre) (2)) )) (PreH5 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p1_pre) (3)) )) (PreH6 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p1_pre) (4)) )) (PreH7 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p1_pre) (5)) )) (PreH8 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p1_pre) (6)) )) (PreH9 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p1_pre) (7)) )) (PreH10 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p1_pre) (8)) )) (PreH11 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p1_pre) (9)) )) (PreH12 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p1_pre) (10)) )) (PreH13 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p1_pre) (11)) )) (PreH14 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p1_pre) (12)) )) (PreH15 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p1_pre) (13)) )) (PreH16 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p1_pre) (14)) )) (PreH17 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p1_pre) (15)) )) (PreH18 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p1_pre) (16)) )) (PreH19 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p1_pre) (17)) )) (PreH20 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p1_pre) (18)) )) (PreH21 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p1_pre) (19)) )) (PreH22 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p1_pre) (20)) )) (PreH23 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p1_pre) (21)) )) (PreH24 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p1_pre) (22)) )) (PreH25 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p1_pre) (23)) )) (PreH26 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p1_pre) (24)) )) (PreH27 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p1_pre) (25)) )) (PreH28 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p1_pre) (26)) )) (PreH29 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p1_pre) (27)) )) (PreH30 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p1_pre) (28)) )) (PreH31 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p1_pre) (29)) )) (PreH32 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p1_pre) (30)) )) (PreH33 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p1_pre) (31)) )) (PreH34 : (0 < vl_pre)) (PreH35 : (vl_pre <= 32)) (PreH36 : (ap_window F p0_pre vl_pre )) (PreH37 : (ap_window F p1_pre vl_pre )) (PreH38 : (ap_window F p2_pre vl_pre )) (PreH39 : (ap_window F p3_pre vl_pre )) (PreH40 : (ap_window F p4_pre vl_pre )) (PreH41 : (ap_window F p5_pre vl_pre )) (PreH42 : (ap_window F p6_pre vl_pre )) (PreH43 : (ap_window F p7_pre vl_pre )) (PreH44 : (ap_window F p8_pre vl_pre )) (PreH45 : (ap_write_window W output_pre vl_pre )) (PreH46 : (ap_write_window WI index_pre vl_pre )) (PreH47 : (ap_block32_previous ab_pre ib_pre )) (PreH48 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH49 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH50 : (ap_optional_write_window W ab_pre vl_pre )) (PreH51 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH52 : (ap_block32_acc A_2 J_2 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 0 )) ,
  TT && emp 
|--
  “ (ap_block32_acc R J_3 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 1 ) ”
  &&  emp
).

Definition ap_rvv_block32_entail_wit_2_split_goal_1 := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A_2: Recordvfloat32m8_t) (J_2: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (R: Recordvfloat32m8_t) (J_3: Recordvuint32m8_t) (PreH1 : (ap_rvv_update32 R J_3 A_2 J_2 (make_record_vfloat32m8_t (r0) (r1) (r2) (r3) (r4) (r5) (r6) (r7) (r8) (r9) (r10) (r11) (r12) (r13) (r14) (r15) (r16) (r17) (r18) (r19) (r20) (r21) (r22) (r23) (r24) (r25) (r26) (r27) (r28) (r29) (r30) (r31)) (unsigned_last_nbits ((idx_pre + 1 )) (32)) vl_pre )) (PreH2 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p1_pre) (0)) )) (PreH3 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p1_pre) (1)) )) (PreH4 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p1_pre) (2)) )) (PreH5 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p1_pre) (3)) )) (PreH6 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p1_pre) (4)) )) (PreH7 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p1_pre) (5)) )) (PreH8 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p1_pre) (6)) )) (PreH9 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p1_pre) (7)) )) (PreH10 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p1_pre) (8)) )) (PreH11 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p1_pre) (9)) )) (PreH12 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p1_pre) (10)) )) (PreH13 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p1_pre) (11)) )) (PreH14 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p1_pre) (12)) )) (PreH15 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p1_pre) (13)) )) (PreH16 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p1_pre) (14)) )) (PreH17 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p1_pre) (15)) )) (PreH18 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p1_pre) (16)) )) (PreH19 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p1_pre) (17)) )) (PreH20 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p1_pre) (18)) )) (PreH21 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p1_pre) (19)) )) (PreH22 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p1_pre) (20)) )) (PreH23 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p1_pre) (21)) )) (PreH24 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p1_pre) (22)) )) (PreH25 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p1_pre) (23)) )) (PreH26 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p1_pre) (24)) )) (PreH27 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p1_pre) (25)) )) (PreH28 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p1_pre) (26)) )) (PreH29 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p1_pre) (27)) )) (PreH30 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p1_pre) (28)) )) (PreH31 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p1_pre) (29)) )) (PreH32 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p1_pre) (30)) )) (PreH33 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p1_pre) (31)) )) (PreH34 : (0 < vl_pre)) (PreH35 : (vl_pre <= 32)) (PreH36 : (ap_window F p0_pre vl_pre )) (PreH37 : (ap_window F p1_pre vl_pre )) (PreH38 : (ap_window F p2_pre vl_pre )) (PreH39 : (ap_window F p3_pre vl_pre )) (PreH40 : (ap_window F p4_pre vl_pre )) (PreH41 : (ap_window F p5_pre vl_pre )) (PreH42 : (ap_window F p6_pre vl_pre )) (PreH43 : (ap_window F p7_pre vl_pre )) (PreH44 : (ap_window F p8_pre vl_pre )) (PreH45 : (ap_write_window W output_pre vl_pre )) (PreH46 : (ap_write_window WI index_pre vl_pre )) (PreH47 : (ap_block32_previous ab_pre ib_pre )) (PreH48 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH49 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH50 : (ap_optional_write_window W ab_pre vl_pre )) (PreH51 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH52 : (ap_block32_acc A_2 J_2 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 0 )) ,
  (ap_block32_acc R J_3 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 1 )
.

Definition ap_rvv_block32_entail_wit_3 := 
(
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A_2: Recordvfloat32m8_t) (J_2: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (R: Recordvfloat32m8_t) (J_3: Recordvuint32m8_t) (PreH1 : (ap_rvv_update32 R J_3 A_2 J_2 (make_record_vfloat32m8_t (r0) (r1) (r2) (r3) (r4) (r5) (r6) (r7) (r8) (r9) (r10) (r11) (r12) (r13) (r14) (r15) (r16) (r17) (r18) (r19) (r20) (r21) (r22) (r23) (r24) (r25) (r26) (r27) (r28) (r29) (r30) (r31)) (unsigned_last_nbits ((idx_pre + 2 )) (32)) vl_pre )) (PreH2 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p2_pre) (0)) )) (PreH3 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p2_pre) (1)) )) (PreH4 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p2_pre) (2)) )) (PreH5 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p2_pre) (3)) )) (PreH6 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p2_pre) (4)) )) (PreH7 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p2_pre) (5)) )) (PreH8 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p2_pre) (6)) )) (PreH9 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p2_pre) (7)) )) (PreH10 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p2_pre) (8)) )) (PreH11 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p2_pre) (9)) )) (PreH12 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p2_pre) (10)) )) (PreH13 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p2_pre) (11)) )) (PreH14 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p2_pre) (12)) )) (PreH15 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p2_pre) (13)) )) (PreH16 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p2_pre) (14)) )) (PreH17 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p2_pre) (15)) )) (PreH18 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p2_pre) (16)) )) (PreH19 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p2_pre) (17)) )) (PreH20 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p2_pre) (18)) )) (PreH21 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p2_pre) (19)) )) (PreH22 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p2_pre) (20)) )) (PreH23 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p2_pre) (21)) )) (PreH24 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p2_pre) (22)) )) (PreH25 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p2_pre) (23)) )) (PreH26 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p2_pre) (24)) )) (PreH27 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p2_pre) (25)) )) (PreH28 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p2_pre) (26)) )) (PreH29 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p2_pre) (27)) )) (PreH30 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p2_pre) (28)) )) (PreH31 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p2_pre) (29)) )) (PreH32 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p2_pre) (30)) )) (PreH33 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p2_pre) (31)) )) (PreH34 : (0 < vl_pre)) (PreH35 : (vl_pre <= 32)) (PreH36 : (ap_window F p0_pre vl_pre )) (PreH37 : (ap_window F p1_pre vl_pre )) (PreH38 : (ap_window F p2_pre vl_pre )) (PreH39 : (ap_window F p3_pre vl_pre )) (PreH40 : (ap_window F p4_pre vl_pre )) (PreH41 : (ap_window F p5_pre vl_pre )) (PreH42 : (ap_window F p6_pre vl_pre )) (PreH43 : (ap_window F p7_pre vl_pre )) (PreH44 : (ap_window F p8_pre vl_pre )) (PreH45 : (ap_write_window W output_pre vl_pre )) (PreH46 : (ap_write_window WI index_pre vl_pre )) (PreH47 : (ap_block32_previous ab_pre ib_pre )) (PreH48 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH49 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH50 : (ap_optional_write_window W ab_pre vl_pre )) (PreH51 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH52 : (ap_block32_acc A_2 J_2 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 1 )) ,
  (StructPredvfloat32m8_t ( &( "a" ) ) R )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J_3 )
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
|--
  EX (A: Recordvfloat32m8_t)  (J: Recordvuint32m8_t) ,
  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 2 ) ”
  &&  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
) \/
(
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A_2: Recordvfloat32m8_t) (J_2: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (R: Recordvfloat32m8_t) (J_3: Recordvuint32m8_t) (PreH1 : (ap_rvv_update32 R J_3 A_2 J_2 (make_record_vfloat32m8_t (r0) (r1) (r2) (r3) (r4) (r5) (r6) (r7) (r8) (r9) (r10) (r11) (r12) (r13) (r14) (r15) (r16) (r17) (r18) (r19) (r20) (r21) (r22) (r23) (r24) (r25) (r26) (r27) (r28) (r29) (r30) (r31)) (unsigned_last_nbits ((idx_pre + 2 )) (32)) vl_pre )) (PreH2 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p2_pre) (0)) )) (PreH3 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p2_pre) (1)) )) (PreH4 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p2_pre) (2)) )) (PreH5 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p2_pre) (3)) )) (PreH6 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p2_pre) (4)) )) (PreH7 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p2_pre) (5)) )) (PreH8 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p2_pre) (6)) )) (PreH9 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p2_pre) (7)) )) (PreH10 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p2_pre) (8)) )) (PreH11 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p2_pre) (9)) )) (PreH12 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p2_pre) (10)) )) (PreH13 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p2_pre) (11)) )) (PreH14 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p2_pre) (12)) )) (PreH15 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p2_pre) (13)) )) (PreH16 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p2_pre) (14)) )) (PreH17 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p2_pre) (15)) )) (PreH18 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p2_pre) (16)) )) (PreH19 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p2_pre) (17)) )) (PreH20 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p2_pre) (18)) )) (PreH21 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p2_pre) (19)) )) (PreH22 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p2_pre) (20)) )) (PreH23 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p2_pre) (21)) )) (PreH24 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p2_pre) (22)) )) (PreH25 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p2_pre) (23)) )) (PreH26 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p2_pre) (24)) )) (PreH27 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p2_pre) (25)) )) (PreH28 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p2_pre) (26)) )) (PreH29 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p2_pre) (27)) )) (PreH30 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p2_pre) (28)) )) (PreH31 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p2_pre) (29)) )) (PreH32 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p2_pre) (30)) )) (PreH33 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p2_pre) (31)) )) (PreH34 : (0 < vl_pre)) (PreH35 : (vl_pre <= 32)) (PreH36 : (ap_window F p0_pre vl_pre )) (PreH37 : (ap_window F p1_pre vl_pre )) (PreH38 : (ap_window F p2_pre vl_pre )) (PreH39 : (ap_window F p3_pre vl_pre )) (PreH40 : (ap_window F p4_pre vl_pre )) (PreH41 : (ap_window F p5_pre vl_pre )) (PreH42 : (ap_window F p6_pre vl_pre )) (PreH43 : (ap_window F p7_pre vl_pre )) (PreH44 : (ap_window F p8_pre vl_pre )) (PreH45 : (ap_write_window W output_pre vl_pre )) (PreH46 : (ap_write_window WI index_pre vl_pre )) (PreH47 : (ap_block32_previous ab_pre ib_pre )) (PreH48 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH49 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH50 : (ap_optional_write_window W ab_pre vl_pre )) (PreH51 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH52 : (ap_block32_acc A_2 J_2 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 1 )) ,
  TT && emp 
|--
  “ (ap_block32_acc R J_3 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 2 ) ”
  &&  emp
).

Definition ap_rvv_block32_entail_wit_3_split_goal_1 := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A_2: Recordvfloat32m8_t) (J_2: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (R: Recordvfloat32m8_t) (J_3: Recordvuint32m8_t) (PreH1 : (ap_rvv_update32 R J_3 A_2 J_2 (make_record_vfloat32m8_t (r0) (r1) (r2) (r3) (r4) (r5) (r6) (r7) (r8) (r9) (r10) (r11) (r12) (r13) (r14) (r15) (r16) (r17) (r18) (r19) (r20) (r21) (r22) (r23) (r24) (r25) (r26) (r27) (r28) (r29) (r30) (r31)) (unsigned_last_nbits ((idx_pre + 2 )) (32)) vl_pre )) (PreH2 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p2_pre) (0)) )) (PreH3 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p2_pre) (1)) )) (PreH4 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p2_pre) (2)) )) (PreH5 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p2_pre) (3)) )) (PreH6 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p2_pre) (4)) )) (PreH7 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p2_pre) (5)) )) (PreH8 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p2_pre) (6)) )) (PreH9 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p2_pre) (7)) )) (PreH10 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p2_pre) (8)) )) (PreH11 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p2_pre) (9)) )) (PreH12 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p2_pre) (10)) )) (PreH13 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p2_pre) (11)) )) (PreH14 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p2_pre) (12)) )) (PreH15 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p2_pre) (13)) )) (PreH16 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p2_pre) (14)) )) (PreH17 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p2_pre) (15)) )) (PreH18 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p2_pre) (16)) )) (PreH19 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p2_pre) (17)) )) (PreH20 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p2_pre) (18)) )) (PreH21 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p2_pre) (19)) )) (PreH22 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p2_pre) (20)) )) (PreH23 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p2_pre) (21)) )) (PreH24 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p2_pre) (22)) )) (PreH25 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p2_pre) (23)) )) (PreH26 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p2_pre) (24)) )) (PreH27 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p2_pre) (25)) )) (PreH28 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p2_pre) (26)) )) (PreH29 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p2_pre) (27)) )) (PreH30 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p2_pre) (28)) )) (PreH31 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p2_pre) (29)) )) (PreH32 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p2_pre) (30)) )) (PreH33 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p2_pre) (31)) )) (PreH34 : (0 < vl_pre)) (PreH35 : (vl_pre <= 32)) (PreH36 : (ap_window F p0_pre vl_pre )) (PreH37 : (ap_window F p1_pre vl_pre )) (PreH38 : (ap_window F p2_pre vl_pre )) (PreH39 : (ap_window F p3_pre vl_pre )) (PreH40 : (ap_window F p4_pre vl_pre )) (PreH41 : (ap_window F p5_pre vl_pre )) (PreH42 : (ap_window F p6_pre vl_pre )) (PreH43 : (ap_window F p7_pre vl_pre )) (PreH44 : (ap_window F p8_pre vl_pre )) (PreH45 : (ap_write_window W output_pre vl_pre )) (PreH46 : (ap_write_window WI index_pre vl_pre )) (PreH47 : (ap_block32_previous ab_pre ib_pre )) (PreH48 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH49 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH50 : (ap_optional_write_window W ab_pre vl_pre )) (PreH51 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH52 : (ap_block32_acc A_2 J_2 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 1 )) ,
  (ap_block32_acc R J_3 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 2 )
.

Definition ap_rvv_block32_entail_wit_4 := 
(
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A_2: Recordvfloat32m8_t) (J_2: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (R: Recordvfloat32m8_t) (J_3: Recordvuint32m8_t) (PreH1 : (ap_rvv_update32 R J_3 A_2 J_2 (make_record_vfloat32m8_t (r0) (r1) (r2) (r3) (r4) (r5) (r6) (r7) (r8) (r9) (r10) (r11) (r12) (r13) (r14) (r15) (r16) (r17) (r18) (r19) (r20) (r21) (r22) (r23) (r24) (r25) (r26) (r27) (r28) (r29) (r30) (r31)) (unsigned_last_nbits ((idx_pre + 3 )) (32)) vl_pre )) (PreH2 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p3_pre) (0)) )) (PreH3 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p3_pre) (1)) )) (PreH4 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p3_pre) (2)) )) (PreH5 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p3_pre) (3)) )) (PreH6 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p3_pre) (4)) )) (PreH7 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p3_pre) (5)) )) (PreH8 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p3_pre) (6)) )) (PreH9 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p3_pre) (7)) )) (PreH10 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p3_pre) (8)) )) (PreH11 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p3_pre) (9)) )) (PreH12 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p3_pre) (10)) )) (PreH13 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p3_pre) (11)) )) (PreH14 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p3_pre) (12)) )) (PreH15 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p3_pre) (13)) )) (PreH16 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p3_pre) (14)) )) (PreH17 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p3_pre) (15)) )) (PreH18 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p3_pre) (16)) )) (PreH19 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p3_pre) (17)) )) (PreH20 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p3_pre) (18)) )) (PreH21 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p3_pre) (19)) )) (PreH22 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p3_pre) (20)) )) (PreH23 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p3_pre) (21)) )) (PreH24 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p3_pre) (22)) )) (PreH25 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p3_pre) (23)) )) (PreH26 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p3_pre) (24)) )) (PreH27 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p3_pre) (25)) )) (PreH28 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p3_pre) (26)) )) (PreH29 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p3_pre) (27)) )) (PreH30 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p3_pre) (28)) )) (PreH31 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p3_pre) (29)) )) (PreH32 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p3_pre) (30)) )) (PreH33 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p3_pre) (31)) )) (PreH34 : (0 < vl_pre)) (PreH35 : (vl_pre <= 32)) (PreH36 : (ap_window F p0_pre vl_pre )) (PreH37 : (ap_window F p1_pre vl_pre )) (PreH38 : (ap_window F p2_pre vl_pre )) (PreH39 : (ap_window F p3_pre vl_pre )) (PreH40 : (ap_window F p4_pre vl_pre )) (PreH41 : (ap_window F p5_pre vl_pre )) (PreH42 : (ap_window F p6_pre vl_pre )) (PreH43 : (ap_window F p7_pre vl_pre )) (PreH44 : (ap_window F p8_pre vl_pre )) (PreH45 : (ap_write_window W output_pre vl_pre )) (PreH46 : (ap_write_window WI index_pre vl_pre )) (PreH47 : (ap_block32_previous ab_pre ib_pre )) (PreH48 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH49 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH50 : (ap_optional_write_window W ab_pre vl_pre )) (PreH51 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH52 : (ap_block32_acc A_2 J_2 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 2 )) ,
  (StructPredvfloat32m8_t ( &( "a" ) ) R )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J_3 )
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
|--
  EX (A: Recordvfloat32m8_t)  (J: Recordvuint32m8_t) ,
  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 3 ) ”
  &&  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
) \/
(
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A_2: Recordvfloat32m8_t) (J_2: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (R: Recordvfloat32m8_t) (J_3: Recordvuint32m8_t) (PreH1 : (ap_rvv_update32 R J_3 A_2 J_2 (make_record_vfloat32m8_t (r0) (r1) (r2) (r3) (r4) (r5) (r6) (r7) (r8) (r9) (r10) (r11) (r12) (r13) (r14) (r15) (r16) (r17) (r18) (r19) (r20) (r21) (r22) (r23) (r24) (r25) (r26) (r27) (r28) (r29) (r30) (r31)) (unsigned_last_nbits ((idx_pre + 3 )) (32)) vl_pre )) (PreH2 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p3_pre) (0)) )) (PreH3 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p3_pre) (1)) )) (PreH4 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p3_pre) (2)) )) (PreH5 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p3_pre) (3)) )) (PreH6 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p3_pre) (4)) )) (PreH7 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p3_pre) (5)) )) (PreH8 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p3_pre) (6)) )) (PreH9 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p3_pre) (7)) )) (PreH10 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p3_pre) (8)) )) (PreH11 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p3_pre) (9)) )) (PreH12 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p3_pre) (10)) )) (PreH13 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p3_pre) (11)) )) (PreH14 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p3_pre) (12)) )) (PreH15 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p3_pre) (13)) )) (PreH16 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p3_pre) (14)) )) (PreH17 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p3_pre) (15)) )) (PreH18 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p3_pre) (16)) )) (PreH19 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p3_pre) (17)) )) (PreH20 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p3_pre) (18)) )) (PreH21 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p3_pre) (19)) )) (PreH22 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p3_pre) (20)) )) (PreH23 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p3_pre) (21)) )) (PreH24 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p3_pre) (22)) )) (PreH25 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p3_pre) (23)) )) (PreH26 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p3_pre) (24)) )) (PreH27 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p3_pre) (25)) )) (PreH28 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p3_pre) (26)) )) (PreH29 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p3_pre) (27)) )) (PreH30 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p3_pre) (28)) )) (PreH31 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p3_pre) (29)) )) (PreH32 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p3_pre) (30)) )) (PreH33 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p3_pre) (31)) )) (PreH34 : (0 < vl_pre)) (PreH35 : (vl_pre <= 32)) (PreH36 : (ap_window F p0_pre vl_pre )) (PreH37 : (ap_window F p1_pre vl_pre )) (PreH38 : (ap_window F p2_pre vl_pre )) (PreH39 : (ap_window F p3_pre vl_pre )) (PreH40 : (ap_window F p4_pre vl_pre )) (PreH41 : (ap_window F p5_pre vl_pre )) (PreH42 : (ap_window F p6_pre vl_pre )) (PreH43 : (ap_window F p7_pre vl_pre )) (PreH44 : (ap_window F p8_pre vl_pre )) (PreH45 : (ap_write_window W output_pre vl_pre )) (PreH46 : (ap_write_window WI index_pre vl_pre )) (PreH47 : (ap_block32_previous ab_pre ib_pre )) (PreH48 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH49 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH50 : (ap_optional_write_window W ab_pre vl_pre )) (PreH51 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH52 : (ap_block32_acc A_2 J_2 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 2 )) ,
  TT && emp 
|--
  “ (ap_block32_acc R J_3 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 3 ) ”
  &&  emp
).

Definition ap_rvv_block32_entail_wit_4_split_goal_1 := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A_2: Recordvfloat32m8_t) (J_2: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (R: Recordvfloat32m8_t) (J_3: Recordvuint32m8_t) (PreH1 : (ap_rvv_update32 R J_3 A_2 J_2 (make_record_vfloat32m8_t (r0) (r1) (r2) (r3) (r4) (r5) (r6) (r7) (r8) (r9) (r10) (r11) (r12) (r13) (r14) (r15) (r16) (r17) (r18) (r19) (r20) (r21) (r22) (r23) (r24) (r25) (r26) (r27) (r28) (r29) (r30) (r31)) (unsigned_last_nbits ((idx_pre + 3 )) (32)) vl_pre )) (PreH2 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p3_pre) (0)) )) (PreH3 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p3_pre) (1)) )) (PreH4 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p3_pre) (2)) )) (PreH5 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p3_pre) (3)) )) (PreH6 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p3_pre) (4)) )) (PreH7 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p3_pre) (5)) )) (PreH8 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p3_pre) (6)) )) (PreH9 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p3_pre) (7)) )) (PreH10 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p3_pre) (8)) )) (PreH11 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p3_pre) (9)) )) (PreH12 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p3_pre) (10)) )) (PreH13 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p3_pre) (11)) )) (PreH14 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p3_pre) (12)) )) (PreH15 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p3_pre) (13)) )) (PreH16 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p3_pre) (14)) )) (PreH17 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p3_pre) (15)) )) (PreH18 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p3_pre) (16)) )) (PreH19 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p3_pre) (17)) )) (PreH20 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p3_pre) (18)) )) (PreH21 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p3_pre) (19)) )) (PreH22 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p3_pre) (20)) )) (PreH23 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p3_pre) (21)) )) (PreH24 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p3_pre) (22)) )) (PreH25 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p3_pre) (23)) )) (PreH26 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p3_pre) (24)) )) (PreH27 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p3_pre) (25)) )) (PreH28 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p3_pre) (26)) )) (PreH29 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p3_pre) (27)) )) (PreH30 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p3_pre) (28)) )) (PreH31 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p3_pre) (29)) )) (PreH32 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p3_pre) (30)) )) (PreH33 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p3_pre) (31)) )) (PreH34 : (0 < vl_pre)) (PreH35 : (vl_pre <= 32)) (PreH36 : (ap_window F p0_pre vl_pre )) (PreH37 : (ap_window F p1_pre vl_pre )) (PreH38 : (ap_window F p2_pre vl_pre )) (PreH39 : (ap_window F p3_pre vl_pre )) (PreH40 : (ap_window F p4_pre vl_pre )) (PreH41 : (ap_window F p5_pre vl_pre )) (PreH42 : (ap_window F p6_pre vl_pre )) (PreH43 : (ap_window F p7_pre vl_pre )) (PreH44 : (ap_window F p8_pre vl_pre )) (PreH45 : (ap_write_window W output_pre vl_pre )) (PreH46 : (ap_write_window WI index_pre vl_pre )) (PreH47 : (ap_block32_previous ab_pre ib_pre )) (PreH48 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH49 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH50 : (ap_optional_write_window W ab_pre vl_pre )) (PreH51 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH52 : (ap_block32_acc A_2 J_2 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 2 )) ,
  (ap_block32_acc R J_3 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 3 )
.

Definition ap_rvv_block32_entail_wit_5 := 
(
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A_2: Recordvfloat32m8_t) (J_2: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (R: Recordvfloat32m8_t) (J_3: Recordvuint32m8_t) (PreH1 : (ap_rvv_update32 R J_3 A_2 J_2 (make_record_vfloat32m8_t (r0) (r1) (r2) (r3) (r4) (r5) (r6) (r7) (r8) (r9) (r10) (r11) (r12) (r13) (r14) (r15) (r16) (r17) (r18) (r19) (r20) (r21) (r22) (r23) (r24) (r25) (r26) (r27) (r28) (r29) (r30) (r31)) (unsigned_last_nbits ((idx_pre + 4 )) (32)) vl_pre )) (PreH2 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p4_pre) (0)) )) (PreH3 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p4_pre) (1)) )) (PreH4 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p4_pre) (2)) )) (PreH5 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p4_pre) (3)) )) (PreH6 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p4_pre) (4)) )) (PreH7 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p4_pre) (5)) )) (PreH8 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p4_pre) (6)) )) (PreH9 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p4_pre) (7)) )) (PreH10 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p4_pre) (8)) )) (PreH11 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p4_pre) (9)) )) (PreH12 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p4_pre) (10)) )) (PreH13 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p4_pre) (11)) )) (PreH14 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p4_pre) (12)) )) (PreH15 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p4_pre) (13)) )) (PreH16 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p4_pre) (14)) )) (PreH17 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p4_pre) (15)) )) (PreH18 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p4_pre) (16)) )) (PreH19 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p4_pre) (17)) )) (PreH20 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p4_pre) (18)) )) (PreH21 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p4_pre) (19)) )) (PreH22 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p4_pre) (20)) )) (PreH23 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p4_pre) (21)) )) (PreH24 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p4_pre) (22)) )) (PreH25 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p4_pre) (23)) )) (PreH26 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p4_pre) (24)) )) (PreH27 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p4_pre) (25)) )) (PreH28 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p4_pre) (26)) )) (PreH29 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p4_pre) (27)) )) (PreH30 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p4_pre) (28)) )) (PreH31 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p4_pre) (29)) )) (PreH32 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p4_pre) (30)) )) (PreH33 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p4_pre) (31)) )) (PreH34 : (0 < vl_pre)) (PreH35 : (vl_pre <= 32)) (PreH36 : (ap_window F p0_pre vl_pre )) (PreH37 : (ap_window F p1_pre vl_pre )) (PreH38 : (ap_window F p2_pre vl_pre )) (PreH39 : (ap_window F p3_pre vl_pre )) (PreH40 : (ap_window F p4_pre vl_pre )) (PreH41 : (ap_window F p5_pre vl_pre )) (PreH42 : (ap_window F p6_pre vl_pre )) (PreH43 : (ap_window F p7_pre vl_pre )) (PreH44 : (ap_window F p8_pre vl_pre )) (PreH45 : (ap_write_window W output_pre vl_pre )) (PreH46 : (ap_write_window WI index_pre vl_pre )) (PreH47 : (ap_block32_previous ab_pre ib_pre )) (PreH48 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH49 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH50 : (ap_optional_write_window W ab_pre vl_pre )) (PreH51 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH52 : (ap_block32_acc A_2 J_2 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 3 )) ,
  (StructPredvfloat32m8_t ( &( "a" ) ) R )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J_3 )
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
|--
  EX (A: Recordvfloat32m8_t)  (J: Recordvuint32m8_t) ,
  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 4 ) ”
  &&  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
) \/
(
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A_2: Recordvfloat32m8_t) (J_2: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (R: Recordvfloat32m8_t) (J_3: Recordvuint32m8_t) (PreH1 : (ap_rvv_update32 R J_3 A_2 J_2 (make_record_vfloat32m8_t (r0) (r1) (r2) (r3) (r4) (r5) (r6) (r7) (r8) (r9) (r10) (r11) (r12) (r13) (r14) (r15) (r16) (r17) (r18) (r19) (r20) (r21) (r22) (r23) (r24) (r25) (r26) (r27) (r28) (r29) (r30) (r31)) (unsigned_last_nbits ((idx_pre + 4 )) (32)) vl_pre )) (PreH2 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p4_pre) (0)) )) (PreH3 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p4_pre) (1)) )) (PreH4 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p4_pre) (2)) )) (PreH5 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p4_pre) (3)) )) (PreH6 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p4_pre) (4)) )) (PreH7 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p4_pre) (5)) )) (PreH8 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p4_pre) (6)) )) (PreH9 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p4_pre) (7)) )) (PreH10 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p4_pre) (8)) )) (PreH11 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p4_pre) (9)) )) (PreH12 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p4_pre) (10)) )) (PreH13 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p4_pre) (11)) )) (PreH14 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p4_pre) (12)) )) (PreH15 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p4_pre) (13)) )) (PreH16 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p4_pre) (14)) )) (PreH17 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p4_pre) (15)) )) (PreH18 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p4_pre) (16)) )) (PreH19 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p4_pre) (17)) )) (PreH20 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p4_pre) (18)) )) (PreH21 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p4_pre) (19)) )) (PreH22 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p4_pre) (20)) )) (PreH23 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p4_pre) (21)) )) (PreH24 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p4_pre) (22)) )) (PreH25 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p4_pre) (23)) )) (PreH26 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p4_pre) (24)) )) (PreH27 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p4_pre) (25)) )) (PreH28 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p4_pre) (26)) )) (PreH29 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p4_pre) (27)) )) (PreH30 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p4_pre) (28)) )) (PreH31 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p4_pre) (29)) )) (PreH32 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p4_pre) (30)) )) (PreH33 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p4_pre) (31)) )) (PreH34 : (0 < vl_pre)) (PreH35 : (vl_pre <= 32)) (PreH36 : (ap_window F p0_pre vl_pre )) (PreH37 : (ap_window F p1_pre vl_pre )) (PreH38 : (ap_window F p2_pre vl_pre )) (PreH39 : (ap_window F p3_pre vl_pre )) (PreH40 : (ap_window F p4_pre vl_pre )) (PreH41 : (ap_window F p5_pre vl_pre )) (PreH42 : (ap_window F p6_pre vl_pre )) (PreH43 : (ap_window F p7_pre vl_pre )) (PreH44 : (ap_window F p8_pre vl_pre )) (PreH45 : (ap_write_window W output_pre vl_pre )) (PreH46 : (ap_write_window WI index_pre vl_pre )) (PreH47 : (ap_block32_previous ab_pre ib_pre )) (PreH48 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH49 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH50 : (ap_optional_write_window W ab_pre vl_pre )) (PreH51 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH52 : (ap_block32_acc A_2 J_2 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 3 )) ,
  TT && emp 
|--
  “ (ap_block32_acc R J_3 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 4 ) ”
  &&  emp
).

Definition ap_rvv_block32_entail_wit_5_split_goal_1 := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A_2: Recordvfloat32m8_t) (J_2: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (R: Recordvfloat32m8_t) (J_3: Recordvuint32m8_t) (PreH1 : (ap_rvv_update32 R J_3 A_2 J_2 (make_record_vfloat32m8_t (r0) (r1) (r2) (r3) (r4) (r5) (r6) (r7) (r8) (r9) (r10) (r11) (r12) (r13) (r14) (r15) (r16) (r17) (r18) (r19) (r20) (r21) (r22) (r23) (r24) (r25) (r26) (r27) (r28) (r29) (r30) (r31)) (unsigned_last_nbits ((idx_pre + 4 )) (32)) vl_pre )) (PreH2 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p4_pre) (0)) )) (PreH3 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p4_pre) (1)) )) (PreH4 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p4_pre) (2)) )) (PreH5 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p4_pre) (3)) )) (PreH6 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p4_pre) (4)) )) (PreH7 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p4_pre) (5)) )) (PreH8 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p4_pre) (6)) )) (PreH9 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p4_pre) (7)) )) (PreH10 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p4_pre) (8)) )) (PreH11 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p4_pre) (9)) )) (PreH12 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p4_pre) (10)) )) (PreH13 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p4_pre) (11)) )) (PreH14 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p4_pre) (12)) )) (PreH15 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p4_pre) (13)) )) (PreH16 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p4_pre) (14)) )) (PreH17 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p4_pre) (15)) )) (PreH18 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p4_pre) (16)) )) (PreH19 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p4_pre) (17)) )) (PreH20 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p4_pre) (18)) )) (PreH21 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p4_pre) (19)) )) (PreH22 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p4_pre) (20)) )) (PreH23 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p4_pre) (21)) )) (PreH24 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p4_pre) (22)) )) (PreH25 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p4_pre) (23)) )) (PreH26 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p4_pre) (24)) )) (PreH27 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p4_pre) (25)) )) (PreH28 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p4_pre) (26)) )) (PreH29 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p4_pre) (27)) )) (PreH30 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p4_pre) (28)) )) (PreH31 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p4_pre) (29)) )) (PreH32 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p4_pre) (30)) )) (PreH33 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p4_pre) (31)) )) (PreH34 : (0 < vl_pre)) (PreH35 : (vl_pre <= 32)) (PreH36 : (ap_window F p0_pre vl_pre )) (PreH37 : (ap_window F p1_pre vl_pre )) (PreH38 : (ap_window F p2_pre vl_pre )) (PreH39 : (ap_window F p3_pre vl_pre )) (PreH40 : (ap_window F p4_pre vl_pre )) (PreH41 : (ap_window F p5_pre vl_pre )) (PreH42 : (ap_window F p6_pre vl_pre )) (PreH43 : (ap_window F p7_pre vl_pre )) (PreH44 : (ap_window F p8_pre vl_pre )) (PreH45 : (ap_write_window W output_pre vl_pre )) (PreH46 : (ap_write_window WI index_pre vl_pre )) (PreH47 : (ap_block32_previous ab_pre ib_pre )) (PreH48 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH49 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH50 : (ap_optional_write_window W ab_pre vl_pre )) (PreH51 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH52 : (ap_block32_acc A_2 J_2 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 3 )) ,
  (ap_block32_acc R J_3 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 4 )
.

Definition ap_rvv_block32_entail_wit_6 := 
(
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A_2: Recordvfloat32m8_t) (J_2: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (R: Recordvfloat32m8_t) (J_3: Recordvuint32m8_t) (PreH1 : (ap_rvv_update32 R J_3 A_2 J_2 (make_record_vfloat32m8_t (r0) (r1) (r2) (r3) (r4) (r5) (r6) (r7) (r8) (r9) (r10) (r11) (r12) (r13) (r14) (r15) (r16) (r17) (r18) (r19) (r20) (r21) (r22) (r23) (r24) (r25) (r26) (r27) (r28) (r29) (r30) (r31)) (unsigned_last_nbits ((idx_pre + 5 )) (32)) vl_pre )) (PreH2 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p5_pre) (0)) )) (PreH3 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p5_pre) (1)) )) (PreH4 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p5_pre) (2)) )) (PreH5 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p5_pre) (3)) )) (PreH6 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p5_pre) (4)) )) (PreH7 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p5_pre) (5)) )) (PreH8 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p5_pre) (6)) )) (PreH9 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p5_pre) (7)) )) (PreH10 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p5_pre) (8)) )) (PreH11 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p5_pre) (9)) )) (PreH12 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p5_pre) (10)) )) (PreH13 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p5_pre) (11)) )) (PreH14 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p5_pre) (12)) )) (PreH15 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p5_pre) (13)) )) (PreH16 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p5_pre) (14)) )) (PreH17 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p5_pre) (15)) )) (PreH18 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p5_pre) (16)) )) (PreH19 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p5_pre) (17)) )) (PreH20 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p5_pre) (18)) )) (PreH21 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p5_pre) (19)) )) (PreH22 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p5_pre) (20)) )) (PreH23 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p5_pre) (21)) )) (PreH24 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p5_pre) (22)) )) (PreH25 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p5_pre) (23)) )) (PreH26 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p5_pre) (24)) )) (PreH27 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p5_pre) (25)) )) (PreH28 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p5_pre) (26)) )) (PreH29 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p5_pre) (27)) )) (PreH30 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p5_pre) (28)) )) (PreH31 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p5_pre) (29)) )) (PreH32 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p5_pre) (30)) )) (PreH33 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p5_pre) (31)) )) (PreH34 : (0 < vl_pre)) (PreH35 : (vl_pre <= 32)) (PreH36 : (ap_window F p0_pre vl_pre )) (PreH37 : (ap_window F p1_pre vl_pre )) (PreH38 : (ap_window F p2_pre vl_pre )) (PreH39 : (ap_window F p3_pre vl_pre )) (PreH40 : (ap_window F p4_pre vl_pre )) (PreH41 : (ap_window F p5_pre vl_pre )) (PreH42 : (ap_window F p6_pre vl_pre )) (PreH43 : (ap_window F p7_pre vl_pre )) (PreH44 : (ap_window F p8_pre vl_pre )) (PreH45 : (ap_write_window W output_pre vl_pre )) (PreH46 : (ap_write_window WI index_pre vl_pre )) (PreH47 : (ap_block32_previous ab_pre ib_pre )) (PreH48 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH49 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH50 : (ap_optional_write_window W ab_pre vl_pre )) (PreH51 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH52 : (ap_block32_acc A_2 J_2 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 4 )) ,
  (StructPredvfloat32m8_t ( &( "a" ) ) R )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J_3 )
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
|--
  EX (A: Recordvfloat32m8_t)  (J: Recordvuint32m8_t) ,
  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 5 ) ”
  &&  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
) \/
(
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A_2: Recordvfloat32m8_t) (J_2: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (R: Recordvfloat32m8_t) (J_3: Recordvuint32m8_t) (PreH1 : (ap_rvv_update32 R J_3 A_2 J_2 (make_record_vfloat32m8_t (r0) (r1) (r2) (r3) (r4) (r5) (r6) (r7) (r8) (r9) (r10) (r11) (r12) (r13) (r14) (r15) (r16) (r17) (r18) (r19) (r20) (r21) (r22) (r23) (r24) (r25) (r26) (r27) (r28) (r29) (r30) (r31)) (unsigned_last_nbits ((idx_pre + 5 )) (32)) vl_pre )) (PreH2 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p5_pre) (0)) )) (PreH3 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p5_pre) (1)) )) (PreH4 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p5_pre) (2)) )) (PreH5 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p5_pre) (3)) )) (PreH6 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p5_pre) (4)) )) (PreH7 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p5_pre) (5)) )) (PreH8 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p5_pre) (6)) )) (PreH9 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p5_pre) (7)) )) (PreH10 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p5_pre) (8)) )) (PreH11 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p5_pre) (9)) )) (PreH12 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p5_pre) (10)) )) (PreH13 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p5_pre) (11)) )) (PreH14 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p5_pre) (12)) )) (PreH15 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p5_pre) (13)) )) (PreH16 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p5_pre) (14)) )) (PreH17 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p5_pre) (15)) )) (PreH18 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p5_pre) (16)) )) (PreH19 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p5_pre) (17)) )) (PreH20 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p5_pre) (18)) )) (PreH21 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p5_pre) (19)) )) (PreH22 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p5_pre) (20)) )) (PreH23 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p5_pre) (21)) )) (PreH24 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p5_pre) (22)) )) (PreH25 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p5_pre) (23)) )) (PreH26 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p5_pre) (24)) )) (PreH27 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p5_pre) (25)) )) (PreH28 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p5_pre) (26)) )) (PreH29 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p5_pre) (27)) )) (PreH30 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p5_pre) (28)) )) (PreH31 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p5_pre) (29)) )) (PreH32 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p5_pre) (30)) )) (PreH33 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p5_pre) (31)) )) (PreH34 : (0 < vl_pre)) (PreH35 : (vl_pre <= 32)) (PreH36 : (ap_window F p0_pre vl_pre )) (PreH37 : (ap_window F p1_pre vl_pre )) (PreH38 : (ap_window F p2_pre vl_pre )) (PreH39 : (ap_window F p3_pre vl_pre )) (PreH40 : (ap_window F p4_pre vl_pre )) (PreH41 : (ap_window F p5_pre vl_pre )) (PreH42 : (ap_window F p6_pre vl_pre )) (PreH43 : (ap_window F p7_pre vl_pre )) (PreH44 : (ap_window F p8_pre vl_pre )) (PreH45 : (ap_write_window W output_pre vl_pre )) (PreH46 : (ap_write_window WI index_pre vl_pre )) (PreH47 : (ap_block32_previous ab_pre ib_pre )) (PreH48 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH49 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH50 : (ap_optional_write_window W ab_pre vl_pre )) (PreH51 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH52 : (ap_block32_acc A_2 J_2 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 4 )) ,
  TT && emp 
|--
  “ (ap_block32_acc R J_3 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 5 ) ”
  &&  emp
).

Definition ap_rvv_block32_entail_wit_6_split_goal_1 := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A_2: Recordvfloat32m8_t) (J_2: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (R: Recordvfloat32m8_t) (J_3: Recordvuint32m8_t) (PreH1 : (ap_rvv_update32 R J_3 A_2 J_2 (make_record_vfloat32m8_t (r0) (r1) (r2) (r3) (r4) (r5) (r6) (r7) (r8) (r9) (r10) (r11) (r12) (r13) (r14) (r15) (r16) (r17) (r18) (r19) (r20) (r21) (r22) (r23) (r24) (r25) (r26) (r27) (r28) (r29) (r30) (r31)) (unsigned_last_nbits ((idx_pre + 5 )) (32)) vl_pre )) (PreH2 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p5_pre) (0)) )) (PreH3 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p5_pre) (1)) )) (PreH4 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p5_pre) (2)) )) (PreH5 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p5_pre) (3)) )) (PreH6 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p5_pre) (4)) )) (PreH7 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p5_pre) (5)) )) (PreH8 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p5_pre) (6)) )) (PreH9 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p5_pre) (7)) )) (PreH10 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p5_pre) (8)) )) (PreH11 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p5_pre) (9)) )) (PreH12 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p5_pre) (10)) )) (PreH13 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p5_pre) (11)) )) (PreH14 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p5_pre) (12)) )) (PreH15 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p5_pre) (13)) )) (PreH16 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p5_pre) (14)) )) (PreH17 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p5_pre) (15)) )) (PreH18 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p5_pre) (16)) )) (PreH19 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p5_pre) (17)) )) (PreH20 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p5_pre) (18)) )) (PreH21 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p5_pre) (19)) )) (PreH22 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p5_pre) (20)) )) (PreH23 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p5_pre) (21)) )) (PreH24 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p5_pre) (22)) )) (PreH25 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p5_pre) (23)) )) (PreH26 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p5_pre) (24)) )) (PreH27 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p5_pre) (25)) )) (PreH28 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p5_pre) (26)) )) (PreH29 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p5_pre) (27)) )) (PreH30 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p5_pre) (28)) )) (PreH31 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p5_pre) (29)) )) (PreH32 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p5_pre) (30)) )) (PreH33 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p5_pre) (31)) )) (PreH34 : (0 < vl_pre)) (PreH35 : (vl_pre <= 32)) (PreH36 : (ap_window F p0_pre vl_pre )) (PreH37 : (ap_window F p1_pre vl_pre )) (PreH38 : (ap_window F p2_pre vl_pre )) (PreH39 : (ap_window F p3_pre vl_pre )) (PreH40 : (ap_window F p4_pre vl_pre )) (PreH41 : (ap_window F p5_pre vl_pre )) (PreH42 : (ap_window F p6_pre vl_pre )) (PreH43 : (ap_window F p7_pre vl_pre )) (PreH44 : (ap_window F p8_pre vl_pre )) (PreH45 : (ap_write_window W output_pre vl_pre )) (PreH46 : (ap_write_window WI index_pre vl_pre )) (PreH47 : (ap_block32_previous ab_pre ib_pre )) (PreH48 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH49 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH50 : (ap_optional_write_window W ab_pre vl_pre )) (PreH51 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH52 : (ap_block32_acc A_2 J_2 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 4 )) ,
  (ap_block32_acc R J_3 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 5 )
.

Definition ap_rvv_block32_entail_wit_7 := 
(
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A_2: Recordvfloat32m8_t) (J_2: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (R: Recordvfloat32m8_t) (J_3: Recordvuint32m8_t) (PreH1 : (ap_rvv_update32 R J_3 A_2 J_2 (make_record_vfloat32m8_t (r0) (r1) (r2) (r3) (r4) (r5) (r6) (r7) (r8) (r9) (r10) (r11) (r12) (r13) (r14) (r15) (r16) (r17) (r18) (r19) (r20) (r21) (r22) (r23) (r24) (r25) (r26) (r27) (r28) (r29) (r30) (r31)) (unsigned_last_nbits ((idx_pre + 6 )) (32)) vl_pre )) (PreH2 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p6_pre) (0)) )) (PreH3 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p6_pre) (1)) )) (PreH4 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p6_pre) (2)) )) (PreH5 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p6_pre) (3)) )) (PreH6 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p6_pre) (4)) )) (PreH7 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p6_pre) (5)) )) (PreH8 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p6_pre) (6)) )) (PreH9 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p6_pre) (7)) )) (PreH10 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p6_pre) (8)) )) (PreH11 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p6_pre) (9)) )) (PreH12 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p6_pre) (10)) )) (PreH13 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p6_pre) (11)) )) (PreH14 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p6_pre) (12)) )) (PreH15 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p6_pre) (13)) )) (PreH16 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p6_pre) (14)) )) (PreH17 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p6_pre) (15)) )) (PreH18 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p6_pre) (16)) )) (PreH19 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p6_pre) (17)) )) (PreH20 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p6_pre) (18)) )) (PreH21 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p6_pre) (19)) )) (PreH22 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p6_pre) (20)) )) (PreH23 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p6_pre) (21)) )) (PreH24 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p6_pre) (22)) )) (PreH25 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p6_pre) (23)) )) (PreH26 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p6_pre) (24)) )) (PreH27 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p6_pre) (25)) )) (PreH28 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p6_pre) (26)) )) (PreH29 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p6_pre) (27)) )) (PreH30 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p6_pre) (28)) )) (PreH31 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p6_pre) (29)) )) (PreH32 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p6_pre) (30)) )) (PreH33 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p6_pre) (31)) )) (PreH34 : (0 < vl_pre)) (PreH35 : (vl_pre <= 32)) (PreH36 : (ap_window F p0_pre vl_pre )) (PreH37 : (ap_window F p1_pre vl_pre )) (PreH38 : (ap_window F p2_pre vl_pre )) (PreH39 : (ap_window F p3_pre vl_pre )) (PreH40 : (ap_window F p4_pre vl_pre )) (PreH41 : (ap_window F p5_pre vl_pre )) (PreH42 : (ap_window F p6_pre vl_pre )) (PreH43 : (ap_window F p7_pre vl_pre )) (PreH44 : (ap_window F p8_pre vl_pre )) (PreH45 : (ap_write_window W output_pre vl_pre )) (PreH46 : (ap_write_window WI index_pre vl_pre )) (PreH47 : (ap_block32_previous ab_pre ib_pre )) (PreH48 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH49 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH50 : (ap_optional_write_window W ab_pre vl_pre )) (PreH51 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH52 : (ap_block32_acc A_2 J_2 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 5 )) ,
  (StructPredvfloat32m8_t ( &( "a" ) ) R )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J_3 )
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
|--
  EX (A: Recordvfloat32m8_t)  (J: Recordvuint32m8_t) ,
  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 6 ) ”
  &&  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
) \/
(
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A_2: Recordvfloat32m8_t) (J_2: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (R: Recordvfloat32m8_t) (J_3: Recordvuint32m8_t) (PreH1 : (ap_rvv_update32 R J_3 A_2 J_2 (make_record_vfloat32m8_t (r0) (r1) (r2) (r3) (r4) (r5) (r6) (r7) (r8) (r9) (r10) (r11) (r12) (r13) (r14) (r15) (r16) (r17) (r18) (r19) (r20) (r21) (r22) (r23) (r24) (r25) (r26) (r27) (r28) (r29) (r30) (r31)) (unsigned_last_nbits ((idx_pre + 6 )) (32)) vl_pre )) (PreH2 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p6_pre) (0)) )) (PreH3 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p6_pre) (1)) )) (PreH4 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p6_pre) (2)) )) (PreH5 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p6_pre) (3)) )) (PreH6 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p6_pre) (4)) )) (PreH7 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p6_pre) (5)) )) (PreH8 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p6_pre) (6)) )) (PreH9 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p6_pre) (7)) )) (PreH10 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p6_pre) (8)) )) (PreH11 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p6_pre) (9)) )) (PreH12 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p6_pre) (10)) )) (PreH13 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p6_pre) (11)) )) (PreH14 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p6_pre) (12)) )) (PreH15 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p6_pre) (13)) )) (PreH16 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p6_pre) (14)) )) (PreH17 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p6_pre) (15)) )) (PreH18 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p6_pre) (16)) )) (PreH19 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p6_pre) (17)) )) (PreH20 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p6_pre) (18)) )) (PreH21 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p6_pre) (19)) )) (PreH22 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p6_pre) (20)) )) (PreH23 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p6_pre) (21)) )) (PreH24 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p6_pre) (22)) )) (PreH25 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p6_pre) (23)) )) (PreH26 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p6_pre) (24)) )) (PreH27 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p6_pre) (25)) )) (PreH28 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p6_pre) (26)) )) (PreH29 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p6_pre) (27)) )) (PreH30 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p6_pre) (28)) )) (PreH31 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p6_pre) (29)) )) (PreH32 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p6_pre) (30)) )) (PreH33 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p6_pre) (31)) )) (PreH34 : (0 < vl_pre)) (PreH35 : (vl_pre <= 32)) (PreH36 : (ap_window F p0_pre vl_pre )) (PreH37 : (ap_window F p1_pre vl_pre )) (PreH38 : (ap_window F p2_pre vl_pre )) (PreH39 : (ap_window F p3_pre vl_pre )) (PreH40 : (ap_window F p4_pre vl_pre )) (PreH41 : (ap_window F p5_pre vl_pre )) (PreH42 : (ap_window F p6_pre vl_pre )) (PreH43 : (ap_window F p7_pre vl_pre )) (PreH44 : (ap_window F p8_pre vl_pre )) (PreH45 : (ap_write_window W output_pre vl_pre )) (PreH46 : (ap_write_window WI index_pre vl_pre )) (PreH47 : (ap_block32_previous ab_pre ib_pre )) (PreH48 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH49 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH50 : (ap_optional_write_window W ab_pre vl_pre )) (PreH51 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH52 : (ap_block32_acc A_2 J_2 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 5 )) ,
  TT && emp 
|--
  “ (ap_block32_acc R J_3 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 6 ) ”
  &&  emp
).

Definition ap_rvv_block32_entail_wit_7_split_goal_1 := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A_2: Recordvfloat32m8_t) (J_2: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (R: Recordvfloat32m8_t) (J_3: Recordvuint32m8_t) (PreH1 : (ap_rvv_update32 R J_3 A_2 J_2 (make_record_vfloat32m8_t (r0) (r1) (r2) (r3) (r4) (r5) (r6) (r7) (r8) (r9) (r10) (r11) (r12) (r13) (r14) (r15) (r16) (r17) (r18) (r19) (r20) (r21) (r22) (r23) (r24) (r25) (r26) (r27) (r28) (r29) (r30) (r31)) (unsigned_last_nbits ((idx_pre + 6 )) (32)) vl_pre )) (PreH2 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p6_pre) (0)) )) (PreH3 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p6_pre) (1)) )) (PreH4 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p6_pre) (2)) )) (PreH5 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p6_pre) (3)) )) (PreH6 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p6_pre) (4)) )) (PreH7 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p6_pre) (5)) )) (PreH8 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p6_pre) (6)) )) (PreH9 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p6_pre) (7)) )) (PreH10 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p6_pre) (8)) )) (PreH11 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p6_pre) (9)) )) (PreH12 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p6_pre) (10)) )) (PreH13 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p6_pre) (11)) )) (PreH14 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p6_pre) (12)) )) (PreH15 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p6_pre) (13)) )) (PreH16 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p6_pre) (14)) )) (PreH17 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p6_pre) (15)) )) (PreH18 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p6_pre) (16)) )) (PreH19 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p6_pre) (17)) )) (PreH20 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p6_pre) (18)) )) (PreH21 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p6_pre) (19)) )) (PreH22 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p6_pre) (20)) )) (PreH23 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p6_pre) (21)) )) (PreH24 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p6_pre) (22)) )) (PreH25 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p6_pre) (23)) )) (PreH26 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p6_pre) (24)) )) (PreH27 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p6_pre) (25)) )) (PreH28 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p6_pre) (26)) )) (PreH29 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p6_pre) (27)) )) (PreH30 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p6_pre) (28)) )) (PreH31 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p6_pre) (29)) )) (PreH32 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p6_pre) (30)) )) (PreH33 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p6_pre) (31)) )) (PreH34 : (0 < vl_pre)) (PreH35 : (vl_pre <= 32)) (PreH36 : (ap_window F p0_pre vl_pre )) (PreH37 : (ap_window F p1_pre vl_pre )) (PreH38 : (ap_window F p2_pre vl_pre )) (PreH39 : (ap_window F p3_pre vl_pre )) (PreH40 : (ap_window F p4_pre vl_pre )) (PreH41 : (ap_window F p5_pre vl_pre )) (PreH42 : (ap_window F p6_pre vl_pre )) (PreH43 : (ap_window F p7_pre vl_pre )) (PreH44 : (ap_window F p8_pre vl_pre )) (PreH45 : (ap_write_window W output_pre vl_pre )) (PreH46 : (ap_write_window WI index_pre vl_pre )) (PreH47 : (ap_block32_previous ab_pre ib_pre )) (PreH48 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH49 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH50 : (ap_optional_write_window W ab_pre vl_pre )) (PreH51 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH52 : (ap_block32_acc A_2 J_2 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 5 )) ,
  (ap_block32_acc R J_3 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 6 )
.

Definition ap_rvv_block32_entail_wit_8 := 
(
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A_2: Recordvfloat32m8_t) (J_2: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (R: Recordvfloat32m8_t) (J_3: Recordvuint32m8_t) (PreH1 : (ap_rvv_update32 R J_3 A_2 J_2 (make_record_vfloat32m8_t (r0) (r1) (r2) (r3) (r4) (r5) (r6) (r7) (r8) (r9) (r10) (r11) (r12) (r13) (r14) (r15) (r16) (r17) (r18) (r19) (r20) (r21) (r22) (r23) (r24) (r25) (r26) (r27) (r28) (r29) (r30) (r31)) (unsigned_last_nbits ((idx_pre + 7 )) (32)) vl_pre )) (PreH2 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p7_pre) (0)) )) (PreH3 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p7_pre) (1)) )) (PreH4 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p7_pre) (2)) )) (PreH5 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p7_pre) (3)) )) (PreH6 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p7_pre) (4)) )) (PreH7 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p7_pre) (5)) )) (PreH8 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p7_pre) (6)) )) (PreH9 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p7_pre) (7)) )) (PreH10 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p7_pre) (8)) )) (PreH11 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p7_pre) (9)) )) (PreH12 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p7_pre) (10)) )) (PreH13 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p7_pre) (11)) )) (PreH14 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p7_pre) (12)) )) (PreH15 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p7_pre) (13)) )) (PreH16 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p7_pre) (14)) )) (PreH17 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p7_pre) (15)) )) (PreH18 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p7_pre) (16)) )) (PreH19 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p7_pre) (17)) )) (PreH20 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p7_pre) (18)) )) (PreH21 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p7_pre) (19)) )) (PreH22 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p7_pre) (20)) )) (PreH23 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p7_pre) (21)) )) (PreH24 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p7_pre) (22)) )) (PreH25 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p7_pre) (23)) )) (PreH26 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p7_pre) (24)) )) (PreH27 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p7_pre) (25)) )) (PreH28 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p7_pre) (26)) )) (PreH29 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p7_pre) (27)) )) (PreH30 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p7_pre) (28)) )) (PreH31 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p7_pre) (29)) )) (PreH32 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p7_pre) (30)) )) (PreH33 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p7_pre) (31)) )) (PreH34 : (0 < vl_pre)) (PreH35 : (vl_pre <= 32)) (PreH36 : (ap_window F p0_pre vl_pre )) (PreH37 : (ap_window F p1_pre vl_pre )) (PreH38 : (ap_window F p2_pre vl_pre )) (PreH39 : (ap_window F p3_pre vl_pre )) (PreH40 : (ap_window F p4_pre vl_pre )) (PreH41 : (ap_window F p5_pre vl_pre )) (PreH42 : (ap_window F p6_pre vl_pre )) (PreH43 : (ap_window F p7_pre vl_pre )) (PreH44 : (ap_window F p8_pre vl_pre )) (PreH45 : (ap_write_window W output_pre vl_pre )) (PreH46 : (ap_write_window WI index_pre vl_pre )) (PreH47 : (ap_block32_previous ab_pre ib_pre )) (PreH48 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH49 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH50 : (ap_optional_write_window W ab_pre vl_pre )) (PreH51 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH52 : (ap_block32_acc A_2 J_2 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 6 )) ,
  (StructPredvfloat32m8_t ( &( "a" ) ) R )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J_3 )
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
|--
  EX (A: Recordvfloat32m8_t)  (J: Recordvuint32m8_t) ,
  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 7 ) ”
  &&  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
) \/
(
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A_2: Recordvfloat32m8_t) (J_2: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (R: Recordvfloat32m8_t) (J_3: Recordvuint32m8_t) (PreH1 : (ap_rvv_update32 R J_3 A_2 J_2 (make_record_vfloat32m8_t (r0) (r1) (r2) (r3) (r4) (r5) (r6) (r7) (r8) (r9) (r10) (r11) (r12) (r13) (r14) (r15) (r16) (r17) (r18) (r19) (r20) (r21) (r22) (r23) (r24) (r25) (r26) (r27) (r28) (r29) (r30) (r31)) (unsigned_last_nbits ((idx_pre + 7 )) (32)) vl_pre )) (PreH2 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p7_pre) (0)) )) (PreH3 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p7_pre) (1)) )) (PreH4 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p7_pre) (2)) )) (PreH5 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p7_pre) (3)) )) (PreH6 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p7_pre) (4)) )) (PreH7 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p7_pre) (5)) )) (PreH8 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p7_pre) (6)) )) (PreH9 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p7_pre) (7)) )) (PreH10 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p7_pre) (8)) )) (PreH11 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p7_pre) (9)) )) (PreH12 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p7_pre) (10)) )) (PreH13 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p7_pre) (11)) )) (PreH14 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p7_pre) (12)) )) (PreH15 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p7_pre) (13)) )) (PreH16 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p7_pre) (14)) )) (PreH17 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p7_pre) (15)) )) (PreH18 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p7_pre) (16)) )) (PreH19 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p7_pre) (17)) )) (PreH20 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p7_pre) (18)) )) (PreH21 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p7_pre) (19)) )) (PreH22 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p7_pre) (20)) )) (PreH23 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p7_pre) (21)) )) (PreH24 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p7_pre) (22)) )) (PreH25 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p7_pre) (23)) )) (PreH26 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p7_pre) (24)) )) (PreH27 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p7_pre) (25)) )) (PreH28 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p7_pre) (26)) )) (PreH29 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p7_pre) (27)) )) (PreH30 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p7_pre) (28)) )) (PreH31 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p7_pre) (29)) )) (PreH32 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p7_pre) (30)) )) (PreH33 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p7_pre) (31)) )) (PreH34 : (0 < vl_pre)) (PreH35 : (vl_pre <= 32)) (PreH36 : (ap_window F p0_pre vl_pre )) (PreH37 : (ap_window F p1_pre vl_pre )) (PreH38 : (ap_window F p2_pre vl_pre )) (PreH39 : (ap_window F p3_pre vl_pre )) (PreH40 : (ap_window F p4_pre vl_pre )) (PreH41 : (ap_window F p5_pre vl_pre )) (PreH42 : (ap_window F p6_pre vl_pre )) (PreH43 : (ap_window F p7_pre vl_pre )) (PreH44 : (ap_window F p8_pre vl_pre )) (PreH45 : (ap_write_window W output_pre vl_pre )) (PreH46 : (ap_write_window WI index_pre vl_pre )) (PreH47 : (ap_block32_previous ab_pre ib_pre )) (PreH48 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH49 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH50 : (ap_optional_write_window W ab_pre vl_pre )) (PreH51 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH52 : (ap_block32_acc A_2 J_2 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 6 )) ,
  TT && emp 
|--
  “ (ap_block32_acc R J_3 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 7 ) ”
  &&  emp
).

Definition ap_rvv_block32_entail_wit_8_split_goal_1 := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A_2: Recordvfloat32m8_t) (J_2: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (R: Recordvfloat32m8_t) (J_3: Recordvuint32m8_t) (PreH1 : (ap_rvv_update32 R J_3 A_2 J_2 (make_record_vfloat32m8_t (r0) (r1) (r2) (r3) (r4) (r5) (r6) (r7) (r8) (r9) (r10) (r11) (r12) (r13) (r14) (r15) (r16) (r17) (r18) (r19) (r20) (r21) (r22) (r23) (r24) (r25) (r26) (r27) (r28) (r29) (r30) (r31)) (unsigned_last_nbits ((idx_pre + 7 )) (32)) vl_pre )) (PreH2 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p7_pre) (0)) )) (PreH3 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p7_pre) (1)) )) (PreH4 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p7_pre) (2)) )) (PreH5 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p7_pre) (3)) )) (PreH6 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p7_pre) (4)) )) (PreH7 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p7_pre) (5)) )) (PreH8 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p7_pre) (6)) )) (PreH9 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p7_pre) (7)) )) (PreH10 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p7_pre) (8)) )) (PreH11 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p7_pre) (9)) )) (PreH12 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p7_pre) (10)) )) (PreH13 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p7_pre) (11)) )) (PreH14 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p7_pre) (12)) )) (PreH15 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p7_pre) (13)) )) (PreH16 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p7_pre) (14)) )) (PreH17 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p7_pre) (15)) )) (PreH18 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p7_pre) (16)) )) (PreH19 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p7_pre) (17)) )) (PreH20 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p7_pre) (18)) )) (PreH21 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p7_pre) (19)) )) (PreH22 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p7_pre) (20)) )) (PreH23 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p7_pre) (21)) )) (PreH24 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p7_pre) (22)) )) (PreH25 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p7_pre) (23)) )) (PreH26 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p7_pre) (24)) )) (PreH27 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p7_pre) (25)) )) (PreH28 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p7_pre) (26)) )) (PreH29 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p7_pre) (27)) )) (PreH30 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p7_pre) (28)) )) (PreH31 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p7_pre) (29)) )) (PreH32 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p7_pre) (30)) )) (PreH33 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p7_pre) (31)) )) (PreH34 : (0 < vl_pre)) (PreH35 : (vl_pre <= 32)) (PreH36 : (ap_window F p0_pre vl_pre )) (PreH37 : (ap_window F p1_pre vl_pre )) (PreH38 : (ap_window F p2_pre vl_pre )) (PreH39 : (ap_window F p3_pre vl_pre )) (PreH40 : (ap_window F p4_pre vl_pre )) (PreH41 : (ap_window F p5_pre vl_pre )) (PreH42 : (ap_window F p6_pre vl_pre )) (PreH43 : (ap_window F p7_pre vl_pre )) (PreH44 : (ap_window F p8_pre vl_pre )) (PreH45 : (ap_write_window W output_pre vl_pre )) (PreH46 : (ap_write_window WI index_pre vl_pre )) (PreH47 : (ap_block32_previous ab_pre ib_pre )) (PreH48 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH49 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH50 : (ap_optional_write_window W ab_pre vl_pre )) (PreH51 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH52 : (ap_block32_acc A_2 J_2 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 6 )) ,
  (ap_block32_acc R J_3 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 7 )
.

Definition ap_rvv_block32_entail_wit_9 := 
(
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A_2: Recordvfloat32m8_t) (J_2: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (R: Recordvfloat32m8_t) (J_3: Recordvuint32m8_t) (PreH1 : (ap_rvv_update32 R J_3 A_2 J_2 (make_record_vfloat32m8_t (r0) (r1) (r2) (r3) (r4) (r5) (r6) (r7) (r8) (r9) (r10) (r11) (r12) (r13) (r14) (r15) (r16) (r17) (r18) (r19) (r20) (r21) (r22) (r23) (r24) (r25) (r26) (r27) (r28) (r29) (r30) (r31)) (unsigned_last_nbits ((idx_pre + 8 )) (32)) vl_pre )) (PreH2 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p8_pre) (0)) )) (PreH3 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p8_pre) (1)) )) (PreH4 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p8_pre) (2)) )) (PreH5 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p8_pre) (3)) )) (PreH6 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p8_pre) (4)) )) (PreH7 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p8_pre) (5)) )) (PreH8 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p8_pre) (6)) )) (PreH9 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p8_pre) (7)) )) (PreH10 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p8_pre) (8)) )) (PreH11 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p8_pre) (9)) )) (PreH12 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p8_pre) (10)) )) (PreH13 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p8_pre) (11)) )) (PreH14 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p8_pre) (12)) )) (PreH15 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p8_pre) (13)) )) (PreH16 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p8_pre) (14)) )) (PreH17 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p8_pre) (15)) )) (PreH18 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p8_pre) (16)) )) (PreH19 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p8_pre) (17)) )) (PreH20 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p8_pre) (18)) )) (PreH21 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p8_pre) (19)) )) (PreH22 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p8_pre) (20)) )) (PreH23 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p8_pre) (21)) )) (PreH24 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p8_pre) (22)) )) (PreH25 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p8_pre) (23)) )) (PreH26 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p8_pre) (24)) )) (PreH27 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p8_pre) (25)) )) (PreH28 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p8_pre) (26)) )) (PreH29 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p8_pre) (27)) )) (PreH30 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p8_pre) (28)) )) (PreH31 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p8_pre) (29)) )) (PreH32 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p8_pre) (30)) )) (PreH33 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p8_pre) (31)) )) (PreH34 : (0 < vl_pre)) (PreH35 : (vl_pre <= 32)) (PreH36 : (ap_window F p0_pre vl_pre )) (PreH37 : (ap_window F p1_pre vl_pre )) (PreH38 : (ap_window F p2_pre vl_pre )) (PreH39 : (ap_window F p3_pre vl_pre )) (PreH40 : (ap_window F p4_pre vl_pre )) (PreH41 : (ap_window F p5_pre vl_pre )) (PreH42 : (ap_window F p6_pre vl_pre )) (PreH43 : (ap_window F p7_pre vl_pre )) (PreH44 : (ap_window F p8_pre vl_pre )) (PreH45 : (ap_write_window W output_pre vl_pre )) (PreH46 : (ap_write_window WI index_pre vl_pre )) (PreH47 : (ap_block32_previous ab_pre ib_pre )) (PreH48 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH49 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH50 : (ap_optional_write_window W ab_pre vl_pre )) (PreH51 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH52 : (ap_block32_acc A_2 J_2 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 7 )) ,
  (StructPredvfloat32m8_t ( &( "a" ) ) R )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J_3 )
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
|--
  EX (A: Recordvfloat32m8_t)  (J: Recordvuint32m8_t) ,
  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 8 ) ”
  &&  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
) \/
(
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A_2: Recordvfloat32m8_t) (J_2: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (R: Recordvfloat32m8_t) (J_3: Recordvuint32m8_t) (PreH1 : (ap_rvv_update32 R J_3 A_2 J_2 (make_record_vfloat32m8_t (r0) (r1) (r2) (r3) (r4) (r5) (r6) (r7) (r8) (r9) (r10) (r11) (r12) (r13) (r14) (r15) (r16) (r17) (r18) (r19) (r20) (r21) (r22) (r23) (r24) (r25) (r26) (r27) (r28) (r29) (r30) (r31)) (unsigned_last_nbits ((idx_pre + 8 )) (32)) vl_pre )) (PreH2 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p8_pre) (0)) )) (PreH3 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p8_pre) (1)) )) (PreH4 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p8_pre) (2)) )) (PreH5 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p8_pre) (3)) )) (PreH6 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p8_pre) (4)) )) (PreH7 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p8_pre) (5)) )) (PreH8 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p8_pre) (6)) )) (PreH9 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p8_pre) (7)) )) (PreH10 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p8_pre) (8)) )) (PreH11 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p8_pre) (9)) )) (PreH12 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p8_pre) (10)) )) (PreH13 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p8_pre) (11)) )) (PreH14 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p8_pre) (12)) )) (PreH15 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p8_pre) (13)) )) (PreH16 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p8_pre) (14)) )) (PreH17 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p8_pre) (15)) )) (PreH18 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p8_pre) (16)) )) (PreH19 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p8_pre) (17)) )) (PreH20 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p8_pre) (18)) )) (PreH21 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p8_pre) (19)) )) (PreH22 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p8_pre) (20)) )) (PreH23 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p8_pre) (21)) )) (PreH24 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p8_pre) (22)) )) (PreH25 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p8_pre) (23)) )) (PreH26 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p8_pre) (24)) )) (PreH27 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p8_pre) (25)) )) (PreH28 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p8_pre) (26)) )) (PreH29 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p8_pre) (27)) )) (PreH30 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p8_pre) (28)) )) (PreH31 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p8_pre) (29)) )) (PreH32 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p8_pre) (30)) )) (PreH33 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p8_pre) (31)) )) (PreH34 : (0 < vl_pre)) (PreH35 : (vl_pre <= 32)) (PreH36 : (ap_window F p0_pre vl_pre )) (PreH37 : (ap_window F p1_pre vl_pre )) (PreH38 : (ap_window F p2_pre vl_pre )) (PreH39 : (ap_window F p3_pre vl_pre )) (PreH40 : (ap_window F p4_pre vl_pre )) (PreH41 : (ap_window F p5_pre vl_pre )) (PreH42 : (ap_window F p6_pre vl_pre )) (PreH43 : (ap_window F p7_pre vl_pre )) (PreH44 : (ap_window F p8_pre vl_pre )) (PreH45 : (ap_write_window W output_pre vl_pre )) (PreH46 : (ap_write_window WI index_pre vl_pre )) (PreH47 : (ap_block32_previous ab_pre ib_pre )) (PreH48 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH49 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH50 : (ap_optional_write_window W ab_pre vl_pre )) (PreH51 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH52 : (ap_block32_acc A_2 J_2 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 7 )) ,
  TT && emp 
|--
  “ (ap_block32_acc R J_3 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 8 ) ”
  &&  emp
).

Definition ap_rvv_block32_entail_wit_9_split_goal_1 := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A_2: Recordvfloat32m8_t) (J_2: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (R: Recordvfloat32m8_t) (J_3: Recordvuint32m8_t) (PreH1 : (ap_rvv_update32 R J_3 A_2 J_2 (make_record_vfloat32m8_t (r0) (r1) (r2) (r3) (r4) (r5) (r6) (r7) (r8) (r9) (r10) (r11) (r12) (r13) (r14) (r15) (r16) (r17) (r18) (r19) (r20) (r21) (r22) (r23) (r24) (r25) (r26) (r27) (r28) (r29) (r30) (r31)) (unsigned_last_nbits ((idx_pre + 8 )) (32)) vl_pre )) (PreH2 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p8_pre) (0)) )) (PreH3 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p8_pre) (1)) )) (PreH4 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p8_pre) (2)) )) (PreH5 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p8_pre) (3)) )) (PreH6 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p8_pre) (4)) )) (PreH7 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p8_pre) (5)) )) (PreH8 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p8_pre) (6)) )) (PreH9 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p8_pre) (7)) )) (PreH10 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p8_pre) (8)) )) (PreH11 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p8_pre) (9)) )) (PreH12 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p8_pre) (10)) )) (PreH13 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p8_pre) (11)) )) (PreH14 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p8_pre) (12)) )) (PreH15 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p8_pre) (13)) )) (PreH16 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p8_pre) (14)) )) (PreH17 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p8_pre) (15)) )) (PreH18 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p8_pre) (16)) )) (PreH19 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p8_pre) (17)) )) (PreH20 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p8_pre) (18)) )) (PreH21 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p8_pre) (19)) )) (PreH22 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p8_pre) (20)) )) (PreH23 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p8_pre) (21)) )) (PreH24 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p8_pre) (22)) )) (PreH25 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p8_pre) (23)) )) (PreH26 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p8_pre) (24)) )) (PreH27 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p8_pre) (25)) )) (PreH28 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p8_pre) (26)) )) (PreH29 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p8_pre) (27)) )) (PreH30 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p8_pre) (28)) )) (PreH31 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p8_pre) (29)) )) (PreH32 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p8_pre) (30)) )) (PreH33 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p8_pre) (31)) )) (PreH34 : (0 < vl_pre)) (PreH35 : (vl_pre <= 32)) (PreH36 : (ap_window F p0_pre vl_pre )) (PreH37 : (ap_window F p1_pre vl_pre )) (PreH38 : (ap_window F p2_pre vl_pre )) (PreH39 : (ap_window F p3_pre vl_pre )) (PreH40 : (ap_window F p4_pre vl_pre )) (PreH41 : (ap_window F p5_pre vl_pre )) (PreH42 : (ap_window F p6_pre vl_pre )) (PreH43 : (ap_window F p7_pre vl_pre )) (PreH44 : (ap_window F p8_pre vl_pre )) (PreH45 : (ap_write_window W output_pre vl_pre )) (PreH46 : (ap_write_window WI index_pre vl_pre )) (PreH47 : (ap_block32_previous ab_pre ib_pre )) (PreH48 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH49 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH50 : (ap_optional_write_window W ab_pre vl_pre )) (PreH51 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH52 : (ap_block32_acc A_2 J_2 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 7 )) ,
  (ap_block32_acc R J_3 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 8 )
.

Definition ap_rvv_block32_return_wit_1 := 
(
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (PreH1 : (0 < vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (ap_window F p0_pre vl_pre )) (PreH4 : (ap_window F p1_pre vl_pre )) (PreH5 : (ap_window F p2_pre vl_pre )) (PreH6 : (ap_window F p3_pre vl_pre )) (PreH7 : (ap_window F p4_pre vl_pre )) (PreH8 : (ap_window F p5_pre vl_pre )) (PreH9 : (ap_window F p6_pre vl_pre )) (PreH10 : (ap_window F p7_pre vl_pre )) (PreH11 : (ap_window F p8_pre vl_pre )) (PreH12 : (ap_write_window W output_pre vl_pre )) (PreH13 : (ap_write_window WI index_pre vl_pre )) (PreH14 : (ap_block32_previous ab_pre ib_pre )) (PreH15 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH16 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH17 : (ap_optional_write_window W ab_pre vl_pre )) (PreH18 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH19 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 8 )) ,
  (ap_index WI (ap_index_write (I) (index_pre) (vl_pre) ((ap_ipack32 ((J.(vuint32m8_t_s0) )) ((J.(vuint32m8_t_s1) )) ((J.(vuint32m8_t_s2) )) ((J.(vuint32m8_t_s3) )) ((J.(vuint32m8_t_s4) )) ((J.(vuint32m8_t_s5) )) ((J.(vuint32m8_t_s6) )) ((J.(vuint32m8_t_s7) )) ((J.(vuint32m8_t_s8) )) ((J.(vuint32m8_t_s9) )) ((J.(vuint32m8_t_s10) )) ((J.(vuint32m8_t_s11) )) ((J.(vuint32m8_t_s12) )) ((J.(vuint32m8_t_s13) )) ((J.(vuint32m8_t_s14) )) ((J.(vuint32m8_t_s15) )) ((J.(vuint32m8_t_s16) )) ((J.(vuint32m8_t_s17) )) ((J.(vuint32m8_t_s18) )) ((J.(vuint32m8_t_s19) )) ((J.(vuint32m8_t_s20) )) ((J.(vuint32m8_t_s21) )) ((J.(vuint32m8_t_s22) )) ((J.(vuint32m8_t_s23) )) ((J.(vuint32m8_t_s24) )) ((J.(vuint32m8_t_s25) )) ((J.(vuint32m8_t_s26) )) ((J.(vuint32m8_t_s27) )) ((J.(vuint32m8_t_s28) )) ((J.(vuint32m8_t_s29) )) ((J.(vuint32m8_t_s30) )) ((J.(vuint32m8_t_s31) ))))) )
  **  (ap_output W (ap_output_write (O) (output_pre) (vl_pre) ((ap_fpack32 ((A.(vfloat32m8_t_s0) )) ((A.(vfloat32m8_t_s1) )) ((A.(vfloat32m8_t_s2) )) ((A.(vfloat32m8_t_s3) )) ((A.(vfloat32m8_t_s4) )) ((A.(vfloat32m8_t_s5) )) ((A.(vfloat32m8_t_s6) )) ((A.(vfloat32m8_t_s7) )) ((A.(vfloat32m8_t_s8) )) ((A.(vfloat32m8_t_s9) )) ((A.(vfloat32m8_t_s10) )) ((A.(vfloat32m8_t_s11) )) ((A.(vfloat32m8_t_s12) )) ((A.(vfloat32m8_t_s13) )) ((A.(vfloat32m8_t_s14) )) ((A.(vfloat32m8_t_s15) )) ((A.(vfloat32m8_t_s16) )) ((A.(vfloat32m8_t_s17) )) ((A.(vfloat32m8_t_s18) )) ((A.(vfloat32m8_t_s19) )) ((A.(vfloat32m8_t_s20) )) ((A.(vfloat32m8_t_s21) )) ((A.(vfloat32m8_t_s22) )) ((A.(vfloat32m8_t_s23) )) ((A.(vfloat32m8_t_s24) )) ((A.(vfloat32m8_t_s25) )) ((A.(vfloat32m8_t_s26) )) ((A.(vfloat32m8_t_s27) )) ((A.(vfloat32m8_t_s28) )) ((A.(vfloat32m8_t_s29) )) ((A.(vfloat32m8_t_s30) )) ((A.(vfloat32m8_t_s31) ))))) )
  **  (ap_data F )
|--
  EX (O2: APOutput)  (I2: APIndex) ,
  “ (ap_block32_written F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre output_pre index_pre O2 I2 ) ” 
  &&  “ (ap_block32_frames O I O2 I2 vl_pre output_pre index_pre ) ”
  &&  (ap_data F )
  **  (ap_output W O2 )
  **  (ap_index WI I2 )
) \/
(
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (PreH1 : (0 < vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (ap_window F p0_pre vl_pre )) (PreH4 : (ap_window F p1_pre vl_pre )) (PreH5 : (ap_window F p2_pre vl_pre )) (PreH6 : (ap_window F p3_pre vl_pre )) (PreH7 : (ap_window F p4_pre vl_pre )) (PreH8 : (ap_window F p5_pre vl_pre )) (PreH9 : (ap_window F p6_pre vl_pre )) (PreH10 : (ap_window F p7_pre vl_pre )) (PreH11 : (ap_window F p8_pre vl_pre )) (PreH12 : (ap_write_window W output_pre vl_pre )) (PreH13 : (ap_write_window WI index_pre vl_pre )) (PreH14 : (ap_block32_previous ab_pre ib_pre )) (PreH15 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH16 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH17 : (ap_optional_write_window W ab_pre vl_pre )) (PreH18 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH19 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 8 )) ,
  TT && emp 
|--
  “ (ap_block32_frames O I (ap_output_write (O) (output_pre) (vl_pre) ((ap_fpack32 ((A.(vfloat32m8_t_s0) )) ((A.(vfloat32m8_t_s1) )) ((A.(vfloat32m8_t_s2) )) ((A.(vfloat32m8_t_s3) )) ((A.(vfloat32m8_t_s4) )) ((A.(vfloat32m8_t_s5) )) ((A.(vfloat32m8_t_s6) )) ((A.(vfloat32m8_t_s7) )) ((A.(vfloat32m8_t_s8) )) ((A.(vfloat32m8_t_s9) )) ((A.(vfloat32m8_t_s10) )) ((A.(vfloat32m8_t_s11) )) ((A.(vfloat32m8_t_s12) )) ((A.(vfloat32m8_t_s13) )) ((A.(vfloat32m8_t_s14) )) ((A.(vfloat32m8_t_s15) )) ((A.(vfloat32m8_t_s16) )) ((A.(vfloat32m8_t_s17) )) ((A.(vfloat32m8_t_s18) )) ((A.(vfloat32m8_t_s19) )) ((A.(vfloat32m8_t_s20) )) ((A.(vfloat32m8_t_s21) )) ((A.(vfloat32m8_t_s22) )) ((A.(vfloat32m8_t_s23) )) ((A.(vfloat32m8_t_s24) )) ((A.(vfloat32m8_t_s25) )) ((A.(vfloat32m8_t_s26) )) ((A.(vfloat32m8_t_s27) )) ((A.(vfloat32m8_t_s28) )) ((A.(vfloat32m8_t_s29) )) ((A.(vfloat32m8_t_s30) )) ((A.(vfloat32m8_t_s31) ))))) (ap_index_write (I) (index_pre) (vl_pre) ((ap_ipack32 ((J.(vuint32m8_t_s0) )) ((J.(vuint32m8_t_s1) )) ((J.(vuint32m8_t_s2) )) ((J.(vuint32m8_t_s3) )) ((J.(vuint32m8_t_s4) )) ((J.(vuint32m8_t_s5) )) ((J.(vuint32m8_t_s6) )) ((J.(vuint32m8_t_s7) )) ((J.(vuint32m8_t_s8) )) ((J.(vuint32m8_t_s9) )) ((J.(vuint32m8_t_s10) )) ((J.(vuint32m8_t_s11) )) ((J.(vuint32m8_t_s12) )) ((J.(vuint32m8_t_s13) )) ((J.(vuint32m8_t_s14) )) ((J.(vuint32m8_t_s15) )) ((J.(vuint32m8_t_s16) )) ((J.(vuint32m8_t_s17) )) ((J.(vuint32m8_t_s18) )) ((J.(vuint32m8_t_s19) )) ((J.(vuint32m8_t_s20) )) ((J.(vuint32m8_t_s21) )) ((J.(vuint32m8_t_s22) )) ((J.(vuint32m8_t_s23) )) ((J.(vuint32m8_t_s24) )) ((J.(vuint32m8_t_s25) )) ((J.(vuint32m8_t_s26) )) ((J.(vuint32m8_t_s27) )) ((J.(vuint32m8_t_s28) )) ((J.(vuint32m8_t_s29) )) ((J.(vuint32m8_t_s30) )) ((J.(vuint32m8_t_s31) ))))) vl_pre output_pre index_pre ) ” 
  &&  “ (ap_block32_written F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre output_pre index_pre (ap_output_write (O) (output_pre) (vl_pre) ((ap_fpack32 ((A.(vfloat32m8_t_s0) )) ((A.(vfloat32m8_t_s1) )) ((A.(vfloat32m8_t_s2) )) ((A.(vfloat32m8_t_s3) )) ((A.(vfloat32m8_t_s4) )) ((A.(vfloat32m8_t_s5) )) ((A.(vfloat32m8_t_s6) )) ((A.(vfloat32m8_t_s7) )) ((A.(vfloat32m8_t_s8) )) ((A.(vfloat32m8_t_s9) )) ((A.(vfloat32m8_t_s10) )) ((A.(vfloat32m8_t_s11) )) ((A.(vfloat32m8_t_s12) )) ((A.(vfloat32m8_t_s13) )) ((A.(vfloat32m8_t_s14) )) ((A.(vfloat32m8_t_s15) )) ((A.(vfloat32m8_t_s16) )) ((A.(vfloat32m8_t_s17) )) ((A.(vfloat32m8_t_s18) )) ((A.(vfloat32m8_t_s19) )) ((A.(vfloat32m8_t_s20) )) ((A.(vfloat32m8_t_s21) )) ((A.(vfloat32m8_t_s22) )) ((A.(vfloat32m8_t_s23) )) ((A.(vfloat32m8_t_s24) )) ((A.(vfloat32m8_t_s25) )) ((A.(vfloat32m8_t_s26) )) ((A.(vfloat32m8_t_s27) )) ((A.(vfloat32m8_t_s28) )) ((A.(vfloat32m8_t_s29) )) ((A.(vfloat32m8_t_s30) )) ((A.(vfloat32m8_t_s31) ))))) (ap_index_write (I) (index_pre) (vl_pre) ((ap_ipack32 ((J.(vuint32m8_t_s0) )) ((J.(vuint32m8_t_s1) )) ((J.(vuint32m8_t_s2) )) ((J.(vuint32m8_t_s3) )) ((J.(vuint32m8_t_s4) )) ((J.(vuint32m8_t_s5) )) ((J.(vuint32m8_t_s6) )) ((J.(vuint32m8_t_s7) )) ((J.(vuint32m8_t_s8) )) ((J.(vuint32m8_t_s9) )) ((J.(vuint32m8_t_s10) )) ((J.(vuint32m8_t_s11) )) ((J.(vuint32m8_t_s12) )) ((J.(vuint32m8_t_s13) )) ((J.(vuint32m8_t_s14) )) ((J.(vuint32m8_t_s15) )) ((J.(vuint32m8_t_s16) )) ((J.(vuint32m8_t_s17) )) ((J.(vuint32m8_t_s18) )) ((J.(vuint32m8_t_s19) )) ((J.(vuint32m8_t_s20) )) ((J.(vuint32m8_t_s21) )) ((J.(vuint32m8_t_s22) )) ((J.(vuint32m8_t_s23) )) ((J.(vuint32m8_t_s24) )) ((J.(vuint32m8_t_s25) )) ((J.(vuint32m8_t_s26) )) ((J.(vuint32m8_t_s27) )) ((J.(vuint32m8_t_s28) )) ((J.(vuint32m8_t_s29) )) ((J.(vuint32m8_t_s30) )) ((J.(vuint32m8_t_s31) ))))) ) ”
  &&  emp
).

Definition ap_rvv_block32_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (PreH1 : (0 < vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (ap_window F p0_pre vl_pre )) (PreH4 : (ap_window F p1_pre vl_pre )) (PreH5 : (ap_window F p2_pre vl_pre )) (PreH6 : (ap_window F p3_pre vl_pre )) (PreH7 : (ap_window F p4_pre vl_pre )) (PreH8 : (ap_window F p5_pre vl_pre )) (PreH9 : (ap_window F p6_pre vl_pre )) (PreH10 : (ap_window F p7_pre vl_pre )) (PreH11 : (ap_window F p8_pre vl_pre )) (PreH12 : (ap_write_window W output_pre vl_pre )) (PreH13 : (ap_write_window WI index_pre vl_pre )) (PreH14 : (ap_block32_previous ab_pre ib_pre )) (PreH15 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH16 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH17 : (ap_optional_write_window W ab_pre vl_pre )) (PreH18 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH19 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 8 )) ,
  (ap_block32_frames O I (ap_output_write (O) (output_pre) (vl_pre) ((ap_fpack32 ((A.(vfloat32m8_t_s0) )) ((A.(vfloat32m8_t_s1) )) ((A.(vfloat32m8_t_s2) )) ((A.(vfloat32m8_t_s3) )) ((A.(vfloat32m8_t_s4) )) ((A.(vfloat32m8_t_s5) )) ((A.(vfloat32m8_t_s6) )) ((A.(vfloat32m8_t_s7) )) ((A.(vfloat32m8_t_s8) )) ((A.(vfloat32m8_t_s9) )) ((A.(vfloat32m8_t_s10) )) ((A.(vfloat32m8_t_s11) )) ((A.(vfloat32m8_t_s12) )) ((A.(vfloat32m8_t_s13) )) ((A.(vfloat32m8_t_s14) )) ((A.(vfloat32m8_t_s15) )) ((A.(vfloat32m8_t_s16) )) ((A.(vfloat32m8_t_s17) )) ((A.(vfloat32m8_t_s18) )) ((A.(vfloat32m8_t_s19) )) ((A.(vfloat32m8_t_s20) )) ((A.(vfloat32m8_t_s21) )) ((A.(vfloat32m8_t_s22) )) ((A.(vfloat32m8_t_s23) )) ((A.(vfloat32m8_t_s24) )) ((A.(vfloat32m8_t_s25) )) ((A.(vfloat32m8_t_s26) )) ((A.(vfloat32m8_t_s27) )) ((A.(vfloat32m8_t_s28) )) ((A.(vfloat32m8_t_s29) )) ((A.(vfloat32m8_t_s30) )) ((A.(vfloat32m8_t_s31) ))))) (ap_index_write (I) (index_pre) (vl_pre) ((ap_ipack32 ((J.(vuint32m8_t_s0) )) ((J.(vuint32m8_t_s1) )) ((J.(vuint32m8_t_s2) )) ((J.(vuint32m8_t_s3) )) ((J.(vuint32m8_t_s4) )) ((J.(vuint32m8_t_s5) )) ((J.(vuint32m8_t_s6) )) ((J.(vuint32m8_t_s7) )) ((J.(vuint32m8_t_s8) )) ((J.(vuint32m8_t_s9) )) ((J.(vuint32m8_t_s10) )) ((J.(vuint32m8_t_s11) )) ((J.(vuint32m8_t_s12) )) ((J.(vuint32m8_t_s13) )) ((J.(vuint32m8_t_s14) )) ((J.(vuint32m8_t_s15) )) ((J.(vuint32m8_t_s16) )) ((J.(vuint32m8_t_s17) )) ((J.(vuint32m8_t_s18) )) ((J.(vuint32m8_t_s19) )) ((J.(vuint32m8_t_s20) )) ((J.(vuint32m8_t_s21) )) ((J.(vuint32m8_t_s22) )) ((J.(vuint32m8_t_s23) )) ((J.(vuint32m8_t_s24) )) ((J.(vuint32m8_t_s25) )) ((J.(vuint32m8_t_s26) )) ((J.(vuint32m8_t_s27) )) ((J.(vuint32m8_t_s28) )) ((J.(vuint32m8_t_s29) )) ((J.(vuint32m8_t_s30) )) ((J.(vuint32m8_t_s31) ))))) vl_pre output_pre index_pre )
.

Definition ap_rvv_block32_return_wit_1_split_goal_2 := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (PreH1 : (0 < vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (ap_window F p0_pre vl_pre )) (PreH4 : (ap_window F p1_pre vl_pre )) (PreH5 : (ap_window F p2_pre vl_pre )) (PreH6 : (ap_window F p3_pre vl_pre )) (PreH7 : (ap_window F p4_pre vl_pre )) (PreH8 : (ap_window F p5_pre vl_pre )) (PreH9 : (ap_window F p6_pre vl_pre )) (PreH10 : (ap_window F p7_pre vl_pre )) (PreH11 : (ap_window F p8_pre vl_pre )) (PreH12 : (ap_write_window W output_pre vl_pre )) (PreH13 : (ap_write_window WI index_pre vl_pre )) (PreH14 : (ap_block32_previous ab_pre ib_pre )) (PreH15 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH16 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH17 : (ap_optional_write_window W ab_pre vl_pre )) (PreH18 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH19 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 8 )) ,
  (ap_block32_written F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre output_pre index_pre (ap_output_write (O) (output_pre) (vl_pre) ((ap_fpack32 ((A.(vfloat32m8_t_s0) )) ((A.(vfloat32m8_t_s1) )) ((A.(vfloat32m8_t_s2) )) ((A.(vfloat32m8_t_s3) )) ((A.(vfloat32m8_t_s4) )) ((A.(vfloat32m8_t_s5) )) ((A.(vfloat32m8_t_s6) )) ((A.(vfloat32m8_t_s7) )) ((A.(vfloat32m8_t_s8) )) ((A.(vfloat32m8_t_s9) )) ((A.(vfloat32m8_t_s10) )) ((A.(vfloat32m8_t_s11) )) ((A.(vfloat32m8_t_s12) )) ((A.(vfloat32m8_t_s13) )) ((A.(vfloat32m8_t_s14) )) ((A.(vfloat32m8_t_s15) )) ((A.(vfloat32m8_t_s16) )) ((A.(vfloat32m8_t_s17) )) ((A.(vfloat32m8_t_s18) )) ((A.(vfloat32m8_t_s19) )) ((A.(vfloat32m8_t_s20) )) ((A.(vfloat32m8_t_s21) )) ((A.(vfloat32m8_t_s22) )) ((A.(vfloat32m8_t_s23) )) ((A.(vfloat32m8_t_s24) )) ((A.(vfloat32m8_t_s25) )) ((A.(vfloat32m8_t_s26) )) ((A.(vfloat32m8_t_s27) )) ((A.(vfloat32m8_t_s28) )) ((A.(vfloat32m8_t_s29) )) ((A.(vfloat32m8_t_s30) )) ((A.(vfloat32m8_t_s31) ))))) (ap_index_write (I) (index_pre) (vl_pre) ((ap_ipack32 ((J.(vuint32m8_t_s0) )) ((J.(vuint32m8_t_s1) )) ((J.(vuint32m8_t_s2) )) ((J.(vuint32m8_t_s3) )) ((J.(vuint32m8_t_s4) )) ((J.(vuint32m8_t_s5) )) ((J.(vuint32m8_t_s6) )) ((J.(vuint32m8_t_s7) )) ((J.(vuint32m8_t_s8) )) ((J.(vuint32m8_t_s9) )) ((J.(vuint32m8_t_s10) )) ((J.(vuint32m8_t_s11) )) ((J.(vuint32m8_t_s12) )) ((J.(vuint32m8_t_s13) )) ((J.(vuint32m8_t_s14) )) ((J.(vuint32m8_t_s15) )) ((J.(vuint32m8_t_s16) )) ((J.(vuint32m8_t_s17) )) ((J.(vuint32m8_t_s18) )) ((J.(vuint32m8_t_s19) )) ((J.(vuint32m8_t_s20) )) ((J.(vuint32m8_t_s21) )) ((J.(vuint32m8_t_s22) )) ((J.(vuint32m8_t_s23) )) ((J.(vuint32m8_t_s24) )) ((J.(vuint32m8_t_s25) )) ((J.(vuint32m8_t_s26) )) ((J.(vuint32m8_t_s27) )) ((J.(vuint32m8_t_s28) )) ((J.(vuint32m8_t_s29) )) ((J.(vuint32m8_t_s30) )) ((J.(vuint32m8_t_s31) ))))) )
.

Definition ap_rvv_block32_partial_solve_wit_1_pure := 
(
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (PreH1 : (0 < vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (ap_window F p0_pre vl_pre )) (PreH4 : (ap_window F p1_pre vl_pre )) (PreH5 : (ap_window F p2_pre vl_pre )) (PreH6 : (ap_window F p3_pre vl_pre )) (PreH7 : (ap_window F p4_pre vl_pre )) (PreH8 : (ap_window F p5_pre vl_pre )) (PreH9 : (ap_window F p6_pre vl_pre )) (PreH10 : (ap_window F p7_pre vl_pre )) (PreH11 : (ap_window F p8_pre vl_pre )) (PreH12 : (ap_write_window W output_pre vl_pre )) (PreH13 : (ap_write_window WI index_pre vl_pre )) (PreH14 : (ap_block32_previous ab_pre ib_pre )) (PreH15 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH16 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH17 : (ap_optional_write_window W ab_pre vl_pre )) (PreH18 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH19 : (ab_pre <> 0)) ,
  (UndefStructPredvuint32m8_t ( &( "i" ) ) )
  **  (UndefStructPredvfloat32m8_t ( &( "a" ) ) )
  **  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "p3" ) )) # Ptr  |-> p3_pre)
  **  ((( &( "p4" ) )) # Ptr  |-> p4_pre)
  **  ((( &( "p5" ) )) # Ptr  |-> p5_pre)
  **  ((( &( "p6" ) )) # Ptr  |-> p6_pre)
  **  ((( &( "p7" ) )) # Ptr  |-> p7_pre)
  **  ((( &( "p8" ) )) # Ptr  |-> p8_pre)
  **  ((( &( "ab" ) )) # Ptr  |-> ab_pre)
  **  ((( &( "ib" ) )) # Ptr  |-> ib_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "index" ) )) # Ptr  |-> index_pre)
  **  ((( &( "idx" ) )) # UInt  |-> idx_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_write_window W ab_pre vl_pre ) ”
) \/
(
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (idx_pre <= UINT_MAX)) (PreH4 : (idx_pre >= 0)) (PreH5 : (0 < vl_pre)) (PreH6 : (vl_pre <= 32)) (PreH7 : (ap_window F p0_pre vl_pre )) (PreH8 : (ap_window F p1_pre vl_pre )) (PreH9 : (ap_window F p2_pre vl_pre )) (PreH10 : (ap_window F p3_pre vl_pre )) (PreH11 : (ap_window F p4_pre vl_pre )) (PreH12 : (ap_window F p5_pre vl_pre )) (PreH13 : (ap_window F p6_pre vl_pre )) (PreH14 : (ap_window F p7_pre vl_pre )) (PreH15 : (ap_window F p8_pre vl_pre )) (PreH16 : (ap_write_window W output_pre vl_pre )) (PreH17 : (ap_write_window WI index_pre vl_pre )) (PreH18 : (ap_block32_previous ab_pre ib_pre )) (PreH19 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH20 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH21 : (ap_optional_write_window W ab_pre vl_pre )) (PreH22 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH23 : (ab_pre <> 0)) ,
  (UndefStructPredvuint32m8_t ( &( "i" ) ) )
  **  (UndefStructPredvfloat32m8_t ( &( "a" ) ) )
  **  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "p3" ) )) # Ptr  |-> p3_pre)
  **  ((( &( "p4" ) )) # Ptr  |-> p4_pre)
  **  ((( &( "p5" ) )) # Ptr  |-> p5_pre)
  **  ((( &( "p6" ) )) # Ptr  |-> p6_pre)
  **  ((( &( "p7" ) )) # Ptr  |-> p7_pre)
  **  ((( &( "p8" ) )) # Ptr  |-> p8_pre)
  **  ((( &( "ab" ) )) # Ptr  |-> ab_pre)
  **  ((( &( "ib" ) )) # Ptr  |-> ib_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "index" ) )) # Ptr  |-> index_pre)
  **  ((( &( "idx" ) )) # UInt  |-> idx_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
|--
  “ (ap_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_output_readable O ab_pre vl_pre ) ”
).

Definition ap_rvv_block32_partial_solve_wit_1_pure_split_goal_1 := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (idx_pre <= UINT_MAX)) (PreH4 : (idx_pre >= 0)) (PreH5 : (0 < vl_pre)) (PreH6 : (vl_pre <= 32)) (PreH7 : (ap_window F p0_pre vl_pre )) (PreH8 : (ap_window F p1_pre vl_pre )) (PreH9 : (ap_window F p2_pre vl_pre )) (PreH10 : (ap_window F p3_pre vl_pre )) (PreH11 : (ap_window F p4_pre vl_pre )) (PreH12 : (ap_window F p5_pre vl_pre )) (PreH13 : (ap_window F p6_pre vl_pre )) (PreH14 : (ap_window F p7_pre vl_pre )) (PreH15 : (ap_window F p8_pre vl_pre )) (PreH16 : (ap_write_window W output_pre vl_pre )) (PreH17 : (ap_write_window WI index_pre vl_pre )) (PreH18 : (ap_block32_previous ab_pre ib_pre )) (PreH19 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH20 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH21 : (ap_optional_write_window W ab_pre vl_pre )) (PreH22 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH23 : (ab_pre <> 0)) ,
  (UndefStructPredvuint32m8_t ( &( "i" ) ) )
  **  (UndefStructPredvfloat32m8_t ( &( "a" ) ) )
  **  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "p3" ) )) # Ptr  |-> p3_pre)
  **  ((( &( "p4" ) )) # Ptr  |-> p4_pre)
  **  ((( &( "p5" ) )) # Ptr  |-> p5_pre)
  **  ((( &( "p6" ) )) # Ptr  |-> p6_pre)
  **  ((( &( "p7" ) )) # Ptr  |-> p7_pre)
  **  ((( &( "p8" ) )) # Ptr  |-> p8_pre)
  **  ((( &( "ab" ) )) # Ptr  |-> ab_pre)
  **  ((( &( "ib" ) )) # Ptr  |-> ib_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "index" ) )) # Ptr  |-> index_pre)
  **  ((( &( "idx" ) )) # UInt  |-> idx_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
|--
  “ (ap_write_window W ab_pre vl_pre ) ”
.

Definition ap_rvv_block32_partial_solve_wit_1_pure_split_goal_2 := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (idx_pre <= UINT_MAX)) (PreH4 : (idx_pre >= 0)) (PreH5 : (0 < vl_pre)) (PreH6 : (vl_pre <= 32)) (PreH7 : (ap_window F p0_pre vl_pre )) (PreH8 : (ap_window F p1_pre vl_pre )) (PreH9 : (ap_window F p2_pre vl_pre )) (PreH10 : (ap_window F p3_pre vl_pre )) (PreH11 : (ap_window F p4_pre vl_pre )) (PreH12 : (ap_window F p5_pre vl_pre )) (PreH13 : (ap_window F p6_pre vl_pre )) (PreH14 : (ap_window F p7_pre vl_pre )) (PreH15 : (ap_window F p8_pre vl_pre )) (PreH16 : (ap_write_window W output_pre vl_pre )) (PreH17 : (ap_write_window WI index_pre vl_pre )) (PreH18 : (ap_block32_previous ab_pre ib_pre )) (PreH19 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH20 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH21 : (ap_optional_write_window W ab_pre vl_pre )) (PreH22 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH23 : (ab_pre <> 0)) ,
  (UndefStructPredvuint32m8_t ( &( "i" ) ) )
  **  (UndefStructPredvfloat32m8_t ( &( "a" ) ) )
  **  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "p3" ) )) # Ptr  |-> p3_pre)
  **  ((( &( "p4" ) )) # Ptr  |-> p4_pre)
  **  ((( &( "p5" ) )) # Ptr  |-> p5_pre)
  **  ((( &( "p6" ) )) # Ptr  |-> p6_pre)
  **  ((( &( "p7" ) )) # Ptr  |-> p7_pre)
  **  ((( &( "p8" ) )) # Ptr  |-> p8_pre)
  **  ((( &( "ab" ) )) # Ptr  |-> ab_pre)
  **  ((( &( "ib" ) )) # Ptr  |-> ib_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "index" ) )) # Ptr  |-> index_pre)
  **  ((( &( "idx" ) )) # UInt  |-> idx_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
|--
  “ (ap_output_readable O ab_pre vl_pre ) ”
.

Definition ap_rvv_block32_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (PreH1 : (0 < vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (ap_window F p0_pre vl_pre )) (PreH4 : (ap_window F p1_pre vl_pre )) (PreH5 : (ap_window F p2_pre vl_pre )) (PreH6 : (ap_window F p3_pre vl_pre )) (PreH7 : (ap_window F p4_pre vl_pre )) (PreH8 : (ap_window F p5_pre vl_pre )) (PreH9 : (ap_window F p6_pre vl_pre )) (PreH10 : (ap_window F p7_pre vl_pre )) (PreH11 : (ap_window F p8_pre vl_pre )) (PreH12 : (ap_write_window W output_pre vl_pre )) (PreH13 : (ap_write_window WI index_pre vl_pre )) (PreH14 : (ap_block32_previous ab_pre ib_pre )) (PreH15 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH16 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH17 : (ap_optional_write_window W ab_pre vl_pre )) (PreH18 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH19 : (ab_pre <> 0)) ,
  (UndefStructPredvuint32m8_t ( &( "i" ) ) )
  **  (UndefStructPredvfloat32m8_t ( &( "a" ) ) )
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_write_window W ab_pre vl_pre ) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ab_pre <> 0) ”
  &&  (ap_output W O )
  **  (UndefStructPredvuint32m8_t ( &( "i" ) ) )
  **  (UndefStructPredvfloat32m8_t ( &( "a" ) ) )
  **  (ap_data F )
  **  (ap_index WI I )
.

Definition ap_rvv_block32_partial_solve_wit_1 := ap_rvv_block32_partial_solve_wit_1_pure -> ap_rvv_block32_partial_solve_wit_1_aux.

Definition ap_rvv_block32_partial_solve_wit_2 := 
forall (vl_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (retval: Z) (PreH1 : (ap_output_active_loaded 0 vl_pre O ab_pre r0 )) (PreH2 : (ap_output_active_loaded 1 vl_pre O ab_pre r1 )) (PreH3 : (ap_output_active_loaded 2 vl_pre O ab_pre r2 )) (PreH4 : (ap_output_active_loaded 3 vl_pre O ab_pre r3 )) (PreH5 : (ap_output_active_loaded 4 vl_pre O ab_pre r4 )) (PreH6 : (ap_output_active_loaded 5 vl_pre O ab_pre r5 )) (PreH7 : (ap_output_active_loaded 6 vl_pre O ab_pre r6 )) (PreH8 : (ap_output_active_loaded 7 vl_pre O ab_pre r7 )) (PreH9 : (ap_output_active_loaded 8 vl_pre O ab_pre r8 )) (PreH10 : (ap_output_active_loaded 9 vl_pre O ab_pre r9 )) (PreH11 : (ap_output_active_loaded 10 vl_pre O ab_pre r10 )) (PreH12 : (ap_output_active_loaded 11 vl_pre O ab_pre r11 )) (PreH13 : (ap_output_active_loaded 12 vl_pre O ab_pre r12 )) (PreH14 : (ap_output_active_loaded 13 vl_pre O ab_pre r13 )) (PreH15 : (ap_output_active_loaded 14 vl_pre O ab_pre r14 )) (PreH16 : (ap_output_active_loaded 15 vl_pre O ab_pre r15 )) (PreH17 : (ap_output_active_loaded 16 vl_pre O ab_pre r16 )) (PreH18 : (ap_output_active_loaded 17 vl_pre O ab_pre r17 )) (PreH19 : (ap_output_active_loaded 18 vl_pre O ab_pre r18 )) (PreH20 : (ap_output_active_loaded 19 vl_pre O ab_pre r19 )) (PreH21 : (ap_output_active_loaded 20 vl_pre O ab_pre r20 )) (PreH22 : (ap_output_active_loaded 21 vl_pre O ab_pre r21 )) (PreH23 : (ap_output_active_loaded 22 vl_pre O ab_pre r22 )) (PreH24 : (ap_output_active_loaded 23 vl_pre O ab_pre r23 )) (PreH25 : (ap_output_active_loaded 24 vl_pre O ab_pre r24 )) (PreH26 : (ap_output_active_loaded 25 vl_pre O ab_pre r25 )) (PreH27 : (ap_output_active_loaded 26 vl_pre O ab_pre r26 )) (PreH28 : (ap_output_active_loaded 27 vl_pre O ab_pre r27 )) (PreH29 : (ap_output_active_loaded 28 vl_pre O ab_pre r28 )) (PreH30 : (ap_output_active_loaded 29 vl_pre O ab_pre r29 )) (PreH31 : (ap_output_active_loaded 30 vl_pre O ab_pre r30 )) (PreH32 : (ap_output_active_loaded 31 vl_pre O ab_pre r31 )) (PreH33 : (0 < vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (ap_window F p0_pre vl_pre )) (PreH36 : (ap_window F p1_pre vl_pre )) (PreH37 : (ap_window F p2_pre vl_pre )) (PreH38 : (ap_window F p3_pre vl_pre )) (PreH39 : (ap_window F p4_pre vl_pre )) (PreH40 : (ap_window F p5_pre vl_pre )) (PreH41 : (ap_window F p6_pre vl_pre )) (PreH42 : (ap_window F p7_pre vl_pre )) (PreH43 : (ap_window F p8_pre vl_pre )) (PreH44 : (ap_write_window W output_pre vl_pre )) (PreH45 : (ap_write_window WI index_pre vl_pre )) (PreH46 : (ap_block32_previous ab_pre ib_pre )) (PreH47 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH48 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH49 : (ap_optional_write_window W ab_pre vl_pre )) (PreH50 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH51 : (ab_pre <> 0)) ,
  (UndefStructPredvfloat32m8_t ( &( "a" ) ) )
  **  (ap_output W O )
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> r0)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> r1)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> r2)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> r3)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> r4)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> r5)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> r6)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> r7)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> r8)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> r9)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> r10)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> r11)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> r12)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> r13)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> r14)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> r15)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> r16)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> r17)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> r18)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> r19)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> r20)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> r21)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> r22)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> r23)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> r24)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> r25)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> r26)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> r27)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> r28)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> r29)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> r30)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> r31)
  **  (UndefStructPredvuint32m8_t ( &( "i" ) ) )
  **  (ap_data F )
  **  (ap_index WI I )
|--
  “ (ap_output_active_loaded 0 vl_pre O ab_pre r0 ) ” 
  &&  “ (ap_output_active_loaded 1 vl_pre O ab_pre r1 ) ” 
  &&  “ (ap_output_active_loaded 2 vl_pre O ab_pre r2 ) ” 
  &&  “ (ap_output_active_loaded 3 vl_pre O ab_pre r3 ) ” 
  &&  “ (ap_output_active_loaded 4 vl_pre O ab_pre r4 ) ” 
  &&  “ (ap_output_active_loaded 5 vl_pre O ab_pre r5 ) ” 
  &&  “ (ap_output_active_loaded 6 vl_pre O ab_pre r6 ) ” 
  &&  “ (ap_output_active_loaded 7 vl_pre O ab_pre r7 ) ” 
  &&  “ (ap_output_active_loaded 8 vl_pre O ab_pre r8 ) ” 
  &&  “ (ap_output_active_loaded 9 vl_pre O ab_pre r9 ) ” 
  &&  “ (ap_output_active_loaded 10 vl_pre O ab_pre r10 ) ” 
  &&  “ (ap_output_active_loaded 11 vl_pre O ab_pre r11 ) ” 
  &&  “ (ap_output_active_loaded 12 vl_pre O ab_pre r12 ) ” 
  &&  “ (ap_output_active_loaded 13 vl_pre O ab_pre r13 ) ” 
  &&  “ (ap_output_active_loaded 14 vl_pre O ab_pre r14 ) ” 
  &&  “ (ap_output_active_loaded 15 vl_pre O ab_pre r15 ) ” 
  &&  “ (ap_output_active_loaded 16 vl_pre O ab_pre r16 ) ” 
  &&  “ (ap_output_active_loaded 17 vl_pre O ab_pre r17 ) ” 
  &&  “ (ap_output_active_loaded 18 vl_pre O ab_pre r18 ) ” 
  &&  “ (ap_output_active_loaded 19 vl_pre O ab_pre r19 ) ” 
  &&  “ (ap_output_active_loaded 20 vl_pre O ab_pre r20 ) ” 
  &&  “ (ap_output_active_loaded 21 vl_pre O ab_pre r21 ) ” 
  &&  “ (ap_output_active_loaded 22 vl_pre O ab_pre r22 ) ” 
  &&  “ (ap_output_active_loaded 23 vl_pre O ab_pre r23 ) ” 
  &&  “ (ap_output_active_loaded 24 vl_pre O ab_pre r24 ) ” 
  &&  “ (ap_output_active_loaded 25 vl_pre O ab_pre r25 ) ” 
  &&  “ (ap_output_active_loaded 26 vl_pre O ab_pre r26 ) ” 
  &&  “ (ap_output_active_loaded 27 vl_pre O ab_pre r27 ) ” 
  &&  “ (ap_output_active_loaded 28 vl_pre O ab_pre r28 ) ” 
  &&  “ (ap_output_active_loaded 29 vl_pre O ab_pre r29 ) ” 
  &&  “ (ap_output_active_loaded 30 vl_pre O ab_pre r30 ) ” 
  &&  “ (ap_output_active_loaded 31 vl_pre O ab_pre r31 ) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ab_pre <> 0) ”
  &&  ((&(( &( "a" ) )->ₛ "s31")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> r0)
  **  (ap_output W O )
  **  (UndefStructPredvuint32m8_t ( &( "i" ) ) )
  **  (ap_data F )
  **  (ap_index WI I )
.

Definition ap_rvv_block32_partial_solve_wit_3_pure := 
(
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (PreH1 : (ap_output_active_loaded 0 vl_pre O ab_pre r0 )) (PreH2 : (ap_output_active_loaded 1 vl_pre O ab_pre r1 )) (PreH3 : (ap_output_active_loaded 2 vl_pre O ab_pre r2 )) (PreH4 : (ap_output_active_loaded 3 vl_pre O ab_pre r3 )) (PreH5 : (ap_output_active_loaded 4 vl_pre O ab_pre r4 )) (PreH6 : (ap_output_active_loaded 5 vl_pre O ab_pre r5 )) (PreH7 : (ap_output_active_loaded 6 vl_pre O ab_pre r6 )) (PreH8 : (ap_output_active_loaded 7 vl_pre O ab_pre r7 )) (PreH9 : (ap_output_active_loaded 8 vl_pre O ab_pre r8 )) (PreH10 : (ap_output_active_loaded 9 vl_pre O ab_pre r9 )) (PreH11 : (ap_output_active_loaded 10 vl_pre O ab_pre r10 )) (PreH12 : (ap_output_active_loaded 11 vl_pre O ab_pre r11 )) (PreH13 : (ap_output_active_loaded 12 vl_pre O ab_pre r12 )) (PreH14 : (ap_output_active_loaded 13 vl_pre O ab_pre r13 )) (PreH15 : (ap_output_active_loaded 14 vl_pre O ab_pre r14 )) (PreH16 : (ap_output_active_loaded 15 vl_pre O ab_pre r15 )) (PreH17 : (ap_output_active_loaded 16 vl_pre O ab_pre r16 )) (PreH18 : (ap_output_active_loaded 17 vl_pre O ab_pre r17 )) (PreH19 : (ap_output_active_loaded 18 vl_pre O ab_pre r18 )) (PreH20 : (ap_output_active_loaded 19 vl_pre O ab_pre r19 )) (PreH21 : (ap_output_active_loaded 20 vl_pre O ab_pre r20 )) (PreH22 : (ap_output_active_loaded 21 vl_pre O ab_pre r21 )) (PreH23 : (ap_output_active_loaded 22 vl_pre O ab_pre r22 )) (PreH24 : (ap_output_active_loaded 23 vl_pre O ab_pre r23 )) (PreH25 : (ap_output_active_loaded 24 vl_pre O ab_pre r24 )) (PreH26 : (ap_output_active_loaded 25 vl_pre O ab_pre r25 )) (PreH27 : (ap_output_active_loaded 26 vl_pre O ab_pre r26 )) (PreH28 : (ap_output_active_loaded 27 vl_pre O ab_pre r27 )) (PreH29 : (ap_output_active_loaded 28 vl_pre O ab_pre r28 )) (PreH30 : (ap_output_active_loaded 29 vl_pre O ab_pre r29 )) (PreH31 : (ap_output_active_loaded 30 vl_pre O ab_pre r30 )) (PreH32 : (ap_output_active_loaded 31 vl_pre O ab_pre r31 )) (PreH33 : (0 < vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (ap_window F p0_pre vl_pre )) (PreH36 : (ap_window F p1_pre vl_pre )) (PreH37 : (ap_window F p2_pre vl_pre )) (PreH38 : (ap_window F p3_pre vl_pre )) (PreH39 : (ap_window F p4_pre vl_pre )) (PreH40 : (ap_window F p5_pre vl_pre )) (PreH41 : (ap_window F p6_pre vl_pre )) (PreH42 : (ap_window F p7_pre vl_pre )) (PreH43 : (ap_window F p8_pre vl_pre )) (PreH44 : (ap_write_window W output_pre vl_pre )) (PreH45 : (ap_write_window WI index_pre vl_pre )) (PreH46 : (ap_block32_previous ab_pre ib_pre )) (PreH47 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH48 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH49 : (ap_optional_write_window W ab_pre vl_pre )) (PreH50 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH51 : (ab_pre <> 0)) ,
  ((&(( &( "a" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_output W O )
  **  (UndefStructPredvuint32m8_t ( &( "i" ) ) )
  **  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "p3" ) )) # Ptr  |-> p3_pre)
  **  ((( &( "p4" ) )) # Ptr  |-> p4_pre)
  **  ((( &( "p5" ) )) # Ptr  |-> p5_pre)
  **  ((( &( "p6" ) )) # Ptr  |-> p6_pre)
  **  ((( &( "p7" ) )) # Ptr  |-> p7_pre)
  **  ((( &( "p8" ) )) # Ptr  |-> p8_pre)
  **  ((( &( "ab" ) )) # Ptr  |-> ab_pre)
  **  ((( &( "ib" ) )) # Ptr  |-> ib_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "index" ) )) # Ptr  |-> index_pre)
  **  ((( &( "idx" ) )) # UInt  |-> idx_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (ap_data F )
  **  (ap_index WI I )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_write_window WI ib_pre vl_pre ) ”
) \/
(
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (idx_pre <= UINT_MAX)) (PreH4 : (idx_pre >= 0)) (PreH5 : (ap_output_active_loaded 0 vl_pre O ab_pre r0 )) (PreH6 : (ap_output_active_loaded 1 vl_pre O ab_pre r1 )) (PreH7 : (ap_output_active_loaded 2 vl_pre O ab_pre r2 )) (PreH8 : (ap_output_active_loaded 3 vl_pre O ab_pre r3 )) (PreH9 : (ap_output_active_loaded 4 vl_pre O ab_pre r4 )) (PreH10 : (ap_output_active_loaded 5 vl_pre O ab_pre r5 )) (PreH11 : (ap_output_active_loaded 6 vl_pre O ab_pre r6 )) (PreH12 : (ap_output_active_loaded 7 vl_pre O ab_pre r7 )) (PreH13 : (ap_output_active_loaded 8 vl_pre O ab_pre r8 )) (PreH14 : (ap_output_active_loaded 9 vl_pre O ab_pre r9 )) (PreH15 : (ap_output_active_loaded 10 vl_pre O ab_pre r10 )) (PreH16 : (ap_output_active_loaded 11 vl_pre O ab_pre r11 )) (PreH17 : (ap_output_active_loaded 12 vl_pre O ab_pre r12 )) (PreH18 : (ap_output_active_loaded 13 vl_pre O ab_pre r13 )) (PreH19 : (ap_output_active_loaded 14 vl_pre O ab_pre r14 )) (PreH20 : (ap_output_active_loaded 15 vl_pre O ab_pre r15 )) (PreH21 : (ap_output_active_loaded 16 vl_pre O ab_pre r16 )) (PreH22 : (ap_output_active_loaded 17 vl_pre O ab_pre r17 )) (PreH23 : (ap_output_active_loaded 18 vl_pre O ab_pre r18 )) (PreH24 : (ap_output_active_loaded 19 vl_pre O ab_pre r19 )) (PreH25 : (ap_output_active_loaded 20 vl_pre O ab_pre r20 )) (PreH26 : (ap_output_active_loaded 21 vl_pre O ab_pre r21 )) (PreH27 : (ap_output_active_loaded 22 vl_pre O ab_pre r22 )) (PreH28 : (ap_output_active_loaded 23 vl_pre O ab_pre r23 )) (PreH29 : (ap_output_active_loaded 24 vl_pre O ab_pre r24 )) (PreH30 : (ap_output_active_loaded 25 vl_pre O ab_pre r25 )) (PreH31 : (ap_output_active_loaded 26 vl_pre O ab_pre r26 )) (PreH32 : (ap_output_active_loaded 27 vl_pre O ab_pre r27 )) (PreH33 : (ap_output_active_loaded 28 vl_pre O ab_pre r28 )) (PreH34 : (ap_output_active_loaded 29 vl_pre O ab_pre r29 )) (PreH35 : (ap_output_active_loaded 30 vl_pre O ab_pre r30 )) (PreH36 : (ap_output_active_loaded 31 vl_pre O ab_pre r31 )) (PreH37 : (0 < vl_pre)) (PreH38 : (vl_pre <= 32)) (PreH39 : (ap_window F p0_pre vl_pre )) (PreH40 : (ap_window F p1_pre vl_pre )) (PreH41 : (ap_window F p2_pre vl_pre )) (PreH42 : (ap_window F p3_pre vl_pre )) (PreH43 : (ap_window F p4_pre vl_pre )) (PreH44 : (ap_window F p5_pre vl_pre )) (PreH45 : (ap_window F p6_pre vl_pre )) (PreH46 : (ap_window F p7_pre vl_pre )) (PreH47 : (ap_window F p8_pre vl_pre )) (PreH48 : (ap_write_window W output_pre vl_pre )) (PreH49 : (ap_write_window WI index_pre vl_pre )) (PreH50 : (ap_block32_previous ab_pre ib_pre )) (PreH51 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH52 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH53 : (ap_optional_write_window W ab_pre vl_pre )) (PreH54 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH55 : (ab_pre <> 0)) ,
  ((&(( &( "a" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_output W O )
  **  (UndefStructPredvuint32m8_t ( &( "i" ) ) )
  **  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "p3" ) )) # Ptr  |-> p3_pre)
  **  ((( &( "p4" ) )) # Ptr  |-> p4_pre)
  **  ((( &( "p5" ) )) # Ptr  |-> p5_pre)
  **  ((( &( "p6" ) )) # Ptr  |-> p6_pre)
  **  ((( &( "p7" ) )) # Ptr  |-> p7_pre)
  **  ((( &( "p8" ) )) # Ptr  |-> p8_pre)
  **  ((( &( "ab" ) )) # Ptr  |-> ab_pre)
  **  ((( &( "ib" ) )) # Ptr  |-> ib_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "index" ) )) # Ptr  |-> index_pre)
  **  ((( &( "idx" ) )) # UInt  |-> idx_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (ap_data F )
  **  (ap_index WI I )
|--
  “ (ap_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ap_index_readable I ib_pre vl_pre ) ”
).

Definition ap_rvv_block32_partial_solve_wit_3_pure_split_goal_1 := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (idx_pre <= UINT_MAX)) (PreH4 : (idx_pre >= 0)) (PreH5 : (ap_output_active_loaded 0 vl_pre O ab_pre r0 )) (PreH6 : (ap_output_active_loaded 1 vl_pre O ab_pre r1 )) (PreH7 : (ap_output_active_loaded 2 vl_pre O ab_pre r2 )) (PreH8 : (ap_output_active_loaded 3 vl_pre O ab_pre r3 )) (PreH9 : (ap_output_active_loaded 4 vl_pre O ab_pre r4 )) (PreH10 : (ap_output_active_loaded 5 vl_pre O ab_pre r5 )) (PreH11 : (ap_output_active_loaded 6 vl_pre O ab_pre r6 )) (PreH12 : (ap_output_active_loaded 7 vl_pre O ab_pre r7 )) (PreH13 : (ap_output_active_loaded 8 vl_pre O ab_pre r8 )) (PreH14 : (ap_output_active_loaded 9 vl_pre O ab_pre r9 )) (PreH15 : (ap_output_active_loaded 10 vl_pre O ab_pre r10 )) (PreH16 : (ap_output_active_loaded 11 vl_pre O ab_pre r11 )) (PreH17 : (ap_output_active_loaded 12 vl_pre O ab_pre r12 )) (PreH18 : (ap_output_active_loaded 13 vl_pre O ab_pre r13 )) (PreH19 : (ap_output_active_loaded 14 vl_pre O ab_pre r14 )) (PreH20 : (ap_output_active_loaded 15 vl_pre O ab_pre r15 )) (PreH21 : (ap_output_active_loaded 16 vl_pre O ab_pre r16 )) (PreH22 : (ap_output_active_loaded 17 vl_pre O ab_pre r17 )) (PreH23 : (ap_output_active_loaded 18 vl_pre O ab_pre r18 )) (PreH24 : (ap_output_active_loaded 19 vl_pre O ab_pre r19 )) (PreH25 : (ap_output_active_loaded 20 vl_pre O ab_pre r20 )) (PreH26 : (ap_output_active_loaded 21 vl_pre O ab_pre r21 )) (PreH27 : (ap_output_active_loaded 22 vl_pre O ab_pre r22 )) (PreH28 : (ap_output_active_loaded 23 vl_pre O ab_pre r23 )) (PreH29 : (ap_output_active_loaded 24 vl_pre O ab_pre r24 )) (PreH30 : (ap_output_active_loaded 25 vl_pre O ab_pre r25 )) (PreH31 : (ap_output_active_loaded 26 vl_pre O ab_pre r26 )) (PreH32 : (ap_output_active_loaded 27 vl_pre O ab_pre r27 )) (PreH33 : (ap_output_active_loaded 28 vl_pre O ab_pre r28 )) (PreH34 : (ap_output_active_loaded 29 vl_pre O ab_pre r29 )) (PreH35 : (ap_output_active_loaded 30 vl_pre O ab_pre r30 )) (PreH36 : (ap_output_active_loaded 31 vl_pre O ab_pre r31 )) (PreH37 : (0 < vl_pre)) (PreH38 : (vl_pre <= 32)) (PreH39 : (ap_window F p0_pre vl_pre )) (PreH40 : (ap_window F p1_pre vl_pre )) (PreH41 : (ap_window F p2_pre vl_pre )) (PreH42 : (ap_window F p3_pre vl_pre )) (PreH43 : (ap_window F p4_pre vl_pre )) (PreH44 : (ap_window F p5_pre vl_pre )) (PreH45 : (ap_window F p6_pre vl_pre )) (PreH46 : (ap_window F p7_pre vl_pre )) (PreH47 : (ap_window F p8_pre vl_pre )) (PreH48 : (ap_write_window W output_pre vl_pre )) (PreH49 : (ap_write_window WI index_pre vl_pre )) (PreH50 : (ap_block32_previous ab_pre ib_pre )) (PreH51 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH52 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH53 : (ap_optional_write_window W ab_pre vl_pre )) (PreH54 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH55 : (ab_pre <> 0)) ,
  ((&(( &( "a" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_output W O )
  **  (UndefStructPredvuint32m8_t ( &( "i" ) ) )
  **  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "p3" ) )) # Ptr  |-> p3_pre)
  **  ((( &( "p4" ) )) # Ptr  |-> p4_pre)
  **  ((( &( "p5" ) )) # Ptr  |-> p5_pre)
  **  ((( &( "p6" ) )) # Ptr  |-> p6_pre)
  **  ((( &( "p7" ) )) # Ptr  |-> p7_pre)
  **  ((( &( "p8" ) )) # Ptr  |-> p8_pre)
  **  ((( &( "ab" ) )) # Ptr  |-> ab_pre)
  **  ((( &( "ib" ) )) # Ptr  |-> ib_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "index" ) )) # Ptr  |-> index_pre)
  **  ((( &( "idx" ) )) # UInt  |-> idx_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (ap_data F )
  **  (ap_index WI I )
|--
  “ (ap_write_window WI ib_pre vl_pre ) ”
.

Definition ap_rvv_block32_partial_solve_wit_3_pure_split_goal_2 := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (idx_pre <= UINT_MAX)) (PreH4 : (idx_pre >= 0)) (PreH5 : (ap_output_active_loaded 0 vl_pre O ab_pre r0 )) (PreH6 : (ap_output_active_loaded 1 vl_pre O ab_pre r1 )) (PreH7 : (ap_output_active_loaded 2 vl_pre O ab_pre r2 )) (PreH8 : (ap_output_active_loaded 3 vl_pre O ab_pre r3 )) (PreH9 : (ap_output_active_loaded 4 vl_pre O ab_pre r4 )) (PreH10 : (ap_output_active_loaded 5 vl_pre O ab_pre r5 )) (PreH11 : (ap_output_active_loaded 6 vl_pre O ab_pre r6 )) (PreH12 : (ap_output_active_loaded 7 vl_pre O ab_pre r7 )) (PreH13 : (ap_output_active_loaded 8 vl_pre O ab_pre r8 )) (PreH14 : (ap_output_active_loaded 9 vl_pre O ab_pre r9 )) (PreH15 : (ap_output_active_loaded 10 vl_pre O ab_pre r10 )) (PreH16 : (ap_output_active_loaded 11 vl_pre O ab_pre r11 )) (PreH17 : (ap_output_active_loaded 12 vl_pre O ab_pre r12 )) (PreH18 : (ap_output_active_loaded 13 vl_pre O ab_pre r13 )) (PreH19 : (ap_output_active_loaded 14 vl_pre O ab_pre r14 )) (PreH20 : (ap_output_active_loaded 15 vl_pre O ab_pre r15 )) (PreH21 : (ap_output_active_loaded 16 vl_pre O ab_pre r16 )) (PreH22 : (ap_output_active_loaded 17 vl_pre O ab_pre r17 )) (PreH23 : (ap_output_active_loaded 18 vl_pre O ab_pre r18 )) (PreH24 : (ap_output_active_loaded 19 vl_pre O ab_pre r19 )) (PreH25 : (ap_output_active_loaded 20 vl_pre O ab_pre r20 )) (PreH26 : (ap_output_active_loaded 21 vl_pre O ab_pre r21 )) (PreH27 : (ap_output_active_loaded 22 vl_pre O ab_pre r22 )) (PreH28 : (ap_output_active_loaded 23 vl_pre O ab_pre r23 )) (PreH29 : (ap_output_active_loaded 24 vl_pre O ab_pre r24 )) (PreH30 : (ap_output_active_loaded 25 vl_pre O ab_pre r25 )) (PreH31 : (ap_output_active_loaded 26 vl_pre O ab_pre r26 )) (PreH32 : (ap_output_active_loaded 27 vl_pre O ab_pre r27 )) (PreH33 : (ap_output_active_loaded 28 vl_pre O ab_pre r28 )) (PreH34 : (ap_output_active_loaded 29 vl_pre O ab_pre r29 )) (PreH35 : (ap_output_active_loaded 30 vl_pre O ab_pre r30 )) (PreH36 : (ap_output_active_loaded 31 vl_pre O ab_pre r31 )) (PreH37 : (0 < vl_pre)) (PreH38 : (vl_pre <= 32)) (PreH39 : (ap_window F p0_pre vl_pre )) (PreH40 : (ap_window F p1_pre vl_pre )) (PreH41 : (ap_window F p2_pre vl_pre )) (PreH42 : (ap_window F p3_pre vl_pre )) (PreH43 : (ap_window F p4_pre vl_pre )) (PreH44 : (ap_window F p5_pre vl_pre )) (PreH45 : (ap_window F p6_pre vl_pre )) (PreH46 : (ap_window F p7_pre vl_pre )) (PreH47 : (ap_window F p8_pre vl_pre )) (PreH48 : (ap_write_window W output_pre vl_pre )) (PreH49 : (ap_write_window WI index_pre vl_pre )) (PreH50 : (ap_block32_previous ab_pre ib_pre )) (PreH51 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH52 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH53 : (ap_optional_write_window W ab_pre vl_pre )) (PreH54 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH55 : (ab_pre <> 0)) ,
  ((&(( &( "a" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_output W O )
  **  (UndefStructPredvuint32m8_t ( &( "i" ) ) )
  **  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "p3" ) )) # Ptr  |-> p3_pre)
  **  ((( &( "p4" ) )) # Ptr  |-> p4_pre)
  **  ((( &( "p5" ) )) # Ptr  |-> p5_pre)
  **  ((( &( "p6" ) )) # Ptr  |-> p6_pre)
  **  ((( &( "p7" ) )) # Ptr  |-> p7_pre)
  **  ((( &( "p8" ) )) # Ptr  |-> p8_pre)
  **  ((( &( "ab" ) )) # Ptr  |-> ab_pre)
  **  ((( &( "ib" ) )) # Ptr  |-> ib_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "index" ) )) # Ptr  |-> index_pre)
  **  ((( &( "idx" ) )) # UInt  |-> idx_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (ap_data F )
  **  (ap_index WI I )
|--
  “ (ap_index_readable I ib_pre vl_pre ) ”
.

Definition ap_rvv_block32_partial_solve_wit_3_aux := 
forall (vl_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (PreH1 : (ap_output_active_loaded 0 vl_pre O ab_pre r0 )) (PreH2 : (ap_output_active_loaded 1 vl_pre O ab_pre r1 )) (PreH3 : (ap_output_active_loaded 2 vl_pre O ab_pre r2 )) (PreH4 : (ap_output_active_loaded 3 vl_pre O ab_pre r3 )) (PreH5 : (ap_output_active_loaded 4 vl_pre O ab_pre r4 )) (PreH6 : (ap_output_active_loaded 5 vl_pre O ab_pre r5 )) (PreH7 : (ap_output_active_loaded 6 vl_pre O ab_pre r6 )) (PreH8 : (ap_output_active_loaded 7 vl_pre O ab_pre r7 )) (PreH9 : (ap_output_active_loaded 8 vl_pre O ab_pre r8 )) (PreH10 : (ap_output_active_loaded 9 vl_pre O ab_pre r9 )) (PreH11 : (ap_output_active_loaded 10 vl_pre O ab_pre r10 )) (PreH12 : (ap_output_active_loaded 11 vl_pre O ab_pre r11 )) (PreH13 : (ap_output_active_loaded 12 vl_pre O ab_pre r12 )) (PreH14 : (ap_output_active_loaded 13 vl_pre O ab_pre r13 )) (PreH15 : (ap_output_active_loaded 14 vl_pre O ab_pre r14 )) (PreH16 : (ap_output_active_loaded 15 vl_pre O ab_pre r15 )) (PreH17 : (ap_output_active_loaded 16 vl_pre O ab_pre r16 )) (PreH18 : (ap_output_active_loaded 17 vl_pre O ab_pre r17 )) (PreH19 : (ap_output_active_loaded 18 vl_pre O ab_pre r18 )) (PreH20 : (ap_output_active_loaded 19 vl_pre O ab_pre r19 )) (PreH21 : (ap_output_active_loaded 20 vl_pre O ab_pre r20 )) (PreH22 : (ap_output_active_loaded 21 vl_pre O ab_pre r21 )) (PreH23 : (ap_output_active_loaded 22 vl_pre O ab_pre r22 )) (PreH24 : (ap_output_active_loaded 23 vl_pre O ab_pre r23 )) (PreH25 : (ap_output_active_loaded 24 vl_pre O ab_pre r24 )) (PreH26 : (ap_output_active_loaded 25 vl_pre O ab_pre r25 )) (PreH27 : (ap_output_active_loaded 26 vl_pre O ab_pre r26 )) (PreH28 : (ap_output_active_loaded 27 vl_pre O ab_pre r27 )) (PreH29 : (ap_output_active_loaded 28 vl_pre O ab_pre r28 )) (PreH30 : (ap_output_active_loaded 29 vl_pre O ab_pre r29 )) (PreH31 : (ap_output_active_loaded 30 vl_pre O ab_pre r30 )) (PreH32 : (ap_output_active_loaded 31 vl_pre O ab_pre r31 )) (PreH33 : (0 < vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (ap_window F p0_pre vl_pre )) (PreH36 : (ap_window F p1_pre vl_pre )) (PreH37 : (ap_window F p2_pre vl_pre )) (PreH38 : (ap_window F p3_pre vl_pre )) (PreH39 : (ap_window F p4_pre vl_pre )) (PreH40 : (ap_window F p5_pre vl_pre )) (PreH41 : (ap_window F p6_pre vl_pre )) (PreH42 : (ap_window F p7_pre vl_pre )) (PreH43 : (ap_window F p8_pre vl_pre )) (PreH44 : (ap_write_window W output_pre vl_pre )) (PreH45 : (ap_write_window WI index_pre vl_pre )) (PreH46 : (ap_block32_previous ab_pre ib_pre )) (PreH47 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH48 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH49 : (ap_optional_write_window W ab_pre vl_pre )) (PreH50 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH51 : (ab_pre <> 0)) ,
  ((&(( &( "a" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_output W O )
  **  (UndefStructPredvuint32m8_t ( &( "i" ) ) )
  **  (ap_data F )
  **  (ap_index WI I )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ap_output_active_loaded 0 vl_pre O ab_pre r0 ) ” 
  &&  “ (ap_output_active_loaded 1 vl_pre O ab_pre r1 ) ” 
  &&  “ (ap_output_active_loaded 2 vl_pre O ab_pre r2 ) ” 
  &&  “ (ap_output_active_loaded 3 vl_pre O ab_pre r3 ) ” 
  &&  “ (ap_output_active_loaded 4 vl_pre O ab_pre r4 ) ” 
  &&  “ (ap_output_active_loaded 5 vl_pre O ab_pre r5 ) ” 
  &&  “ (ap_output_active_loaded 6 vl_pre O ab_pre r6 ) ” 
  &&  “ (ap_output_active_loaded 7 vl_pre O ab_pre r7 ) ” 
  &&  “ (ap_output_active_loaded 8 vl_pre O ab_pre r8 ) ” 
  &&  “ (ap_output_active_loaded 9 vl_pre O ab_pre r9 ) ” 
  &&  “ (ap_output_active_loaded 10 vl_pre O ab_pre r10 ) ” 
  &&  “ (ap_output_active_loaded 11 vl_pre O ab_pre r11 ) ” 
  &&  “ (ap_output_active_loaded 12 vl_pre O ab_pre r12 ) ” 
  &&  “ (ap_output_active_loaded 13 vl_pre O ab_pre r13 ) ” 
  &&  “ (ap_output_active_loaded 14 vl_pre O ab_pre r14 ) ” 
  &&  “ (ap_output_active_loaded 15 vl_pre O ab_pre r15 ) ” 
  &&  “ (ap_output_active_loaded 16 vl_pre O ab_pre r16 ) ” 
  &&  “ (ap_output_active_loaded 17 vl_pre O ab_pre r17 ) ” 
  &&  “ (ap_output_active_loaded 18 vl_pre O ab_pre r18 ) ” 
  &&  “ (ap_output_active_loaded 19 vl_pre O ab_pre r19 ) ” 
  &&  “ (ap_output_active_loaded 20 vl_pre O ab_pre r20 ) ” 
  &&  “ (ap_output_active_loaded 21 vl_pre O ab_pre r21 ) ” 
  &&  “ (ap_output_active_loaded 22 vl_pre O ab_pre r22 ) ” 
  &&  “ (ap_output_active_loaded 23 vl_pre O ab_pre r23 ) ” 
  &&  “ (ap_output_active_loaded 24 vl_pre O ab_pre r24 ) ” 
  &&  “ (ap_output_active_loaded 25 vl_pre O ab_pre r25 ) ” 
  &&  “ (ap_output_active_loaded 26 vl_pre O ab_pre r26 ) ” 
  &&  “ (ap_output_active_loaded 27 vl_pre O ab_pre r27 ) ” 
  &&  “ (ap_output_active_loaded 28 vl_pre O ab_pre r28 ) ” 
  &&  “ (ap_output_active_loaded 29 vl_pre O ab_pre r29 ) ” 
  &&  “ (ap_output_active_loaded 30 vl_pre O ab_pre r30 ) ” 
  &&  “ (ap_output_active_loaded 31 vl_pre O ab_pre r31 ) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ab_pre <> 0) ”
  &&  (ap_index WI I )
  **  ((&(( &( "a" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_output W O )
  **  (UndefStructPredvuint32m8_t ( &( "i" ) ) )
  **  (ap_data F )
.

Definition ap_rvv_block32_partial_solve_wit_3 := ap_rvv_block32_partial_solve_wit_3_pure -> ap_rvv_block32_partial_solve_wit_3_aux.

Definition ap_rvv_block32_partial_solve_wit_4 := 
forall (vl_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (r31_2: Z) (r30_2: Z) (r29_2: Z) (r28_2: Z) (r27_2: Z) (r26_2: Z) (r25_2: Z) (r24_2: Z) (r23_2: Z) (r22_2: Z) (r21_2: Z) (r20_2: Z) (r19_2: Z) (r18_2: Z) (r17_2: Z) (r16_2: Z) (r15_2: Z) (r14_2: Z) (r13_2: Z) (r12_2: Z) (r11_2: Z) (r10_2: Z) (r9_2: Z) (r8_2: Z) (r7_2: Z) (r6_2: Z) (r5_2: Z) (r4_2: Z) (r3_2: Z) (r2_2: Z) (r1_2: Z) (r0_2: Z) (retval: Z) (PreH1 : (ap_index_active_loaded 0 vl_pre I ib_pre r0_2 )) (PreH2 : (ap_index_active_loaded 1 vl_pre I ib_pre r1_2 )) (PreH3 : (ap_index_active_loaded 2 vl_pre I ib_pre r2_2 )) (PreH4 : (ap_index_active_loaded 3 vl_pre I ib_pre r3_2 )) (PreH5 : (ap_index_active_loaded 4 vl_pre I ib_pre r4_2 )) (PreH6 : (ap_index_active_loaded 5 vl_pre I ib_pre r5_2 )) (PreH7 : (ap_index_active_loaded 6 vl_pre I ib_pre r6_2 )) (PreH8 : (ap_index_active_loaded 7 vl_pre I ib_pre r7_2 )) (PreH9 : (ap_index_active_loaded 8 vl_pre I ib_pre r8_2 )) (PreH10 : (ap_index_active_loaded 9 vl_pre I ib_pre r9_2 )) (PreH11 : (ap_index_active_loaded 10 vl_pre I ib_pre r10_2 )) (PreH12 : (ap_index_active_loaded 11 vl_pre I ib_pre r11_2 )) (PreH13 : (ap_index_active_loaded 12 vl_pre I ib_pre r12_2 )) (PreH14 : (ap_index_active_loaded 13 vl_pre I ib_pre r13_2 )) (PreH15 : (ap_index_active_loaded 14 vl_pre I ib_pre r14_2 )) (PreH16 : (ap_index_active_loaded 15 vl_pre I ib_pre r15_2 )) (PreH17 : (ap_index_active_loaded 16 vl_pre I ib_pre r16_2 )) (PreH18 : (ap_index_active_loaded 17 vl_pre I ib_pre r17_2 )) (PreH19 : (ap_index_active_loaded 18 vl_pre I ib_pre r18_2 )) (PreH20 : (ap_index_active_loaded 19 vl_pre I ib_pre r19_2 )) (PreH21 : (ap_index_active_loaded 20 vl_pre I ib_pre r20_2 )) (PreH22 : (ap_index_active_loaded 21 vl_pre I ib_pre r21_2 )) (PreH23 : (ap_index_active_loaded 22 vl_pre I ib_pre r22_2 )) (PreH24 : (ap_index_active_loaded 23 vl_pre I ib_pre r23_2 )) (PreH25 : (ap_index_active_loaded 24 vl_pre I ib_pre r24_2 )) (PreH26 : (ap_index_active_loaded 25 vl_pre I ib_pre r25_2 )) (PreH27 : (ap_index_active_loaded 26 vl_pre I ib_pre r26_2 )) (PreH28 : (ap_index_active_loaded 27 vl_pre I ib_pre r27_2 )) (PreH29 : (ap_index_active_loaded 28 vl_pre I ib_pre r28_2 )) (PreH30 : (ap_index_active_loaded 29 vl_pre I ib_pre r29_2 )) (PreH31 : (ap_index_active_loaded 30 vl_pre I ib_pre r30_2 )) (PreH32 : (ap_index_active_loaded 31 vl_pre I ib_pre r31_2 )) (PreH33 : (ap_output_active_loaded 0 vl_pre O ab_pre r0 )) (PreH34 : (ap_output_active_loaded 1 vl_pre O ab_pre r1 )) (PreH35 : (ap_output_active_loaded 2 vl_pre O ab_pre r2 )) (PreH36 : (ap_output_active_loaded 3 vl_pre O ab_pre r3 )) (PreH37 : (ap_output_active_loaded 4 vl_pre O ab_pre r4 )) (PreH38 : (ap_output_active_loaded 5 vl_pre O ab_pre r5 )) (PreH39 : (ap_output_active_loaded 6 vl_pre O ab_pre r6 )) (PreH40 : (ap_output_active_loaded 7 vl_pre O ab_pre r7 )) (PreH41 : (ap_output_active_loaded 8 vl_pre O ab_pre r8 )) (PreH42 : (ap_output_active_loaded 9 vl_pre O ab_pre r9 )) (PreH43 : (ap_output_active_loaded 10 vl_pre O ab_pre r10 )) (PreH44 : (ap_output_active_loaded 11 vl_pre O ab_pre r11 )) (PreH45 : (ap_output_active_loaded 12 vl_pre O ab_pre r12 )) (PreH46 : (ap_output_active_loaded 13 vl_pre O ab_pre r13 )) (PreH47 : (ap_output_active_loaded 14 vl_pre O ab_pre r14 )) (PreH48 : (ap_output_active_loaded 15 vl_pre O ab_pre r15 )) (PreH49 : (ap_output_active_loaded 16 vl_pre O ab_pre r16 )) (PreH50 : (ap_output_active_loaded 17 vl_pre O ab_pre r17 )) (PreH51 : (ap_output_active_loaded 18 vl_pre O ab_pre r18 )) (PreH52 : (ap_output_active_loaded 19 vl_pre O ab_pre r19 )) (PreH53 : (ap_output_active_loaded 20 vl_pre O ab_pre r20 )) (PreH54 : (ap_output_active_loaded 21 vl_pre O ab_pre r21 )) (PreH55 : (ap_output_active_loaded 22 vl_pre O ab_pre r22 )) (PreH56 : (ap_output_active_loaded 23 vl_pre O ab_pre r23 )) (PreH57 : (ap_output_active_loaded 24 vl_pre O ab_pre r24 )) (PreH58 : (ap_output_active_loaded 25 vl_pre O ab_pre r25 )) (PreH59 : (ap_output_active_loaded 26 vl_pre O ab_pre r26 )) (PreH60 : (ap_output_active_loaded 27 vl_pre O ab_pre r27 )) (PreH61 : (ap_output_active_loaded 28 vl_pre O ab_pre r28 )) (PreH62 : (ap_output_active_loaded 29 vl_pre O ab_pre r29 )) (PreH63 : (ap_output_active_loaded 30 vl_pre O ab_pre r30 )) (PreH64 : (ap_output_active_loaded 31 vl_pre O ab_pre r31 )) (PreH65 : (0 < vl_pre)) (PreH66 : (vl_pre <= 32)) (PreH67 : (ap_window F p0_pre vl_pre )) (PreH68 : (ap_window F p1_pre vl_pre )) (PreH69 : (ap_window F p2_pre vl_pre )) (PreH70 : (ap_window F p3_pre vl_pre )) (PreH71 : (ap_window F p4_pre vl_pre )) (PreH72 : (ap_window F p5_pre vl_pre )) (PreH73 : (ap_window F p6_pre vl_pre )) (PreH74 : (ap_window F p7_pre vl_pre )) (PreH75 : (ap_window F p8_pre vl_pre )) (PreH76 : (ap_write_window W output_pre vl_pre )) (PreH77 : (ap_write_window WI index_pre vl_pre )) (PreH78 : (ap_block32_previous ab_pre ib_pre )) (PreH79 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH80 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH81 : (ap_optional_write_window W ab_pre vl_pre )) (PreH82 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH83 : (ab_pre <> 0)) ,
  (UndefStructPredvuint32m8_t ( &( "i" ) ) )
  **  (ap_index WI I )
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s0")) # UInt  |-> r0_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s1")) # UInt  |-> r1_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s2")) # UInt  |-> r2_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s3")) # UInt  |-> r3_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s4")) # UInt  |-> r4_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s5")) # UInt  |-> r5_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s6")) # UInt  |-> r6_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s7")) # UInt  |-> r7_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s8")) # UInt  |-> r8_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s9")) # UInt  |-> r9_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s10")) # UInt  |-> r10_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s11")) # UInt  |-> r11_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s12")) # UInt  |-> r12_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s13")) # UInt  |-> r13_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s14")) # UInt  |-> r14_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s15")) # UInt  |-> r15_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s16")) # UInt  |-> r16_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s17")) # UInt  |-> r17_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s18")) # UInt  |-> r18_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s19")) # UInt  |-> r19_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s20")) # UInt  |-> r20_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s21")) # UInt  |-> r21_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s22")) # UInt  |-> r22_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s23")) # UInt  |-> r23_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s24")) # UInt  |-> r24_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s25")) # UInt  |-> r25_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s26")) # UInt  |-> r26_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s27")) # UInt  |-> r27_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s28")) # UInt  |-> r28_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s29")) # UInt  |-> r29_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s30")) # UInt  |-> r30_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s31")) # UInt  |-> r31_2)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_output W O )
  **  (ap_data F )
|--
  “ (ap_index_active_loaded 0 vl_pre I ib_pre r0_2 ) ” 
  &&  “ (ap_index_active_loaded 1 vl_pre I ib_pre r1_2 ) ” 
  &&  “ (ap_index_active_loaded 2 vl_pre I ib_pre r2_2 ) ” 
  &&  “ (ap_index_active_loaded 3 vl_pre I ib_pre r3_2 ) ” 
  &&  “ (ap_index_active_loaded 4 vl_pre I ib_pre r4_2 ) ” 
  &&  “ (ap_index_active_loaded 5 vl_pre I ib_pre r5_2 ) ” 
  &&  “ (ap_index_active_loaded 6 vl_pre I ib_pre r6_2 ) ” 
  &&  “ (ap_index_active_loaded 7 vl_pre I ib_pre r7_2 ) ” 
  &&  “ (ap_index_active_loaded 8 vl_pre I ib_pre r8_2 ) ” 
  &&  “ (ap_index_active_loaded 9 vl_pre I ib_pre r9_2 ) ” 
  &&  “ (ap_index_active_loaded 10 vl_pre I ib_pre r10_2 ) ” 
  &&  “ (ap_index_active_loaded 11 vl_pre I ib_pre r11_2 ) ” 
  &&  “ (ap_index_active_loaded 12 vl_pre I ib_pre r12_2 ) ” 
  &&  “ (ap_index_active_loaded 13 vl_pre I ib_pre r13_2 ) ” 
  &&  “ (ap_index_active_loaded 14 vl_pre I ib_pre r14_2 ) ” 
  &&  “ (ap_index_active_loaded 15 vl_pre I ib_pre r15_2 ) ” 
  &&  “ (ap_index_active_loaded 16 vl_pre I ib_pre r16_2 ) ” 
  &&  “ (ap_index_active_loaded 17 vl_pre I ib_pre r17_2 ) ” 
  &&  “ (ap_index_active_loaded 18 vl_pre I ib_pre r18_2 ) ” 
  &&  “ (ap_index_active_loaded 19 vl_pre I ib_pre r19_2 ) ” 
  &&  “ (ap_index_active_loaded 20 vl_pre I ib_pre r20_2 ) ” 
  &&  “ (ap_index_active_loaded 21 vl_pre I ib_pre r21_2 ) ” 
  &&  “ (ap_index_active_loaded 22 vl_pre I ib_pre r22_2 ) ” 
  &&  “ (ap_index_active_loaded 23 vl_pre I ib_pre r23_2 ) ” 
  &&  “ (ap_index_active_loaded 24 vl_pre I ib_pre r24_2 ) ” 
  &&  “ (ap_index_active_loaded 25 vl_pre I ib_pre r25_2 ) ” 
  &&  “ (ap_index_active_loaded 26 vl_pre I ib_pre r26_2 ) ” 
  &&  “ (ap_index_active_loaded 27 vl_pre I ib_pre r27_2 ) ” 
  &&  “ (ap_index_active_loaded 28 vl_pre I ib_pre r28_2 ) ” 
  &&  “ (ap_index_active_loaded 29 vl_pre I ib_pre r29_2 ) ” 
  &&  “ (ap_index_active_loaded 30 vl_pre I ib_pre r30_2 ) ” 
  &&  “ (ap_index_active_loaded 31 vl_pre I ib_pre r31_2 ) ” 
  &&  “ (ap_output_active_loaded 0 vl_pre O ab_pre r0 ) ” 
  &&  “ (ap_output_active_loaded 1 vl_pre O ab_pre r1 ) ” 
  &&  “ (ap_output_active_loaded 2 vl_pre O ab_pre r2 ) ” 
  &&  “ (ap_output_active_loaded 3 vl_pre O ab_pre r3 ) ” 
  &&  “ (ap_output_active_loaded 4 vl_pre O ab_pre r4 ) ” 
  &&  “ (ap_output_active_loaded 5 vl_pre O ab_pre r5 ) ” 
  &&  “ (ap_output_active_loaded 6 vl_pre O ab_pre r6 ) ” 
  &&  “ (ap_output_active_loaded 7 vl_pre O ab_pre r7 ) ” 
  &&  “ (ap_output_active_loaded 8 vl_pre O ab_pre r8 ) ” 
  &&  “ (ap_output_active_loaded 9 vl_pre O ab_pre r9 ) ” 
  &&  “ (ap_output_active_loaded 10 vl_pre O ab_pre r10 ) ” 
  &&  “ (ap_output_active_loaded 11 vl_pre O ab_pre r11 ) ” 
  &&  “ (ap_output_active_loaded 12 vl_pre O ab_pre r12 ) ” 
  &&  “ (ap_output_active_loaded 13 vl_pre O ab_pre r13 ) ” 
  &&  “ (ap_output_active_loaded 14 vl_pre O ab_pre r14 ) ” 
  &&  “ (ap_output_active_loaded 15 vl_pre O ab_pre r15 ) ” 
  &&  “ (ap_output_active_loaded 16 vl_pre O ab_pre r16 ) ” 
  &&  “ (ap_output_active_loaded 17 vl_pre O ab_pre r17 ) ” 
  &&  “ (ap_output_active_loaded 18 vl_pre O ab_pre r18 ) ” 
  &&  “ (ap_output_active_loaded 19 vl_pre O ab_pre r19 ) ” 
  &&  “ (ap_output_active_loaded 20 vl_pre O ab_pre r20 ) ” 
  &&  “ (ap_output_active_loaded 21 vl_pre O ab_pre r21 ) ” 
  &&  “ (ap_output_active_loaded 22 vl_pre O ab_pre r22 ) ” 
  &&  “ (ap_output_active_loaded 23 vl_pre O ab_pre r23 ) ” 
  &&  “ (ap_output_active_loaded 24 vl_pre O ab_pre r24 ) ” 
  &&  “ (ap_output_active_loaded 25 vl_pre O ab_pre r25 ) ” 
  &&  “ (ap_output_active_loaded 26 vl_pre O ab_pre r26 ) ” 
  &&  “ (ap_output_active_loaded 27 vl_pre O ab_pre r27 ) ” 
  &&  “ (ap_output_active_loaded 28 vl_pre O ab_pre r28 ) ” 
  &&  “ (ap_output_active_loaded 29 vl_pre O ab_pre r29 ) ” 
  &&  “ (ap_output_active_loaded 30 vl_pre O ab_pre r30 ) ” 
  &&  “ (ap_output_active_loaded 31 vl_pre O ab_pre r31 ) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ab_pre <> 0) ”
  &&  ((&(( &( "i" ) )->ₛ "s31")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s31")) # UInt  |-> r31_2)
  **  ((&(( &( "i" ) )->ₛ "s30")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s30")) # UInt  |-> r30_2)
  **  ((&(( &( "i" ) )->ₛ "s29")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s29")) # UInt  |-> r29_2)
  **  ((&(( &( "i" ) )->ₛ "s28")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s28")) # UInt  |-> r28_2)
  **  ((&(( &( "i" ) )->ₛ "s27")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s27")) # UInt  |-> r27_2)
  **  ((&(( &( "i" ) )->ₛ "s26")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s26")) # UInt  |-> r26_2)
  **  ((&(( &( "i" ) )->ₛ "s25")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s25")) # UInt  |-> r25_2)
  **  ((&(( &( "i" ) )->ₛ "s24")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s24")) # UInt  |-> r24_2)
  **  ((&(( &( "i" ) )->ₛ "s23")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s23")) # UInt  |-> r23_2)
  **  ((&(( &( "i" ) )->ₛ "s22")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s22")) # UInt  |-> r22_2)
  **  ((&(( &( "i" ) )->ₛ "s21")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s21")) # UInt  |-> r21_2)
  **  ((&(( &( "i" ) )->ₛ "s20")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s20")) # UInt  |-> r20_2)
  **  ((&(( &( "i" ) )->ₛ "s19")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s19")) # UInt  |-> r19_2)
  **  ((&(( &( "i" ) )->ₛ "s18")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s18")) # UInt  |-> r18_2)
  **  ((&(( &( "i" ) )->ₛ "s17")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s17")) # UInt  |-> r17_2)
  **  ((&(( &( "i" ) )->ₛ "s16")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s16")) # UInt  |-> r16_2)
  **  ((&(( &( "i" ) )->ₛ "s15")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s15")) # UInt  |-> r15_2)
  **  ((&(( &( "i" ) )->ₛ "s14")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s14")) # UInt  |-> r14_2)
  **  ((&(( &( "i" ) )->ₛ "s13")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s13")) # UInt  |-> r13_2)
  **  ((&(( &( "i" ) )->ₛ "s12")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s12")) # UInt  |-> r12_2)
  **  ((&(( &( "i" ) )->ₛ "s11")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s11")) # UInt  |-> r11_2)
  **  ((&(( &( "i" ) )->ₛ "s10")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s10")) # UInt  |-> r10_2)
  **  ((&(( &( "i" ) )->ₛ "s9")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s9")) # UInt  |-> r9_2)
  **  ((&(( &( "i" ) )->ₛ "s8")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s8")) # UInt  |-> r8_2)
  **  ((&(( &( "i" ) )->ₛ "s7")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s7")) # UInt  |-> r7_2)
  **  ((&(( &( "i" ) )->ₛ "s6")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s6")) # UInt  |-> r6_2)
  **  ((&(( &( "i" ) )->ₛ "s5")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s5")) # UInt  |-> r5_2)
  **  ((&(( &( "i" ) )->ₛ "s4")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s4")) # UInt  |-> r4_2)
  **  ((&(( &( "i" ) )->ₛ "s3")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s3")) # UInt  |-> r3_2)
  **  ((&(( &( "i" ) )->ₛ "s2")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s2")) # UInt  |-> r2_2)
  **  ((&(( &( "i" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s1")) # UInt  |-> r1_2)
  **  ((&(( &( "i" ) )->ₛ "s0")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s0")) # UInt  |-> r0_2)
  **  (ap_index WI I )
  **  ((&(( &( "a" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_output W O )
  **  (ap_data F )
.

Definition ap_rvv_block32_partial_solve_wit_5_pure := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (r31_2: Z) (r30_2: Z) (r29_2: Z) (r28_2: Z) (r27_2: Z) (r26_2: Z) (r25_2: Z) (r24_2: Z) (r23_2: Z) (r22_2: Z) (r21_2: Z) (r20_2: Z) (r19_2: Z) (r18_2: Z) (r17_2: Z) (r16_2: Z) (r15_2: Z) (r14_2: Z) (r13_2: Z) (r12_2: Z) (r11_2: Z) (r10_2: Z) (r9_2: Z) (r8_2: Z) (r7_2: Z) (r6_2: Z) (r5_2: Z) (r4_2: Z) (r3_2: Z) (r2_2: Z) (r1_2: Z) (r0_2: Z) (PreH1 : (ap_index_active_loaded 0 vl_pre I ib_pre r0_2 )) (PreH2 : (ap_index_active_loaded 1 vl_pre I ib_pre r1_2 )) (PreH3 : (ap_index_active_loaded 2 vl_pre I ib_pre r2_2 )) (PreH4 : (ap_index_active_loaded 3 vl_pre I ib_pre r3_2 )) (PreH5 : (ap_index_active_loaded 4 vl_pre I ib_pre r4_2 )) (PreH6 : (ap_index_active_loaded 5 vl_pre I ib_pre r5_2 )) (PreH7 : (ap_index_active_loaded 6 vl_pre I ib_pre r6_2 )) (PreH8 : (ap_index_active_loaded 7 vl_pre I ib_pre r7_2 )) (PreH9 : (ap_index_active_loaded 8 vl_pre I ib_pre r8_2 )) (PreH10 : (ap_index_active_loaded 9 vl_pre I ib_pre r9_2 )) (PreH11 : (ap_index_active_loaded 10 vl_pre I ib_pre r10_2 )) (PreH12 : (ap_index_active_loaded 11 vl_pre I ib_pre r11_2 )) (PreH13 : (ap_index_active_loaded 12 vl_pre I ib_pre r12_2 )) (PreH14 : (ap_index_active_loaded 13 vl_pre I ib_pre r13_2 )) (PreH15 : (ap_index_active_loaded 14 vl_pre I ib_pre r14_2 )) (PreH16 : (ap_index_active_loaded 15 vl_pre I ib_pre r15_2 )) (PreH17 : (ap_index_active_loaded 16 vl_pre I ib_pre r16_2 )) (PreH18 : (ap_index_active_loaded 17 vl_pre I ib_pre r17_2 )) (PreH19 : (ap_index_active_loaded 18 vl_pre I ib_pre r18_2 )) (PreH20 : (ap_index_active_loaded 19 vl_pre I ib_pre r19_2 )) (PreH21 : (ap_index_active_loaded 20 vl_pre I ib_pre r20_2 )) (PreH22 : (ap_index_active_loaded 21 vl_pre I ib_pre r21_2 )) (PreH23 : (ap_index_active_loaded 22 vl_pre I ib_pre r22_2 )) (PreH24 : (ap_index_active_loaded 23 vl_pre I ib_pre r23_2 )) (PreH25 : (ap_index_active_loaded 24 vl_pre I ib_pre r24_2 )) (PreH26 : (ap_index_active_loaded 25 vl_pre I ib_pre r25_2 )) (PreH27 : (ap_index_active_loaded 26 vl_pre I ib_pre r26_2 )) (PreH28 : (ap_index_active_loaded 27 vl_pre I ib_pre r27_2 )) (PreH29 : (ap_index_active_loaded 28 vl_pre I ib_pre r28_2 )) (PreH30 : (ap_index_active_loaded 29 vl_pre I ib_pre r29_2 )) (PreH31 : (ap_index_active_loaded 30 vl_pre I ib_pre r30_2 )) (PreH32 : (ap_index_active_loaded 31 vl_pre I ib_pre r31_2 )) (PreH33 : (ap_output_active_loaded 0 vl_pre O ab_pre r0 )) (PreH34 : (ap_output_active_loaded 1 vl_pre O ab_pre r1 )) (PreH35 : (ap_output_active_loaded 2 vl_pre O ab_pre r2 )) (PreH36 : (ap_output_active_loaded 3 vl_pre O ab_pre r3 )) (PreH37 : (ap_output_active_loaded 4 vl_pre O ab_pre r4 )) (PreH38 : (ap_output_active_loaded 5 vl_pre O ab_pre r5 )) (PreH39 : (ap_output_active_loaded 6 vl_pre O ab_pre r6 )) (PreH40 : (ap_output_active_loaded 7 vl_pre O ab_pre r7 )) (PreH41 : (ap_output_active_loaded 8 vl_pre O ab_pre r8 )) (PreH42 : (ap_output_active_loaded 9 vl_pre O ab_pre r9 )) (PreH43 : (ap_output_active_loaded 10 vl_pre O ab_pre r10 )) (PreH44 : (ap_output_active_loaded 11 vl_pre O ab_pre r11 )) (PreH45 : (ap_output_active_loaded 12 vl_pre O ab_pre r12 )) (PreH46 : (ap_output_active_loaded 13 vl_pre O ab_pre r13 )) (PreH47 : (ap_output_active_loaded 14 vl_pre O ab_pre r14 )) (PreH48 : (ap_output_active_loaded 15 vl_pre O ab_pre r15 )) (PreH49 : (ap_output_active_loaded 16 vl_pre O ab_pre r16 )) (PreH50 : (ap_output_active_loaded 17 vl_pre O ab_pre r17 )) (PreH51 : (ap_output_active_loaded 18 vl_pre O ab_pre r18 )) (PreH52 : (ap_output_active_loaded 19 vl_pre O ab_pre r19 )) (PreH53 : (ap_output_active_loaded 20 vl_pre O ab_pre r20 )) (PreH54 : (ap_output_active_loaded 21 vl_pre O ab_pre r21 )) (PreH55 : (ap_output_active_loaded 22 vl_pre O ab_pre r22 )) (PreH56 : (ap_output_active_loaded 23 vl_pre O ab_pre r23 )) (PreH57 : (ap_output_active_loaded 24 vl_pre O ab_pre r24 )) (PreH58 : (ap_output_active_loaded 25 vl_pre O ab_pre r25 )) (PreH59 : (ap_output_active_loaded 26 vl_pre O ab_pre r26 )) (PreH60 : (ap_output_active_loaded 27 vl_pre O ab_pre r27 )) (PreH61 : (ap_output_active_loaded 28 vl_pre O ab_pre r28 )) (PreH62 : (ap_output_active_loaded 29 vl_pre O ab_pre r29 )) (PreH63 : (ap_output_active_loaded 30 vl_pre O ab_pre r30 )) (PreH64 : (ap_output_active_loaded 31 vl_pre O ab_pre r31 )) (PreH65 : (0 < vl_pre)) (PreH66 : (vl_pre <= 32)) (PreH67 : (ap_window F p0_pre vl_pre )) (PreH68 : (ap_window F p1_pre vl_pre )) (PreH69 : (ap_window F p2_pre vl_pre )) (PreH70 : (ap_window F p3_pre vl_pre )) (PreH71 : (ap_window F p4_pre vl_pre )) (PreH72 : (ap_window F p5_pre vl_pre )) (PreH73 : (ap_window F p6_pre vl_pre )) (PreH74 : (ap_window F p7_pre vl_pre )) (PreH75 : (ap_window F p8_pre vl_pre )) (PreH76 : (ap_write_window W output_pre vl_pre )) (PreH77 : (ap_write_window WI index_pre vl_pre )) (PreH78 : (ap_block32_previous ab_pre ib_pre )) (PreH79 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH80 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH81 : (ap_optional_write_window W ab_pre vl_pre )) (PreH82 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH83 : (ab_pre <> 0)) ,
  (UndefStructPredvfloat32m8_t ( &( "b" ) ) )
  **  ((&(( &( "i" ) )->ₛ "s31")) # UInt  |-> r31_2)
  **  ((&(( &( "i" ) )->ₛ "s30")) # UInt  |-> r30_2)
  **  ((&(( &( "i" ) )->ₛ "s29")) # UInt  |-> r29_2)
  **  ((&(( &( "i" ) )->ₛ "s28")) # UInt  |-> r28_2)
  **  ((&(( &( "i" ) )->ₛ "s27")) # UInt  |-> r27_2)
  **  ((&(( &( "i" ) )->ₛ "s26")) # UInt  |-> r26_2)
  **  ((&(( &( "i" ) )->ₛ "s25")) # UInt  |-> r25_2)
  **  ((&(( &( "i" ) )->ₛ "s24")) # UInt  |-> r24_2)
  **  ((&(( &( "i" ) )->ₛ "s23")) # UInt  |-> r23_2)
  **  ((&(( &( "i" ) )->ₛ "s22")) # UInt  |-> r22_2)
  **  ((&(( &( "i" ) )->ₛ "s21")) # UInt  |-> r21_2)
  **  ((&(( &( "i" ) )->ₛ "s20")) # UInt  |-> r20_2)
  **  ((&(( &( "i" ) )->ₛ "s19")) # UInt  |-> r19_2)
  **  ((&(( &( "i" ) )->ₛ "s18")) # UInt  |-> r18_2)
  **  ((&(( &( "i" ) )->ₛ "s17")) # UInt  |-> r17_2)
  **  ((&(( &( "i" ) )->ₛ "s16")) # UInt  |-> r16_2)
  **  ((&(( &( "i" ) )->ₛ "s15")) # UInt  |-> r15_2)
  **  ((&(( &( "i" ) )->ₛ "s14")) # UInt  |-> r14_2)
  **  ((&(( &( "i" ) )->ₛ "s13")) # UInt  |-> r13_2)
  **  ((&(( &( "i" ) )->ₛ "s12")) # UInt  |-> r12_2)
  **  ((&(( &( "i" ) )->ₛ "s11")) # UInt  |-> r11_2)
  **  ((&(( &( "i" ) )->ₛ "s10")) # UInt  |-> r10_2)
  **  ((&(( &( "i" ) )->ₛ "s9")) # UInt  |-> r9_2)
  **  ((&(( &( "i" ) )->ₛ "s8")) # UInt  |-> r8_2)
  **  ((&(( &( "i" ) )->ₛ "s7")) # UInt  |-> r7_2)
  **  ((&(( &( "i" ) )->ₛ "s6")) # UInt  |-> r6_2)
  **  ((&(( &( "i" ) )->ₛ "s5")) # UInt  |-> r5_2)
  **  ((&(( &( "i" ) )->ₛ "s4")) # UInt  |-> r4_2)
  **  ((&(( &( "i" ) )->ₛ "s3")) # UInt  |-> r3_2)
  **  ((&(( &( "i" ) )->ₛ "s2")) # UInt  |-> r2_2)
  **  ((&(( &( "i" ) )->ₛ "s1")) # UInt  |-> r1_2)
  **  ((&(( &( "i" ) )->ₛ "s0")) # UInt  |-> r0_2)
  **  (ap_index WI I )
  **  ((&(( &( "a" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_output W O )
  **  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "p3" ) )) # Ptr  |-> p3_pre)
  **  ((( &( "p4" ) )) # Ptr  |-> p4_pre)
  **  ((( &( "p5" ) )) # Ptr  |-> p5_pre)
  **  ((( &( "p6" ) )) # Ptr  |-> p6_pre)
  **  ((( &( "p7" ) )) # Ptr  |-> p7_pre)
  **  ((( &( "p8" ) )) # Ptr  |-> p8_pre)
  **  ((( &( "ab" ) )) # Ptr  |-> ab_pre)
  **  ((( &( "ib" ) )) # Ptr  |-> ib_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "index" ) )) # Ptr  |-> index_pre)
  **  ((( &( "idx" ) )) # UInt  |-> idx_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (ap_data F )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ”
.

Definition ap_rvv_block32_partial_solve_wit_5_aux := 
forall (vl_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (r31_2: Z) (r30_2: Z) (r29_2: Z) (r28_2: Z) (r27_2: Z) (r26_2: Z) (r25_2: Z) (r24_2: Z) (r23_2: Z) (r22_2: Z) (r21_2: Z) (r20_2: Z) (r19_2: Z) (r18_2: Z) (r17_2: Z) (r16_2: Z) (r15_2: Z) (r14_2: Z) (r13_2: Z) (r12_2: Z) (r11_2: Z) (r10_2: Z) (r9_2: Z) (r8_2: Z) (r7_2: Z) (r6_2: Z) (r5_2: Z) (r4_2: Z) (r3_2: Z) (r2_2: Z) (r1_2: Z) (r0_2: Z) (PreH1 : (ap_index_active_loaded 0 vl_pre I ib_pre r0_2 )) (PreH2 : (ap_index_active_loaded 1 vl_pre I ib_pre r1_2 )) (PreH3 : (ap_index_active_loaded 2 vl_pre I ib_pre r2_2 )) (PreH4 : (ap_index_active_loaded 3 vl_pre I ib_pre r3_2 )) (PreH5 : (ap_index_active_loaded 4 vl_pre I ib_pre r4_2 )) (PreH6 : (ap_index_active_loaded 5 vl_pre I ib_pre r5_2 )) (PreH7 : (ap_index_active_loaded 6 vl_pre I ib_pre r6_2 )) (PreH8 : (ap_index_active_loaded 7 vl_pre I ib_pre r7_2 )) (PreH9 : (ap_index_active_loaded 8 vl_pre I ib_pre r8_2 )) (PreH10 : (ap_index_active_loaded 9 vl_pre I ib_pre r9_2 )) (PreH11 : (ap_index_active_loaded 10 vl_pre I ib_pre r10_2 )) (PreH12 : (ap_index_active_loaded 11 vl_pre I ib_pre r11_2 )) (PreH13 : (ap_index_active_loaded 12 vl_pre I ib_pre r12_2 )) (PreH14 : (ap_index_active_loaded 13 vl_pre I ib_pre r13_2 )) (PreH15 : (ap_index_active_loaded 14 vl_pre I ib_pre r14_2 )) (PreH16 : (ap_index_active_loaded 15 vl_pre I ib_pre r15_2 )) (PreH17 : (ap_index_active_loaded 16 vl_pre I ib_pre r16_2 )) (PreH18 : (ap_index_active_loaded 17 vl_pre I ib_pre r17_2 )) (PreH19 : (ap_index_active_loaded 18 vl_pre I ib_pre r18_2 )) (PreH20 : (ap_index_active_loaded 19 vl_pre I ib_pre r19_2 )) (PreH21 : (ap_index_active_loaded 20 vl_pre I ib_pre r20_2 )) (PreH22 : (ap_index_active_loaded 21 vl_pre I ib_pre r21_2 )) (PreH23 : (ap_index_active_loaded 22 vl_pre I ib_pre r22_2 )) (PreH24 : (ap_index_active_loaded 23 vl_pre I ib_pre r23_2 )) (PreH25 : (ap_index_active_loaded 24 vl_pre I ib_pre r24_2 )) (PreH26 : (ap_index_active_loaded 25 vl_pre I ib_pre r25_2 )) (PreH27 : (ap_index_active_loaded 26 vl_pre I ib_pre r26_2 )) (PreH28 : (ap_index_active_loaded 27 vl_pre I ib_pre r27_2 )) (PreH29 : (ap_index_active_loaded 28 vl_pre I ib_pre r28_2 )) (PreH30 : (ap_index_active_loaded 29 vl_pre I ib_pre r29_2 )) (PreH31 : (ap_index_active_loaded 30 vl_pre I ib_pre r30_2 )) (PreH32 : (ap_index_active_loaded 31 vl_pre I ib_pre r31_2 )) (PreH33 : (ap_output_active_loaded 0 vl_pre O ab_pre r0 )) (PreH34 : (ap_output_active_loaded 1 vl_pre O ab_pre r1 )) (PreH35 : (ap_output_active_loaded 2 vl_pre O ab_pre r2 )) (PreH36 : (ap_output_active_loaded 3 vl_pre O ab_pre r3 )) (PreH37 : (ap_output_active_loaded 4 vl_pre O ab_pre r4 )) (PreH38 : (ap_output_active_loaded 5 vl_pre O ab_pre r5 )) (PreH39 : (ap_output_active_loaded 6 vl_pre O ab_pre r6 )) (PreH40 : (ap_output_active_loaded 7 vl_pre O ab_pre r7 )) (PreH41 : (ap_output_active_loaded 8 vl_pre O ab_pre r8 )) (PreH42 : (ap_output_active_loaded 9 vl_pre O ab_pre r9 )) (PreH43 : (ap_output_active_loaded 10 vl_pre O ab_pre r10 )) (PreH44 : (ap_output_active_loaded 11 vl_pre O ab_pre r11 )) (PreH45 : (ap_output_active_loaded 12 vl_pre O ab_pre r12 )) (PreH46 : (ap_output_active_loaded 13 vl_pre O ab_pre r13 )) (PreH47 : (ap_output_active_loaded 14 vl_pre O ab_pre r14 )) (PreH48 : (ap_output_active_loaded 15 vl_pre O ab_pre r15 )) (PreH49 : (ap_output_active_loaded 16 vl_pre O ab_pre r16 )) (PreH50 : (ap_output_active_loaded 17 vl_pre O ab_pre r17 )) (PreH51 : (ap_output_active_loaded 18 vl_pre O ab_pre r18 )) (PreH52 : (ap_output_active_loaded 19 vl_pre O ab_pre r19 )) (PreH53 : (ap_output_active_loaded 20 vl_pre O ab_pre r20 )) (PreH54 : (ap_output_active_loaded 21 vl_pre O ab_pre r21 )) (PreH55 : (ap_output_active_loaded 22 vl_pre O ab_pre r22 )) (PreH56 : (ap_output_active_loaded 23 vl_pre O ab_pre r23 )) (PreH57 : (ap_output_active_loaded 24 vl_pre O ab_pre r24 )) (PreH58 : (ap_output_active_loaded 25 vl_pre O ab_pre r25 )) (PreH59 : (ap_output_active_loaded 26 vl_pre O ab_pre r26 )) (PreH60 : (ap_output_active_loaded 27 vl_pre O ab_pre r27 )) (PreH61 : (ap_output_active_loaded 28 vl_pre O ab_pre r28 )) (PreH62 : (ap_output_active_loaded 29 vl_pre O ab_pre r29 )) (PreH63 : (ap_output_active_loaded 30 vl_pre O ab_pre r30 )) (PreH64 : (ap_output_active_loaded 31 vl_pre O ab_pre r31 )) (PreH65 : (0 < vl_pre)) (PreH66 : (vl_pre <= 32)) (PreH67 : (ap_window F p0_pre vl_pre )) (PreH68 : (ap_window F p1_pre vl_pre )) (PreH69 : (ap_window F p2_pre vl_pre )) (PreH70 : (ap_window F p3_pre vl_pre )) (PreH71 : (ap_window F p4_pre vl_pre )) (PreH72 : (ap_window F p5_pre vl_pre )) (PreH73 : (ap_window F p6_pre vl_pre )) (PreH74 : (ap_window F p7_pre vl_pre )) (PreH75 : (ap_window F p8_pre vl_pre )) (PreH76 : (ap_write_window W output_pre vl_pre )) (PreH77 : (ap_write_window WI index_pre vl_pre )) (PreH78 : (ap_block32_previous ab_pre ib_pre )) (PreH79 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH80 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH81 : (ap_optional_write_window W ab_pre vl_pre )) (PreH82 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH83 : (ab_pre <> 0)) ,
  (UndefStructPredvfloat32m8_t ( &( "b" ) ) )
  **  ((&(( &( "i" ) )->ₛ "s31")) # UInt  |-> r31_2)
  **  ((&(( &( "i" ) )->ₛ "s30")) # UInt  |-> r30_2)
  **  ((&(( &( "i" ) )->ₛ "s29")) # UInt  |-> r29_2)
  **  ((&(( &( "i" ) )->ₛ "s28")) # UInt  |-> r28_2)
  **  ((&(( &( "i" ) )->ₛ "s27")) # UInt  |-> r27_2)
  **  ((&(( &( "i" ) )->ₛ "s26")) # UInt  |-> r26_2)
  **  ((&(( &( "i" ) )->ₛ "s25")) # UInt  |-> r25_2)
  **  ((&(( &( "i" ) )->ₛ "s24")) # UInt  |-> r24_2)
  **  ((&(( &( "i" ) )->ₛ "s23")) # UInt  |-> r23_2)
  **  ((&(( &( "i" ) )->ₛ "s22")) # UInt  |-> r22_2)
  **  ((&(( &( "i" ) )->ₛ "s21")) # UInt  |-> r21_2)
  **  ((&(( &( "i" ) )->ₛ "s20")) # UInt  |-> r20_2)
  **  ((&(( &( "i" ) )->ₛ "s19")) # UInt  |-> r19_2)
  **  ((&(( &( "i" ) )->ₛ "s18")) # UInt  |-> r18_2)
  **  ((&(( &( "i" ) )->ₛ "s17")) # UInt  |-> r17_2)
  **  ((&(( &( "i" ) )->ₛ "s16")) # UInt  |-> r16_2)
  **  ((&(( &( "i" ) )->ₛ "s15")) # UInt  |-> r15_2)
  **  ((&(( &( "i" ) )->ₛ "s14")) # UInt  |-> r14_2)
  **  ((&(( &( "i" ) )->ₛ "s13")) # UInt  |-> r13_2)
  **  ((&(( &( "i" ) )->ₛ "s12")) # UInt  |-> r12_2)
  **  ((&(( &( "i" ) )->ₛ "s11")) # UInt  |-> r11_2)
  **  ((&(( &( "i" ) )->ₛ "s10")) # UInt  |-> r10_2)
  **  ((&(( &( "i" ) )->ₛ "s9")) # UInt  |-> r9_2)
  **  ((&(( &( "i" ) )->ₛ "s8")) # UInt  |-> r8_2)
  **  ((&(( &( "i" ) )->ₛ "s7")) # UInt  |-> r7_2)
  **  ((&(( &( "i" ) )->ₛ "s6")) # UInt  |-> r6_2)
  **  ((&(( &( "i" ) )->ₛ "s5")) # UInt  |-> r5_2)
  **  ((&(( &( "i" ) )->ₛ "s4")) # UInt  |-> r4_2)
  **  ((&(( &( "i" ) )->ₛ "s3")) # UInt  |-> r3_2)
  **  ((&(( &( "i" ) )->ₛ "s2")) # UInt  |-> r2_2)
  **  ((&(( &( "i" ) )->ₛ "s1")) # UInt  |-> r1_2)
  **  ((&(( &( "i" ) )->ₛ "s0")) # UInt  |-> r0_2)
  **  (ap_index WI I )
  **  ((&(( &( "a" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_output W O )
  **  (ap_data F )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_index_active_loaded 0 vl_pre I ib_pre r0_2 ) ” 
  &&  “ (ap_index_active_loaded 1 vl_pre I ib_pre r1_2 ) ” 
  &&  “ (ap_index_active_loaded 2 vl_pre I ib_pre r2_2 ) ” 
  &&  “ (ap_index_active_loaded 3 vl_pre I ib_pre r3_2 ) ” 
  &&  “ (ap_index_active_loaded 4 vl_pre I ib_pre r4_2 ) ” 
  &&  “ (ap_index_active_loaded 5 vl_pre I ib_pre r5_2 ) ” 
  &&  “ (ap_index_active_loaded 6 vl_pre I ib_pre r6_2 ) ” 
  &&  “ (ap_index_active_loaded 7 vl_pre I ib_pre r7_2 ) ” 
  &&  “ (ap_index_active_loaded 8 vl_pre I ib_pre r8_2 ) ” 
  &&  “ (ap_index_active_loaded 9 vl_pre I ib_pre r9_2 ) ” 
  &&  “ (ap_index_active_loaded 10 vl_pre I ib_pre r10_2 ) ” 
  &&  “ (ap_index_active_loaded 11 vl_pre I ib_pre r11_2 ) ” 
  &&  “ (ap_index_active_loaded 12 vl_pre I ib_pre r12_2 ) ” 
  &&  “ (ap_index_active_loaded 13 vl_pre I ib_pre r13_2 ) ” 
  &&  “ (ap_index_active_loaded 14 vl_pre I ib_pre r14_2 ) ” 
  &&  “ (ap_index_active_loaded 15 vl_pre I ib_pre r15_2 ) ” 
  &&  “ (ap_index_active_loaded 16 vl_pre I ib_pre r16_2 ) ” 
  &&  “ (ap_index_active_loaded 17 vl_pre I ib_pre r17_2 ) ” 
  &&  “ (ap_index_active_loaded 18 vl_pre I ib_pre r18_2 ) ” 
  &&  “ (ap_index_active_loaded 19 vl_pre I ib_pre r19_2 ) ” 
  &&  “ (ap_index_active_loaded 20 vl_pre I ib_pre r20_2 ) ” 
  &&  “ (ap_index_active_loaded 21 vl_pre I ib_pre r21_2 ) ” 
  &&  “ (ap_index_active_loaded 22 vl_pre I ib_pre r22_2 ) ” 
  &&  “ (ap_index_active_loaded 23 vl_pre I ib_pre r23_2 ) ” 
  &&  “ (ap_index_active_loaded 24 vl_pre I ib_pre r24_2 ) ” 
  &&  “ (ap_index_active_loaded 25 vl_pre I ib_pre r25_2 ) ” 
  &&  “ (ap_index_active_loaded 26 vl_pre I ib_pre r26_2 ) ” 
  &&  “ (ap_index_active_loaded 27 vl_pre I ib_pre r27_2 ) ” 
  &&  “ (ap_index_active_loaded 28 vl_pre I ib_pre r28_2 ) ” 
  &&  “ (ap_index_active_loaded 29 vl_pre I ib_pre r29_2 ) ” 
  &&  “ (ap_index_active_loaded 30 vl_pre I ib_pre r30_2 ) ” 
  &&  “ (ap_index_active_loaded 31 vl_pre I ib_pre r31_2 ) ” 
  &&  “ (ap_output_active_loaded 0 vl_pre O ab_pre r0 ) ” 
  &&  “ (ap_output_active_loaded 1 vl_pre O ab_pre r1 ) ” 
  &&  “ (ap_output_active_loaded 2 vl_pre O ab_pre r2 ) ” 
  &&  “ (ap_output_active_loaded 3 vl_pre O ab_pre r3 ) ” 
  &&  “ (ap_output_active_loaded 4 vl_pre O ab_pre r4 ) ” 
  &&  “ (ap_output_active_loaded 5 vl_pre O ab_pre r5 ) ” 
  &&  “ (ap_output_active_loaded 6 vl_pre O ab_pre r6 ) ” 
  &&  “ (ap_output_active_loaded 7 vl_pre O ab_pre r7 ) ” 
  &&  “ (ap_output_active_loaded 8 vl_pre O ab_pre r8 ) ” 
  &&  “ (ap_output_active_loaded 9 vl_pre O ab_pre r9 ) ” 
  &&  “ (ap_output_active_loaded 10 vl_pre O ab_pre r10 ) ” 
  &&  “ (ap_output_active_loaded 11 vl_pre O ab_pre r11 ) ” 
  &&  “ (ap_output_active_loaded 12 vl_pre O ab_pre r12 ) ” 
  &&  “ (ap_output_active_loaded 13 vl_pre O ab_pre r13 ) ” 
  &&  “ (ap_output_active_loaded 14 vl_pre O ab_pre r14 ) ” 
  &&  “ (ap_output_active_loaded 15 vl_pre O ab_pre r15 ) ” 
  &&  “ (ap_output_active_loaded 16 vl_pre O ab_pre r16 ) ” 
  &&  “ (ap_output_active_loaded 17 vl_pre O ab_pre r17 ) ” 
  &&  “ (ap_output_active_loaded 18 vl_pre O ab_pre r18 ) ” 
  &&  “ (ap_output_active_loaded 19 vl_pre O ab_pre r19 ) ” 
  &&  “ (ap_output_active_loaded 20 vl_pre O ab_pre r20 ) ” 
  &&  “ (ap_output_active_loaded 21 vl_pre O ab_pre r21 ) ” 
  &&  “ (ap_output_active_loaded 22 vl_pre O ab_pre r22 ) ” 
  &&  “ (ap_output_active_loaded 23 vl_pre O ab_pre r23 ) ” 
  &&  “ (ap_output_active_loaded 24 vl_pre O ab_pre r24 ) ” 
  &&  “ (ap_output_active_loaded 25 vl_pre O ab_pre r25 ) ” 
  &&  “ (ap_output_active_loaded 26 vl_pre O ab_pre r26 ) ” 
  &&  “ (ap_output_active_loaded 27 vl_pre O ab_pre r27 ) ” 
  &&  “ (ap_output_active_loaded 28 vl_pre O ab_pre r28 ) ” 
  &&  “ (ap_output_active_loaded 29 vl_pre O ab_pre r29 ) ” 
  &&  “ (ap_output_active_loaded 30 vl_pre O ab_pre r30 ) ” 
  &&  “ (ap_output_active_loaded 31 vl_pre O ab_pre r31 ) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ab_pre <> 0) ”
  &&  (ap_data F )
  **  (UndefStructPredvfloat32m8_t ( &( "b" ) ) )
  **  ((&(( &( "i" ) )->ₛ "s31")) # UInt  |-> r31_2)
  **  ((&(( &( "i" ) )->ₛ "s30")) # UInt  |-> r30_2)
  **  ((&(( &( "i" ) )->ₛ "s29")) # UInt  |-> r29_2)
  **  ((&(( &( "i" ) )->ₛ "s28")) # UInt  |-> r28_2)
  **  ((&(( &( "i" ) )->ₛ "s27")) # UInt  |-> r27_2)
  **  ((&(( &( "i" ) )->ₛ "s26")) # UInt  |-> r26_2)
  **  ((&(( &( "i" ) )->ₛ "s25")) # UInt  |-> r25_2)
  **  ((&(( &( "i" ) )->ₛ "s24")) # UInt  |-> r24_2)
  **  ((&(( &( "i" ) )->ₛ "s23")) # UInt  |-> r23_2)
  **  ((&(( &( "i" ) )->ₛ "s22")) # UInt  |-> r22_2)
  **  ((&(( &( "i" ) )->ₛ "s21")) # UInt  |-> r21_2)
  **  ((&(( &( "i" ) )->ₛ "s20")) # UInt  |-> r20_2)
  **  ((&(( &( "i" ) )->ₛ "s19")) # UInt  |-> r19_2)
  **  ((&(( &( "i" ) )->ₛ "s18")) # UInt  |-> r18_2)
  **  ((&(( &( "i" ) )->ₛ "s17")) # UInt  |-> r17_2)
  **  ((&(( &( "i" ) )->ₛ "s16")) # UInt  |-> r16_2)
  **  ((&(( &( "i" ) )->ₛ "s15")) # UInt  |-> r15_2)
  **  ((&(( &( "i" ) )->ₛ "s14")) # UInt  |-> r14_2)
  **  ((&(( &( "i" ) )->ₛ "s13")) # UInt  |-> r13_2)
  **  ((&(( &( "i" ) )->ₛ "s12")) # UInt  |-> r12_2)
  **  ((&(( &( "i" ) )->ₛ "s11")) # UInt  |-> r11_2)
  **  ((&(( &( "i" ) )->ₛ "s10")) # UInt  |-> r10_2)
  **  ((&(( &( "i" ) )->ₛ "s9")) # UInt  |-> r9_2)
  **  ((&(( &( "i" ) )->ₛ "s8")) # UInt  |-> r8_2)
  **  ((&(( &( "i" ) )->ₛ "s7")) # UInt  |-> r7_2)
  **  ((&(( &( "i" ) )->ₛ "s6")) # UInt  |-> r6_2)
  **  ((&(( &( "i" ) )->ₛ "s5")) # UInt  |-> r5_2)
  **  ((&(( &( "i" ) )->ₛ "s4")) # UInt  |-> r4_2)
  **  ((&(( &( "i" ) )->ₛ "s3")) # UInt  |-> r3_2)
  **  ((&(( &( "i" ) )->ₛ "s2")) # UInt  |-> r2_2)
  **  ((&(( &( "i" ) )->ₛ "s1")) # UInt  |-> r1_2)
  **  ((&(( &( "i" ) )->ₛ "s0")) # UInt  |-> r0_2)
  **  (ap_index WI I )
  **  ((&(( &( "a" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_output W O )
.

Definition ap_rvv_block32_partial_solve_wit_5 := ap_rvv_block32_partial_solve_wit_5_pure -> ap_rvv_block32_partial_solve_wit_5_aux.

Definition ap_rvv_block32_partial_solve_wit_6 := 
forall (vl_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (r31_2: Z) (r30_2: Z) (r29_2: Z) (r28_2: Z) (r27_2: Z) (r26_2: Z) (r25_2: Z) (r24_2: Z) (r23_2: Z) (r22_2: Z) (r21_2: Z) (r20_2: Z) (r19_2: Z) (r18_2: Z) (r17_2: Z) (r16_2: Z) (r15_2: Z) (r14_2: Z) (r13_2: Z) (r12_2: Z) (r11_2: Z) (r10_2: Z) (r9_2: Z) (r8_2: Z) (r7_2: Z) (r6_2: Z) (r5_2: Z) (r4_2: Z) (r3_2: Z) (r2_2: Z) (r1_2: Z) (r0_2: Z) (r31_3: fp32) (r30_3: fp32) (r29_3: fp32) (r28_3: fp32) (r27_3: fp32) (r26_3: fp32) (r25_3: fp32) (r24_3: fp32) (r23_3: fp32) (r22_3: fp32) (r21_3: fp32) (r20_3: fp32) (r19_3: fp32) (r18_3: fp32) (r17_3: fp32) (r16_3: fp32) (r15_3: fp32) (r14_3: fp32) (r13_3: fp32) (r12_3: fp32) (r11_3: fp32) (r10_3: fp32) (r9_3: fp32) (r8_3: fp32) (r7_3: fp32) (r6_3: fp32) (r5_3: fp32) (r4_3: fp32) (r3_3: fp32) (r2_3: fp32) (r1_3: fp32) (r0_3: fp32) (retval: Z) (PreH1 : (apr_float_lane 0 vl_pre r0_3 (ap_load_lane (F) (p0_pre) (0)) )) (PreH2 : (apr_float_lane 1 vl_pre r1_3 (ap_load_lane (F) (p0_pre) (1)) )) (PreH3 : (apr_float_lane 2 vl_pre r2_3 (ap_load_lane (F) (p0_pre) (2)) )) (PreH4 : (apr_float_lane 3 vl_pre r3_3 (ap_load_lane (F) (p0_pre) (3)) )) (PreH5 : (apr_float_lane 4 vl_pre r4_3 (ap_load_lane (F) (p0_pre) (4)) )) (PreH6 : (apr_float_lane 5 vl_pre r5_3 (ap_load_lane (F) (p0_pre) (5)) )) (PreH7 : (apr_float_lane 6 vl_pre r6_3 (ap_load_lane (F) (p0_pre) (6)) )) (PreH8 : (apr_float_lane 7 vl_pre r7_3 (ap_load_lane (F) (p0_pre) (7)) )) (PreH9 : (apr_float_lane 8 vl_pre r8_3 (ap_load_lane (F) (p0_pre) (8)) )) (PreH10 : (apr_float_lane 9 vl_pre r9_3 (ap_load_lane (F) (p0_pre) (9)) )) (PreH11 : (apr_float_lane 10 vl_pre r10_3 (ap_load_lane (F) (p0_pre) (10)) )) (PreH12 : (apr_float_lane 11 vl_pre r11_3 (ap_load_lane (F) (p0_pre) (11)) )) (PreH13 : (apr_float_lane 12 vl_pre r12_3 (ap_load_lane (F) (p0_pre) (12)) )) (PreH14 : (apr_float_lane 13 vl_pre r13_3 (ap_load_lane (F) (p0_pre) (13)) )) (PreH15 : (apr_float_lane 14 vl_pre r14_3 (ap_load_lane (F) (p0_pre) (14)) )) (PreH16 : (apr_float_lane 15 vl_pre r15_3 (ap_load_lane (F) (p0_pre) (15)) )) (PreH17 : (apr_float_lane 16 vl_pre r16_3 (ap_load_lane (F) (p0_pre) (16)) )) (PreH18 : (apr_float_lane 17 vl_pre r17_3 (ap_load_lane (F) (p0_pre) (17)) )) (PreH19 : (apr_float_lane 18 vl_pre r18_3 (ap_load_lane (F) (p0_pre) (18)) )) (PreH20 : (apr_float_lane 19 vl_pre r19_3 (ap_load_lane (F) (p0_pre) (19)) )) (PreH21 : (apr_float_lane 20 vl_pre r20_3 (ap_load_lane (F) (p0_pre) (20)) )) (PreH22 : (apr_float_lane 21 vl_pre r21_3 (ap_load_lane (F) (p0_pre) (21)) )) (PreH23 : (apr_float_lane 22 vl_pre r22_3 (ap_load_lane (F) (p0_pre) (22)) )) (PreH24 : (apr_float_lane 23 vl_pre r23_3 (ap_load_lane (F) (p0_pre) (23)) )) (PreH25 : (apr_float_lane 24 vl_pre r24_3 (ap_load_lane (F) (p0_pre) (24)) )) (PreH26 : (apr_float_lane 25 vl_pre r25_3 (ap_load_lane (F) (p0_pre) (25)) )) (PreH27 : (apr_float_lane 26 vl_pre r26_3 (ap_load_lane (F) (p0_pre) (26)) )) (PreH28 : (apr_float_lane 27 vl_pre r27_3 (ap_load_lane (F) (p0_pre) (27)) )) (PreH29 : (apr_float_lane 28 vl_pre r28_3 (ap_load_lane (F) (p0_pre) (28)) )) (PreH30 : (apr_float_lane 29 vl_pre r29_3 (ap_load_lane (F) (p0_pre) (29)) )) (PreH31 : (apr_float_lane 30 vl_pre r30_3 (ap_load_lane (F) (p0_pre) (30)) )) (PreH32 : (apr_float_lane 31 vl_pre r31_3 (ap_load_lane (F) (p0_pre) (31)) )) (PreH33 : (ap_index_active_loaded 0 vl_pre I ib_pre r0_2 )) (PreH34 : (ap_index_active_loaded 1 vl_pre I ib_pre r1_2 )) (PreH35 : (ap_index_active_loaded 2 vl_pre I ib_pre r2_2 )) (PreH36 : (ap_index_active_loaded 3 vl_pre I ib_pre r3_2 )) (PreH37 : (ap_index_active_loaded 4 vl_pre I ib_pre r4_2 )) (PreH38 : (ap_index_active_loaded 5 vl_pre I ib_pre r5_2 )) (PreH39 : (ap_index_active_loaded 6 vl_pre I ib_pre r6_2 )) (PreH40 : (ap_index_active_loaded 7 vl_pre I ib_pre r7_2 )) (PreH41 : (ap_index_active_loaded 8 vl_pre I ib_pre r8_2 )) (PreH42 : (ap_index_active_loaded 9 vl_pre I ib_pre r9_2 )) (PreH43 : (ap_index_active_loaded 10 vl_pre I ib_pre r10_2 )) (PreH44 : (ap_index_active_loaded 11 vl_pre I ib_pre r11_2 )) (PreH45 : (ap_index_active_loaded 12 vl_pre I ib_pre r12_2 )) (PreH46 : (ap_index_active_loaded 13 vl_pre I ib_pre r13_2 )) (PreH47 : (ap_index_active_loaded 14 vl_pre I ib_pre r14_2 )) (PreH48 : (ap_index_active_loaded 15 vl_pre I ib_pre r15_2 )) (PreH49 : (ap_index_active_loaded 16 vl_pre I ib_pre r16_2 )) (PreH50 : (ap_index_active_loaded 17 vl_pre I ib_pre r17_2 )) (PreH51 : (ap_index_active_loaded 18 vl_pre I ib_pre r18_2 )) (PreH52 : (ap_index_active_loaded 19 vl_pre I ib_pre r19_2 )) (PreH53 : (ap_index_active_loaded 20 vl_pre I ib_pre r20_2 )) (PreH54 : (ap_index_active_loaded 21 vl_pre I ib_pre r21_2 )) (PreH55 : (ap_index_active_loaded 22 vl_pre I ib_pre r22_2 )) (PreH56 : (ap_index_active_loaded 23 vl_pre I ib_pre r23_2 )) (PreH57 : (ap_index_active_loaded 24 vl_pre I ib_pre r24_2 )) (PreH58 : (ap_index_active_loaded 25 vl_pre I ib_pre r25_2 )) (PreH59 : (ap_index_active_loaded 26 vl_pre I ib_pre r26_2 )) (PreH60 : (ap_index_active_loaded 27 vl_pre I ib_pre r27_2 )) (PreH61 : (ap_index_active_loaded 28 vl_pre I ib_pre r28_2 )) (PreH62 : (ap_index_active_loaded 29 vl_pre I ib_pre r29_2 )) (PreH63 : (ap_index_active_loaded 30 vl_pre I ib_pre r30_2 )) (PreH64 : (ap_index_active_loaded 31 vl_pre I ib_pre r31_2 )) (PreH65 : (ap_output_active_loaded 0 vl_pre O ab_pre r0 )) (PreH66 : (ap_output_active_loaded 1 vl_pre O ab_pre r1 )) (PreH67 : (ap_output_active_loaded 2 vl_pre O ab_pre r2 )) (PreH68 : (ap_output_active_loaded 3 vl_pre O ab_pre r3 )) (PreH69 : (ap_output_active_loaded 4 vl_pre O ab_pre r4 )) (PreH70 : (ap_output_active_loaded 5 vl_pre O ab_pre r5 )) (PreH71 : (ap_output_active_loaded 6 vl_pre O ab_pre r6 )) (PreH72 : (ap_output_active_loaded 7 vl_pre O ab_pre r7 )) (PreH73 : (ap_output_active_loaded 8 vl_pre O ab_pre r8 )) (PreH74 : (ap_output_active_loaded 9 vl_pre O ab_pre r9 )) (PreH75 : (ap_output_active_loaded 10 vl_pre O ab_pre r10 )) (PreH76 : (ap_output_active_loaded 11 vl_pre O ab_pre r11 )) (PreH77 : (ap_output_active_loaded 12 vl_pre O ab_pre r12 )) (PreH78 : (ap_output_active_loaded 13 vl_pre O ab_pre r13 )) (PreH79 : (ap_output_active_loaded 14 vl_pre O ab_pre r14 )) (PreH80 : (ap_output_active_loaded 15 vl_pre O ab_pre r15 )) (PreH81 : (ap_output_active_loaded 16 vl_pre O ab_pre r16 )) (PreH82 : (ap_output_active_loaded 17 vl_pre O ab_pre r17 )) (PreH83 : (ap_output_active_loaded 18 vl_pre O ab_pre r18 )) (PreH84 : (ap_output_active_loaded 19 vl_pre O ab_pre r19 )) (PreH85 : (ap_output_active_loaded 20 vl_pre O ab_pre r20 )) (PreH86 : (ap_output_active_loaded 21 vl_pre O ab_pre r21 )) (PreH87 : (ap_output_active_loaded 22 vl_pre O ab_pre r22 )) (PreH88 : (ap_output_active_loaded 23 vl_pre O ab_pre r23 )) (PreH89 : (ap_output_active_loaded 24 vl_pre O ab_pre r24 )) (PreH90 : (ap_output_active_loaded 25 vl_pre O ab_pre r25 )) (PreH91 : (ap_output_active_loaded 26 vl_pre O ab_pre r26 )) (PreH92 : (ap_output_active_loaded 27 vl_pre O ab_pre r27 )) (PreH93 : (ap_output_active_loaded 28 vl_pre O ab_pre r28 )) (PreH94 : (ap_output_active_loaded 29 vl_pre O ab_pre r29 )) (PreH95 : (ap_output_active_loaded 30 vl_pre O ab_pre r30 )) (PreH96 : (ap_output_active_loaded 31 vl_pre O ab_pre r31 )) (PreH97 : (0 < vl_pre)) (PreH98 : (vl_pre <= 32)) (PreH99 : (ap_window F p0_pre vl_pre )) (PreH100 : (ap_window F p1_pre vl_pre )) (PreH101 : (ap_window F p2_pre vl_pre )) (PreH102 : (ap_window F p3_pre vl_pre )) (PreH103 : (ap_window F p4_pre vl_pre )) (PreH104 : (ap_window F p5_pre vl_pre )) (PreH105 : (ap_window F p6_pre vl_pre )) (PreH106 : (ap_window F p7_pre vl_pre )) (PreH107 : (ap_window F p8_pre vl_pre )) (PreH108 : (ap_write_window W output_pre vl_pre )) (PreH109 : (ap_write_window WI index_pre vl_pre )) (PreH110 : (ap_block32_previous ab_pre ib_pre )) (PreH111 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH112 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH113 : (ap_optional_write_window W ab_pre vl_pre )) (PreH114 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH115 : (ab_pre <> 0)) ,
  (ap_data F )
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> r0_3)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> r1_3)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> r2_3)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> r3_3)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> r4_3)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> r5_3)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> r6_3)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> r7_3)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> r8_3)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> r9_3)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> r10_3)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> r11_3)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> r12_3)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> r13_3)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> r14_3)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> r15_3)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> r16_3)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> r17_3)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> r18_3)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> r19_3)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> r20_3)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> r21_3)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> r22_3)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> r23_3)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> r24_3)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> r25_3)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> r26_3)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> r27_3)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> r28_3)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> r29_3)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> r30_3)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> r31_3)
  **  (UndefStructPredvfloat32m8_t ( &( "b" ) ) )
  **  ((&(( &( "i" ) )->ₛ "s31")) # UInt  |-> r31_2)
  **  ((&(( &( "i" ) )->ₛ "s30")) # UInt  |-> r30_2)
  **  ((&(( &( "i" ) )->ₛ "s29")) # UInt  |-> r29_2)
  **  ((&(( &( "i" ) )->ₛ "s28")) # UInt  |-> r28_2)
  **  ((&(( &( "i" ) )->ₛ "s27")) # UInt  |-> r27_2)
  **  ((&(( &( "i" ) )->ₛ "s26")) # UInt  |-> r26_2)
  **  ((&(( &( "i" ) )->ₛ "s25")) # UInt  |-> r25_2)
  **  ((&(( &( "i" ) )->ₛ "s24")) # UInt  |-> r24_2)
  **  ((&(( &( "i" ) )->ₛ "s23")) # UInt  |-> r23_2)
  **  ((&(( &( "i" ) )->ₛ "s22")) # UInt  |-> r22_2)
  **  ((&(( &( "i" ) )->ₛ "s21")) # UInt  |-> r21_2)
  **  ((&(( &( "i" ) )->ₛ "s20")) # UInt  |-> r20_2)
  **  ((&(( &( "i" ) )->ₛ "s19")) # UInt  |-> r19_2)
  **  ((&(( &( "i" ) )->ₛ "s18")) # UInt  |-> r18_2)
  **  ((&(( &( "i" ) )->ₛ "s17")) # UInt  |-> r17_2)
  **  ((&(( &( "i" ) )->ₛ "s16")) # UInt  |-> r16_2)
  **  ((&(( &( "i" ) )->ₛ "s15")) # UInt  |-> r15_2)
  **  ((&(( &( "i" ) )->ₛ "s14")) # UInt  |-> r14_2)
  **  ((&(( &( "i" ) )->ₛ "s13")) # UInt  |-> r13_2)
  **  ((&(( &( "i" ) )->ₛ "s12")) # UInt  |-> r12_2)
  **  ((&(( &( "i" ) )->ₛ "s11")) # UInt  |-> r11_2)
  **  ((&(( &( "i" ) )->ₛ "s10")) # UInt  |-> r10_2)
  **  ((&(( &( "i" ) )->ₛ "s9")) # UInt  |-> r9_2)
  **  ((&(( &( "i" ) )->ₛ "s8")) # UInt  |-> r8_2)
  **  ((&(( &( "i" ) )->ₛ "s7")) # UInt  |-> r7_2)
  **  ((&(( &( "i" ) )->ₛ "s6")) # UInt  |-> r6_2)
  **  ((&(( &( "i" ) )->ₛ "s5")) # UInt  |-> r5_2)
  **  ((&(( &( "i" ) )->ₛ "s4")) # UInt  |-> r4_2)
  **  ((&(( &( "i" ) )->ₛ "s3")) # UInt  |-> r3_2)
  **  ((&(( &( "i" ) )->ₛ "s2")) # UInt  |-> r2_2)
  **  ((&(( &( "i" ) )->ₛ "s1")) # UInt  |-> r1_2)
  **  ((&(( &( "i" ) )->ₛ "s0")) # UInt  |-> r0_2)
  **  (ap_index WI I )
  **  ((&(( &( "a" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_output W O )
|--
  “ (apr_float_lane 0 vl_pre r0_3 (ap_load_lane (F) (p0_pre) (0)) ) ” 
  &&  “ (apr_float_lane 1 vl_pre r1_3 (ap_load_lane (F) (p0_pre) (1)) ) ” 
  &&  “ (apr_float_lane 2 vl_pre r2_3 (ap_load_lane (F) (p0_pre) (2)) ) ” 
  &&  “ (apr_float_lane 3 vl_pre r3_3 (ap_load_lane (F) (p0_pre) (3)) ) ” 
  &&  “ (apr_float_lane 4 vl_pre r4_3 (ap_load_lane (F) (p0_pre) (4)) ) ” 
  &&  “ (apr_float_lane 5 vl_pre r5_3 (ap_load_lane (F) (p0_pre) (5)) ) ” 
  &&  “ (apr_float_lane 6 vl_pre r6_3 (ap_load_lane (F) (p0_pre) (6)) ) ” 
  &&  “ (apr_float_lane 7 vl_pre r7_3 (ap_load_lane (F) (p0_pre) (7)) ) ” 
  &&  “ (apr_float_lane 8 vl_pre r8_3 (ap_load_lane (F) (p0_pre) (8)) ) ” 
  &&  “ (apr_float_lane 9 vl_pre r9_3 (ap_load_lane (F) (p0_pre) (9)) ) ” 
  &&  “ (apr_float_lane 10 vl_pre r10_3 (ap_load_lane (F) (p0_pre) (10)) ) ” 
  &&  “ (apr_float_lane 11 vl_pre r11_3 (ap_load_lane (F) (p0_pre) (11)) ) ” 
  &&  “ (apr_float_lane 12 vl_pre r12_3 (ap_load_lane (F) (p0_pre) (12)) ) ” 
  &&  “ (apr_float_lane 13 vl_pre r13_3 (ap_load_lane (F) (p0_pre) (13)) ) ” 
  &&  “ (apr_float_lane 14 vl_pre r14_3 (ap_load_lane (F) (p0_pre) (14)) ) ” 
  &&  “ (apr_float_lane 15 vl_pre r15_3 (ap_load_lane (F) (p0_pre) (15)) ) ” 
  &&  “ (apr_float_lane 16 vl_pre r16_3 (ap_load_lane (F) (p0_pre) (16)) ) ” 
  &&  “ (apr_float_lane 17 vl_pre r17_3 (ap_load_lane (F) (p0_pre) (17)) ) ” 
  &&  “ (apr_float_lane 18 vl_pre r18_3 (ap_load_lane (F) (p0_pre) (18)) ) ” 
  &&  “ (apr_float_lane 19 vl_pre r19_3 (ap_load_lane (F) (p0_pre) (19)) ) ” 
  &&  “ (apr_float_lane 20 vl_pre r20_3 (ap_load_lane (F) (p0_pre) (20)) ) ” 
  &&  “ (apr_float_lane 21 vl_pre r21_3 (ap_load_lane (F) (p0_pre) (21)) ) ” 
  &&  “ (apr_float_lane 22 vl_pre r22_3 (ap_load_lane (F) (p0_pre) (22)) ) ” 
  &&  “ (apr_float_lane 23 vl_pre r23_3 (ap_load_lane (F) (p0_pre) (23)) ) ” 
  &&  “ (apr_float_lane 24 vl_pre r24_3 (ap_load_lane (F) (p0_pre) (24)) ) ” 
  &&  “ (apr_float_lane 25 vl_pre r25_3 (ap_load_lane (F) (p0_pre) (25)) ) ” 
  &&  “ (apr_float_lane 26 vl_pre r26_3 (ap_load_lane (F) (p0_pre) (26)) ) ” 
  &&  “ (apr_float_lane 27 vl_pre r27_3 (ap_load_lane (F) (p0_pre) (27)) ) ” 
  &&  “ (apr_float_lane 28 vl_pre r28_3 (ap_load_lane (F) (p0_pre) (28)) ) ” 
  &&  “ (apr_float_lane 29 vl_pre r29_3 (ap_load_lane (F) (p0_pre) (29)) ) ” 
  &&  “ (apr_float_lane 30 vl_pre r30_3 (ap_load_lane (F) (p0_pre) (30)) ) ” 
  &&  “ (apr_float_lane 31 vl_pre r31_3 (ap_load_lane (F) (p0_pre) (31)) ) ” 
  &&  “ (ap_index_active_loaded 0 vl_pre I ib_pre r0_2 ) ” 
  &&  “ (ap_index_active_loaded 1 vl_pre I ib_pre r1_2 ) ” 
  &&  “ (ap_index_active_loaded 2 vl_pre I ib_pre r2_2 ) ” 
  &&  “ (ap_index_active_loaded 3 vl_pre I ib_pre r3_2 ) ” 
  &&  “ (ap_index_active_loaded 4 vl_pre I ib_pre r4_2 ) ” 
  &&  “ (ap_index_active_loaded 5 vl_pre I ib_pre r5_2 ) ” 
  &&  “ (ap_index_active_loaded 6 vl_pre I ib_pre r6_2 ) ” 
  &&  “ (ap_index_active_loaded 7 vl_pre I ib_pre r7_2 ) ” 
  &&  “ (ap_index_active_loaded 8 vl_pre I ib_pre r8_2 ) ” 
  &&  “ (ap_index_active_loaded 9 vl_pre I ib_pre r9_2 ) ” 
  &&  “ (ap_index_active_loaded 10 vl_pre I ib_pre r10_2 ) ” 
  &&  “ (ap_index_active_loaded 11 vl_pre I ib_pre r11_2 ) ” 
  &&  “ (ap_index_active_loaded 12 vl_pre I ib_pre r12_2 ) ” 
  &&  “ (ap_index_active_loaded 13 vl_pre I ib_pre r13_2 ) ” 
  &&  “ (ap_index_active_loaded 14 vl_pre I ib_pre r14_2 ) ” 
  &&  “ (ap_index_active_loaded 15 vl_pre I ib_pre r15_2 ) ” 
  &&  “ (ap_index_active_loaded 16 vl_pre I ib_pre r16_2 ) ” 
  &&  “ (ap_index_active_loaded 17 vl_pre I ib_pre r17_2 ) ” 
  &&  “ (ap_index_active_loaded 18 vl_pre I ib_pre r18_2 ) ” 
  &&  “ (ap_index_active_loaded 19 vl_pre I ib_pre r19_2 ) ” 
  &&  “ (ap_index_active_loaded 20 vl_pre I ib_pre r20_2 ) ” 
  &&  “ (ap_index_active_loaded 21 vl_pre I ib_pre r21_2 ) ” 
  &&  “ (ap_index_active_loaded 22 vl_pre I ib_pre r22_2 ) ” 
  &&  “ (ap_index_active_loaded 23 vl_pre I ib_pre r23_2 ) ” 
  &&  “ (ap_index_active_loaded 24 vl_pre I ib_pre r24_2 ) ” 
  &&  “ (ap_index_active_loaded 25 vl_pre I ib_pre r25_2 ) ” 
  &&  “ (ap_index_active_loaded 26 vl_pre I ib_pre r26_2 ) ” 
  &&  “ (ap_index_active_loaded 27 vl_pre I ib_pre r27_2 ) ” 
  &&  “ (ap_index_active_loaded 28 vl_pre I ib_pre r28_2 ) ” 
  &&  “ (ap_index_active_loaded 29 vl_pre I ib_pre r29_2 ) ” 
  &&  “ (ap_index_active_loaded 30 vl_pre I ib_pre r30_2 ) ” 
  &&  “ (ap_index_active_loaded 31 vl_pre I ib_pre r31_2 ) ” 
  &&  “ (ap_output_active_loaded 0 vl_pre O ab_pre r0 ) ” 
  &&  “ (ap_output_active_loaded 1 vl_pre O ab_pre r1 ) ” 
  &&  “ (ap_output_active_loaded 2 vl_pre O ab_pre r2 ) ” 
  &&  “ (ap_output_active_loaded 3 vl_pre O ab_pre r3 ) ” 
  &&  “ (ap_output_active_loaded 4 vl_pre O ab_pre r4 ) ” 
  &&  “ (ap_output_active_loaded 5 vl_pre O ab_pre r5 ) ” 
  &&  “ (ap_output_active_loaded 6 vl_pre O ab_pre r6 ) ” 
  &&  “ (ap_output_active_loaded 7 vl_pre O ab_pre r7 ) ” 
  &&  “ (ap_output_active_loaded 8 vl_pre O ab_pre r8 ) ” 
  &&  “ (ap_output_active_loaded 9 vl_pre O ab_pre r9 ) ” 
  &&  “ (ap_output_active_loaded 10 vl_pre O ab_pre r10 ) ” 
  &&  “ (ap_output_active_loaded 11 vl_pre O ab_pre r11 ) ” 
  &&  “ (ap_output_active_loaded 12 vl_pre O ab_pre r12 ) ” 
  &&  “ (ap_output_active_loaded 13 vl_pre O ab_pre r13 ) ” 
  &&  “ (ap_output_active_loaded 14 vl_pre O ab_pre r14 ) ” 
  &&  “ (ap_output_active_loaded 15 vl_pre O ab_pre r15 ) ” 
  &&  “ (ap_output_active_loaded 16 vl_pre O ab_pre r16 ) ” 
  &&  “ (ap_output_active_loaded 17 vl_pre O ab_pre r17 ) ” 
  &&  “ (ap_output_active_loaded 18 vl_pre O ab_pre r18 ) ” 
  &&  “ (ap_output_active_loaded 19 vl_pre O ab_pre r19 ) ” 
  &&  “ (ap_output_active_loaded 20 vl_pre O ab_pre r20 ) ” 
  &&  “ (ap_output_active_loaded 21 vl_pre O ab_pre r21 ) ” 
  &&  “ (ap_output_active_loaded 22 vl_pre O ab_pre r22 ) ” 
  &&  “ (ap_output_active_loaded 23 vl_pre O ab_pre r23 ) ” 
  &&  “ (ap_output_active_loaded 24 vl_pre O ab_pre r24 ) ” 
  &&  “ (ap_output_active_loaded 25 vl_pre O ab_pre r25 ) ” 
  &&  “ (ap_output_active_loaded 26 vl_pre O ab_pre r26 ) ” 
  &&  “ (ap_output_active_loaded 27 vl_pre O ab_pre r27 ) ” 
  &&  “ (ap_output_active_loaded 28 vl_pre O ab_pre r28 ) ” 
  &&  “ (ap_output_active_loaded 29 vl_pre O ab_pre r29 ) ” 
  &&  “ (ap_output_active_loaded 30 vl_pre O ab_pre r30 ) ” 
  &&  “ (ap_output_active_loaded 31 vl_pre O ab_pre r31 ) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ab_pre <> 0) ”
  &&  ((&(( &( "b" ) )->ₛ "s31")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> r31_3)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> r30_3)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> r29_3)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> r28_3)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> r27_3)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> r26_3)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> r25_3)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> r24_3)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> r23_3)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> r22_3)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> r21_3)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> r20_3)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> r19_3)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> r18_3)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> r17_3)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> r16_3)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> r15_3)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> r14_3)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> r13_3)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> r12_3)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> r11_3)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> r10_3)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> r9_3)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> r8_3)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> r7_3)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> r6_3)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> r5_3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> r4_3)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> r3_3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> r2_3)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> r1_3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> r0_3)
  **  (ap_data F )
  **  ((&(( &( "i" ) )->ₛ "s31")) # UInt  |-> r31_2)
  **  ((&(( &( "i" ) )->ₛ "s30")) # UInt  |-> r30_2)
  **  ((&(( &( "i" ) )->ₛ "s29")) # UInt  |-> r29_2)
  **  ((&(( &( "i" ) )->ₛ "s28")) # UInt  |-> r28_2)
  **  ((&(( &( "i" ) )->ₛ "s27")) # UInt  |-> r27_2)
  **  ((&(( &( "i" ) )->ₛ "s26")) # UInt  |-> r26_2)
  **  ((&(( &( "i" ) )->ₛ "s25")) # UInt  |-> r25_2)
  **  ((&(( &( "i" ) )->ₛ "s24")) # UInt  |-> r24_2)
  **  ((&(( &( "i" ) )->ₛ "s23")) # UInt  |-> r23_2)
  **  ((&(( &( "i" ) )->ₛ "s22")) # UInt  |-> r22_2)
  **  ((&(( &( "i" ) )->ₛ "s21")) # UInt  |-> r21_2)
  **  ((&(( &( "i" ) )->ₛ "s20")) # UInt  |-> r20_2)
  **  ((&(( &( "i" ) )->ₛ "s19")) # UInt  |-> r19_2)
  **  ((&(( &( "i" ) )->ₛ "s18")) # UInt  |-> r18_2)
  **  ((&(( &( "i" ) )->ₛ "s17")) # UInt  |-> r17_2)
  **  ((&(( &( "i" ) )->ₛ "s16")) # UInt  |-> r16_2)
  **  ((&(( &( "i" ) )->ₛ "s15")) # UInt  |-> r15_2)
  **  ((&(( &( "i" ) )->ₛ "s14")) # UInt  |-> r14_2)
  **  ((&(( &( "i" ) )->ₛ "s13")) # UInt  |-> r13_2)
  **  ((&(( &( "i" ) )->ₛ "s12")) # UInt  |-> r12_2)
  **  ((&(( &( "i" ) )->ₛ "s11")) # UInt  |-> r11_2)
  **  ((&(( &( "i" ) )->ₛ "s10")) # UInt  |-> r10_2)
  **  ((&(( &( "i" ) )->ₛ "s9")) # UInt  |-> r9_2)
  **  ((&(( &( "i" ) )->ₛ "s8")) # UInt  |-> r8_2)
  **  ((&(( &( "i" ) )->ₛ "s7")) # UInt  |-> r7_2)
  **  ((&(( &( "i" ) )->ₛ "s6")) # UInt  |-> r6_2)
  **  ((&(( &( "i" ) )->ₛ "s5")) # UInt  |-> r5_2)
  **  ((&(( &( "i" ) )->ₛ "s4")) # UInt  |-> r4_2)
  **  ((&(( &( "i" ) )->ₛ "s3")) # UInt  |-> r3_2)
  **  ((&(( &( "i" ) )->ₛ "s2")) # UInt  |-> r2_2)
  **  ((&(( &( "i" ) )->ₛ "s1")) # UInt  |-> r1_2)
  **  ((&(( &( "i" ) )->ₛ "s0")) # UInt  |-> r0_2)
  **  (ap_index WI I )
  **  ((&(( &( "a" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_output W O )
.

Definition ap_rvv_block32_partial_solve_wit_7_pure := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (r31_2: Z) (r30_2: Z) (r29_2: Z) (r28_2: Z) (r27_2: Z) (r26_2: Z) (r25_2: Z) (r24_2: Z) (r23_2: Z) (r22_2: Z) (r21_2: Z) (r20_2: Z) (r19_2: Z) (r18_2: Z) (r17_2: Z) (r16_2: Z) (r15_2: Z) (r14_2: Z) (r13_2: Z) (r12_2: Z) (r11_2: Z) (r10_2: Z) (r9_2: Z) (r8_2: Z) (r7_2: Z) (r6_2: Z) (r5_2: Z) (r4_2: Z) (r3_2: Z) (r2_2: Z) (r1_2: Z) (r0_2: Z) (r31_3: fp32) (r30_3: fp32) (r29_3: fp32) (r28_3: fp32) (r27_3: fp32) (r26_3: fp32) (r25_3: fp32) (r24_3: fp32) (r23_3: fp32) (r22_3: fp32) (r21_3: fp32) (r20_3: fp32) (r19_3: fp32) (r18_3: fp32) (r17_3: fp32) (r16_3: fp32) (r15_3: fp32) (r14_3: fp32) (r13_3: fp32) (r12_3: fp32) (r11_3: fp32) (r10_3: fp32) (r9_3: fp32) (r8_3: fp32) (r7_3: fp32) (r6_3: fp32) (r5_3: fp32) (r4_3: fp32) (r3_3: fp32) (r2_3: fp32) (r1_3: fp32) (r0_3: fp32) (PreH1 : (apr_float_lane 0 vl_pre r0_3 (ap_load_lane (F) (p0_pre) (0)) )) (PreH2 : (apr_float_lane 1 vl_pre r1_3 (ap_load_lane (F) (p0_pre) (1)) )) (PreH3 : (apr_float_lane 2 vl_pre r2_3 (ap_load_lane (F) (p0_pre) (2)) )) (PreH4 : (apr_float_lane 3 vl_pre r3_3 (ap_load_lane (F) (p0_pre) (3)) )) (PreH5 : (apr_float_lane 4 vl_pre r4_3 (ap_load_lane (F) (p0_pre) (4)) )) (PreH6 : (apr_float_lane 5 vl_pre r5_3 (ap_load_lane (F) (p0_pre) (5)) )) (PreH7 : (apr_float_lane 6 vl_pre r6_3 (ap_load_lane (F) (p0_pre) (6)) )) (PreH8 : (apr_float_lane 7 vl_pre r7_3 (ap_load_lane (F) (p0_pre) (7)) )) (PreH9 : (apr_float_lane 8 vl_pre r8_3 (ap_load_lane (F) (p0_pre) (8)) )) (PreH10 : (apr_float_lane 9 vl_pre r9_3 (ap_load_lane (F) (p0_pre) (9)) )) (PreH11 : (apr_float_lane 10 vl_pre r10_3 (ap_load_lane (F) (p0_pre) (10)) )) (PreH12 : (apr_float_lane 11 vl_pre r11_3 (ap_load_lane (F) (p0_pre) (11)) )) (PreH13 : (apr_float_lane 12 vl_pre r12_3 (ap_load_lane (F) (p0_pre) (12)) )) (PreH14 : (apr_float_lane 13 vl_pre r13_3 (ap_load_lane (F) (p0_pre) (13)) )) (PreH15 : (apr_float_lane 14 vl_pre r14_3 (ap_load_lane (F) (p0_pre) (14)) )) (PreH16 : (apr_float_lane 15 vl_pre r15_3 (ap_load_lane (F) (p0_pre) (15)) )) (PreH17 : (apr_float_lane 16 vl_pre r16_3 (ap_load_lane (F) (p0_pre) (16)) )) (PreH18 : (apr_float_lane 17 vl_pre r17_3 (ap_load_lane (F) (p0_pre) (17)) )) (PreH19 : (apr_float_lane 18 vl_pre r18_3 (ap_load_lane (F) (p0_pre) (18)) )) (PreH20 : (apr_float_lane 19 vl_pre r19_3 (ap_load_lane (F) (p0_pre) (19)) )) (PreH21 : (apr_float_lane 20 vl_pre r20_3 (ap_load_lane (F) (p0_pre) (20)) )) (PreH22 : (apr_float_lane 21 vl_pre r21_3 (ap_load_lane (F) (p0_pre) (21)) )) (PreH23 : (apr_float_lane 22 vl_pre r22_3 (ap_load_lane (F) (p0_pre) (22)) )) (PreH24 : (apr_float_lane 23 vl_pre r23_3 (ap_load_lane (F) (p0_pre) (23)) )) (PreH25 : (apr_float_lane 24 vl_pre r24_3 (ap_load_lane (F) (p0_pre) (24)) )) (PreH26 : (apr_float_lane 25 vl_pre r25_3 (ap_load_lane (F) (p0_pre) (25)) )) (PreH27 : (apr_float_lane 26 vl_pre r26_3 (ap_load_lane (F) (p0_pre) (26)) )) (PreH28 : (apr_float_lane 27 vl_pre r27_3 (ap_load_lane (F) (p0_pre) (27)) )) (PreH29 : (apr_float_lane 28 vl_pre r28_3 (ap_load_lane (F) (p0_pre) (28)) )) (PreH30 : (apr_float_lane 29 vl_pre r29_3 (ap_load_lane (F) (p0_pre) (29)) )) (PreH31 : (apr_float_lane 30 vl_pre r30_3 (ap_load_lane (F) (p0_pre) (30)) )) (PreH32 : (apr_float_lane 31 vl_pre r31_3 (ap_load_lane (F) (p0_pre) (31)) )) (PreH33 : (ap_index_active_loaded 0 vl_pre I ib_pre r0_2 )) (PreH34 : (ap_index_active_loaded 1 vl_pre I ib_pre r1_2 )) (PreH35 : (ap_index_active_loaded 2 vl_pre I ib_pre r2_2 )) (PreH36 : (ap_index_active_loaded 3 vl_pre I ib_pre r3_2 )) (PreH37 : (ap_index_active_loaded 4 vl_pre I ib_pre r4_2 )) (PreH38 : (ap_index_active_loaded 5 vl_pre I ib_pre r5_2 )) (PreH39 : (ap_index_active_loaded 6 vl_pre I ib_pre r6_2 )) (PreH40 : (ap_index_active_loaded 7 vl_pre I ib_pre r7_2 )) (PreH41 : (ap_index_active_loaded 8 vl_pre I ib_pre r8_2 )) (PreH42 : (ap_index_active_loaded 9 vl_pre I ib_pre r9_2 )) (PreH43 : (ap_index_active_loaded 10 vl_pre I ib_pre r10_2 )) (PreH44 : (ap_index_active_loaded 11 vl_pre I ib_pre r11_2 )) (PreH45 : (ap_index_active_loaded 12 vl_pre I ib_pre r12_2 )) (PreH46 : (ap_index_active_loaded 13 vl_pre I ib_pre r13_2 )) (PreH47 : (ap_index_active_loaded 14 vl_pre I ib_pre r14_2 )) (PreH48 : (ap_index_active_loaded 15 vl_pre I ib_pre r15_2 )) (PreH49 : (ap_index_active_loaded 16 vl_pre I ib_pre r16_2 )) (PreH50 : (ap_index_active_loaded 17 vl_pre I ib_pre r17_2 )) (PreH51 : (ap_index_active_loaded 18 vl_pre I ib_pre r18_2 )) (PreH52 : (ap_index_active_loaded 19 vl_pre I ib_pre r19_2 )) (PreH53 : (ap_index_active_loaded 20 vl_pre I ib_pre r20_2 )) (PreH54 : (ap_index_active_loaded 21 vl_pre I ib_pre r21_2 )) (PreH55 : (ap_index_active_loaded 22 vl_pre I ib_pre r22_2 )) (PreH56 : (ap_index_active_loaded 23 vl_pre I ib_pre r23_2 )) (PreH57 : (ap_index_active_loaded 24 vl_pre I ib_pre r24_2 )) (PreH58 : (ap_index_active_loaded 25 vl_pre I ib_pre r25_2 )) (PreH59 : (ap_index_active_loaded 26 vl_pre I ib_pre r26_2 )) (PreH60 : (ap_index_active_loaded 27 vl_pre I ib_pre r27_2 )) (PreH61 : (ap_index_active_loaded 28 vl_pre I ib_pre r28_2 )) (PreH62 : (ap_index_active_loaded 29 vl_pre I ib_pre r29_2 )) (PreH63 : (ap_index_active_loaded 30 vl_pre I ib_pre r30_2 )) (PreH64 : (ap_index_active_loaded 31 vl_pre I ib_pre r31_2 )) (PreH65 : (ap_output_active_loaded 0 vl_pre O ab_pre r0 )) (PreH66 : (ap_output_active_loaded 1 vl_pre O ab_pre r1 )) (PreH67 : (ap_output_active_loaded 2 vl_pre O ab_pre r2 )) (PreH68 : (ap_output_active_loaded 3 vl_pre O ab_pre r3 )) (PreH69 : (ap_output_active_loaded 4 vl_pre O ab_pre r4 )) (PreH70 : (ap_output_active_loaded 5 vl_pre O ab_pre r5 )) (PreH71 : (ap_output_active_loaded 6 vl_pre O ab_pre r6 )) (PreH72 : (ap_output_active_loaded 7 vl_pre O ab_pre r7 )) (PreH73 : (ap_output_active_loaded 8 vl_pre O ab_pre r8 )) (PreH74 : (ap_output_active_loaded 9 vl_pre O ab_pre r9 )) (PreH75 : (ap_output_active_loaded 10 vl_pre O ab_pre r10 )) (PreH76 : (ap_output_active_loaded 11 vl_pre O ab_pre r11 )) (PreH77 : (ap_output_active_loaded 12 vl_pre O ab_pre r12 )) (PreH78 : (ap_output_active_loaded 13 vl_pre O ab_pre r13 )) (PreH79 : (ap_output_active_loaded 14 vl_pre O ab_pre r14 )) (PreH80 : (ap_output_active_loaded 15 vl_pre O ab_pre r15 )) (PreH81 : (ap_output_active_loaded 16 vl_pre O ab_pre r16 )) (PreH82 : (ap_output_active_loaded 17 vl_pre O ab_pre r17 )) (PreH83 : (ap_output_active_loaded 18 vl_pre O ab_pre r18 )) (PreH84 : (ap_output_active_loaded 19 vl_pre O ab_pre r19 )) (PreH85 : (ap_output_active_loaded 20 vl_pre O ab_pre r20 )) (PreH86 : (ap_output_active_loaded 21 vl_pre O ab_pre r21 )) (PreH87 : (ap_output_active_loaded 22 vl_pre O ab_pre r22 )) (PreH88 : (ap_output_active_loaded 23 vl_pre O ab_pre r23 )) (PreH89 : (ap_output_active_loaded 24 vl_pre O ab_pre r24 )) (PreH90 : (ap_output_active_loaded 25 vl_pre O ab_pre r25 )) (PreH91 : (ap_output_active_loaded 26 vl_pre O ab_pre r26 )) (PreH92 : (ap_output_active_loaded 27 vl_pre O ab_pre r27 )) (PreH93 : (ap_output_active_loaded 28 vl_pre O ab_pre r28 )) (PreH94 : (ap_output_active_loaded 29 vl_pre O ab_pre r29 )) (PreH95 : (ap_output_active_loaded 30 vl_pre O ab_pre r30 )) (PreH96 : (ap_output_active_loaded 31 vl_pre O ab_pre r31 )) (PreH97 : (0 < vl_pre)) (PreH98 : (vl_pre <= 32)) (PreH99 : (ap_window F p0_pre vl_pre )) (PreH100 : (ap_window F p1_pre vl_pre )) (PreH101 : (ap_window F p2_pre vl_pre )) (PreH102 : (ap_window F p3_pre vl_pre )) (PreH103 : (ap_window F p4_pre vl_pre )) (PreH104 : (ap_window F p5_pre vl_pre )) (PreH105 : (ap_window F p6_pre vl_pre )) (PreH106 : (ap_window F p7_pre vl_pre )) (PreH107 : (ap_window F p8_pre vl_pre )) (PreH108 : (ap_write_window W output_pre vl_pre )) (PreH109 : (ap_write_window WI index_pre vl_pre )) (PreH110 : (ap_block32_previous ab_pre ib_pre )) (PreH111 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH112 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH113 : (ap_optional_write_window W ab_pre vl_pre )) (PreH114 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH115 : (ab_pre <> 0)) ,
  ((&(( &( "b" ) )->ₛ "s31")) # Float  |-> r31_3)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |-> r30_3)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |-> r29_3)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |-> r28_3)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |-> r27_3)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |-> r26_3)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |-> r25_3)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |-> r24_3)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |-> r23_3)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |-> r22_3)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |-> r21_3)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |-> r20_3)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |-> r19_3)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |-> r18_3)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |-> r17_3)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |-> r16_3)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> r15_3)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> r14_3)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> r13_3)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> r12_3)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> r11_3)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> r10_3)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> r9_3)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> r8_3)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> r7_3)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> r6_3)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> r5_3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> r4_3)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> r3_3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> r2_3)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> r1_3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> r0_3)
  **  (ap_data F )
  **  ((&(( &( "i" ) )->ₛ "s31")) # UInt  |-> r31_2)
  **  ((&(( &( "i" ) )->ₛ "s30")) # UInt  |-> r30_2)
  **  ((&(( &( "i" ) )->ₛ "s29")) # UInt  |-> r29_2)
  **  ((&(( &( "i" ) )->ₛ "s28")) # UInt  |-> r28_2)
  **  ((&(( &( "i" ) )->ₛ "s27")) # UInt  |-> r27_2)
  **  ((&(( &( "i" ) )->ₛ "s26")) # UInt  |-> r26_2)
  **  ((&(( &( "i" ) )->ₛ "s25")) # UInt  |-> r25_2)
  **  ((&(( &( "i" ) )->ₛ "s24")) # UInt  |-> r24_2)
  **  ((&(( &( "i" ) )->ₛ "s23")) # UInt  |-> r23_2)
  **  ((&(( &( "i" ) )->ₛ "s22")) # UInt  |-> r22_2)
  **  ((&(( &( "i" ) )->ₛ "s21")) # UInt  |-> r21_2)
  **  ((&(( &( "i" ) )->ₛ "s20")) # UInt  |-> r20_2)
  **  ((&(( &( "i" ) )->ₛ "s19")) # UInt  |-> r19_2)
  **  ((&(( &( "i" ) )->ₛ "s18")) # UInt  |-> r18_2)
  **  ((&(( &( "i" ) )->ₛ "s17")) # UInt  |-> r17_2)
  **  ((&(( &( "i" ) )->ₛ "s16")) # UInt  |-> r16_2)
  **  ((&(( &( "i" ) )->ₛ "s15")) # UInt  |-> r15_2)
  **  ((&(( &( "i" ) )->ₛ "s14")) # UInt  |-> r14_2)
  **  ((&(( &( "i" ) )->ₛ "s13")) # UInt  |-> r13_2)
  **  ((&(( &( "i" ) )->ₛ "s12")) # UInt  |-> r12_2)
  **  ((&(( &( "i" ) )->ₛ "s11")) # UInt  |-> r11_2)
  **  ((&(( &( "i" ) )->ₛ "s10")) # UInt  |-> r10_2)
  **  ((&(( &( "i" ) )->ₛ "s9")) # UInt  |-> r9_2)
  **  ((&(( &( "i" ) )->ₛ "s8")) # UInt  |-> r8_2)
  **  ((&(( &( "i" ) )->ₛ "s7")) # UInt  |-> r7_2)
  **  ((&(( &( "i" ) )->ₛ "s6")) # UInt  |-> r6_2)
  **  ((&(( &( "i" ) )->ₛ "s5")) # UInt  |-> r5_2)
  **  ((&(( &( "i" ) )->ₛ "s4")) # UInt  |-> r4_2)
  **  ((&(( &( "i" ) )->ₛ "s3")) # UInt  |-> r3_2)
  **  ((&(( &( "i" ) )->ₛ "s2")) # UInt  |-> r2_2)
  **  ((&(( &( "i" ) )->ₛ "s1")) # UInt  |-> r1_2)
  **  ((&(( &( "i" ) )->ₛ "s0")) # UInt  |-> r0_2)
  **  (ap_index WI I )
  **  ((&(( &( "a" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_output W O )
  **  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "p3" ) )) # Ptr  |-> p3_pre)
  **  ((( &( "p4" ) )) # Ptr  |-> p4_pre)
  **  ((( &( "p5" ) )) # Ptr  |-> p5_pre)
  **  ((( &( "p6" ) )) # Ptr  |-> p6_pre)
  **  ((( &( "p7" ) )) # Ptr  |-> p7_pre)
  **  ((( &( "p8" ) )) # Ptr  |-> p8_pre)
  **  ((( &( "ab" ) )) # Ptr  |-> ab_pre)
  **  ((( &( "ib" ) )) # Ptr  |-> ib_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "index" ) )) # Ptr  |-> index_pre)
  **  ((( &( "idx" ) )) # UInt  |-> idx_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition ap_rvv_block32_partial_solve_wit_7_aux := 
forall (vl_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (r31_2: Z) (r30_2: Z) (r29_2: Z) (r28_2: Z) (r27_2: Z) (r26_2: Z) (r25_2: Z) (r24_2: Z) (r23_2: Z) (r22_2: Z) (r21_2: Z) (r20_2: Z) (r19_2: Z) (r18_2: Z) (r17_2: Z) (r16_2: Z) (r15_2: Z) (r14_2: Z) (r13_2: Z) (r12_2: Z) (r11_2: Z) (r10_2: Z) (r9_2: Z) (r8_2: Z) (r7_2: Z) (r6_2: Z) (r5_2: Z) (r4_2: Z) (r3_2: Z) (r2_2: Z) (r1_2: Z) (r0_2: Z) (r31_3: fp32) (r30_3: fp32) (r29_3: fp32) (r28_3: fp32) (r27_3: fp32) (r26_3: fp32) (r25_3: fp32) (r24_3: fp32) (r23_3: fp32) (r22_3: fp32) (r21_3: fp32) (r20_3: fp32) (r19_3: fp32) (r18_3: fp32) (r17_3: fp32) (r16_3: fp32) (r15_3: fp32) (r14_3: fp32) (r13_3: fp32) (r12_3: fp32) (r11_3: fp32) (r10_3: fp32) (r9_3: fp32) (r8_3: fp32) (r7_3: fp32) (r6_3: fp32) (r5_3: fp32) (r4_3: fp32) (r3_3: fp32) (r2_3: fp32) (r1_3: fp32) (r0_3: fp32) (PreH1 : (apr_float_lane 0 vl_pre r0_3 (ap_load_lane (F) (p0_pre) (0)) )) (PreH2 : (apr_float_lane 1 vl_pre r1_3 (ap_load_lane (F) (p0_pre) (1)) )) (PreH3 : (apr_float_lane 2 vl_pre r2_3 (ap_load_lane (F) (p0_pre) (2)) )) (PreH4 : (apr_float_lane 3 vl_pre r3_3 (ap_load_lane (F) (p0_pre) (3)) )) (PreH5 : (apr_float_lane 4 vl_pre r4_3 (ap_load_lane (F) (p0_pre) (4)) )) (PreH6 : (apr_float_lane 5 vl_pre r5_3 (ap_load_lane (F) (p0_pre) (5)) )) (PreH7 : (apr_float_lane 6 vl_pre r6_3 (ap_load_lane (F) (p0_pre) (6)) )) (PreH8 : (apr_float_lane 7 vl_pre r7_3 (ap_load_lane (F) (p0_pre) (7)) )) (PreH9 : (apr_float_lane 8 vl_pre r8_3 (ap_load_lane (F) (p0_pre) (8)) )) (PreH10 : (apr_float_lane 9 vl_pre r9_3 (ap_load_lane (F) (p0_pre) (9)) )) (PreH11 : (apr_float_lane 10 vl_pre r10_3 (ap_load_lane (F) (p0_pre) (10)) )) (PreH12 : (apr_float_lane 11 vl_pre r11_3 (ap_load_lane (F) (p0_pre) (11)) )) (PreH13 : (apr_float_lane 12 vl_pre r12_3 (ap_load_lane (F) (p0_pre) (12)) )) (PreH14 : (apr_float_lane 13 vl_pre r13_3 (ap_load_lane (F) (p0_pre) (13)) )) (PreH15 : (apr_float_lane 14 vl_pre r14_3 (ap_load_lane (F) (p0_pre) (14)) )) (PreH16 : (apr_float_lane 15 vl_pre r15_3 (ap_load_lane (F) (p0_pre) (15)) )) (PreH17 : (apr_float_lane 16 vl_pre r16_3 (ap_load_lane (F) (p0_pre) (16)) )) (PreH18 : (apr_float_lane 17 vl_pre r17_3 (ap_load_lane (F) (p0_pre) (17)) )) (PreH19 : (apr_float_lane 18 vl_pre r18_3 (ap_load_lane (F) (p0_pre) (18)) )) (PreH20 : (apr_float_lane 19 vl_pre r19_3 (ap_load_lane (F) (p0_pre) (19)) )) (PreH21 : (apr_float_lane 20 vl_pre r20_3 (ap_load_lane (F) (p0_pre) (20)) )) (PreH22 : (apr_float_lane 21 vl_pre r21_3 (ap_load_lane (F) (p0_pre) (21)) )) (PreH23 : (apr_float_lane 22 vl_pre r22_3 (ap_load_lane (F) (p0_pre) (22)) )) (PreH24 : (apr_float_lane 23 vl_pre r23_3 (ap_load_lane (F) (p0_pre) (23)) )) (PreH25 : (apr_float_lane 24 vl_pre r24_3 (ap_load_lane (F) (p0_pre) (24)) )) (PreH26 : (apr_float_lane 25 vl_pre r25_3 (ap_load_lane (F) (p0_pre) (25)) )) (PreH27 : (apr_float_lane 26 vl_pre r26_3 (ap_load_lane (F) (p0_pre) (26)) )) (PreH28 : (apr_float_lane 27 vl_pre r27_3 (ap_load_lane (F) (p0_pre) (27)) )) (PreH29 : (apr_float_lane 28 vl_pre r28_3 (ap_load_lane (F) (p0_pre) (28)) )) (PreH30 : (apr_float_lane 29 vl_pre r29_3 (ap_load_lane (F) (p0_pre) (29)) )) (PreH31 : (apr_float_lane 30 vl_pre r30_3 (ap_load_lane (F) (p0_pre) (30)) )) (PreH32 : (apr_float_lane 31 vl_pre r31_3 (ap_load_lane (F) (p0_pre) (31)) )) (PreH33 : (ap_index_active_loaded 0 vl_pre I ib_pre r0_2 )) (PreH34 : (ap_index_active_loaded 1 vl_pre I ib_pre r1_2 )) (PreH35 : (ap_index_active_loaded 2 vl_pre I ib_pre r2_2 )) (PreH36 : (ap_index_active_loaded 3 vl_pre I ib_pre r3_2 )) (PreH37 : (ap_index_active_loaded 4 vl_pre I ib_pre r4_2 )) (PreH38 : (ap_index_active_loaded 5 vl_pre I ib_pre r5_2 )) (PreH39 : (ap_index_active_loaded 6 vl_pre I ib_pre r6_2 )) (PreH40 : (ap_index_active_loaded 7 vl_pre I ib_pre r7_2 )) (PreH41 : (ap_index_active_loaded 8 vl_pre I ib_pre r8_2 )) (PreH42 : (ap_index_active_loaded 9 vl_pre I ib_pre r9_2 )) (PreH43 : (ap_index_active_loaded 10 vl_pre I ib_pre r10_2 )) (PreH44 : (ap_index_active_loaded 11 vl_pre I ib_pre r11_2 )) (PreH45 : (ap_index_active_loaded 12 vl_pre I ib_pre r12_2 )) (PreH46 : (ap_index_active_loaded 13 vl_pre I ib_pre r13_2 )) (PreH47 : (ap_index_active_loaded 14 vl_pre I ib_pre r14_2 )) (PreH48 : (ap_index_active_loaded 15 vl_pre I ib_pre r15_2 )) (PreH49 : (ap_index_active_loaded 16 vl_pre I ib_pre r16_2 )) (PreH50 : (ap_index_active_loaded 17 vl_pre I ib_pre r17_2 )) (PreH51 : (ap_index_active_loaded 18 vl_pre I ib_pre r18_2 )) (PreH52 : (ap_index_active_loaded 19 vl_pre I ib_pre r19_2 )) (PreH53 : (ap_index_active_loaded 20 vl_pre I ib_pre r20_2 )) (PreH54 : (ap_index_active_loaded 21 vl_pre I ib_pre r21_2 )) (PreH55 : (ap_index_active_loaded 22 vl_pre I ib_pre r22_2 )) (PreH56 : (ap_index_active_loaded 23 vl_pre I ib_pre r23_2 )) (PreH57 : (ap_index_active_loaded 24 vl_pre I ib_pre r24_2 )) (PreH58 : (ap_index_active_loaded 25 vl_pre I ib_pre r25_2 )) (PreH59 : (ap_index_active_loaded 26 vl_pre I ib_pre r26_2 )) (PreH60 : (ap_index_active_loaded 27 vl_pre I ib_pre r27_2 )) (PreH61 : (ap_index_active_loaded 28 vl_pre I ib_pre r28_2 )) (PreH62 : (ap_index_active_loaded 29 vl_pre I ib_pre r29_2 )) (PreH63 : (ap_index_active_loaded 30 vl_pre I ib_pre r30_2 )) (PreH64 : (ap_index_active_loaded 31 vl_pre I ib_pre r31_2 )) (PreH65 : (ap_output_active_loaded 0 vl_pre O ab_pre r0 )) (PreH66 : (ap_output_active_loaded 1 vl_pre O ab_pre r1 )) (PreH67 : (ap_output_active_loaded 2 vl_pre O ab_pre r2 )) (PreH68 : (ap_output_active_loaded 3 vl_pre O ab_pre r3 )) (PreH69 : (ap_output_active_loaded 4 vl_pre O ab_pre r4 )) (PreH70 : (ap_output_active_loaded 5 vl_pre O ab_pre r5 )) (PreH71 : (ap_output_active_loaded 6 vl_pre O ab_pre r6 )) (PreH72 : (ap_output_active_loaded 7 vl_pre O ab_pre r7 )) (PreH73 : (ap_output_active_loaded 8 vl_pre O ab_pre r8 )) (PreH74 : (ap_output_active_loaded 9 vl_pre O ab_pre r9 )) (PreH75 : (ap_output_active_loaded 10 vl_pre O ab_pre r10 )) (PreH76 : (ap_output_active_loaded 11 vl_pre O ab_pre r11 )) (PreH77 : (ap_output_active_loaded 12 vl_pre O ab_pre r12 )) (PreH78 : (ap_output_active_loaded 13 vl_pre O ab_pre r13 )) (PreH79 : (ap_output_active_loaded 14 vl_pre O ab_pre r14 )) (PreH80 : (ap_output_active_loaded 15 vl_pre O ab_pre r15 )) (PreH81 : (ap_output_active_loaded 16 vl_pre O ab_pre r16 )) (PreH82 : (ap_output_active_loaded 17 vl_pre O ab_pre r17 )) (PreH83 : (ap_output_active_loaded 18 vl_pre O ab_pre r18 )) (PreH84 : (ap_output_active_loaded 19 vl_pre O ab_pre r19 )) (PreH85 : (ap_output_active_loaded 20 vl_pre O ab_pre r20 )) (PreH86 : (ap_output_active_loaded 21 vl_pre O ab_pre r21 )) (PreH87 : (ap_output_active_loaded 22 vl_pre O ab_pre r22 )) (PreH88 : (ap_output_active_loaded 23 vl_pre O ab_pre r23 )) (PreH89 : (ap_output_active_loaded 24 vl_pre O ab_pre r24 )) (PreH90 : (ap_output_active_loaded 25 vl_pre O ab_pre r25 )) (PreH91 : (ap_output_active_loaded 26 vl_pre O ab_pre r26 )) (PreH92 : (ap_output_active_loaded 27 vl_pre O ab_pre r27 )) (PreH93 : (ap_output_active_loaded 28 vl_pre O ab_pre r28 )) (PreH94 : (ap_output_active_loaded 29 vl_pre O ab_pre r29 )) (PreH95 : (ap_output_active_loaded 30 vl_pre O ab_pre r30 )) (PreH96 : (ap_output_active_loaded 31 vl_pre O ab_pre r31 )) (PreH97 : (0 < vl_pre)) (PreH98 : (vl_pre <= 32)) (PreH99 : (ap_window F p0_pre vl_pre )) (PreH100 : (ap_window F p1_pre vl_pre )) (PreH101 : (ap_window F p2_pre vl_pre )) (PreH102 : (ap_window F p3_pre vl_pre )) (PreH103 : (ap_window F p4_pre vl_pre )) (PreH104 : (ap_window F p5_pre vl_pre )) (PreH105 : (ap_window F p6_pre vl_pre )) (PreH106 : (ap_window F p7_pre vl_pre )) (PreH107 : (ap_window F p8_pre vl_pre )) (PreH108 : (ap_write_window W output_pre vl_pre )) (PreH109 : (ap_write_window WI index_pre vl_pre )) (PreH110 : (ap_block32_previous ab_pre ib_pre )) (PreH111 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH112 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH113 : (ap_optional_write_window W ab_pre vl_pre )) (PreH114 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH115 : (ab_pre <> 0)) ,
  ((&(( &( "b" ) )->ₛ "s31")) # Float  |-> r31_3)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |-> r30_3)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |-> r29_3)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |-> r28_3)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |-> r27_3)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |-> r26_3)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |-> r25_3)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |-> r24_3)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |-> r23_3)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |-> r22_3)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |-> r21_3)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |-> r20_3)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |-> r19_3)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |-> r18_3)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |-> r17_3)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |-> r16_3)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> r15_3)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> r14_3)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> r13_3)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> r12_3)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> r11_3)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> r10_3)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> r9_3)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> r8_3)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> r7_3)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> r6_3)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> r5_3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> r4_3)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> r3_3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> r2_3)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> r1_3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> r0_3)
  **  (ap_data F )
  **  ((&(( &( "i" ) )->ₛ "s31")) # UInt  |-> r31_2)
  **  ((&(( &( "i" ) )->ₛ "s30")) # UInt  |-> r30_2)
  **  ((&(( &( "i" ) )->ₛ "s29")) # UInt  |-> r29_2)
  **  ((&(( &( "i" ) )->ₛ "s28")) # UInt  |-> r28_2)
  **  ((&(( &( "i" ) )->ₛ "s27")) # UInt  |-> r27_2)
  **  ((&(( &( "i" ) )->ₛ "s26")) # UInt  |-> r26_2)
  **  ((&(( &( "i" ) )->ₛ "s25")) # UInt  |-> r25_2)
  **  ((&(( &( "i" ) )->ₛ "s24")) # UInt  |-> r24_2)
  **  ((&(( &( "i" ) )->ₛ "s23")) # UInt  |-> r23_2)
  **  ((&(( &( "i" ) )->ₛ "s22")) # UInt  |-> r22_2)
  **  ((&(( &( "i" ) )->ₛ "s21")) # UInt  |-> r21_2)
  **  ((&(( &( "i" ) )->ₛ "s20")) # UInt  |-> r20_2)
  **  ((&(( &( "i" ) )->ₛ "s19")) # UInt  |-> r19_2)
  **  ((&(( &( "i" ) )->ₛ "s18")) # UInt  |-> r18_2)
  **  ((&(( &( "i" ) )->ₛ "s17")) # UInt  |-> r17_2)
  **  ((&(( &( "i" ) )->ₛ "s16")) # UInt  |-> r16_2)
  **  ((&(( &( "i" ) )->ₛ "s15")) # UInt  |-> r15_2)
  **  ((&(( &( "i" ) )->ₛ "s14")) # UInt  |-> r14_2)
  **  ((&(( &( "i" ) )->ₛ "s13")) # UInt  |-> r13_2)
  **  ((&(( &( "i" ) )->ₛ "s12")) # UInt  |-> r12_2)
  **  ((&(( &( "i" ) )->ₛ "s11")) # UInt  |-> r11_2)
  **  ((&(( &( "i" ) )->ₛ "s10")) # UInt  |-> r10_2)
  **  ((&(( &( "i" ) )->ₛ "s9")) # UInt  |-> r9_2)
  **  ((&(( &( "i" ) )->ₛ "s8")) # UInt  |-> r8_2)
  **  ((&(( &( "i" ) )->ₛ "s7")) # UInt  |-> r7_2)
  **  ((&(( &( "i" ) )->ₛ "s6")) # UInt  |-> r6_2)
  **  ((&(( &( "i" ) )->ₛ "s5")) # UInt  |-> r5_2)
  **  ((&(( &( "i" ) )->ₛ "s4")) # UInt  |-> r4_2)
  **  ((&(( &( "i" ) )->ₛ "s3")) # UInt  |-> r3_2)
  **  ((&(( &( "i" ) )->ₛ "s2")) # UInt  |-> r2_2)
  **  ((&(( &( "i" ) )->ₛ "s1")) # UInt  |-> r1_2)
  **  ((&(( &( "i" ) )->ₛ "s0")) # UInt  |-> r0_2)
  **  (ap_index WI I )
  **  ((&(( &( "a" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_output W O )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (apr_float_lane 0 vl_pre r0_3 (ap_load_lane (F) (p0_pre) (0)) ) ” 
  &&  “ (apr_float_lane 1 vl_pre r1_3 (ap_load_lane (F) (p0_pre) (1)) ) ” 
  &&  “ (apr_float_lane 2 vl_pre r2_3 (ap_load_lane (F) (p0_pre) (2)) ) ” 
  &&  “ (apr_float_lane 3 vl_pre r3_3 (ap_load_lane (F) (p0_pre) (3)) ) ” 
  &&  “ (apr_float_lane 4 vl_pre r4_3 (ap_load_lane (F) (p0_pre) (4)) ) ” 
  &&  “ (apr_float_lane 5 vl_pre r5_3 (ap_load_lane (F) (p0_pre) (5)) ) ” 
  &&  “ (apr_float_lane 6 vl_pre r6_3 (ap_load_lane (F) (p0_pre) (6)) ) ” 
  &&  “ (apr_float_lane 7 vl_pre r7_3 (ap_load_lane (F) (p0_pre) (7)) ) ” 
  &&  “ (apr_float_lane 8 vl_pre r8_3 (ap_load_lane (F) (p0_pre) (8)) ) ” 
  &&  “ (apr_float_lane 9 vl_pre r9_3 (ap_load_lane (F) (p0_pre) (9)) ) ” 
  &&  “ (apr_float_lane 10 vl_pre r10_3 (ap_load_lane (F) (p0_pre) (10)) ) ” 
  &&  “ (apr_float_lane 11 vl_pre r11_3 (ap_load_lane (F) (p0_pre) (11)) ) ” 
  &&  “ (apr_float_lane 12 vl_pre r12_3 (ap_load_lane (F) (p0_pre) (12)) ) ” 
  &&  “ (apr_float_lane 13 vl_pre r13_3 (ap_load_lane (F) (p0_pre) (13)) ) ” 
  &&  “ (apr_float_lane 14 vl_pre r14_3 (ap_load_lane (F) (p0_pre) (14)) ) ” 
  &&  “ (apr_float_lane 15 vl_pre r15_3 (ap_load_lane (F) (p0_pre) (15)) ) ” 
  &&  “ (apr_float_lane 16 vl_pre r16_3 (ap_load_lane (F) (p0_pre) (16)) ) ” 
  &&  “ (apr_float_lane 17 vl_pre r17_3 (ap_load_lane (F) (p0_pre) (17)) ) ” 
  &&  “ (apr_float_lane 18 vl_pre r18_3 (ap_load_lane (F) (p0_pre) (18)) ) ” 
  &&  “ (apr_float_lane 19 vl_pre r19_3 (ap_load_lane (F) (p0_pre) (19)) ) ” 
  &&  “ (apr_float_lane 20 vl_pre r20_3 (ap_load_lane (F) (p0_pre) (20)) ) ” 
  &&  “ (apr_float_lane 21 vl_pre r21_3 (ap_load_lane (F) (p0_pre) (21)) ) ” 
  &&  “ (apr_float_lane 22 vl_pre r22_3 (ap_load_lane (F) (p0_pre) (22)) ) ” 
  &&  “ (apr_float_lane 23 vl_pre r23_3 (ap_load_lane (F) (p0_pre) (23)) ) ” 
  &&  “ (apr_float_lane 24 vl_pre r24_3 (ap_load_lane (F) (p0_pre) (24)) ) ” 
  &&  “ (apr_float_lane 25 vl_pre r25_3 (ap_load_lane (F) (p0_pre) (25)) ) ” 
  &&  “ (apr_float_lane 26 vl_pre r26_3 (ap_load_lane (F) (p0_pre) (26)) ) ” 
  &&  “ (apr_float_lane 27 vl_pre r27_3 (ap_load_lane (F) (p0_pre) (27)) ) ” 
  &&  “ (apr_float_lane 28 vl_pre r28_3 (ap_load_lane (F) (p0_pre) (28)) ) ” 
  &&  “ (apr_float_lane 29 vl_pre r29_3 (ap_load_lane (F) (p0_pre) (29)) ) ” 
  &&  “ (apr_float_lane 30 vl_pre r30_3 (ap_load_lane (F) (p0_pre) (30)) ) ” 
  &&  “ (apr_float_lane 31 vl_pre r31_3 (ap_load_lane (F) (p0_pre) (31)) ) ” 
  &&  “ (ap_index_active_loaded 0 vl_pre I ib_pre r0_2 ) ” 
  &&  “ (ap_index_active_loaded 1 vl_pre I ib_pre r1_2 ) ” 
  &&  “ (ap_index_active_loaded 2 vl_pre I ib_pre r2_2 ) ” 
  &&  “ (ap_index_active_loaded 3 vl_pre I ib_pre r3_2 ) ” 
  &&  “ (ap_index_active_loaded 4 vl_pre I ib_pre r4_2 ) ” 
  &&  “ (ap_index_active_loaded 5 vl_pre I ib_pre r5_2 ) ” 
  &&  “ (ap_index_active_loaded 6 vl_pre I ib_pre r6_2 ) ” 
  &&  “ (ap_index_active_loaded 7 vl_pre I ib_pre r7_2 ) ” 
  &&  “ (ap_index_active_loaded 8 vl_pre I ib_pre r8_2 ) ” 
  &&  “ (ap_index_active_loaded 9 vl_pre I ib_pre r9_2 ) ” 
  &&  “ (ap_index_active_loaded 10 vl_pre I ib_pre r10_2 ) ” 
  &&  “ (ap_index_active_loaded 11 vl_pre I ib_pre r11_2 ) ” 
  &&  “ (ap_index_active_loaded 12 vl_pre I ib_pre r12_2 ) ” 
  &&  “ (ap_index_active_loaded 13 vl_pre I ib_pre r13_2 ) ” 
  &&  “ (ap_index_active_loaded 14 vl_pre I ib_pre r14_2 ) ” 
  &&  “ (ap_index_active_loaded 15 vl_pre I ib_pre r15_2 ) ” 
  &&  “ (ap_index_active_loaded 16 vl_pre I ib_pre r16_2 ) ” 
  &&  “ (ap_index_active_loaded 17 vl_pre I ib_pre r17_2 ) ” 
  &&  “ (ap_index_active_loaded 18 vl_pre I ib_pre r18_2 ) ” 
  &&  “ (ap_index_active_loaded 19 vl_pre I ib_pre r19_2 ) ” 
  &&  “ (ap_index_active_loaded 20 vl_pre I ib_pre r20_2 ) ” 
  &&  “ (ap_index_active_loaded 21 vl_pre I ib_pre r21_2 ) ” 
  &&  “ (ap_index_active_loaded 22 vl_pre I ib_pre r22_2 ) ” 
  &&  “ (ap_index_active_loaded 23 vl_pre I ib_pre r23_2 ) ” 
  &&  “ (ap_index_active_loaded 24 vl_pre I ib_pre r24_2 ) ” 
  &&  “ (ap_index_active_loaded 25 vl_pre I ib_pre r25_2 ) ” 
  &&  “ (ap_index_active_loaded 26 vl_pre I ib_pre r26_2 ) ” 
  &&  “ (ap_index_active_loaded 27 vl_pre I ib_pre r27_2 ) ” 
  &&  “ (ap_index_active_loaded 28 vl_pre I ib_pre r28_2 ) ” 
  &&  “ (ap_index_active_loaded 29 vl_pre I ib_pre r29_2 ) ” 
  &&  “ (ap_index_active_loaded 30 vl_pre I ib_pre r30_2 ) ” 
  &&  “ (ap_index_active_loaded 31 vl_pre I ib_pre r31_2 ) ” 
  &&  “ (ap_output_active_loaded 0 vl_pre O ab_pre r0 ) ” 
  &&  “ (ap_output_active_loaded 1 vl_pre O ab_pre r1 ) ” 
  &&  “ (ap_output_active_loaded 2 vl_pre O ab_pre r2 ) ” 
  &&  “ (ap_output_active_loaded 3 vl_pre O ab_pre r3 ) ” 
  &&  “ (ap_output_active_loaded 4 vl_pre O ab_pre r4 ) ” 
  &&  “ (ap_output_active_loaded 5 vl_pre O ab_pre r5 ) ” 
  &&  “ (ap_output_active_loaded 6 vl_pre O ab_pre r6 ) ” 
  &&  “ (ap_output_active_loaded 7 vl_pre O ab_pre r7 ) ” 
  &&  “ (ap_output_active_loaded 8 vl_pre O ab_pre r8 ) ” 
  &&  “ (ap_output_active_loaded 9 vl_pre O ab_pre r9 ) ” 
  &&  “ (ap_output_active_loaded 10 vl_pre O ab_pre r10 ) ” 
  &&  “ (ap_output_active_loaded 11 vl_pre O ab_pre r11 ) ” 
  &&  “ (ap_output_active_loaded 12 vl_pre O ab_pre r12 ) ” 
  &&  “ (ap_output_active_loaded 13 vl_pre O ab_pre r13 ) ” 
  &&  “ (ap_output_active_loaded 14 vl_pre O ab_pre r14 ) ” 
  &&  “ (ap_output_active_loaded 15 vl_pre O ab_pre r15 ) ” 
  &&  “ (ap_output_active_loaded 16 vl_pre O ab_pre r16 ) ” 
  &&  “ (ap_output_active_loaded 17 vl_pre O ab_pre r17 ) ” 
  &&  “ (ap_output_active_loaded 18 vl_pre O ab_pre r18 ) ” 
  &&  “ (ap_output_active_loaded 19 vl_pre O ab_pre r19 ) ” 
  &&  “ (ap_output_active_loaded 20 vl_pre O ab_pre r20 ) ” 
  &&  “ (ap_output_active_loaded 21 vl_pre O ab_pre r21 ) ” 
  &&  “ (ap_output_active_loaded 22 vl_pre O ab_pre r22 ) ” 
  &&  “ (ap_output_active_loaded 23 vl_pre O ab_pre r23 ) ” 
  &&  “ (ap_output_active_loaded 24 vl_pre O ab_pre r24 ) ” 
  &&  “ (ap_output_active_loaded 25 vl_pre O ab_pre r25 ) ” 
  &&  “ (ap_output_active_loaded 26 vl_pre O ab_pre r26 ) ” 
  &&  “ (ap_output_active_loaded 27 vl_pre O ab_pre r27 ) ” 
  &&  “ (ap_output_active_loaded 28 vl_pre O ab_pre r28 ) ” 
  &&  “ (ap_output_active_loaded 29 vl_pre O ab_pre r29 ) ” 
  &&  “ (ap_output_active_loaded 30 vl_pre O ab_pre r30 ) ” 
  &&  “ (ap_output_active_loaded 31 vl_pre O ab_pre r31 ) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ab_pre <> 0) ”
  &&  (StructPredvfloat32m8_t ( &( "a" ) ) (make_record_vfloat32m8_t (r0) (r1) (r2) (r3) (r4) (r5) (r6) (r7) (r8) (r9) (r10) (r11) (r12) (r13) (r14) (r15) (r16) (r17) (r18) (r19) (r20) (r21) (r22) (r23) (r24) (r25) (r26) (r27) (r28) (r29) (r30) (r31)) )
  **  (StructPredvuint32m8_t ( &( "i" ) ) (make_record_vuint32m8_t (r0_2) (r1_2) (r2_2) (r3_2) (r4_2) (r5_2) (r6_2) (r7_2) (r8_2) (r9_2) (r10_2) (r11_2) (r12_2) (r13_2) (r14_2) (r15_2) (r16_2) (r17_2) (r18_2) (r19_2) (r20_2) (r21_2) (r22_2) (r23_2) (r24_2) (r25_2) (r26_2) (r27_2) (r28_2) (r29_2) (r30_2) (r31_2)) )
  **  (StructPredvfloat32m8_t ( &( "b" ) ) (make_record_vfloat32m8_t (r0_3) (r1_3) (r2_3) (r3_3) (r4_3) (r5_3) (r6_3) (r7_3) (r8_3) (r9_3) (r10_3) (r11_3) (r12_3) (r13_3) (r14_3) (r15_3) (r16_3) (r17_3) (r18_3) (r19_3) (r20_3) (r21_3) (r22_3) (r23_3) (r24_3) (r25_3) (r26_3) (r27_3) (r28_3) (r29_3) (r30_3) (r31_3)) )
  **  (ap_data F )
  **  (ap_index WI I )
  **  (ap_output W O )
.

Definition ap_rvv_block32_partial_solve_wit_7 := ap_rvv_block32_partial_solve_wit_7_pure -> ap_rvv_block32_partial_solve_wit_7_aux.

Definition ap_rvv_block32_partial_solve_wit_8_pure := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (PreH1 : (0 < vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (ap_window F p0_pre vl_pre )) (PreH4 : (ap_window F p1_pre vl_pre )) (PreH5 : (ap_window F p2_pre vl_pre )) (PreH6 : (ap_window F p3_pre vl_pre )) (PreH7 : (ap_window F p4_pre vl_pre )) (PreH8 : (ap_window F p5_pre vl_pre )) (PreH9 : (ap_window F p6_pre vl_pre )) (PreH10 : (ap_window F p7_pre vl_pre )) (PreH11 : (ap_window F p8_pre vl_pre )) (PreH12 : (ap_write_window W output_pre vl_pre )) (PreH13 : (ap_write_window WI index_pre vl_pre )) (PreH14 : (ap_block32_previous ab_pre ib_pre )) (PreH15 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH16 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH17 : (ap_optional_write_window W ab_pre vl_pre )) (PreH18 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH19 : (ab_pre = 0)) ,
  (UndefStructPredvuint32m8_t ( &( "i" ) ) )
  **  (UndefStructPredvfloat32m8_t ( &( "a" ) ) )
  **  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "p3" ) )) # Ptr  |-> p3_pre)
  **  ((( &( "p4" ) )) # Ptr  |-> p4_pre)
  **  ((( &( "p5" ) )) # Ptr  |-> p5_pre)
  **  ((( &( "p6" ) )) # Ptr  |-> p6_pre)
  **  ((( &( "p7" ) )) # Ptr  |-> p7_pre)
  **  ((( &( "p8" ) )) # Ptr  |-> p8_pre)
  **  ((( &( "ab" ) )) # Ptr  |-> ab_pre)
  **  ((( &( "ib" ) )) # Ptr  |-> ib_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "index" ) )) # Ptr  |-> index_pre)
  **  ((( &( "idx" ) )) # UInt  |-> idx_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ”
.

Definition ap_rvv_block32_partial_solve_wit_8_aux := 
forall (vl_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (PreH1 : (0 < vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (ap_window F p0_pre vl_pre )) (PreH4 : (ap_window F p1_pre vl_pre )) (PreH5 : (ap_window F p2_pre vl_pre )) (PreH6 : (ap_window F p3_pre vl_pre )) (PreH7 : (ap_window F p4_pre vl_pre )) (PreH8 : (ap_window F p5_pre vl_pre )) (PreH9 : (ap_window F p6_pre vl_pre )) (PreH10 : (ap_window F p7_pre vl_pre )) (PreH11 : (ap_window F p8_pre vl_pre )) (PreH12 : (ap_write_window W output_pre vl_pre )) (PreH13 : (ap_write_window WI index_pre vl_pre )) (PreH14 : (ap_block32_previous ab_pre ib_pre )) (PreH15 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH16 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH17 : (ap_optional_write_window W ab_pre vl_pre )) (PreH18 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH19 : (ab_pre = 0)) ,
  (UndefStructPredvuint32m8_t ( &( "i" ) ) )
  **  (UndefStructPredvfloat32m8_t ( &( "a" ) ) )
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ab_pre = 0) ”
  &&  (ap_data F )
  **  (UndefStructPredvuint32m8_t ( &( "i" ) ) )
  **  (UndefStructPredvfloat32m8_t ( &( "a" ) ) )
  **  (ap_output W O )
  **  (ap_index WI I )
.

Definition ap_rvv_block32_partial_solve_wit_8 := ap_rvv_block32_partial_solve_wit_8_pure -> ap_rvv_block32_partial_solve_wit_8_aux.

Definition ap_rvv_block32_partial_solve_wit_9 := 
forall (vl_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (retval: Z) (PreH1 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p0_pre) (0)) )) (PreH2 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p0_pre) (1)) )) (PreH3 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p0_pre) (2)) )) (PreH4 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p0_pre) (3)) )) (PreH5 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p0_pre) (4)) )) (PreH6 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p0_pre) (5)) )) (PreH7 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p0_pre) (6)) )) (PreH8 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p0_pre) (7)) )) (PreH9 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p0_pre) (8)) )) (PreH10 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p0_pre) (9)) )) (PreH11 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p0_pre) (10)) )) (PreH12 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p0_pre) (11)) )) (PreH13 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p0_pre) (12)) )) (PreH14 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p0_pre) (13)) )) (PreH15 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p0_pre) (14)) )) (PreH16 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p0_pre) (15)) )) (PreH17 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p0_pre) (16)) )) (PreH18 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p0_pre) (17)) )) (PreH19 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p0_pre) (18)) )) (PreH20 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p0_pre) (19)) )) (PreH21 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p0_pre) (20)) )) (PreH22 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p0_pre) (21)) )) (PreH23 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p0_pre) (22)) )) (PreH24 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p0_pre) (23)) )) (PreH25 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p0_pre) (24)) )) (PreH26 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p0_pre) (25)) )) (PreH27 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p0_pre) (26)) )) (PreH28 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p0_pre) (27)) )) (PreH29 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p0_pre) (28)) )) (PreH30 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p0_pre) (29)) )) (PreH31 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p0_pre) (30)) )) (PreH32 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p0_pre) (31)) )) (PreH33 : (0 < vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (ap_window F p0_pre vl_pre )) (PreH36 : (ap_window F p1_pre vl_pre )) (PreH37 : (ap_window F p2_pre vl_pre )) (PreH38 : (ap_window F p3_pre vl_pre )) (PreH39 : (ap_window F p4_pre vl_pre )) (PreH40 : (ap_window F p5_pre vl_pre )) (PreH41 : (ap_window F p6_pre vl_pre )) (PreH42 : (ap_window F p7_pre vl_pre )) (PreH43 : (ap_window F p8_pre vl_pre )) (PreH44 : (ap_write_window W output_pre vl_pre )) (PreH45 : (ap_write_window WI index_pre vl_pre )) (PreH46 : (ap_block32_previous ab_pre ib_pre )) (PreH47 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH48 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH49 : (ap_optional_write_window W ab_pre vl_pre )) (PreH50 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH51 : (ab_pre = 0)) ,
  (UndefStructPredvfloat32m8_t ( &( "a" ) ) )
  **  (ap_data F )
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> r0)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> r1)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> r2)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> r3)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> r4)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> r5)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> r6)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> r7)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> r8)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> r9)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> r10)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> r11)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> r12)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> r13)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> r14)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> r15)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> r16)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> r17)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> r18)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> r19)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> r20)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> r21)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> r22)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> r23)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> r24)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> r25)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> r26)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> r27)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> r28)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> r29)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> r30)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> r31)
  **  (UndefStructPredvuint32m8_t ( &( "i" ) ) )
  **  (ap_output W O )
  **  (ap_index WI I )
|--
  “ (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p0_pre) (0)) ) ” 
  &&  “ (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p0_pre) (1)) ) ” 
  &&  “ (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p0_pre) (2)) ) ” 
  &&  “ (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p0_pre) (3)) ) ” 
  &&  “ (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p0_pre) (4)) ) ” 
  &&  “ (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p0_pre) (5)) ) ” 
  &&  “ (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p0_pre) (6)) ) ” 
  &&  “ (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p0_pre) (7)) ) ” 
  &&  “ (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p0_pre) (8)) ) ” 
  &&  “ (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p0_pre) (9)) ) ” 
  &&  “ (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p0_pre) (10)) ) ” 
  &&  “ (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p0_pre) (11)) ) ” 
  &&  “ (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p0_pre) (12)) ) ” 
  &&  “ (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p0_pre) (13)) ) ” 
  &&  “ (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p0_pre) (14)) ) ” 
  &&  “ (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p0_pre) (15)) ) ” 
  &&  “ (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p0_pre) (16)) ) ” 
  &&  “ (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p0_pre) (17)) ) ” 
  &&  “ (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p0_pre) (18)) ) ” 
  &&  “ (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p0_pre) (19)) ) ” 
  &&  “ (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p0_pre) (20)) ) ” 
  &&  “ (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p0_pre) (21)) ) ” 
  &&  “ (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p0_pre) (22)) ) ” 
  &&  “ (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p0_pre) (23)) ) ” 
  &&  “ (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p0_pre) (24)) ) ” 
  &&  “ (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p0_pre) (25)) ) ” 
  &&  “ (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p0_pre) (26)) ) ” 
  &&  “ (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p0_pre) (27)) ) ” 
  &&  “ (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p0_pre) (28)) ) ” 
  &&  “ (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p0_pre) (29)) ) ” 
  &&  “ (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p0_pre) (30)) ) ” 
  &&  “ (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p0_pre) (31)) ) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ab_pre = 0) ”
  &&  ((&(( &( "a" ) )->ₛ "s31")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> r0)
  **  (ap_data F )
  **  (UndefStructPredvuint32m8_t ( &( "i" ) ) )
  **  (ap_output W O )
  **  (ap_index WI I )
.

Definition ap_rvv_block32_partial_solve_wit_10_pure := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (PreH1 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p0_pre) (0)) )) (PreH2 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p0_pre) (1)) )) (PreH3 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p0_pre) (2)) )) (PreH4 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p0_pre) (3)) )) (PreH5 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p0_pre) (4)) )) (PreH6 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p0_pre) (5)) )) (PreH7 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p0_pre) (6)) )) (PreH8 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p0_pre) (7)) )) (PreH9 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p0_pre) (8)) )) (PreH10 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p0_pre) (9)) )) (PreH11 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p0_pre) (10)) )) (PreH12 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p0_pre) (11)) )) (PreH13 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p0_pre) (12)) )) (PreH14 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p0_pre) (13)) )) (PreH15 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p0_pre) (14)) )) (PreH16 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p0_pre) (15)) )) (PreH17 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p0_pre) (16)) )) (PreH18 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p0_pre) (17)) )) (PreH19 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p0_pre) (18)) )) (PreH20 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p0_pre) (19)) )) (PreH21 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p0_pre) (20)) )) (PreH22 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p0_pre) (21)) )) (PreH23 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p0_pre) (22)) )) (PreH24 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p0_pre) (23)) )) (PreH25 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p0_pre) (24)) )) (PreH26 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p0_pre) (25)) )) (PreH27 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p0_pre) (26)) )) (PreH28 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p0_pre) (27)) )) (PreH29 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p0_pre) (28)) )) (PreH30 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p0_pre) (29)) )) (PreH31 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p0_pre) (30)) )) (PreH32 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p0_pre) (31)) )) (PreH33 : (0 < vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (ap_window F p0_pre vl_pre )) (PreH36 : (ap_window F p1_pre vl_pre )) (PreH37 : (ap_window F p2_pre vl_pre )) (PreH38 : (ap_window F p3_pre vl_pre )) (PreH39 : (ap_window F p4_pre vl_pre )) (PreH40 : (ap_window F p5_pre vl_pre )) (PreH41 : (ap_window F p6_pre vl_pre )) (PreH42 : (ap_window F p7_pre vl_pre )) (PreH43 : (ap_window F p8_pre vl_pre )) (PreH44 : (ap_write_window W output_pre vl_pre )) (PreH45 : (ap_write_window WI index_pre vl_pre )) (PreH46 : (ap_block32_previous ab_pre ib_pre )) (PreH47 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH48 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH49 : (ap_optional_write_window W ab_pre vl_pre )) (PreH50 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH51 : (ab_pre = 0)) ,
  ((&(( &( "a" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_data F )
  **  (UndefStructPredvuint32m8_t ( &( "i" ) ) )
  **  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "p3" ) )) # Ptr  |-> p3_pre)
  **  ((( &( "p4" ) )) # Ptr  |-> p4_pre)
  **  ((( &( "p5" ) )) # Ptr  |-> p5_pre)
  **  ((( &( "p6" ) )) # Ptr  |-> p6_pre)
  **  ((( &( "p7" ) )) # Ptr  |-> p7_pre)
  **  ((( &( "p8" ) )) # Ptr  |-> p8_pre)
  **  ((( &( "ab" ) )) # Ptr  |-> ab_pre)
  **  ((( &( "ib" ) )) # Ptr  |-> ib_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "index" ) )) # Ptr  |-> index_pre)
  **  ((( &( "idx" ) )) # UInt  |-> idx_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (ap_output W O )
  **  (ap_index WI I )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition ap_rvv_block32_partial_solve_wit_10_aux := 
forall (vl_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (PreH1 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p0_pre) (0)) )) (PreH2 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p0_pre) (1)) )) (PreH3 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p0_pre) (2)) )) (PreH4 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p0_pre) (3)) )) (PreH5 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p0_pre) (4)) )) (PreH6 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p0_pre) (5)) )) (PreH7 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p0_pre) (6)) )) (PreH8 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p0_pre) (7)) )) (PreH9 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p0_pre) (8)) )) (PreH10 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p0_pre) (9)) )) (PreH11 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p0_pre) (10)) )) (PreH12 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p0_pre) (11)) )) (PreH13 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p0_pre) (12)) )) (PreH14 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p0_pre) (13)) )) (PreH15 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p0_pre) (14)) )) (PreH16 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p0_pre) (15)) )) (PreH17 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p0_pre) (16)) )) (PreH18 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p0_pre) (17)) )) (PreH19 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p0_pre) (18)) )) (PreH20 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p0_pre) (19)) )) (PreH21 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p0_pre) (20)) )) (PreH22 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p0_pre) (21)) )) (PreH23 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p0_pre) (22)) )) (PreH24 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p0_pre) (23)) )) (PreH25 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p0_pre) (24)) )) (PreH26 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p0_pre) (25)) )) (PreH27 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p0_pre) (26)) )) (PreH28 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p0_pre) (27)) )) (PreH29 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p0_pre) (28)) )) (PreH30 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p0_pre) (29)) )) (PreH31 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p0_pre) (30)) )) (PreH32 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p0_pre) (31)) )) (PreH33 : (0 < vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (ap_window F p0_pre vl_pre )) (PreH36 : (ap_window F p1_pre vl_pre )) (PreH37 : (ap_window F p2_pre vl_pre )) (PreH38 : (ap_window F p3_pre vl_pre )) (PreH39 : (ap_window F p4_pre vl_pre )) (PreH40 : (ap_window F p5_pre vl_pre )) (PreH41 : (ap_window F p6_pre vl_pre )) (PreH42 : (ap_window F p7_pre vl_pre )) (PreH43 : (ap_window F p8_pre vl_pre )) (PreH44 : (ap_write_window W output_pre vl_pre )) (PreH45 : (ap_write_window WI index_pre vl_pre )) (PreH46 : (ap_block32_previous ab_pre ib_pre )) (PreH47 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH48 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH49 : (ap_optional_write_window W ab_pre vl_pre )) (PreH50 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH51 : (ab_pre = 0)) ,
  ((&(( &( "a" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_data F )
  **  (UndefStructPredvuint32m8_t ( &( "i" ) ) )
  **  (ap_output W O )
  **  (ap_index WI I )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p0_pre) (0)) ) ” 
  &&  “ (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p0_pre) (1)) ) ” 
  &&  “ (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p0_pre) (2)) ) ” 
  &&  “ (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p0_pre) (3)) ) ” 
  &&  “ (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p0_pre) (4)) ) ” 
  &&  “ (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p0_pre) (5)) ) ” 
  &&  “ (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p0_pre) (6)) ) ” 
  &&  “ (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p0_pre) (7)) ) ” 
  &&  “ (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p0_pre) (8)) ) ” 
  &&  “ (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p0_pre) (9)) ) ” 
  &&  “ (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p0_pre) (10)) ) ” 
  &&  “ (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p0_pre) (11)) ) ” 
  &&  “ (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p0_pre) (12)) ) ” 
  &&  “ (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p0_pre) (13)) ) ” 
  &&  “ (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p0_pre) (14)) ) ” 
  &&  “ (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p0_pre) (15)) ) ” 
  &&  “ (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p0_pre) (16)) ) ” 
  &&  “ (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p0_pre) (17)) ) ” 
  &&  “ (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p0_pre) (18)) ) ” 
  &&  “ (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p0_pre) (19)) ) ” 
  &&  “ (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p0_pre) (20)) ) ” 
  &&  “ (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p0_pre) (21)) ) ” 
  &&  “ (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p0_pre) (22)) ) ” 
  &&  “ (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p0_pre) (23)) ) ” 
  &&  “ (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p0_pre) (24)) ) ” 
  &&  “ (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p0_pre) (25)) ) ” 
  &&  “ (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p0_pre) (26)) ) ” 
  &&  “ (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p0_pre) (27)) ) ” 
  &&  “ (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p0_pre) (28)) ) ” 
  &&  “ (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p0_pre) (29)) ) ” 
  &&  “ (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p0_pre) (30)) ) ” 
  &&  “ (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p0_pre) (31)) ) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ab_pre = 0) ”
  &&  ((&(( &( "a" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_data F )
  **  (UndefStructPredvuint32m8_t ( &( "i" ) ) )
  **  (ap_output W O )
  **  (ap_index WI I )
.

Definition ap_rvv_block32_partial_solve_wit_10 := ap_rvv_block32_partial_solve_wit_10_pure -> ap_rvv_block32_partial_solve_wit_10_aux.

Definition ap_rvv_block32_partial_solve_wit_11 := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (r31_2: Z) (r30_2: Z) (r29_2: Z) (r28_2: Z) (r27_2: Z) (r26_2: Z) (r25_2: Z) (r24_2: Z) (r23_2: Z) (r22_2: Z) (r21_2: Z) (r20_2: Z) (r19_2: Z) (r18_2: Z) (r17_2: Z) (r16_2: Z) (r15_2: Z) (r14_2: Z) (r13_2: Z) (r12_2: Z) (r11_2: Z) (r10_2: Z) (r9_2: Z) (r8_2: Z) (r7_2: Z) (r6_2: Z) (r5_2: Z) (r4_2: Z) (r3_2: Z) (r2_2: Z) (r1_2: Z) (r0_2: Z) (retval: Z) (PreH1 : (apr_int_lane 0 vl_pre r0_2 (ap_u32 (idx_pre)) )) (PreH2 : (apr_int_lane 1 vl_pre r1_2 (ap_u32 (idx_pre)) )) (PreH3 : (apr_int_lane 2 vl_pre r2_2 (ap_u32 (idx_pre)) )) (PreH4 : (apr_int_lane 3 vl_pre r3_2 (ap_u32 (idx_pre)) )) (PreH5 : (apr_int_lane 4 vl_pre r4_2 (ap_u32 (idx_pre)) )) (PreH6 : (apr_int_lane 5 vl_pre r5_2 (ap_u32 (idx_pre)) )) (PreH7 : (apr_int_lane 6 vl_pre r6_2 (ap_u32 (idx_pre)) )) (PreH8 : (apr_int_lane 7 vl_pre r7_2 (ap_u32 (idx_pre)) )) (PreH9 : (apr_int_lane 8 vl_pre r8_2 (ap_u32 (idx_pre)) )) (PreH10 : (apr_int_lane 9 vl_pre r9_2 (ap_u32 (idx_pre)) )) (PreH11 : (apr_int_lane 10 vl_pre r10_2 (ap_u32 (idx_pre)) )) (PreH12 : (apr_int_lane 11 vl_pre r11_2 (ap_u32 (idx_pre)) )) (PreH13 : (apr_int_lane 12 vl_pre r12_2 (ap_u32 (idx_pre)) )) (PreH14 : (apr_int_lane 13 vl_pre r13_2 (ap_u32 (idx_pre)) )) (PreH15 : (apr_int_lane 14 vl_pre r14_2 (ap_u32 (idx_pre)) )) (PreH16 : (apr_int_lane 15 vl_pre r15_2 (ap_u32 (idx_pre)) )) (PreH17 : (apr_int_lane 16 vl_pre r16_2 (ap_u32 (idx_pre)) )) (PreH18 : (apr_int_lane 17 vl_pre r17_2 (ap_u32 (idx_pre)) )) (PreH19 : (apr_int_lane 18 vl_pre r18_2 (ap_u32 (idx_pre)) )) (PreH20 : (apr_int_lane 19 vl_pre r19_2 (ap_u32 (idx_pre)) )) (PreH21 : (apr_int_lane 20 vl_pre r20_2 (ap_u32 (idx_pre)) )) (PreH22 : (apr_int_lane 21 vl_pre r21_2 (ap_u32 (idx_pre)) )) (PreH23 : (apr_int_lane 22 vl_pre r22_2 (ap_u32 (idx_pre)) )) (PreH24 : (apr_int_lane 23 vl_pre r23_2 (ap_u32 (idx_pre)) )) (PreH25 : (apr_int_lane 24 vl_pre r24_2 (ap_u32 (idx_pre)) )) (PreH26 : (apr_int_lane 25 vl_pre r25_2 (ap_u32 (idx_pre)) )) (PreH27 : (apr_int_lane 26 vl_pre r26_2 (ap_u32 (idx_pre)) )) (PreH28 : (apr_int_lane 27 vl_pre r27_2 (ap_u32 (idx_pre)) )) (PreH29 : (apr_int_lane 28 vl_pre r28_2 (ap_u32 (idx_pre)) )) (PreH30 : (apr_int_lane 29 vl_pre r29_2 (ap_u32 (idx_pre)) )) (PreH31 : (apr_int_lane 30 vl_pre r30_2 (ap_u32 (idx_pre)) )) (PreH32 : (apr_int_lane 31 vl_pre r31_2 (ap_u32 (idx_pre)) )) (PreH33 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p0_pre) (0)) )) (PreH34 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p0_pre) (1)) )) (PreH35 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p0_pre) (2)) )) (PreH36 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p0_pre) (3)) )) (PreH37 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p0_pre) (4)) )) (PreH38 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p0_pre) (5)) )) (PreH39 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p0_pre) (6)) )) (PreH40 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p0_pre) (7)) )) (PreH41 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p0_pre) (8)) )) (PreH42 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p0_pre) (9)) )) (PreH43 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p0_pre) (10)) )) (PreH44 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p0_pre) (11)) )) (PreH45 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p0_pre) (12)) )) (PreH46 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p0_pre) (13)) )) (PreH47 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p0_pre) (14)) )) (PreH48 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p0_pre) (15)) )) (PreH49 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p0_pre) (16)) )) (PreH50 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p0_pre) (17)) )) (PreH51 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p0_pre) (18)) )) (PreH52 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p0_pre) (19)) )) (PreH53 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p0_pre) (20)) )) (PreH54 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p0_pre) (21)) )) (PreH55 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p0_pre) (22)) )) (PreH56 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p0_pre) (23)) )) (PreH57 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p0_pre) (24)) )) (PreH58 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p0_pre) (25)) )) (PreH59 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p0_pre) (26)) )) (PreH60 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p0_pre) (27)) )) (PreH61 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p0_pre) (28)) )) (PreH62 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p0_pre) (29)) )) (PreH63 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p0_pre) (30)) )) (PreH64 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p0_pre) (31)) )) (PreH65 : (0 < vl_pre)) (PreH66 : (vl_pre <= 32)) (PreH67 : (ap_window F p0_pre vl_pre )) (PreH68 : (ap_window F p1_pre vl_pre )) (PreH69 : (ap_window F p2_pre vl_pre )) (PreH70 : (ap_window F p3_pre vl_pre )) (PreH71 : (ap_window F p4_pre vl_pre )) (PreH72 : (ap_window F p5_pre vl_pre )) (PreH73 : (ap_window F p6_pre vl_pre )) (PreH74 : (ap_window F p7_pre vl_pre )) (PreH75 : (ap_window F p8_pre vl_pre )) (PreH76 : (ap_write_window W output_pre vl_pre )) (PreH77 : (ap_write_window WI index_pre vl_pre )) (PreH78 : (ap_block32_previous ab_pre ib_pre )) (PreH79 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH80 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH81 : (ap_optional_write_window W ab_pre vl_pre )) (PreH82 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH83 : (ab_pre = 0)) ,
  (UndefStructPredvuint32m8_t ( &( "i" ) ) )
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s0")) # UInt  |-> r0_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s1")) # UInt  |-> r1_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s2")) # UInt  |-> r2_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s3")) # UInt  |-> r3_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s4")) # UInt  |-> r4_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s5")) # UInt  |-> r5_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s6")) # UInt  |-> r6_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s7")) # UInt  |-> r7_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s8")) # UInt  |-> r8_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s9")) # UInt  |-> r9_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s10")) # UInt  |-> r10_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s11")) # UInt  |-> r11_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s12")) # UInt  |-> r12_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s13")) # UInt  |-> r13_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s14")) # UInt  |-> r14_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s15")) # UInt  |-> r15_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s16")) # UInt  |-> r16_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s17")) # UInt  |-> r17_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s18")) # UInt  |-> r18_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s19")) # UInt  |-> r19_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s20")) # UInt  |-> r20_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s21")) # UInt  |-> r21_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s22")) # UInt  |-> r22_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s23")) # UInt  |-> r23_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s24")) # UInt  |-> r24_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s25")) # UInt  |-> r25_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s26")) # UInt  |-> r26_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s27")) # UInt  |-> r27_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s28")) # UInt  |-> r28_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s29")) # UInt  |-> r29_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s30")) # UInt  |-> r30_2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s31")) # UInt  |-> r31_2)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
|--
  “ (apr_int_lane 0 vl_pre r0_2 (ap_u32 (idx_pre)) ) ” 
  &&  “ (apr_int_lane 1 vl_pre r1_2 (ap_u32 (idx_pre)) ) ” 
  &&  “ (apr_int_lane 2 vl_pre r2_2 (ap_u32 (idx_pre)) ) ” 
  &&  “ (apr_int_lane 3 vl_pre r3_2 (ap_u32 (idx_pre)) ) ” 
  &&  “ (apr_int_lane 4 vl_pre r4_2 (ap_u32 (idx_pre)) ) ” 
  &&  “ (apr_int_lane 5 vl_pre r5_2 (ap_u32 (idx_pre)) ) ” 
  &&  “ (apr_int_lane 6 vl_pre r6_2 (ap_u32 (idx_pre)) ) ” 
  &&  “ (apr_int_lane 7 vl_pre r7_2 (ap_u32 (idx_pre)) ) ” 
  &&  “ (apr_int_lane 8 vl_pre r8_2 (ap_u32 (idx_pre)) ) ” 
  &&  “ (apr_int_lane 9 vl_pre r9_2 (ap_u32 (idx_pre)) ) ” 
  &&  “ (apr_int_lane 10 vl_pre r10_2 (ap_u32 (idx_pre)) ) ” 
  &&  “ (apr_int_lane 11 vl_pre r11_2 (ap_u32 (idx_pre)) ) ” 
  &&  “ (apr_int_lane 12 vl_pre r12_2 (ap_u32 (idx_pre)) ) ” 
  &&  “ (apr_int_lane 13 vl_pre r13_2 (ap_u32 (idx_pre)) ) ” 
  &&  “ (apr_int_lane 14 vl_pre r14_2 (ap_u32 (idx_pre)) ) ” 
  &&  “ (apr_int_lane 15 vl_pre r15_2 (ap_u32 (idx_pre)) ) ” 
  &&  “ (apr_int_lane 16 vl_pre r16_2 (ap_u32 (idx_pre)) ) ” 
  &&  “ (apr_int_lane 17 vl_pre r17_2 (ap_u32 (idx_pre)) ) ” 
  &&  “ (apr_int_lane 18 vl_pre r18_2 (ap_u32 (idx_pre)) ) ” 
  &&  “ (apr_int_lane 19 vl_pre r19_2 (ap_u32 (idx_pre)) ) ” 
  &&  “ (apr_int_lane 20 vl_pre r20_2 (ap_u32 (idx_pre)) ) ” 
  &&  “ (apr_int_lane 21 vl_pre r21_2 (ap_u32 (idx_pre)) ) ” 
  &&  “ (apr_int_lane 22 vl_pre r22_2 (ap_u32 (idx_pre)) ) ” 
  &&  “ (apr_int_lane 23 vl_pre r23_2 (ap_u32 (idx_pre)) ) ” 
  &&  “ (apr_int_lane 24 vl_pre r24_2 (ap_u32 (idx_pre)) ) ” 
  &&  “ (apr_int_lane 25 vl_pre r25_2 (ap_u32 (idx_pre)) ) ” 
  &&  “ (apr_int_lane 26 vl_pre r26_2 (ap_u32 (idx_pre)) ) ” 
  &&  “ (apr_int_lane 27 vl_pre r27_2 (ap_u32 (idx_pre)) ) ” 
  &&  “ (apr_int_lane 28 vl_pre r28_2 (ap_u32 (idx_pre)) ) ” 
  &&  “ (apr_int_lane 29 vl_pre r29_2 (ap_u32 (idx_pre)) ) ” 
  &&  “ (apr_int_lane 30 vl_pre r30_2 (ap_u32 (idx_pre)) ) ” 
  &&  “ (apr_int_lane 31 vl_pre r31_2 (ap_u32 (idx_pre)) ) ” 
  &&  “ (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p0_pre) (0)) ) ” 
  &&  “ (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p0_pre) (1)) ) ” 
  &&  “ (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p0_pre) (2)) ) ” 
  &&  “ (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p0_pre) (3)) ) ” 
  &&  “ (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p0_pre) (4)) ) ” 
  &&  “ (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p0_pre) (5)) ) ” 
  &&  “ (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p0_pre) (6)) ) ” 
  &&  “ (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p0_pre) (7)) ) ” 
  &&  “ (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p0_pre) (8)) ) ” 
  &&  “ (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p0_pre) (9)) ) ” 
  &&  “ (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p0_pre) (10)) ) ” 
  &&  “ (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p0_pre) (11)) ) ” 
  &&  “ (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p0_pre) (12)) ) ” 
  &&  “ (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p0_pre) (13)) ) ” 
  &&  “ (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p0_pre) (14)) ) ” 
  &&  “ (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p0_pre) (15)) ) ” 
  &&  “ (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p0_pre) (16)) ) ” 
  &&  “ (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p0_pre) (17)) ) ” 
  &&  “ (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p0_pre) (18)) ) ” 
  &&  “ (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p0_pre) (19)) ) ” 
  &&  “ (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p0_pre) (20)) ) ” 
  &&  “ (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p0_pre) (21)) ) ” 
  &&  “ (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p0_pre) (22)) ) ” 
  &&  “ (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p0_pre) (23)) ) ” 
  &&  “ (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p0_pre) (24)) ) ” 
  &&  “ (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p0_pre) (25)) ) ” 
  &&  “ (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p0_pre) (26)) ) ” 
  &&  “ (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p0_pre) (27)) ) ” 
  &&  “ (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p0_pre) (28)) ) ” 
  &&  “ (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p0_pre) (29)) ) ” 
  &&  “ (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p0_pre) (30)) ) ” 
  &&  “ (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p0_pre) (31)) ) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ab_pre = 0) ”
  &&  ((&(( &( "i" ) )->ₛ "s31")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s31")) # UInt  |-> r31_2)
  **  ((&(( &( "i" ) )->ₛ "s30")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s30")) # UInt  |-> r30_2)
  **  ((&(( &( "i" ) )->ₛ "s29")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s29")) # UInt  |-> r29_2)
  **  ((&(( &( "i" ) )->ₛ "s28")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s28")) # UInt  |-> r28_2)
  **  ((&(( &( "i" ) )->ₛ "s27")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s27")) # UInt  |-> r27_2)
  **  ((&(( &( "i" ) )->ₛ "s26")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s26")) # UInt  |-> r26_2)
  **  ((&(( &( "i" ) )->ₛ "s25")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s25")) # UInt  |-> r25_2)
  **  ((&(( &( "i" ) )->ₛ "s24")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s24")) # UInt  |-> r24_2)
  **  ((&(( &( "i" ) )->ₛ "s23")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s23")) # UInt  |-> r23_2)
  **  ((&(( &( "i" ) )->ₛ "s22")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s22")) # UInt  |-> r22_2)
  **  ((&(( &( "i" ) )->ₛ "s21")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s21")) # UInt  |-> r21_2)
  **  ((&(( &( "i" ) )->ₛ "s20")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s20")) # UInt  |-> r20_2)
  **  ((&(( &( "i" ) )->ₛ "s19")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s19")) # UInt  |-> r19_2)
  **  ((&(( &( "i" ) )->ₛ "s18")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s18")) # UInt  |-> r18_2)
  **  ((&(( &( "i" ) )->ₛ "s17")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s17")) # UInt  |-> r17_2)
  **  ((&(( &( "i" ) )->ₛ "s16")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s16")) # UInt  |-> r16_2)
  **  ((&(( &( "i" ) )->ₛ "s15")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s15")) # UInt  |-> r15_2)
  **  ((&(( &( "i" ) )->ₛ "s14")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s14")) # UInt  |-> r14_2)
  **  ((&(( &( "i" ) )->ₛ "s13")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s13")) # UInt  |-> r13_2)
  **  ((&(( &( "i" ) )->ₛ "s12")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s12")) # UInt  |-> r12_2)
  **  ((&(( &( "i" ) )->ₛ "s11")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s11")) # UInt  |-> r11_2)
  **  ((&(( &( "i" ) )->ₛ "s10")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s10")) # UInt  |-> r10_2)
  **  ((&(( &( "i" ) )->ₛ "s9")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s9")) # UInt  |-> r9_2)
  **  ((&(( &( "i" ) )->ₛ "s8")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s8")) # UInt  |-> r8_2)
  **  ((&(( &( "i" ) )->ₛ "s7")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s7")) # UInt  |-> r7_2)
  **  ((&(( &( "i" ) )->ₛ "s6")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s6")) # UInt  |-> r6_2)
  **  ((&(( &( "i" ) )->ₛ "s5")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s5")) # UInt  |-> r5_2)
  **  ((&(( &( "i" ) )->ₛ "s4")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s4")) # UInt  |-> r4_2)
  **  ((&(( &( "i" ) )->ₛ "s3")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s3")) # UInt  |-> r3_2)
  **  ((&(( &( "i" ) )->ₛ "s2")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s2")) # UInt  |-> r2_2)
  **  ((&(( &( "i" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s1")) # UInt  |-> r1_2)
  **  ((&(( &( "i" ) )->ₛ "s0")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s0")) # UInt  |-> r0_2)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
.

Definition ap_rvv_block32_partial_solve_wit_12_pure := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (PreH1 : (0 < vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (ap_window F p0_pre vl_pre )) (PreH4 : (ap_window F p1_pre vl_pre )) (PreH5 : (ap_window F p2_pre vl_pre )) (PreH6 : (ap_window F p3_pre vl_pre )) (PreH7 : (ap_window F p4_pre vl_pre )) (PreH8 : (ap_window F p5_pre vl_pre )) (PreH9 : (ap_window F p6_pre vl_pre )) (PreH10 : (ap_window F p7_pre vl_pre )) (PreH11 : (ap_window F p8_pre vl_pre )) (PreH12 : (ap_write_window W output_pre vl_pre )) (PreH13 : (ap_write_window WI index_pre vl_pre )) (PreH14 : (ap_block32_previous ab_pre ib_pre )) (PreH15 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH16 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH17 : (ap_optional_write_window W ab_pre vl_pre )) (PreH18 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH19 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 0 )) ,
  (UndefStructPredvfloat32m8_t ( &( "b" ) ) )
  **  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "p3" ) )) # Ptr  |-> p3_pre)
  **  ((( &( "p4" ) )) # Ptr  |-> p4_pre)
  **  ((( &( "p5" ) )) # Ptr  |-> p5_pre)
  **  ((( &( "p6" ) )) # Ptr  |-> p6_pre)
  **  ((( &( "p7" ) )) # Ptr  |-> p7_pre)
  **  ((( &( "p8" ) )) # Ptr  |-> p8_pre)
  **  ((( &( "ab" ) )) # Ptr  |-> ab_pre)
  **  ((( &( "ib" ) )) # Ptr  |-> ib_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "index" ) )) # Ptr  |-> index_pre)
  **  ((( &( "idx" ) )) # UInt  |-> idx_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ”
.

Definition ap_rvv_block32_partial_solve_wit_12_aux := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (PreH1 : (0 < vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (ap_window F p0_pre vl_pre )) (PreH4 : (ap_window F p1_pre vl_pre )) (PreH5 : (ap_window F p2_pre vl_pre )) (PreH6 : (ap_window F p3_pre vl_pre )) (PreH7 : (ap_window F p4_pre vl_pre )) (PreH8 : (ap_window F p5_pre vl_pre )) (PreH9 : (ap_window F p6_pre vl_pre )) (PreH10 : (ap_window F p7_pre vl_pre )) (PreH11 : (ap_window F p8_pre vl_pre )) (PreH12 : (ap_write_window W output_pre vl_pre )) (PreH13 : (ap_write_window WI index_pre vl_pre )) (PreH14 : (ap_block32_previous ab_pre ib_pre )) (PreH15 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH16 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH17 : (ap_optional_write_window W ab_pre vl_pre )) (PreH18 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH19 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 0 )) ,
  (UndefStructPredvfloat32m8_t ( &( "b" ) ) )
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 0 ) ”
  &&  (ap_data F )
  **  (UndefStructPredvfloat32m8_t ( &( "b" ) ) )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
.

Definition ap_rvv_block32_partial_solve_wit_12 := ap_rvv_block32_partial_solve_wit_12_pure -> ap_rvv_block32_partial_solve_wit_12_aux.

Definition ap_rvv_block32_partial_solve_wit_13 := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (retval: Z) (PreH1 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p1_pre) (0)) )) (PreH2 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p1_pre) (1)) )) (PreH3 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p1_pre) (2)) )) (PreH4 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p1_pre) (3)) )) (PreH5 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p1_pre) (4)) )) (PreH6 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p1_pre) (5)) )) (PreH7 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p1_pre) (6)) )) (PreH8 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p1_pre) (7)) )) (PreH9 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p1_pre) (8)) )) (PreH10 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p1_pre) (9)) )) (PreH11 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p1_pre) (10)) )) (PreH12 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p1_pre) (11)) )) (PreH13 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p1_pre) (12)) )) (PreH14 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p1_pre) (13)) )) (PreH15 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p1_pre) (14)) )) (PreH16 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p1_pre) (15)) )) (PreH17 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p1_pre) (16)) )) (PreH18 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p1_pre) (17)) )) (PreH19 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p1_pre) (18)) )) (PreH20 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p1_pre) (19)) )) (PreH21 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p1_pre) (20)) )) (PreH22 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p1_pre) (21)) )) (PreH23 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p1_pre) (22)) )) (PreH24 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p1_pre) (23)) )) (PreH25 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p1_pre) (24)) )) (PreH26 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p1_pre) (25)) )) (PreH27 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p1_pre) (26)) )) (PreH28 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p1_pre) (27)) )) (PreH29 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p1_pre) (28)) )) (PreH30 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p1_pre) (29)) )) (PreH31 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p1_pre) (30)) )) (PreH32 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p1_pre) (31)) )) (PreH33 : (0 < vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (ap_window F p0_pre vl_pre )) (PreH36 : (ap_window F p1_pre vl_pre )) (PreH37 : (ap_window F p2_pre vl_pre )) (PreH38 : (ap_window F p3_pre vl_pre )) (PreH39 : (ap_window F p4_pre vl_pre )) (PreH40 : (ap_window F p5_pre vl_pre )) (PreH41 : (ap_window F p6_pre vl_pre )) (PreH42 : (ap_window F p7_pre vl_pre )) (PreH43 : (ap_window F p8_pre vl_pre )) (PreH44 : (ap_write_window W output_pre vl_pre )) (PreH45 : (ap_write_window WI index_pre vl_pre )) (PreH46 : (ap_block32_previous ab_pre ib_pre )) (PreH47 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH48 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH49 : (ap_optional_write_window W ab_pre vl_pre )) (PreH50 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH51 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 0 )) ,
  (ap_data F )
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> r0)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> r1)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> r2)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> r3)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> r4)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> r5)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> r6)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> r7)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> r8)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> r9)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> r10)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> r11)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> r12)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> r13)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> r14)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> r15)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> r16)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> r17)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> r18)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> r19)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> r20)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> r21)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> r22)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> r23)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> r24)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> r25)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> r26)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> r27)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> r28)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> r29)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> r30)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> r31)
  **  (UndefStructPredvfloat32m8_t ( &( "b" ) ) )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p1_pre) (0)) ) ” 
  &&  “ (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p1_pre) (1)) ) ” 
  &&  “ (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p1_pre) (2)) ) ” 
  &&  “ (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p1_pre) (3)) ) ” 
  &&  “ (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p1_pre) (4)) ) ” 
  &&  “ (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p1_pre) (5)) ) ” 
  &&  “ (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p1_pre) (6)) ) ” 
  &&  “ (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p1_pre) (7)) ) ” 
  &&  “ (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p1_pre) (8)) ) ” 
  &&  “ (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p1_pre) (9)) ) ” 
  &&  “ (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p1_pre) (10)) ) ” 
  &&  “ (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p1_pre) (11)) ) ” 
  &&  “ (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p1_pre) (12)) ) ” 
  &&  “ (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p1_pre) (13)) ) ” 
  &&  “ (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p1_pre) (14)) ) ” 
  &&  “ (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p1_pre) (15)) ) ” 
  &&  “ (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p1_pre) (16)) ) ” 
  &&  “ (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p1_pre) (17)) ) ” 
  &&  “ (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p1_pre) (18)) ) ” 
  &&  “ (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p1_pre) (19)) ) ” 
  &&  “ (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p1_pre) (20)) ) ” 
  &&  “ (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p1_pre) (21)) ) ” 
  &&  “ (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p1_pre) (22)) ) ” 
  &&  “ (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p1_pre) (23)) ) ” 
  &&  “ (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p1_pre) (24)) ) ” 
  &&  “ (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p1_pre) (25)) ) ” 
  &&  “ (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p1_pre) (26)) ) ” 
  &&  “ (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p1_pre) (27)) ) ” 
  &&  “ (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p1_pre) (28)) ) ” 
  &&  “ (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p1_pre) (29)) ) ” 
  &&  “ (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p1_pre) (30)) ) ” 
  &&  “ (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p1_pre) (31)) ) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 0 ) ”
  &&  ((&(( &( "b" ) )->ₛ "s31")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> r0)
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
.

Definition ap_rvv_block32_partial_solve_wit_14_pure := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (PreH1 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p1_pre) (0)) )) (PreH2 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p1_pre) (1)) )) (PreH3 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p1_pre) (2)) )) (PreH4 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p1_pre) (3)) )) (PreH5 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p1_pre) (4)) )) (PreH6 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p1_pre) (5)) )) (PreH7 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p1_pre) (6)) )) (PreH8 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p1_pre) (7)) )) (PreH9 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p1_pre) (8)) )) (PreH10 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p1_pre) (9)) )) (PreH11 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p1_pre) (10)) )) (PreH12 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p1_pre) (11)) )) (PreH13 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p1_pre) (12)) )) (PreH14 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p1_pre) (13)) )) (PreH15 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p1_pre) (14)) )) (PreH16 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p1_pre) (15)) )) (PreH17 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p1_pre) (16)) )) (PreH18 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p1_pre) (17)) )) (PreH19 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p1_pre) (18)) )) (PreH20 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p1_pre) (19)) )) (PreH21 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p1_pre) (20)) )) (PreH22 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p1_pre) (21)) )) (PreH23 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p1_pre) (22)) )) (PreH24 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p1_pre) (23)) )) (PreH25 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p1_pre) (24)) )) (PreH26 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p1_pre) (25)) )) (PreH27 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p1_pre) (26)) )) (PreH28 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p1_pre) (27)) )) (PreH29 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p1_pre) (28)) )) (PreH30 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p1_pre) (29)) )) (PreH31 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p1_pre) (30)) )) (PreH32 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p1_pre) (31)) )) (PreH33 : (0 < vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (ap_window F p0_pre vl_pre )) (PreH36 : (ap_window F p1_pre vl_pre )) (PreH37 : (ap_window F p2_pre vl_pre )) (PreH38 : (ap_window F p3_pre vl_pre )) (PreH39 : (ap_window F p4_pre vl_pre )) (PreH40 : (ap_window F p5_pre vl_pre )) (PreH41 : (ap_window F p6_pre vl_pre )) (PreH42 : (ap_window F p7_pre vl_pre )) (PreH43 : (ap_window F p8_pre vl_pre )) (PreH44 : (ap_write_window W output_pre vl_pre )) (PreH45 : (ap_write_window WI index_pre vl_pre )) (PreH46 : (ap_block32_previous ab_pre ib_pre )) (PreH47 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH48 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH49 : (ap_optional_write_window W ab_pre vl_pre )) (PreH50 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH51 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 0 )) ,
  ((&(( &( "b" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_data F )
  **  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "p3" ) )) # Ptr  |-> p3_pre)
  **  ((( &( "p4" ) )) # Ptr  |-> p4_pre)
  **  ((( &( "p5" ) )) # Ptr  |-> p5_pre)
  **  ((( &( "p6" ) )) # Ptr  |-> p6_pre)
  **  ((( &( "p7" ) )) # Ptr  |-> p7_pre)
  **  ((( &( "p8" ) )) # Ptr  |-> p8_pre)
  **  ((( &( "ab" ) )) # Ptr  |-> ab_pre)
  **  ((( &( "ib" ) )) # Ptr  |-> ib_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "index" ) )) # Ptr  |-> index_pre)
  **  ((( &( "idx" ) )) # UInt  |-> idx_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition ap_rvv_block32_partial_solve_wit_14_aux := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (PreH1 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p1_pre) (0)) )) (PreH2 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p1_pre) (1)) )) (PreH3 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p1_pre) (2)) )) (PreH4 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p1_pre) (3)) )) (PreH5 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p1_pre) (4)) )) (PreH6 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p1_pre) (5)) )) (PreH7 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p1_pre) (6)) )) (PreH8 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p1_pre) (7)) )) (PreH9 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p1_pre) (8)) )) (PreH10 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p1_pre) (9)) )) (PreH11 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p1_pre) (10)) )) (PreH12 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p1_pre) (11)) )) (PreH13 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p1_pre) (12)) )) (PreH14 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p1_pre) (13)) )) (PreH15 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p1_pre) (14)) )) (PreH16 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p1_pre) (15)) )) (PreH17 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p1_pre) (16)) )) (PreH18 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p1_pre) (17)) )) (PreH19 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p1_pre) (18)) )) (PreH20 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p1_pre) (19)) )) (PreH21 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p1_pre) (20)) )) (PreH22 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p1_pre) (21)) )) (PreH23 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p1_pre) (22)) )) (PreH24 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p1_pre) (23)) )) (PreH25 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p1_pre) (24)) )) (PreH26 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p1_pre) (25)) )) (PreH27 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p1_pre) (26)) )) (PreH28 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p1_pre) (27)) )) (PreH29 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p1_pre) (28)) )) (PreH30 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p1_pre) (29)) )) (PreH31 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p1_pre) (30)) )) (PreH32 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p1_pre) (31)) )) (PreH33 : (0 < vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (ap_window F p0_pre vl_pre )) (PreH36 : (ap_window F p1_pre vl_pre )) (PreH37 : (ap_window F p2_pre vl_pre )) (PreH38 : (ap_window F p3_pre vl_pre )) (PreH39 : (ap_window F p4_pre vl_pre )) (PreH40 : (ap_window F p5_pre vl_pre )) (PreH41 : (ap_window F p6_pre vl_pre )) (PreH42 : (ap_window F p7_pre vl_pre )) (PreH43 : (ap_window F p8_pre vl_pre )) (PreH44 : (ap_write_window W output_pre vl_pre )) (PreH45 : (ap_write_window WI index_pre vl_pre )) (PreH46 : (ap_block32_previous ab_pre ib_pre )) (PreH47 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH48 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH49 : (ap_optional_write_window W ab_pre vl_pre )) (PreH50 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH51 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 0 )) ,
  ((&(( &( "b" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p1_pre) (0)) ) ” 
  &&  “ (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p1_pre) (1)) ) ” 
  &&  “ (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p1_pre) (2)) ) ” 
  &&  “ (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p1_pre) (3)) ) ” 
  &&  “ (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p1_pre) (4)) ) ” 
  &&  “ (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p1_pre) (5)) ) ” 
  &&  “ (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p1_pre) (6)) ) ” 
  &&  “ (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p1_pre) (7)) ) ” 
  &&  “ (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p1_pre) (8)) ) ” 
  &&  “ (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p1_pre) (9)) ) ” 
  &&  “ (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p1_pre) (10)) ) ” 
  &&  “ (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p1_pre) (11)) ) ” 
  &&  “ (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p1_pre) (12)) ) ” 
  &&  “ (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p1_pre) (13)) ) ” 
  &&  “ (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p1_pre) (14)) ) ” 
  &&  “ (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p1_pre) (15)) ) ” 
  &&  “ (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p1_pre) (16)) ) ” 
  &&  “ (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p1_pre) (17)) ) ” 
  &&  “ (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p1_pre) (18)) ) ” 
  &&  “ (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p1_pre) (19)) ) ” 
  &&  “ (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p1_pre) (20)) ) ” 
  &&  “ (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p1_pre) (21)) ) ” 
  &&  “ (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p1_pre) (22)) ) ” 
  &&  “ (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p1_pre) (23)) ) ” 
  &&  “ (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p1_pre) (24)) ) ” 
  &&  “ (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p1_pre) (25)) ) ” 
  &&  “ (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p1_pre) (26)) ) ” 
  &&  “ (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p1_pre) (27)) ) ” 
  &&  “ (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p1_pre) (28)) ) ” 
  &&  “ (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p1_pre) (29)) ) ” 
  &&  “ (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p1_pre) (30)) ) ” 
  &&  “ (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p1_pre) (31)) ) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 0 ) ”
  &&  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
  **  (StructPredvfloat32m8_t ( &( "b" ) ) (make_record_vfloat32m8_t (r0) (r1) (r2) (r3) (r4) (r5) (r6) (r7) (r8) (r9) (r10) (r11) (r12) (r13) (r14) (r15) (r16) (r17) (r18) (r19) (r20) (r21) (r22) (r23) (r24) (r25) (r26) (r27) (r28) (r29) (r30) (r31)) )
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
.

Definition ap_rvv_block32_partial_solve_wit_14 := ap_rvv_block32_partial_solve_wit_14_pure -> ap_rvv_block32_partial_solve_wit_14_aux.

Definition ap_rvv_block32_partial_solve_wit_15_pure := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (PreH1 : (0 < vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (ap_window F p0_pre vl_pre )) (PreH4 : (ap_window F p1_pre vl_pre )) (PreH5 : (ap_window F p2_pre vl_pre )) (PreH6 : (ap_window F p3_pre vl_pre )) (PreH7 : (ap_window F p4_pre vl_pre )) (PreH8 : (ap_window F p5_pre vl_pre )) (PreH9 : (ap_window F p6_pre vl_pre )) (PreH10 : (ap_window F p7_pre vl_pre )) (PreH11 : (ap_window F p8_pre vl_pre )) (PreH12 : (ap_write_window W output_pre vl_pre )) (PreH13 : (ap_write_window WI index_pre vl_pre )) (PreH14 : (ap_block32_previous ab_pre ib_pre )) (PreH15 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH16 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH17 : (ap_optional_write_window W ab_pre vl_pre )) (PreH18 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH19 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 1 )) ,
  (UndefStructPredvfloat32m8_t ( &( "b" ) ) )
  **  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "p3" ) )) # Ptr  |-> p3_pre)
  **  ((( &( "p4" ) )) # Ptr  |-> p4_pre)
  **  ((( &( "p5" ) )) # Ptr  |-> p5_pre)
  **  ((( &( "p6" ) )) # Ptr  |-> p6_pre)
  **  ((( &( "p7" ) )) # Ptr  |-> p7_pre)
  **  ((( &( "p8" ) )) # Ptr  |-> p8_pre)
  **  ((( &( "ab" ) )) # Ptr  |-> ab_pre)
  **  ((( &( "ib" ) )) # Ptr  |-> ib_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "index" ) )) # Ptr  |-> index_pre)
  **  ((( &( "idx" ) )) # UInt  |-> idx_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ”
.

Definition ap_rvv_block32_partial_solve_wit_15_aux := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (PreH1 : (0 < vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (ap_window F p0_pre vl_pre )) (PreH4 : (ap_window F p1_pre vl_pre )) (PreH5 : (ap_window F p2_pre vl_pre )) (PreH6 : (ap_window F p3_pre vl_pre )) (PreH7 : (ap_window F p4_pre vl_pre )) (PreH8 : (ap_window F p5_pre vl_pre )) (PreH9 : (ap_window F p6_pre vl_pre )) (PreH10 : (ap_window F p7_pre vl_pre )) (PreH11 : (ap_window F p8_pre vl_pre )) (PreH12 : (ap_write_window W output_pre vl_pre )) (PreH13 : (ap_write_window WI index_pre vl_pre )) (PreH14 : (ap_block32_previous ab_pre ib_pre )) (PreH15 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH16 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH17 : (ap_optional_write_window W ab_pre vl_pre )) (PreH18 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH19 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 1 )) ,
  (UndefStructPredvfloat32m8_t ( &( "b" ) ) )
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 1 ) ”
  &&  (ap_data F )
  **  (UndefStructPredvfloat32m8_t ( &( "b" ) ) )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
.

Definition ap_rvv_block32_partial_solve_wit_15 := ap_rvv_block32_partial_solve_wit_15_pure -> ap_rvv_block32_partial_solve_wit_15_aux.

Definition ap_rvv_block32_partial_solve_wit_16 := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (retval: Z) (PreH1 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p2_pre) (0)) )) (PreH2 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p2_pre) (1)) )) (PreH3 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p2_pre) (2)) )) (PreH4 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p2_pre) (3)) )) (PreH5 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p2_pre) (4)) )) (PreH6 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p2_pre) (5)) )) (PreH7 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p2_pre) (6)) )) (PreH8 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p2_pre) (7)) )) (PreH9 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p2_pre) (8)) )) (PreH10 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p2_pre) (9)) )) (PreH11 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p2_pre) (10)) )) (PreH12 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p2_pre) (11)) )) (PreH13 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p2_pre) (12)) )) (PreH14 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p2_pre) (13)) )) (PreH15 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p2_pre) (14)) )) (PreH16 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p2_pre) (15)) )) (PreH17 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p2_pre) (16)) )) (PreH18 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p2_pre) (17)) )) (PreH19 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p2_pre) (18)) )) (PreH20 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p2_pre) (19)) )) (PreH21 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p2_pre) (20)) )) (PreH22 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p2_pre) (21)) )) (PreH23 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p2_pre) (22)) )) (PreH24 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p2_pre) (23)) )) (PreH25 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p2_pre) (24)) )) (PreH26 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p2_pre) (25)) )) (PreH27 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p2_pre) (26)) )) (PreH28 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p2_pre) (27)) )) (PreH29 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p2_pre) (28)) )) (PreH30 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p2_pre) (29)) )) (PreH31 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p2_pre) (30)) )) (PreH32 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p2_pre) (31)) )) (PreH33 : (0 < vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (ap_window F p0_pre vl_pre )) (PreH36 : (ap_window F p1_pre vl_pre )) (PreH37 : (ap_window F p2_pre vl_pre )) (PreH38 : (ap_window F p3_pre vl_pre )) (PreH39 : (ap_window F p4_pre vl_pre )) (PreH40 : (ap_window F p5_pre vl_pre )) (PreH41 : (ap_window F p6_pre vl_pre )) (PreH42 : (ap_window F p7_pre vl_pre )) (PreH43 : (ap_window F p8_pre vl_pre )) (PreH44 : (ap_write_window W output_pre vl_pre )) (PreH45 : (ap_write_window WI index_pre vl_pre )) (PreH46 : (ap_block32_previous ab_pre ib_pre )) (PreH47 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH48 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH49 : (ap_optional_write_window W ab_pre vl_pre )) (PreH50 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH51 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 1 )) ,
  (ap_data F )
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> r0)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> r1)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> r2)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> r3)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> r4)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> r5)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> r6)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> r7)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> r8)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> r9)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> r10)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> r11)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> r12)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> r13)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> r14)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> r15)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> r16)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> r17)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> r18)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> r19)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> r20)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> r21)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> r22)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> r23)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> r24)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> r25)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> r26)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> r27)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> r28)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> r29)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> r30)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> r31)
  **  (UndefStructPredvfloat32m8_t ( &( "b" ) ) )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p2_pre) (0)) ) ” 
  &&  “ (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p2_pre) (1)) ) ” 
  &&  “ (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p2_pre) (2)) ) ” 
  &&  “ (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p2_pre) (3)) ) ” 
  &&  “ (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p2_pre) (4)) ) ” 
  &&  “ (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p2_pre) (5)) ) ” 
  &&  “ (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p2_pre) (6)) ) ” 
  &&  “ (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p2_pre) (7)) ) ” 
  &&  “ (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p2_pre) (8)) ) ” 
  &&  “ (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p2_pre) (9)) ) ” 
  &&  “ (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p2_pre) (10)) ) ” 
  &&  “ (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p2_pre) (11)) ) ” 
  &&  “ (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p2_pre) (12)) ) ” 
  &&  “ (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p2_pre) (13)) ) ” 
  &&  “ (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p2_pre) (14)) ) ” 
  &&  “ (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p2_pre) (15)) ) ” 
  &&  “ (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p2_pre) (16)) ) ” 
  &&  “ (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p2_pre) (17)) ) ” 
  &&  “ (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p2_pre) (18)) ) ” 
  &&  “ (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p2_pre) (19)) ) ” 
  &&  “ (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p2_pre) (20)) ) ” 
  &&  “ (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p2_pre) (21)) ) ” 
  &&  “ (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p2_pre) (22)) ) ” 
  &&  “ (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p2_pre) (23)) ) ” 
  &&  “ (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p2_pre) (24)) ) ” 
  &&  “ (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p2_pre) (25)) ) ” 
  &&  “ (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p2_pre) (26)) ) ” 
  &&  “ (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p2_pre) (27)) ) ” 
  &&  “ (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p2_pre) (28)) ) ” 
  &&  “ (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p2_pre) (29)) ) ” 
  &&  “ (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p2_pre) (30)) ) ” 
  &&  “ (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p2_pre) (31)) ) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 1 ) ”
  &&  ((&(( &( "b" ) )->ₛ "s31")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> r0)
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
.

Definition ap_rvv_block32_partial_solve_wit_17_pure := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (PreH1 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p2_pre) (0)) )) (PreH2 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p2_pre) (1)) )) (PreH3 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p2_pre) (2)) )) (PreH4 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p2_pre) (3)) )) (PreH5 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p2_pre) (4)) )) (PreH6 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p2_pre) (5)) )) (PreH7 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p2_pre) (6)) )) (PreH8 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p2_pre) (7)) )) (PreH9 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p2_pre) (8)) )) (PreH10 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p2_pre) (9)) )) (PreH11 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p2_pre) (10)) )) (PreH12 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p2_pre) (11)) )) (PreH13 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p2_pre) (12)) )) (PreH14 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p2_pre) (13)) )) (PreH15 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p2_pre) (14)) )) (PreH16 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p2_pre) (15)) )) (PreH17 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p2_pre) (16)) )) (PreH18 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p2_pre) (17)) )) (PreH19 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p2_pre) (18)) )) (PreH20 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p2_pre) (19)) )) (PreH21 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p2_pre) (20)) )) (PreH22 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p2_pre) (21)) )) (PreH23 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p2_pre) (22)) )) (PreH24 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p2_pre) (23)) )) (PreH25 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p2_pre) (24)) )) (PreH26 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p2_pre) (25)) )) (PreH27 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p2_pre) (26)) )) (PreH28 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p2_pre) (27)) )) (PreH29 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p2_pre) (28)) )) (PreH30 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p2_pre) (29)) )) (PreH31 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p2_pre) (30)) )) (PreH32 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p2_pre) (31)) )) (PreH33 : (0 < vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (ap_window F p0_pre vl_pre )) (PreH36 : (ap_window F p1_pre vl_pre )) (PreH37 : (ap_window F p2_pre vl_pre )) (PreH38 : (ap_window F p3_pre vl_pre )) (PreH39 : (ap_window F p4_pre vl_pre )) (PreH40 : (ap_window F p5_pre vl_pre )) (PreH41 : (ap_window F p6_pre vl_pre )) (PreH42 : (ap_window F p7_pre vl_pre )) (PreH43 : (ap_window F p8_pre vl_pre )) (PreH44 : (ap_write_window W output_pre vl_pre )) (PreH45 : (ap_write_window WI index_pre vl_pre )) (PreH46 : (ap_block32_previous ab_pre ib_pre )) (PreH47 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH48 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH49 : (ap_optional_write_window W ab_pre vl_pre )) (PreH50 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH51 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 1 )) ,
  ((&(( &( "b" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_data F )
  **  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "p3" ) )) # Ptr  |-> p3_pre)
  **  ((( &( "p4" ) )) # Ptr  |-> p4_pre)
  **  ((( &( "p5" ) )) # Ptr  |-> p5_pre)
  **  ((( &( "p6" ) )) # Ptr  |-> p6_pre)
  **  ((( &( "p7" ) )) # Ptr  |-> p7_pre)
  **  ((( &( "p8" ) )) # Ptr  |-> p8_pre)
  **  ((( &( "ab" ) )) # Ptr  |-> ab_pre)
  **  ((( &( "ib" ) )) # Ptr  |-> ib_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "index" ) )) # Ptr  |-> index_pre)
  **  ((( &( "idx" ) )) # UInt  |-> idx_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition ap_rvv_block32_partial_solve_wit_17_aux := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (PreH1 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p2_pre) (0)) )) (PreH2 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p2_pre) (1)) )) (PreH3 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p2_pre) (2)) )) (PreH4 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p2_pre) (3)) )) (PreH5 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p2_pre) (4)) )) (PreH6 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p2_pre) (5)) )) (PreH7 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p2_pre) (6)) )) (PreH8 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p2_pre) (7)) )) (PreH9 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p2_pre) (8)) )) (PreH10 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p2_pre) (9)) )) (PreH11 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p2_pre) (10)) )) (PreH12 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p2_pre) (11)) )) (PreH13 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p2_pre) (12)) )) (PreH14 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p2_pre) (13)) )) (PreH15 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p2_pre) (14)) )) (PreH16 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p2_pre) (15)) )) (PreH17 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p2_pre) (16)) )) (PreH18 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p2_pre) (17)) )) (PreH19 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p2_pre) (18)) )) (PreH20 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p2_pre) (19)) )) (PreH21 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p2_pre) (20)) )) (PreH22 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p2_pre) (21)) )) (PreH23 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p2_pre) (22)) )) (PreH24 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p2_pre) (23)) )) (PreH25 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p2_pre) (24)) )) (PreH26 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p2_pre) (25)) )) (PreH27 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p2_pre) (26)) )) (PreH28 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p2_pre) (27)) )) (PreH29 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p2_pre) (28)) )) (PreH30 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p2_pre) (29)) )) (PreH31 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p2_pre) (30)) )) (PreH32 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p2_pre) (31)) )) (PreH33 : (0 < vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (ap_window F p0_pre vl_pre )) (PreH36 : (ap_window F p1_pre vl_pre )) (PreH37 : (ap_window F p2_pre vl_pre )) (PreH38 : (ap_window F p3_pre vl_pre )) (PreH39 : (ap_window F p4_pre vl_pre )) (PreH40 : (ap_window F p5_pre vl_pre )) (PreH41 : (ap_window F p6_pre vl_pre )) (PreH42 : (ap_window F p7_pre vl_pre )) (PreH43 : (ap_window F p8_pre vl_pre )) (PreH44 : (ap_write_window W output_pre vl_pre )) (PreH45 : (ap_write_window WI index_pre vl_pre )) (PreH46 : (ap_block32_previous ab_pre ib_pre )) (PreH47 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH48 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH49 : (ap_optional_write_window W ab_pre vl_pre )) (PreH50 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH51 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 1 )) ,
  ((&(( &( "b" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p2_pre) (0)) ) ” 
  &&  “ (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p2_pre) (1)) ) ” 
  &&  “ (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p2_pre) (2)) ) ” 
  &&  “ (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p2_pre) (3)) ) ” 
  &&  “ (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p2_pre) (4)) ) ” 
  &&  “ (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p2_pre) (5)) ) ” 
  &&  “ (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p2_pre) (6)) ) ” 
  &&  “ (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p2_pre) (7)) ) ” 
  &&  “ (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p2_pre) (8)) ) ” 
  &&  “ (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p2_pre) (9)) ) ” 
  &&  “ (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p2_pre) (10)) ) ” 
  &&  “ (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p2_pre) (11)) ) ” 
  &&  “ (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p2_pre) (12)) ) ” 
  &&  “ (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p2_pre) (13)) ) ” 
  &&  “ (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p2_pre) (14)) ) ” 
  &&  “ (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p2_pre) (15)) ) ” 
  &&  “ (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p2_pre) (16)) ) ” 
  &&  “ (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p2_pre) (17)) ) ” 
  &&  “ (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p2_pre) (18)) ) ” 
  &&  “ (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p2_pre) (19)) ) ” 
  &&  “ (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p2_pre) (20)) ) ” 
  &&  “ (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p2_pre) (21)) ) ” 
  &&  “ (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p2_pre) (22)) ) ” 
  &&  “ (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p2_pre) (23)) ) ” 
  &&  “ (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p2_pre) (24)) ) ” 
  &&  “ (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p2_pre) (25)) ) ” 
  &&  “ (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p2_pre) (26)) ) ” 
  &&  “ (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p2_pre) (27)) ) ” 
  &&  “ (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p2_pre) (28)) ) ” 
  &&  “ (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p2_pre) (29)) ) ” 
  &&  “ (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p2_pre) (30)) ) ” 
  &&  “ (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p2_pre) (31)) ) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 1 ) ”
  &&  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
  **  (StructPredvfloat32m8_t ( &( "b" ) ) (make_record_vfloat32m8_t (r0) (r1) (r2) (r3) (r4) (r5) (r6) (r7) (r8) (r9) (r10) (r11) (r12) (r13) (r14) (r15) (r16) (r17) (r18) (r19) (r20) (r21) (r22) (r23) (r24) (r25) (r26) (r27) (r28) (r29) (r30) (r31)) )
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
.

Definition ap_rvv_block32_partial_solve_wit_17 := ap_rvv_block32_partial_solve_wit_17_pure -> ap_rvv_block32_partial_solve_wit_17_aux.

Definition ap_rvv_block32_partial_solve_wit_18_pure := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (PreH1 : (0 < vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (ap_window F p0_pre vl_pre )) (PreH4 : (ap_window F p1_pre vl_pre )) (PreH5 : (ap_window F p2_pre vl_pre )) (PreH6 : (ap_window F p3_pre vl_pre )) (PreH7 : (ap_window F p4_pre vl_pre )) (PreH8 : (ap_window F p5_pre vl_pre )) (PreH9 : (ap_window F p6_pre vl_pre )) (PreH10 : (ap_window F p7_pre vl_pre )) (PreH11 : (ap_window F p8_pre vl_pre )) (PreH12 : (ap_write_window W output_pre vl_pre )) (PreH13 : (ap_write_window WI index_pre vl_pre )) (PreH14 : (ap_block32_previous ab_pre ib_pre )) (PreH15 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH16 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH17 : (ap_optional_write_window W ab_pre vl_pre )) (PreH18 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH19 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 2 )) ,
  (UndefStructPredvfloat32m8_t ( &( "b" ) ) )
  **  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "p3" ) )) # Ptr  |-> p3_pre)
  **  ((( &( "p4" ) )) # Ptr  |-> p4_pre)
  **  ((( &( "p5" ) )) # Ptr  |-> p5_pre)
  **  ((( &( "p6" ) )) # Ptr  |-> p6_pre)
  **  ((( &( "p7" ) )) # Ptr  |-> p7_pre)
  **  ((( &( "p8" ) )) # Ptr  |-> p8_pre)
  **  ((( &( "ab" ) )) # Ptr  |-> ab_pre)
  **  ((( &( "ib" ) )) # Ptr  |-> ib_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "index" ) )) # Ptr  |-> index_pre)
  **  ((( &( "idx" ) )) # UInt  |-> idx_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ”
.

Definition ap_rvv_block32_partial_solve_wit_18_aux := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (PreH1 : (0 < vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (ap_window F p0_pre vl_pre )) (PreH4 : (ap_window F p1_pre vl_pre )) (PreH5 : (ap_window F p2_pre vl_pre )) (PreH6 : (ap_window F p3_pre vl_pre )) (PreH7 : (ap_window F p4_pre vl_pre )) (PreH8 : (ap_window F p5_pre vl_pre )) (PreH9 : (ap_window F p6_pre vl_pre )) (PreH10 : (ap_window F p7_pre vl_pre )) (PreH11 : (ap_window F p8_pre vl_pre )) (PreH12 : (ap_write_window W output_pre vl_pre )) (PreH13 : (ap_write_window WI index_pre vl_pre )) (PreH14 : (ap_block32_previous ab_pre ib_pre )) (PreH15 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH16 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH17 : (ap_optional_write_window W ab_pre vl_pre )) (PreH18 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH19 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 2 )) ,
  (UndefStructPredvfloat32m8_t ( &( "b" ) ) )
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 2 ) ”
  &&  (ap_data F )
  **  (UndefStructPredvfloat32m8_t ( &( "b" ) ) )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
.

Definition ap_rvv_block32_partial_solve_wit_18 := ap_rvv_block32_partial_solve_wit_18_pure -> ap_rvv_block32_partial_solve_wit_18_aux.

Definition ap_rvv_block32_partial_solve_wit_19 := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (retval: Z) (PreH1 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p3_pre) (0)) )) (PreH2 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p3_pre) (1)) )) (PreH3 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p3_pre) (2)) )) (PreH4 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p3_pre) (3)) )) (PreH5 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p3_pre) (4)) )) (PreH6 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p3_pre) (5)) )) (PreH7 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p3_pre) (6)) )) (PreH8 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p3_pre) (7)) )) (PreH9 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p3_pre) (8)) )) (PreH10 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p3_pre) (9)) )) (PreH11 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p3_pre) (10)) )) (PreH12 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p3_pre) (11)) )) (PreH13 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p3_pre) (12)) )) (PreH14 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p3_pre) (13)) )) (PreH15 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p3_pre) (14)) )) (PreH16 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p3_pre) (15)) )) (PreH17 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p3_pre) (16)) )) (PreH18 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p3_pre) (17)) )) (PreH19 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p3_pre) (18)) )) (PreH20 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p3_pre) (19)) )) (PreH21 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p3_pre) (20)) )) (PreH22 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p3_pre) (21)) )) (PreH23 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p3_pre) (22)) )) (PreH24 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p3_pre) (23)) )) (PreH25 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p3_pre) (24)) )) (PreH26 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p3_pre) (25)) )) (PreH27 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p3_pre) (26)) )) (PreH28 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p3_pre) (27)) )) (PreH29 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p3_pre) (28)) )) (PreH30 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p3_pre) (29)) )) (PreH31 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p3_pre) (30)) )) (PreH32 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p3_pre) (31)) )) (PreH33 : (0 < vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (ap_window F p0_pre vl_pre )) (PreH36 : (ap_window F p1_pre vl_pre )) (PreH37 : (ap_window F p2_pre vl_pre )) (PreH38 : (ap_window F p3_pre vl_pre )) (PreH39 : (ap_window F p4_pre vl_pre )) (PreH40 : (ap_window F p5_pre vl_pre )) (PreH41 : (ap_window F p6_pre vl_pre )) (PreH42 : (ap_window F p7_pre vl_pre )) (PreH43 : (ap_window F p8_pre vl_pre )) (PreH44 : (ap_write_window W output_pre vl_pre )) (PreH45 : (ap_write_window WI index_pre vl_pre )) (PreH46 : (ap_block32_previous ab_pre ib_pre )) (PreH47 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH48 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH49 : (ap_optional_write_window W ab_pre vl_pre )) (PreH50 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH51 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 2 )) ,
  (ap_data F )
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> r0)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> r1)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> r2)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> r3)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> r4)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> r5)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> r6)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> r7)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> r8)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> r9)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> r10)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> r11)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> r12)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> r13)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> r14)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> r15)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> r16)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> r17)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> r18)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> r19)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> r20)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> r21)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> r22)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> r23)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> r24)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> r25)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> r26)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> r27)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> r28)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> r29)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> r30)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> r31)
  **  (UndefStructPredvfloat32m8_t ( &( "b" ) ) )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p3_pre) (0)) ) ” 
  &&  “ (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p3_pre) (1)) ) ” 
  &&  “ (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p3_pre) (2)) ) ” 
  &&  “ (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p3_pre) (3)) ) ” 
  &&  “ (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p3_pre) (4)) ) ” 
  &&  “ (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p3_pre) (5)) ) ” 
  &&  “ (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p3_pre) (6)) ) ” 
  &&  “ (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p3_pre) (7)) ) ” 
  &&  “ (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p3_pre) (8)) ) ” 
  &&  “ (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p3_pre) (9)) ) ” 
  &&  “ (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p3_pre) (10)) ) ” 
  &&  “ (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p3_pre) (11)) ) ” 
  &&  “ (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p3_pre) (12)) ) ” 
  &&  “ (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p3_pre) (13)) ) ” 
  &&  “ (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p3_pre) (14)) ) ” 
  &&  “ (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p3_pre) (15)) ) ” 
  &&  “ (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p3_pre) (16)) ) ” 
  &&  “ (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p3_pre) (17)) ) ” 
  &&  “ (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p3_pre) (18)) ) ” 
  &&  “ (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p3_pre) (19)) ) ” 
  &&  “ (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p3_pre) (20)) ) ” 
  &&  “ (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p3_pre) (21)) ) ” 
  &&  “ (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p3_pre) (22)) ) ” 
  &&  “ (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p3_pre) (23)) ) ” 
  &&  “ (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p3_pre) (24)) ) ” 
  &&  “ (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p3_pre) (25)) ) ” 
  &&  “ (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p3_pre) (26)) ) ” 
  &&  “ (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p3_pre) (27)) ) ” 
  &&  “ (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p3_pre) (28)) ) ” 
  &&  “ (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p3_pre) (29)) ) ” 
  &&  “ (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p3_pre) (30)) ) ” 
  &&  “ (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p3_pre) (31)) ) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 2 ) ”
  &&  ((&(( &( "b" ) )->ₛ "s31")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> r0)
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
.

Definition ap_rvv_block32_partial_solve_wit_20_pure := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (PreH1 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p3_pre) (0)) )) (PreH2 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p3_pre) (1)) )) (PreH3 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p3_pre) (2)) )) (PreH4 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p3_pre) (3)) )) (PreH5 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p3_pre) (4)) )) (PreH6 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p3_pre) (5)) )) (PreH7 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p3_pre) (6)) )) (PreH8 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p3_pre) (7)) )) (PreH9 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p3_pre) (8)) )) (PreH10 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p3_pre) (9)) )) (PreH11 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p3_pre) (10)) )) (PreH12 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p3_pre) (11)) )) (PreH13 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p3_pre) (12)) )) (PreH14 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p3_pre) (13)) )) (PreH15 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p3_pre) (14)) )) (PreH16 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p3_pre) (15)) )) (PreH17 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p3_pre) (16)) )) (PreH18 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p3_pre) (17)) )) (PreH19 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p3_pre) (18)) )) (PreH20 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p3_pre) (19)) )) (PreH21 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p3_pre) (20)) )) (PreH22 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p3_pre) (21)) )) (PreH23 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p3_pre) (22)) )) (PreH24 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p3_pre) (23)) )) (PreH25 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p3_pre) (24)) )) (PreH26 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p3_pre) (25)) )) (PreH27 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p3_pre) (26)) )) (PreH28 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p3_pre) (27)) )) (PreH29 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p3_pre) (28)) )) (PreH30 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p3_pre) (29)) )) (PreH31 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p3_pre) (30)) )) (PreH32 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p3_pre) (31)) )) (PreH33 : (0 < vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (ap_window F p0_pre vl_pre )) (PreH36 : (ap_window F p1_pre vl_pre )) (PreH37 : (ap_window F p2_pre vl_pre )) (PreH38 : (ap_window F p3_pre vl_pre )) (PreH39 : (ap_window F p4_pre vl_pre )) (PreH40 : (ap_window F p5_pre vl_pre )) (PreH41 : (ap_window F p6_pre vl_pre )) (PreH42 : (ap_window F p7_pre vl_pre )) (PreH43 : (ap_window F p8_pre vl_pre )) (PreH44 : (ap_write_window W output_pre vl_pre )) (PreH45 : (ap_write_window WI index_pre vl_pre )) (PreH46 : (ap_block32_previous ab_pre ib_pre )) (PreH47 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH48 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH49 : (ap_optional_write_window W ab_pre vl_pre )) (PreH50 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH51 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 2 )) ,
  ((&(( &( "b" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_data F )
  **  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "p3" ) )) # Ptr  |-> p3_pre)
  **  ((( &( "p4" ) )) # Ptr  |-> p4_pre)
  **  ((( &( "p5" ) )) # Ptr  |-> p5_pre)
  **  ((( &( "p6" ) )) # Ptr  |-> p6_pre)
  **  ((( &( "p7" ) )) # Ptr  |-> p7_pre)
  **  ((( &( "p8" ) )) # Ptr  |-> p8_pre)
  **  ((( &( "ab" ) )) # Ptr  |-> ab_pre)
  **  ((( &( "ib" ) )) # Ptr  |-> ib_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "index" ) )) # Ptr  |-> index_pre)
  **  ((( &( "idx" ) )) # UInt  |-> idx_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition ap_rvv_block32_partial_solve_wit_20_aux := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (PreH1 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p3_pre) (0)) )) (PreH2 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p3_pre) (1)) )) (PreH3 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p3_pre) (2)) )) (PreH4 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p3_pre) (3)) )) (PreH5 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p3_pre) (4)) )) (PreH6 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p3_pre) (5)) )) (PreH7 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p3_pre) (6)) )) (PreH8 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p3_pre) (7)) )) (PreH9 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p3_pre) (8)) )) (PreH10 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p3_pre) (9)) )) (PreH11 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p3_pre) (10)) )) (PreH12 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p3_pre) (11)) )) (PreH13 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p3_pre) (12)) )) (PreH14 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p3_pre) (13)) )) (PreH15 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p3_pre) (14)) )) (PreH16 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p3_pre) (15)) )) (PreH17 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p3_pre) (16)) )) (PreH18 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p3_pre) (17)) )) (PreH19 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p3_pre) (18)) )) (PreH20 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p3_pre) (19)) )) (PreH21 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p3_pre) (20)) )) (PreH22 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p3_pre) (21)) )) (PreH23 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p3_pre) (22)) )) (PreH24 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p3_pre) (23)) )) (PreH25 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p3_pre) (24)) )) (PreH26 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p3_pre) (25)) )) (PreH27 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p3_pre) (26)) )) (PreH28 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p3_pre) (27)) )) (PreH29 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p3_pre) (28)) )) (PreH30 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p3_pre) (29)) )) (PreH31 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p3_pre) (30)) )) (PreH32 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p3_pre) (31)) )) (PreH33 : (0 < vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (ap_window F p0_pre vl_pre )) (PreH36 : (ap_window F p1_pre vl_pre )) (PreH37 : (ap_window F p2_pre vl_pre )) (PreH38 : (ap_window F p3_pre vl_pre )) (PreH39 : (ap_window F p4_pre vl_pre )) (PreH40 : (ap_window F p5_pre vl_pre )) (PreH41 : (ap_window F p6_pre vl_pre )) (PreH42 : (ap_window F p7_pre vl_pre )) (PreH43 : (ap_window F p8_pre vl_pre )) (PreH44 : (ap_write_window W output_pre vl_pre )) (PreH45 : (ap_write_window WI index_pre vl_pre )) (PreH46 : (ap_block32_previous ab_pre ib_pre )) (PreH47 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH48 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH49 : (ap_optional_write_window W ab_pre vl_pre )) (PreH50 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH51 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 2 )) ,
  ((&(( &( "b" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p3_pre) (0)) ) ” 
  &&  “ (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p3_pre) (1)) ) ” 
  &&  “ (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p3_pre) (2)) ) ” 
  &&  “ (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p3_pre) (3)) ) ” 
  &&  “ (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p3_pre) (4)) ) ” 
  &&  “ (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p3_pre) (5)) ) ” 
  &&  “ (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p3_pre) (6)) ) ” 
  &&  “ (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p3_pre) (7)) ) ” 
  &&  “ (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p3_pre) (8)) ) ” 
  &&  “ (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p3_pre) (9)) ) ” 
  &&  “ (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p3_pre) (10)) ) ” 
  &&  “ (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p3_pre) (11)) ) ” 
  &&  “ (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p3_pre) (12)) ) ” 
  &&  “ (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p3_pre) (13)) ) ” 
  &&  “ (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p3_pre) (14)) ) ” 
  &&  “ (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p3_pre) (15)) ) ” 
  &&  “ (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p3_pre) (16)) ) ” 
  &&  “ (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p3_pre) (17)) ) ” 
  &&  “ (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p3_pre) (18)) ) ” 
  &&  “ (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p3_pre) (19)) ) ” 
  &&  “ (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p3_pre) (20)) ) ” 
  &&  “ (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p3_pre) (21)) ) ” 
  &&  “ (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p3_pre) (22)) ) ” 
  &&  “ (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p3_pre) (23)) ) ” 
  &&  “ (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p3_pre) (24)) ) ” 
  &&  “ (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p3_pre) (25)) ) ” 
  &&  “ (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p3_pre) (26)) ) ” 
  &&  “ (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p3_pre) (27)) ) ” 
  &&  “ (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p3_pre) (28)) ) ” 
  &&  “ (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p3_pre) (29)) ) ” 
  &&  “ (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p3_pre) (30)) ) ” 
  &&  “ (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p3_pre) (31)) ) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 2 ) ”
  &&  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
  **  (StructPredvfloat32m8_t ( &( "b" ) ) (make_record_vfloat32m8_t (r0) (r1) (r2) (r3) (r4) (r5) (r6) (r7) (r8) (r9) (r10) (r11) (r12) (r13) (r14) (r15) (r16) (r17) (r18) (r19) (r20) (r21) (r22) (r23) (r24) (r25) (r26) (r27) (r28) (r29) (r30) (r31)) )
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
.

Definition ap_rvv_block32_partial_solve_wit_20 := ap_rvv_block32_partial_solve_wit_20_pure -> ap_rvv_block32_partial_solve_wit_20_aux.

Definition ap_rvv_block32_partial_solve_wit_21_pure := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (PreH1 : (0 < vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (ap_window F p0_pre vl_pre )) (PreH4 : (ap_window F p1_pre vl_pre )) (PreH5 : (ap_window F p2_pre vl_pre )) (PreH6 : (ap_window F p3_pre vl_pre )) (PreH7 : (ap_window F p4_pre vl_pre )) (PreH8 : (ap_window F p5_pre vl_pre )) (PreH9 : (ap_window F p6_pre vl_pre )) (PreH10 : (ap_window F p7_pre vl_pre )) (PreH11 : (ap_window F p8_pre vl_pre )) (PreH12 : (ap_write_window W output_pre vl_pre )) (PreH13 : (ap_write_window WI index_pre vl_pre )) (PreH14 : (ap_block32_previous ab_pre ib_pre )) (PreH15 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH16 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH17 : (ap_optional_write_window W ab_pre vl_pre )) (PreH18 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH19 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 3 )) ,
  (UndefStructPredvfloat32m8_t ( &( "b" ) ) )
  **  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "p3" ) )) # Ptr  |-> p3_pre)
  **  ((( &( "p4" ) )) # Ptr  |-> p4_pre)
  **  ((( &( "p5" ) )) # Ptr  |-> p5_pre)
  **  ((( &( "p6" ) )) # Ptr  |-> p6_pre)
  **  ((( &( "p7" ) )) # Ptr  |-> p7_pre)
  **  ((( &( "p8" ) )) # Ptr  |-> p8_pre)
  **  ((( &( "ab" ) )) # Ptr  |-> ab_pre)
  **  ((( &( "ib" ) )) # Ptr  |-> ib_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "index" ) )) # Ptr  |-> index_pre)
  **  ((( &( "idx" ) )) # UInt  |-> idx_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ”
.

Definition ap_rvv_block32_partial_solve_wit_21_aux := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (PreH1 : (0 < vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (ap_window F p0_pre vl_pre )) (PreH4 : (ap_window F p1_pre vl_pre )) (PreH5 : (ap_window F p2_pre vl_pre )) (PreH6 : (ap_window F p3_pre vl_pre )) (PreH7 : (ap_window F p4_pre vl_pre )) (PreH8 : (ap_window F p5_pre vl_pre )) (PreH9 : (ap_window F p6_pre vl_pre )) (PreH10 : (ap_window F p7_pre vl_pre )) (PreH11 : (ap_window F p8_pre vl_pre )) (PreH12 : (ap_write_window W output_pre vl_pre )) (PreH13 : (ap_write_window WI index_pre vl_pre )) (PreH14 : (ap_block32_previous ab_pre ib_pre )) (PreH15 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH16 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH17 : (ap_optional_write_window W ab_pre vl_pre )) (PreH18 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH19 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 3 )) ,
  (UndefStructPredvfloat32m8_t ( &( "b" ) ) )
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 3 ) ”
  &&  (ap_data F )
  **  (UndefStructPredvfloat32m8_t ( &( "b" ) ) )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
.

Definition ap_rvv_block32_partial_solve_wit_21 := ap_rvv_block32_partial_solve_wit_21_pure -> ap_rvv_block32_partial_solve_wit_21_aux.

Definition ap_rvv_block32_partial_solve_wit_22 := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (retval: Z) (PreH1 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p4_pre) (0)) )) (PreH2 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p4_pre) (1)) )) (PreH3 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p4_pre) (2)) )) (PreH4 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p4_pre) (3)) )) (PreH5 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p4_pre) (4)) )) (PreH6 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p4_pre) (5)) )) (PreH7 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p4_pre) (6)) )) (PreH8 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p4_pre) (7)) )) (PreH9 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p4_pre) (8)) )) (PreH10 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p4_pre) (9)) )) (PreH11 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p4_pre) (10)) )) (PreH12 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p4_pre) (11)) )) (PreH13 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p4_pre) (12)) )) (PreH14 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p4_pre) (13)) )) (PreH15 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p4_pre) (14)) )) (PreH16 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p4_pre) (15)) )) (PreH17 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p4_pre) (16)) )) (PreH18 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p4_pre) (17)) )) (PreH19 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p4_pre) (18)) )) (PreH20 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p4_pre) (19)) )) (PreH21 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p4_pre) (20)) )) (PreH22 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p4_pre) (21)) )) (PreH23 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p4_pre) (22)) )) (PreH24 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p4_pre) (23)) )) (PreH25 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p4_pre) (24)) )) (PreH26 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p4_pre) (25)) )) (PreH27 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p4_pre) (26)) )) (PreH28 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p4_pre) (27)) )) (PreH29 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p4_pre) (28)) )) (PreH30 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p4_pre) (29)) )) (PreH31 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p4_pre) (30)) )) (PreH32 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p4_pre) (31)) )) (PreH33 : (0 < vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (ap_window F p0_pre vl_pre )) (PreH36 : (ap_window F p1_pre vl_pre )) (PreH37 : (ap_window F p2_pre vl_pre )) (PreH38 : (ap_window F p3_pre vl_pre )) (PreH39 : (ap_window F p4_pre vl_pre )) (PreH40 : (ap_window F p5_pre vl_pre )) (PreH41 : (ap_window F p6_pre vl_pre )) (PreH42 : (ap_window F p7_pre vl_pre )) (PreH43 : (ap_window F p8_pre vl_pre )) (PreH44 : (ap_write_window W output_pre vl_pre )) (PreH45 : (ap_write_window WI index_pre vl_pre )) (PreH46 : (ap_block32_previous ab_pre ib_pre )) (PreH47 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH48 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH49 : (ap_optional_write_window W ab_pre vl_pre )) (PreH50 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH51 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 3 )) ,
  (ap_data F )
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> r0)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> r1)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> r2)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> r3)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> r4)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> r5)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> r6)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> r7)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> r8)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> r9)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> r10)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> r11)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> r12)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> r13)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> r14)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> r15)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> r16)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> r17)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> r18)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> r19)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> r20)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> r21)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> r22)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> r23)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> r24)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> r25)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> r26)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> r27)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> r28)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> r29)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> r30)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> r31)
  **  (UndefStructPredvfloat32m8_t ( &( "b" ) ) )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p4_pre) (0)) ) ” 
  &&  “ (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p4_pre) (1)) ) ” 
  &&  “ (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p4_pre) (2)) ) ” 
  &&  “ (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p4_pre) (3)) ) ” 
  &&  “ (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p4_pre) (4)) ) ” 
  &&  “ (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p4_pre) (5)) ) ” 
  &&  “ (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p4_pre) (6)) ) ” 
  &&  “ (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p4_pre) (7)) ) ” 
  &&  “ (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p4_pre) (8)) ) ” 
  &&  “ (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p4_pre) (9)) ) ” 
  &&  “ (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p4_pre) (10)) ) ” 
  &&  “ (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p4_pre) (11)) ) ” 
  &&  “ (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p4_pre) (12)) ) ” 
  &&  “ (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p4_pre) (13)) ) ” 
  &&  “ (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p4_pre) (14)) ) ” 
  &&  “ (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p4_pre) (15)) ) ” 
  &&  “ (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p4_pre) (16)) ) ” 
  &&  “ (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p4_pre) (17)) ) ” 
  &&  “ (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p4_pre) (18)) ) ” 
  &&  “ (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p4_pre) (19)) ) ” 
  &&  “ (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p4_pre) (20)) ) ” 
  &&  “ (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p4_pre) (21)) ) ” 
  &&  “ (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p4_pre) (22)) ) ” 
  &&  “ (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p4_pre) (23)) ) ” 
  &&  “ (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p4_pre) (24)) ) ” 
  &&  “ (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p4_pre) (25)) ) ” 
  &&  “ (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p4_pre) (26)) ) ” 
  &&  “ (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p4_pre) (27)) ) ” 
  &&  “ (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p4_pre) (28)) ) ” 
  &&  “ (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p4_pre) (29)) ) ” 
  &&  “ (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p4_pre) (30)) ) ” 
  &&  “ (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p4_pre) (31)) ) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 3 ) ”
  &&  ((&(( &( "b" ) )->ₛ "s31")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> r0)
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
.

Definition ap_rvv_block32_partial_solve_wit_23_pure := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (PreH1 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p4_pre) (0)) )) (PreH2 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p4_pre) (1)) )) (PreH3 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p4_pre) (2)) )) (PreH4 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p4_pre) (3)) )) (PreH5 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p4_pre) (4)) )) (PreH6 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p4_pre) (5)) )) (PreH7 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p4_pre) (6)) )) (PreH8 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p4_pre) (7)) )) (PreH9 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p4_pre) (8)) )) (PreH10 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p4_pre) (9)) )) (PreH11 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p4_pre) (10)) )) (PreH12 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p4_pre) (11)) )) (PreH13 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p4_pre) (12)) )) (PreH14 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p4_pre) (13)) )) (PreH15 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p4_pre) (14)) )) (PreH16 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p4_pre) (15)) )) (PreH17 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p4_pre) (16)) )) (PreH18 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p4_pre) (17)) )) (PreH19 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p4_pre) (18)) )) (PreH20 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p4_pre) (19)) )) (PreH21 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p4_pre) (20)) )) (PreH22 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p4_pre) (21)) )) (PreH23 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p4_pre) (22)) )) (PreH24 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p4_pre) (23)) )) (PreH25 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p4_pre) (24)) )) (PreH26 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p4_pre) (25)) )) (PreH27 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p4_pre) (26)) )) (PreH28 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p4_pre) (27)) )) (PreH29 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p4_pre) (28)) )) (PreH30 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p4_pre) (29)) )) (PreH31 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p4_pre) (30)) )) (PreH32 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p4_pre) (31)) )) (PreH33 : (0 < vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (ap_window F p0_pre vl_pre )) (PreH36 : (ap_window F p1_pre vl_pre )) (PreH37 : (ap_window F p2_pre vl_pre )) (PreH38 : (ap_window F p3_pre vl_pre )) (PreH39 : (ap_window F p4_pre vl_pre )) (PreH40 : (ap_window F p5_pre vl_pre )) (PreH41 : (ap_window F p6_pre vl_pre )) (PreH42 : (ap_window F p7_pre vl_pre )) (PreH43 : (ap_window F p8_pre vl_pre )) (PreH44 : (ap_write_window W output_pre vl_pre )) (PreH45 : (ap_write_window WI index_pre vl_pre )) (PreH46 : (ap_block32_previous ab_pre ib_pre )) (PreH47 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH48 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH49 : (ap_optional_write_window W ab_pre vl_pre )) (PreH50 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH51 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 3 )) ,
  ((&(( &( "b" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_data F )
  **  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "p3" ) )) # Ptr  |-> p3_pre)
  **  ((( &( "p4" ) )) # Ptr  |-> p4_pre)
  **  ((( &( "p5" ) )) # Ptr  |-> p5_pre)
  **  ((( &( "p6" ) )) # Ptr  |-> p6_pre)
  **  ((( &( "p7" ) )) # Ptr  |-> p7_pre)
  **  ((( &( "p8" ) )) # Ptr  |-> p8_pre)
  **  ((( &( "ab" ) )) # Ptr  |-> ab_pre)
  **  ((( &( "ib" ) )) # Ptr  |-> ib_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "index" ) )) # Ptr  |-> index_pre)
  **  ((( &( "idx" ) )) # UInt  |-> idx_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition ap_rvv_block32_partial_solve_wit_23_aux := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (PreH1 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p4_pre) (0)) )) (PreH2 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p4_pre) (1)) )) (PreH3 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p4_pre) (2)) )) (PreH4 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p4_pre) (3)) )) (PreH5 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p4_pre) (4)) )) (PreH6 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p4_pre) (5)) )) (PreH7 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p4_pre) (6)) )) (PreH8 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p4_pre) (7)) )) (PreH9 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p4_pre) (8)) )) (PreH10 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p4_pre) (9)) )) (PreH11 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p4_pre) (10)) )) (PreH12 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p4_pre) (11)) )) (PreH13 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p4_pre) (12)) )) (PreH14 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p4_pre) (13)) )) (PreH15 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p4_pre) (14)) )) (PreH16 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p4_pre) (15)) )) (PreH17 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p4_pre) (16)) )) (PreH18 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p4_pre) (17)) )) (PreH19 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p4_pre) (18)) )) (PreH20 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p4_pre) (19)) )) (PreH21 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p4_pre) (20)) )) (PreH22 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p4_pre) (21)) )) (PreH23 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p4_pre) (22)) )) (PreH24 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p4_pre) (23)) )) (PreH25 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p4_pre) (24)) )) (PreH26 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p4_pre) (25)) )) (PreH27 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p4_pre) (26)) )) (PreH28 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p4_pre) (27)) )) (PreH29 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p4_pre) (28)) )) (PreH30 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p4_pre) (29)) )) (PreH31 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p4_pre) (30)) )) (PreH32 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p4_pre) (31)) )) (PreH33 : (0 < vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (ap_window F p0_pre vl_pre )) (PreH36 : (ap_window F p1_pre vl_pre )) (PreH37 : (ap_window F p2_pre vl_pre )) (PreH38 : (ap_window F p3_pre vl_pre )) (PreH39 : (ap_window F p4_pre vl_pre )) (PreH40 : (ap_window F p5_pre vl_pre )) (PreH41 : (ap_window F p6_pre vl_pre )) (PreH42 : (ap_window F p7_pre vl_pre )) (PreH43 : (ap_window F p8_pre vl_pre )) (PreH44 : (ap_write_window W output_pre vl_pre )) (PreH45 : (ap_write_window WI index_pre vl_pre )) (PreH46 : (ap_block32_previous ab_pre ib_pre )) (PreH47 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH48 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH49 : (ap_optional_write_window W ab_pre vl_pre )) (PreH50 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH51 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 3 )) ,
  ((&(( &( "b" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p4_pre) (0)) ) ” 
  &&  “ (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p4_pre) (1)) ) ” 
  &&  “ (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p4_pre) (2)) ) ” 
  &&  “ (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p4_pre) (3)) ) ” 
  &&  “ (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p4_pre) (4)) ) ” 
  &&  “ (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p4_pre) (5)) ) ” 
  &&  “ (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p4_pre) (6)) ) ” 
  &&  “ (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p4_pre) (7)) ) ” 
  &&  “ (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p4_pre) (8)) ) ” 
  &&  “ (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p4_pre) (9)) ) ” 
  &&  “ (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p4_pre) (10)) ) ” 
  &&  “ (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p4_pre) (11)) ) ” 
  &&  “ (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p4_pre) (12)) ) ” 
  &&  “ (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p4_pre) (13)) ) ” 
  &&  “ (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p4_pre) (14)) ) ” 
  &&  “ (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p4_pre) (15)) ) ” 
  &&  “ (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p4_pre) (16)) ) ” 
  &&  “ (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p4_pre) (17)) ) ” 
  &&  “ (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p4_pre) (18)) ) ” 
  &&  “ (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p4_pre) (19)) ) ” 
  &&  “ (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p4_pre) (20)) ) ” 
  &&  “ (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p4_pre) (21)) ) ” 
  &&  “ (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p4_pre) (22)) ) ” 
  &&  “ (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p4_pre) (23)) ) ” 
  &&  “ (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p4_pre) (24)) ) ” 
  &&  “ (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p4_pre) (25)) ) ” 
  &&  “ (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p4_pre) (26)) ) ” 
  &&  “ (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p4_pre) (27)) ) ” 
  &&  “ (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p4_pre) (28)) ) ” 
  &&  “ (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p4_pre) (29)) ) ” 
  &&  “ (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p4_pre) (30)) ) ” 
  &&  “ (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p4_pre) (31)) ) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 3 ) ”
  &&  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
  **  (StructPredvfloat32m8_t ( &( "b" ) ) (make_record_vfloat32m8_t (r0) (r1) (r2) (r3) (r4) (r5) (r6) (r7) (r8) (r9) (r10) (r11) (r12) (r13) (r14) (r15) (r16) (r17) (r18) (r19) (r20) (r21) (r22) (r23) (r24) (r25) (r26) (r27) (r28) (r29) (r30) (r31)) )
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
.

Definition ap_rvv_block32_partial_solve_wit_23 := ap_rvv_block32_partial_solve_wit_23_pure -> ap_rvv_block32_partial_solve_wit_23_aux.

Definition ap_rvv_block32_partial_solve_wit_24_pure := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (PreH1 : (0 < vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (ap_window F p0_pre vl_pre )) (PreH4 : (ap_window F p1_pre vl_pre )) (PreH5 : (ap_window F p2_pre vl_pre )) (PreH6 : (ap_window F p3_pre vl_pre )) (PreH7 : (ap_window F p4_pre vl_pre )) (PreH8 : (ap_window F p5_pre vl_pre )) (PreH9 : (ap_window F p6_pre vl_pre )) (PreH10 : (ap_window F p7_pre vl_pre )) (PreH11 : (ap_window F p8_pre vl_pre )) (PreH12 : (ap_write_window W output_pre vl_pre )) (PreH13 : (ap_write_window WI index_pre vl_pre )) (PreH14 : (ap_block32_previous ab_pre ib_pre )) (PreH15 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH16 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH17 : (ap_optional_write_window W ab_pre vl_pre )) (PreH18 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH19 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 4 )) ,
  (UndefStructPredvfloat32m8_t ( &( "b" ) ) )
  **  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "p3" ) )) # Ptr  |-> p3_pre)
  **  ((( &( "p4" ) )) # Ptr  |-> p4_pre)
  **  ((( &( "p5" ) )) # Ptr  |-> p5_pre)
  **  ((( &( "p6" ) )) # Ptr  |-> p6_pre)
  **  ((( &( "p7" ) )) # Ptr  |-> p7_pre)
  **  ((( &( "p8" ) )) # Ptr  |-> p8_pre)
  **  ((( &( "ab" ) )) # Ptr  |-> ab_pre)
  **  ((( &( "ib" ) )) # Ptr  |-> ib_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "index" ) )) # Ptr  |-> index_pre)
  **  ((( &( "idx" ) )) # UInt  |-> idx_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ”
.

Definition ap_rvv_block32_partial_solve_wit_24_aux := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (PreH1 : (0 < vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (ap_window F p0_pre vl_pre )) (PreH4 : (ap_window F p1_pre vl_pre )) (PreH5 : (ap_window F p2_pre vl_pre )) (PreH6 : (ap_window F p3_pre vl_pre )) (PreH7 : (ap_window F p4_pre vl_pre )) (PreH8 : (ap_window F p5_pre vl_pre )) (PreH9 : (ap_window F p6_pre vl_pre )) (PreH10 : (ap_window F p7_pre vl_pre )) (PreH11 : (ap_window F p8_pre vl_pre )) (PreH12 : (ap_write_window W output_pre vl_pre )) (PreH13 : (ap_write_window WI index_pre vl_pre )) (PreH14 : (ap_block32_previous ab_pre ib_pre )) (PreH15 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH16 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH17 : (ap_optional_write_window W ab_pre vl_pre )) (PreH18 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH19 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 4 )) ,
  (UndefStructPredvfloat32m8_t ( &( "b" ) ) )
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 4 ) ”
  &&  (ap_data F )
  **  (UndefStructPredvfloat32m8_t ( &( "b" ) ) )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
.

Definition ap_rvv_block32_partial_solve_wit_24 := ap_rvv_block32_partial_solve_wit_24_pure -> ap_rvv_block32_partial_solve_wit_24_aux.

Definition ap_rvv_block32_partial_solve_wit_25 := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (retval: Z) (PreH1 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p5_pre) (0)) )) (PreH2 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p5_pre) (1)) )) (PreH3 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p5_pre) (2)) )) (PreH4 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p5_pre) (3)) )) (PreH5 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p5_pre) (4)) )) (PreH6 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p5_pre) (5)) )) (PreH7 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p5_pre) (6)) )) (PreH8 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p5_pre) (7)) )) (PreH9 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p5_pre) (8)) )) (PreH10 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p5_pre) (9)) )) (PreH11 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p5_pre) (10)) )) (PreH12 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p5_pre) (11)) )) (PreH13 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p5_pre) (12)) )) (PreH14 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p5_pre) (13)) )) (PreH15 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p5_pre) (14)) )) (PreH16 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p5_pre) (15)) )) (PreH17 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p5_pre) (16)) )) (PreH18 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p5_pre) (17)) )) (PreH19 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p5_pre) (18)) )) (PreH20 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p5_pre) (19)) )) (PreH21 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p5_pre) (20)) )) (PreH22 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p5_pre) (21)) )) (PreH23 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p5_pre) (22)) )) (PreH24 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p5_pre) (23)) )) (PreH25 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p5_pre) (24)) )) (PreH26 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p5_pre) (25)) )) (PreH27 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p5_pre) (26)) )) (PreH28 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p5_pre) (27)) )) (PreH29 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p5_pre) (28)) )) (PreH30 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p5_pre) (29)) )) (PreH31 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p5_pre) (30)) )) (PreH32 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p5_pre) (31)) )) (PreH33 : (0 < vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (ap_window F p0_pre vl_pre )) (PreH36 : (ap_window F p1_pre vl_pre )) (PreH37 : (ap_window F p2_pre vl_pre )) (PreH38 : (ap_window F p3_pre vl_pre )) (PreH39 : (ap_window F p4_pre vl_pre )) (PreH40 : (ap_window F p5_pre vl_pre )) (PreH41 : (ap_window F p6_pre vl_pre )) (PreH42 : (ap_window F p7_pre vl_pre )) (PreH43 : (ap_window F p8_pre vl_pre )) (PreH44 : (ap_write_window W output_pre vl_pre )) (PreH45 : (ap_write_window WI index_pre vl_pre )) (PreH46 : (ap_block32_previous ab_pre ib_pre )) (PreH47 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH48 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH49 : (ap_optional_write_window W ab_pre vl_pre )) (PreH50 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH51 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 4 )) ,
  (ap_data F )
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> r0)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> r1)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> r2)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> r3)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> r4)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> r5)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> r6)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> r7)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> r8)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> r9)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> r10)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> r11)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> r12)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> r13)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> r14)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> r15)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> r16)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> r17)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> r18)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> r19)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> r20)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> r21)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> r22)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> r23)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> r24)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> r25)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> r26)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> r27)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> r28)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> r29)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> r30)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> r31)
  **  (UndefStructPredvfloat32m8_t ( &( "b" ) ) )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p5_pre) (0)) ) ” 
  &&  “ (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p5_pre) (1)) ) ” 
  &&  “ (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p5_pre) (2)) ) ” 
  &&  “ (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p5_pre) (3)) ) ” 
  &&  “ (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p5_pre) (4)) ) ” 
  &&  “ (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p5_pre) (5)) ) ” 
  &&  “ (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p5_pre) (6)) ) ” 
  &&  “ (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p5_pre) (7)) ) ” 
  &&  “ (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p5_pre) (8)) ) ” 
  &&  “ (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p5_pre) (9)) ) ” 
  &&  “ (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p5_pre) (10)) ) ” 
  &&  “ (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p5_pre) (11)) ) ” 
  &&  “ (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p5_pre) (12)) ) ” 
  &&  “ (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p5_pre) (13)) ) ” 
  &&  “ (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p5_pre) (14)) ) ” 
  &&  “ (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p5_pre) (15)) ) ” 
  &&  “ (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p5_pre) (16)) ) ” 
  &&  “ (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p5_pre) (17)) ) ” 
  &&  “ (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p5_pre) (18)) ) ” 
  &&  “ (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p5_pre) (19)) ) ” 
  &&  “ (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p5_pre) (20)) ) ” 
  &&  “ (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p5_pre) (21)) ) ” 
  &&  “ (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p5_pre) (22)) ) ” 
  &&  “ (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p5_pre) (23)) ) ” 
  &&  “ (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p5_pre) (24)) ) ” 
  &&  “ (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p5_pre) (25)) ) ” 
  &&  “ (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p5_pre) (26)) ) ” 
  &&  “ (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p5_pre) (27)) ) ” 
  &&  “ (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p5_pre) (28)) ) ” 
  &&  “ (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p5_pre) (29)) ) ” 
  &&  “ (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p5_pre) (30)) ) ” 
  &&  “ (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p5_pre) (31)) ) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 4 ) ”
  &&  ((&(( &( "b" ) )->ₛ "s31")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> r0)
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
.

Definition ap_rvv_block32_partial_solve_wit_26_pure := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (PreH1 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p5_pre) (0)) )) (PreH2 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p5_pre) (1)) )) (PreH3 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p5_pre) (2)) )) (PreH4 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p5_pre) (3)) )) (PreH5 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p5_pre) (4)) )) (PreH6 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p5_pre) (5)) )) (PreH7 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p5_pre) (6)) )) (PreH8 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p5_pre) (7)) )) (PreH9 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p5_pre) (8)) )) (PreH10 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p5_pre) (9)) )) (PreH11 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p5_pre) (10)) )) (PreH12 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p5_pre) (11)) )) (PreH13 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p5_pre) (12)) )) (PreH14 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p5_pre) (13)) )) (PreH15 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p5_pre) (14)) )) (PreH16 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p5_pre) (15)) )) (PreH17 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p5_pre) (16)) )) (PreH18 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p5_pre) (17)) )) (PreH19 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p5_pre) (18)) )) (PreH20 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p5_pre) (19)) )) (PreH21 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p5_pre) (20)) )) (PreH22 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p5_pre) (21)) )) (PreH23 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p5_pre) (22)) )) (PreH24 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p5_pre) (23)) )) (PreH25 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p5_pre) (24)) )) (PreH26 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p5_pre) (25)) )) (PreH27 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p5_pre) (26)) )) (PreH28 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p5_pre) (27)) )) (PreH29 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p5_pre) (28)) )) (PreH30 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p5_pre) (29)) )) (PreH31 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p5_pre) (30)) )) (PreH32 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p5_pre) (31)) )) (PreH33 : (0 < vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (ap_window F p0_pre vl_pre )) (PreH36 : (ap_window F p1_pre vl_pre )) (PreH37 : (ap_window F p2_pre vl_pre )) (PreH38 : (ap_window F p3_pre vl_pre )) (PreH39 : (ap_window F p4_pre vl_pre )) (PreH40 : (ap_window F p5_pre vl_pre )) (PreH41 : (ap_window F p6_pre vl_pre )) (PreH42 : (ap_window F p7_pre vl_pre )) (PreH43 : (ap_window F p8_pre vl_pre )) (PreH44 : (ap_write_window W output_pre vl_pre )) (PreH45 : (ap_write_window WI index_pre vl_pre )) (PreH46 : (ap_block32_previous ab_pre ib_pre )) (PreH47 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH48 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH49 : (ap_optional_write_window W ab_pre vl_pre )) (PreH50 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH51 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 4 )) ,
  ((&(( &( "b" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_data F )
  **  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "p3" ) )) # Ptr  |-> p3_pre)
  **  ((( &( "p4" ) )) # Ptr  |-> p4_pre)
  **  ((( &( "p5" ) )) # Ptr  |-> p5_pre)
  **  ((( &( "p6" ) )) # Ptr  |-> p6_pre)
  **  ((( &( "p7" ) )) # Ptr  |-> p7_pre)
  **  ((( &( "p8" ) )) # Ptr  |-> p8_pre)
  **  ((( &( "ab" ) )) # Ptr  |-> ab_pre)
  **  ((( &( "ib" ) )) # Ptr  |-> ib_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "index" ) )) # Ptr  |-> index_pre)
  **  ((( &( "idx" ) )) # UInt  |-> idx_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition ap_rvv_block32_partial_solve_wit_26_aux := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (PreH1 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p5_pre) (0)) )) (PreH2 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p5_pre) (1)) )) (PreH3 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p5_pre) (2)) )) (PreH4 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p5_pre) (3)) )) (PreH5 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p5_pre) (4)) )) (PreH6 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p5_pre) (5)) )) (PreH7 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p5_pre) (6)) )) (PreH8 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p5_pre) (7)) )) (PreH9 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p5_pre) (8)) )) (PreH10 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p5_pre) (9)) )) (PreH11 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p5_pre) (10)) )) (PreH12 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p5_pre) (11)) )) (PreH13 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p5_pre) (12)) )) (PreH14 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p5_pre) (13)) )) (PreH15 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p5_pre) (14)) )) (PreH16 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p5_pre) (15)) )) (PreH17 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p5_pre) (16)) )) (PreH18 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p5_pre) (17)) )) (PreH19 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p5_pre) (18)) )) (PreH20 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p5_pre) (19)) )) (PreH21 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p5_pre) (20)) )) (PreH22 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p5_pre) (21)) )) (PreH23 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p5_pre) (22)) )) (PreH24 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p5_pre) (23)) )) (PreH25 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p5_pre) (24)) )) (PreH26 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p5_pre) (25)) )) (PreH27 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p5_pre) (26)) )) (PreH28 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p5_pre) (27)) )) (PreH29 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p5_pre) (28)) )) (PreH30 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p5_pre) (29)) )) (PreH31 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p5_pre) (30)) )) (PreH32 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p5_pre) (31)) )) (PreH33 : (0 < vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (ap_window F p0_pre vl_pre )) (PreH36 : (ap_window F p1_pre vl_pre )) (PreH37 : (ap_window F p2_pre vl_pre )) (PreH38 : (ap_window F p3_pre vl_pre )) (PreH39 : (ap_window F p4_pre vl_pre )) (PreH40 : (ap_window F p5_pre vl_pre )) (PreH41 : (ap_window F p6_pre vl_pre )) (PreH42 : (ap_window F p7_pre vl_pre )) (PreH43 : (ap_window F p8_pre vl_pre )) (PreH44 : (ap_write_window W output_pre vl_pre )) (PreH45 : (ap_write_window WI index_pre vl_pre )) (PreH46 : (ap_block32_previous ab_pre ib_pre )) (PreH47 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH48 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH49 : (ap_optional_write_window W ab_pre vl_pre )) (PreH50 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH51 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 4 )) ,
  ((&(( &( "b" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p5_pre) (0)) ) ” 
  &&  “ (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p5_pre) (1)) ) ” 
  &&  “ (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p5_pre) (2)) ) ” 
  &&  “ (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p5_pre) (3)) ) ” 
  &&  “ (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p5_pre) (4)) ) ” 
  &&  “ (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p5_pre) (5)) ) ” 
  &&  “ (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p5_pre) (6)) ) ” 
  &&  “ (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p5_pre) (7)) ) ” 
  &&  “ (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p5_pre) (8)) ) ” 
  &&  “ (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p5_pre) (9)) ) ” 
  &&  “ (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p5_pre) (10)) ) ” 
  &&  “ (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p5_pre) (11)) ) ” 
  &&  “ (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p5_pre) (12)) ) ” 
  &&  “ (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p5_pre) (13)) ) ” 
  &&  “ (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p5_pre) (14)) ) ” 
  &&  “ (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p5_pre) (15)) ) ” 
  &&  “ (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p5_pre) (16)) ) ” 
  &&  “ (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p5_pre) (17)) ) ” 
  &&  “ (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p5_pre) (18)) ) ” 
  &&  “ (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p5_pre) (19)) ) ” 
  &&  “ (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p5_pre) (20)) ) ” 
  &&  “ (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p5_pre) (21)) ) ” 
  &&  “ (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p5_pre) (22)) ) ” 
  &&  “ (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p5_pre) (23)) ) ” 
  &&  “ (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p5_pre) (24)) ) ” 
  &&  “ (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p5_pre) (25)) ) ” 
  &&  “ (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p5_pre) (26)) ) ” 
  &&  “ (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p5_pre) (27)) ) ” 
  &&  “ (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p5_pre) (28)) ) ” 
  &&  “ (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p5_pre) (29)) ) ” 
  &&  “ (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p5_pre) (30)) ) ” 
  &&  “ (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p5_pre) (31)) ) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 4 ) ”
  &&  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
  **  (StructPredvfloat32m8_t ( &( "b" ) ) (make_record_vfloat32m8_t (r0) (r1) (r2) (r3) (r4) (r5) (r6) (r7) (r8) (r9) (r10) (r11) (r12) (r13) (r14) (r15) (r16) (r17) (r18) (r19) (r20) (r21) (r22) (r23) (r24) (r25) (r26) (r27) (r28) (r29) (r30) (r31)) )
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
.

Definition ap_rvv_block32_partial_solve_wit_26 := ap_rvv_block32_partial_solve_wit_26_pure -> ap_rvv_block32_partial_solve_wit_26_aux.

Definition ap_rvv_block32_partial_solve_wit_27_pure := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (PreH1 : (0 < vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (ap_window F p0_pre vl_pre )) (PreH4 : (ap_window F p1_pre vl_pre )) (PreH5 : (ap_window F p2_pre vl_pre )) (PreH6 : (ap_window F p3_pre vl_pre )) (PreH7 : (ap_window F p4_pre vl_pre )) (PreH8 : (ap_window F p5_pre vl_pre )) (PreH9 : (ap_window F p6_pre vl_pre )) (PreH10 : (ap_window F p7_pre vl_pre )) (PreH11 : (ap_window F p8_pre vl_pre )) (PreH12 : (ap_write_window W output_pre vl_pre )) (PreH13 : (ap_write_window WI index_pre vl_pre )) (PreH14 : (ap_block32_previous ab_pre ib_pre )) (PreH15 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH16 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH17 : (ap_optional_write_window W ab_pre vl_pre )) (PreH18 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH19 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 5 )) ,
  (UndefStructPredvfloat32m8_t ( &( "b" ) ) )
  **  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "p3" ) )) # Ptr  |-> p3_pre)
  **  ((( &( "p4" ) )) # Ptr  |-> p4_pre)
  **  ((( &( "p5" ) )) # Ptr  |-> p5_pre)
  **  ((( &( "p6" ) )) # Ptr  |-> p6_pre)
  **  ((( &( "p7" ) )) # Ptr  |-> p7_pre)
  **  ((( &( "p8" ) )) # Ptr  |-> p8_pre)
  **  ((( &( "ab" ) )) # Ptr  |-> ab_pre)
  **  ((( &( "ib" ) )) # Ptr  |-> ib_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "index" ) )) # Ptr  |-> index_pre)
  **  ((( &( "idx" ) )) # UInt  |-> idx_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ”
.

Definition ap_rvv_block32_partial_solve_wit_27_aux := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (PreH1 : (0 < vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (ap_window F p0_pre vl_pre )) (PreH4 : (ap_window F p1_pre vl_pre )) (PreH5 : (ap_window F p2_pre vl_pre )) (PreH6 : (ap_window F p3_pre vl_pre )) (PreH7 : (ap_window F p4_pre vl_pre )) (PreH8 : (ap_window F p5_pre vl_pre )) (PreH9 : (ap_window F p6_pre vl_pre )) (PreH10 : (ap_window F p7_pre vl_pre )) (PreH11 : (ap_window F p8_pre vl_pre )) (PreH12 : (ap_write_window W output_pre vl_pre )) (PreH13 : (ap_write_window WI index_pre vl_pre )) (PreH14 : (ap_block32_previous ab_pre ib_pre )) (PreH15 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH16 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH17 : (ap_optional_write_window W ab_pre vl_pre )) (PreH18 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH19 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 5 )) ,
  (UndefStructPredvfloat32m8_t ( &( "b" ) ) )
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 5 ) ”
  &&  (ap_data F )
  **  (UndefStructPredvfloat32m8_t ( &( "b" ) ) )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
.

Definition ap_rvv_block32_partial_solve_wit_27 := ap_rvv_block32_partial_solve_wit_27_pure -> ap_rvv_block32_partial_solve_wit_27_aux.

Definition ap_rvv_block32_partial_solve_wit_28 := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (retval: Z) (PreH1 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p6_pre) (0)) )) (PreH2 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p6_pre) (1)) )) (PreH3 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p6_pre) (2)) )) (PreH4 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p6_pre) (3)) )) (PreH5 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p6_pre) (4)) )) (PreH6 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p6_pre) (5)) )) (PreH7 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p6_pre) (6)) )) (PreH8 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p6_pre) (7)) )) (PreH9 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p6_pre) (8)) )) (PreH10 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p6_pre) (9)) )) (PreH11 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p6_pre) (10)) )) (PreH12 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p6_pre) (11)) )) (PreH13 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p6_pre) (12)) )) (PreH14 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p6_pre) (13)) )) (PreH15 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p6_pre) (14)) )) (PreH16 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p6_pre) (15)) )) (PreH17 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p6_pre) (16)) )) (PreH18 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p6_pre) (17)) )) (PreH19 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p6_pre) (18)) )) (PreH20 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p6_pre) (19)) )) (PreH21 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p6_pre) (20)) )) (PreH22 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p6_pre) (21)) )) (PreH23 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p6_pre) (22)) )) (PreH24 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p6_pre) (23)) )) (PreH25 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p6_pre) (24)) )) (PreH26 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p6_pre) (25)) )) (PreH27 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p6_pre) (26)) )) (PreH28 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p6_pre) (27)) )) (PreH29 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p6_pre) (28)) )) (PreH30 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p6_pre) (29)) )) (PreH31 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p6_pre) (30)) )) (PreH32 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p6_pre) (31)) )) (PreH33 : (0 < vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (ap_window F p0_pre vl_pre )) (PreH36 : (ap_window F p1_pre vl_pre )) (PreH37 : (ap_window F p2_pre vl_pre )) (PreH38 : (ap_window F p3_pre vl_pre )) (PreH39 : (ap_window F p4_pre vl_pre )) (PreH40 : (ap_window F p5_pre vl_pre )) (PreH41 : (ap_window F p6_pre vl_pre )) (PreH42 : (ap_window F p7_pre vl_pre )) (PreH43 : (ap_window F p8_pre vl_pre )) (PreH44 : (ap_write_window W output_pre vl_pre )) (PreH45 : (ap_write_window WI index_pre vl_pre )) (PreH46 : (ap_block32_previous ab_pre ib_pre )) (PreH47 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH48 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH49 : (ap_optional_write_window W ab_pre vl_pre )) (PreH50 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH51 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 5 )) ,
  (ap_data F )
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> r0)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> r1)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> r2)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> r3)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> r4)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> r5)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> r6)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> r7)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> r8)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> r9)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> r10)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> r11)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> r12)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> r13)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> r14)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> r15)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> r16)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> r17)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> r18)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> r19)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> r20)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> r21)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> r22)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> r23)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> r24)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> r25)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> r26)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> r27)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> r28)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> r29)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> r30)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> r31)
  **  (UndefStructPredvfloat32m8_t ( &( "b" ) ) )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p6_pre) (0)) ) ” 
  &&  “ (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p6_pre) (1)) ) ” 
  &&  “ (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p6_pre) (2)) ) ” 
  &&  “ (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p6_pre) (3)) ) ” 
  &&  “ (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p6_pre) (4)) ) ” 
  &&  “ (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p6_pre) (5)) ) ” 
  &&  “ (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p6_pre) (6)) ) ” 
  &&  “ (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p6_pre) (7)) ) ” 
  &&  “ (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p6_pre) (8)) ) ” 
  &&  “ (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p6_pre) (9)) ) ” 
  &&  “ (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p6_pre) (10)) ) ” 
  &&  “ (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p6_pre) (11)) ) ” 
  &&  “ (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p6_pre) (12)) ) ” 
  &&  “ (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p6_pre) (13)) ) ” 
  &&  “ (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p6_pre) (14)) ) ” 
  &&  “ (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p6_pre) (15)) ) ” 
  &&  “ (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p6_pre) (16)) ) ” 
  &&  “ (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p6_pre) (17)) ) ” 
  &&  “ (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p6_pre) (18)) ) ” 
  &&  “ (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p6_pre) (19)) ) ” 
  &&  “ (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p6_pre) (20)) ) ” 
  &&  “ (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p6_pre) (21)) ) ” 
  &&  “ (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p6_pre) (22)) ) ” 
  &&  “ (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p6_pre) (23)) ) ” 
  &&  “ (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p6_pre) (24)) ) ” 
  &&  “ (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p6_pre) (25)) ) ” 
  &&  “ (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p6_pre) (26)) ) ” 
  &&  “ (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p6_pre) (27)) ) ” 
  &&  “ (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p6_pre) (28)) ) ” 
  &&  “ (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p6_pre) (29)) ) ” 
  &&  “ (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p6_pre) (30)) ) ” 
  &&  “ (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p6_pre) (31)) ) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 5 ) ”
  &&  ((&(( &( "b" ) )->ₛ "s31")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> r0)
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
.

Definition ap_rvv_block32_partial_solve_wit_29_pure := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (PreH1 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p6_pre) (0)) )) (PreH2 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p6_pre) (1)) )) (PreH3 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p6_pre) (2)) )) (PreH4 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p6_pre) (3)) )) (PreH5 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p6_pre) (4)) )) (PreH6 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p6_pre) (5)) )) (PreH7 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p6_pre) (6)) )) (PreH8 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p6_pre) (7)) )) (PreH9 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p6_pre) (8)) )) (PreH10 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p6_pre) (9)) )) (PreH11 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p6_pre) (10)) )) (PreH12 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p6_pre) (11)) )) (PreH13 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p6_pre) (12)) )) (PreH14 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p6_pre) (13)) )) (PreH15 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p6_pre) (14)) )) (PreH16 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p6_pre) (15)) )) (PreH17 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p6_pre) (16)) )) (PreH18 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p6_pre) (17)) )) (PreH19 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p6_pre) (18)) )) (PreH20 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p6_pre) (19)) )) (PreH21 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p6_pre) (20)) )) (PreH22 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p6_pre) (21)) )) (PreH23 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p6_pre) (22)) )) (PreH24 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p6_pre) (23)) )) (PreH25 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p6_pre) (24)) )) (PreH26 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p6_pre) (25)) )) (PreH27 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p6_pre) (26)) )) (PreH28 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p6_pre) (27)) )) (PreH29 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p6_pre) (28)) )) (PreH30 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p6_pre) (29)) )) (PreH31 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p6_pre) (30)) )) (PreH32 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p6_pre) (31)) )) (PreH33 : (0 < vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (ap_window F p0_pre vl_pre )) (PreH36 : (ap_window F p1_pre vl_pre )) (PreH37 : (ap_window F p2_pre vl_pre )) (PreH38 : (ap_window F p3_pre vl_pre )) (PreH39 : (ap_window F p4_pre vl_pre )) (PreH40 : (ap_window F p5_pre vl_pre )) (PreH41 : (ap_window F p6_pre vl_pre )) (PreH42 : (ap_window F p7_pre vl_pre )) (PreH43 : (ap_window F p8_pre vl_pre )) (PreH44 : (ap_write_window W output_pre vl_pre )) (PreH45 : (ap_write_window WI index_pre vl_pre )) (PreH46 : (ap_block32_previous ab_pre ib_pre )) (PreH47 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH48 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH49 : (ap_optional_write_window W ab_pre vl_pre )) (PreH50 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH51 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 5 )) ,
  ((&(( &( "b" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_data F )
  **  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "p3" ) )) # Ptr  |-> p3_pre)
  **  ((( &( "p4" ) )) # Ptr  |-> p4_pre)
  **  ((( &( "p5" ) )) # Ptr  |-> p5_pre)
  **  ((( &( "p6" ) )) # Ptr  |-> p6_pre)
  **  ((( &( "p7" ) )) # Ptr  |-> p7_pre)
  **  ((( &( "p8" ) )) # Ptr  |-> p8_pre)
  **  ((( &( "ab" ) )) # Ptr  |-> ab_pre)
  **  ((( &( "ib" ) )) # Ptr  |-> ib_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "index" ) )) # Ptr  |-> index_pre)
  **  ((( &( "idx" ) )) # UInt  |-> idx_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition ap_rvv_block32_partial_solve_wit_29_aux := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (PreH1 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p6_pre) (0)) )) (PreH2 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p6_pre) (1)) )) (PreH3 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p6_pre) (2)) )) (PreH4 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p6_pre) (3)) )) (PreH5 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p6_pre) (4)) )) (PreH6 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p6_pre) (5)) )) (PreH7 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p6_pre) (6)) )) (PreH8 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p6_pre) (7)) )) (PreH9 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p6_pre) (8)) )) (PreH10 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p6_pre) (9)) )) (PreH11 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p6_pre) (10)) )) (PreH12 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p6_pre) (11)) )) (PreH13 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p6_pre) (12)) )) (PreH14 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p6_pre) (13)) )) (PreH15 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p6_pre) (14)) )) (PreH16 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p6_pre) (15)) )) (PreH17 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p6_pre) (16)) )) (PreH18 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p6_pre) (17)) )) (PreH19 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p6_pre) (18)) )) (PreH20 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p6_pre) (19)) )) (PreH21 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p6_pre) (20)) )) (PreH22 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p6_pre) (21)) )) (PreH23 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p6_pre) (22)) )) (PreH24 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p6_pre) (23)) )) (PreH25 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p6_pre) (24)) )) (PreH26 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p6_pre) (25)) )) (PreH27 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p6_pre) (26)) )) (PreH28 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p6_pre) (27)) )) (PreH29 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p6_pre) (28)) )) (PreH30 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p6_pre) (29)) )) (PreH31 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p6_pre) (30)) )) (PreH32 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p6_pre) (31)) )) (PreH33 : (0 < vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (ap_window F p0_pre vl_pre )) (PreH36 : (ap_window F p1_pre vl_pre )) (PreH37 : (ap_window F p2_pre vl_pre )) (PreH38 : (ap_window F p3_pre vl_pre )) (PreH39 : (ap_window F p4_pre vl_pre )) (PreH40 : (ap_window F p5_pre vl_pre )) (PreH41 : (ap_window F p6_pre vl_pre )) (PreH42 : (ap_window F p7_pre vl_pre )) (PreH43 : (ap_window F p8_pre vl_pre )) (PreH44 : (ap_write_window W output_pre vl_pre )) (PreH45 : (ap_write_window WI index_pre vl_pre )) (PreH46 : (ap_block32_previous ab_pre ib_pre )) (PreH47 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH48 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH49 : (ap_optional_write_window W ab_pre vl_pre )) (PreH50 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH51 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 5 )) ,
  ((&(( &( "b" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p6_pre) (0)) ) ” 
  &&  “ (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p6_pre) (1)) ) ” 
  &&  “ (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p6_pre) (2)) ) ” 
  &&  “ (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p6_pre) (3)) ) ” 
  &&  “ (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p6_pre) (4)) ) ” 
  &&  “ (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p6_pre) (5)) ) ” 
  &&  “ (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p6_pre) (6)) ) ” 
  &&  “ (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p6_pre) (7)) ) ” 
  &&  “ (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p6_pre) (8)) ) ” 
  &&  “ (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p6_pre) (9)) ) ” 
  &&  “ (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p6_pre) (10)) ) ” 
  &&  “ (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p6_pre) (11)) ) ” 
  &&  “ (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p6_pre) (12)) ) ” 
  &&  “ (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p6_pre) (13)) ) ” 
  &&  “ (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p6_pre) (14)) ) ” 
  &&  “ (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p6_pre) (15)) ) ” 
  &&  “ (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p6_pre) (16)) ) ” 
  &&  “ (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p6_pre) (17)) ) ” 
  &&  “ (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p6_pre) (18)) ) ” 
  &&  “ (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p6_pre) (19)) ) ” 
  &&  “ (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p6_pre) (20)) ) ” 
  &&  “ (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p6_pre) (21)) ) ” 
  &&  “ (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p6_pre) (22)) ) ” 
  &&  “ (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p6_pre) (23)) ) ” 
  &&  “ (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p6_pre) (24)) ) ” 
  &&  “ (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p6_pre) (25)) ) ” 
  &&  “ (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p6_pre) (26)) ) ” 
  &&  “ (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p6_pre) (27)) ) ” 
  &&  “ (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p6_pre) (28)) ) ” 
  &&  “ (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p6_pre) (29)) ) ” 
  &&  “ (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p6_pre) (30)) ) ” 
  &&  “ (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p6_pre) (31)) ) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 5 ) ”
  &&  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
  **  (StructPredvfloat32m8_t ( &( "b" ) ) (make_record_vfloat32m8_t (r0) (r1) (r2) (r3) (r4) (r5) (r6) (r7) (r8) (r9) (r10) (r11) (r12) (r13) (r14) (r15) (r16) (r17) (r18) (r19) (r20) (r21) (r22) (r23) (r24) (r25) (r26) (r27) (r28) (r29) (r30) (r31)) )
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
.

Definition ap_rvv_block32_partial_solve_wit_29 := ap_rvv_block32_partial_solve_wit_29_pure -> ap_rvv_block32_partial_solve_wit_29_aux.

Definition ap_rvv_block32_partial_solve_wit_30_pure := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (PreH1 : (0 < vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (ap_window F p0_pre vl_pre )) (PreH4 : (ap_window F p1_pre vl_pre )) (PreH5 : (ap_window F p2_pre vl_pre )) (PreH6 : (ap_window F p3_pre vl_pre )) (PreH7 : (ap_window F p4_pre vl_pre )) (PreH8 : (ap_window F p5_pre vl_pre )) (PreH9 : (ap_window F p6_pre vl_pre )) (PreH10 : (ap_window F p7_pre vl_pre )) (PreH11 : (ap_window F p8_pre vl_pre )) (PreH12 : (ap_write_window W output_pre vl_pre )) (PreH13 : (ap_write_window WI index_pre vl_pre )) (PreH14 : (ap_block32_previous ab_pre ib_pre )) (PreH15 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH16 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH17 : (ap_optional_write_window W ab_pre vl_pre )) (PreH18 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH19 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 6 )) ,
  (UndefStructPredvfloat32m8_t ( &( "b" ) ) )
  **  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "p3" ) )) # Ptr  |-> p3_pre)
  **  ((( &( "p4" ) )) # Ptr  |-> p4_pre)
  **  ((( &( "p5" ) )) # Ptr  |-> p5_pre)
  **  ((( &( "p6" ) )) # Ptr  |-> p6_pre)
  **  ((( &( "p7" ) )) # Ptr  |-> p7_pre)
  **  ((( &( "p8" ) )) # Ptr  |-> p8_pre)
  **  ((( &( "ab" ) )) # Ptr  |-> ab_pre)
  **  ((( &( "ib" ) )) # Ptr  |-> ib_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "index" ) )) # Ptr  |-> index_pre)
  **  ((( &( "idx" ) )) # UInt  |-> idx_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ”
.

Definition ap_rvv_block32_partial_solve_wit_30_aux := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (PreH1 : (0 < vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (ap_window F p0_pre vl_pre )) (PreH4 : (ap_window F p1_pre vl_pre )) (PreH5 : (ap_window F p2_pre vl_pre )) (PreH6 : (ap_window F p3_pre vl_pre )) (PreH7 : (ap_window F p4_pre vl_pre )) (PreH8 : (ap_window F p5_pre vl_pre )) (PreH9 : (ap_window F p6_pre vl_pre )) (PreH10 : (ap_window F p7_pre vl_pre )) (PreH11 : (ap_window F p8_pre vl_pre )) (PreH12 : (ap_write_window W output_pre vl_pre )) (PreH13 : (ap_write_window WI index_pre vl_pre )) (PreH14 : (ap_block32_previous ab_pre ib_pre )) (PreH15 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH16 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH17 : (ap_optional_write_window W ab_pre vl_pre )) (PreH18 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH19 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 6 )) ,
  (UndefStructPredvfloat32m8_t ( &( "b" ) ) )
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 6 ) ”
  &&  (ap_data F )
  **  (UndefStructPredvfloat32m8_t ( &( "b" ) ) )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
.

Definition ap_rvv_block32_partial_solve_wit_30 := ap_rvv_block32_partial_solve_wit_30_pure -> ap_rvv_block32_partial_solve_wit_30_aux.

Definition ap_rvv_block32_partial_solve_wit_31 := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (retval: Z) (PreH1 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p7_pre) (0)) )) (PreH2 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p7_pre) (1)) )) (PreH3 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p7_pre) (2)) )) (PreH4 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p7_pre) (3)) )) (PreH5 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p7_pre) (4)) )) (PreH6 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p7_pre) (5)) )) (PreH7 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p7_pre) (6)) )) (PreH8 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p7_pre) (7)) )) (PreH9 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p7_pre) (8)) )) (PreH10 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p7_pre) (9)) )) (PreH11 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p7_pre) (10)) )) (PreH12 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p7_pre) (11)) )) (PreH13 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p7_pre) (12)) )) (PreH14 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p7_pre) (13)) )) (PreH15 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p7_pre) (14)) )) (PreH16 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p7_pre) (15)) )) (PreH17 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p7_pre) (16)) )) (PreH18 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p7_pre) (17)) )) (PreH19 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p7_pre) (18)) )) (PreH20 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p7_pre) (19)) )) (PreH21 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p7_pre) (20)) )) (PreH22 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p7_pre) (21)) )) (PreH23 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p7_pre) (22)) )) (PreH24 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p7_pre) (23)) )) (PreH25 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p7_pre) (24)) )) (PreH26 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p7_pre) (25)) )) (PreH27 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p7_pre) (26)) )) (PreH28 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p7_pre) (27)) )) (PreH29 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p7_pre) (28)) )) (PreH30 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p7_pre) (29)) )) (PreH31 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p7_pre) (30)) )) (PreH32 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p7_pre) (31)) )) (PreH33 : (0 < vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (ap_window F p0_pre vl_pre )) (PreH36 : (ap_window F p1_pre vl_pre )) (PreH37 : (ap_window F p2_pre vl_pre )) (PreH38 : (ap_window F p3_pre vl_pre )) (PreH39 : (ap_window F p4_pre vl_pre )) (PreH40 : (ap_window F p5_pre vl_pre )) (PreH41 : (ap_window F p6_pre vl_pre )) (PreH42 : (ap_window F p7_pre vl_pre )) (PreH43 : (ap_window F p8_pre vl_pre )) (PreH44 : (ap_write_window W output_pre vl_pre )) (PreH45 : (ap_write_window WI index_pre vl_pre )) (PreH46 : (ap_block32_previous ab_pre ib_pre )) (PreH47 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH48 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH49 : (ap_optional_write_window W ab_pre vl_pre )) (PreH50 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH51 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 6 )) ,
  (ap_data F )
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> r0)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> r1)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> r2)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> r3)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> r4)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> r5)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> r6)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> r7)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> r8)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> r9)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> r10)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> r11)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> r12)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> r13)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> r14)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> r15)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> r16)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> r17)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> r18)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> r19)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> r20)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> r21)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> r22)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> r23)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> r24)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> r25)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> r26)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> r27)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> r28)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> r29)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> r30)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> r31)
  **  (UndefStructPredvfloat32m8_t ( &( "b" ) ) )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p7_pre) (0)) ) ” 
  &&  “ (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p7_pre) (1)) ) ” 
  &&  “ (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p7_pre) (2)) ) ” 
  &&  “ (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p7_pre) (3)) ) ” 
  &&  “ (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p7_pre) (4)) ) ” 
  &&  “ (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p7_pre) (5)) ) ” 
  &&  “ (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p7_pre) (6)) ) ” 
  &&  “ (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p7_pre) (7)) ) ” 
  &&  “ (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p7_pre) (8)) ) ” 
  &&  “ (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p7_pre) (9)) ) ” 
  &&  “ (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p7_pre) (10)) ) ” 
  &&  “ (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p7_pre) (11)) ) ” 
  &&  “ (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p7_pre) (12)) ) ” 
  &&  “ (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p7_pre) (13)) ) ” 
  &&  “ (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p7_pre) (14)) ) ” 
  &&  “ (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p7_pre) (15)) ) ” 
  &&  “ (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p7_pre) (16)) ) ” 
  &&  “ (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p7_pre) (17)) ) ” 
  &&  “ (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p7_pre) (18)) ) ” 
  &&  “ (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p7_pre) (19)) ) ” 
  &&  “ (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p7_pre) (20)) ) ” 
  &&  “ (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p7_pre) (21)) ) ” 
  &&  “ (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p7_pre) (22)) ) ” 
  &&  “ (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p7_pre) (23)) ) ” 
  &&  “ (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p7_pre) (24)) ) ” 
  &&  “ (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p7_pre) (25)) ) ” 
  &&  “ (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p7_pre) (26)) ) ” 
  &&  “ (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p7_pre) (27)) ) ” 
  &&  “ (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p7_pre) (28)) ) ” 
  &&  “ (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p7_pre) (29)) ) ” 
  &&  “ (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p7_pre) (30)) ) ” 
  &&  “ (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p7_pre) (31)) ) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 6 ) ”
  &&  ((&(( &( "b" ) )->ₛ "s31")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> r0)
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
.

Definition ap_rvv_block32_partial_solve_wit_32_pure := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (PreH1 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p7_pre) (0)) )) (PreH2 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p7_pre) (1)) )) (PreH3 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p7_pre) (2)) )) (PreH4 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p7_pre) (3)) )) (PreH5 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p7_pre) (4)) )) (PreH6 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p7_pre) (5)) )) (PreH7 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p7_pre) (6)) )) (PreH8 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p7_pre) (7)) )) (PreH9 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p7_pre) (8)) )) (PreH10 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p7_pre) (9)) )) (PreH11 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p7_pre) (10)) )) (PreH12 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p7_pre) (11)) )) (PreH13 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p7_pre) (12)) )) (PreH14 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p7_pre) (13)) )) (PreH15 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p7_pre) (14)) )) (PreH16 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p7_pre) (15)) )) (PreH17 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p7_pre) (16)) )) (PreH18 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p7_pre) (17)) )) (PreH19 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p7_pre) (18)) )) (PreH20 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p7_pre) (19)) )) (PreH21 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p7_pre) (20)) )) (PreH22 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p7_pre) (21)) )) (PreH23 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p7_pre) (22)) )) (PreH24 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p7_pre) (23)) )) (PreH25 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p7_pre) (24)) )) (PreH26 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p7_pre) (25)) )) (PreH27 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p7_pre) (26)) )) (PreH28 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p7_pre) (27)) )) (PreH29 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p7_pre) (28)) )) (PreH30 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p7_pre) (29)) )) (PreH31 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p7_pre) (30)) )) (PreH32 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p7_pre) (31)) )) (PreH33 : (0 < vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (ap_window F p0_pre vl_pre )) (PreH36 : (ap_window F p1_pre vl_pre )) (PreH37 : (ap_window F p2_pre vl_pre )) (PreH38 : (ap_window F p3_pre vl_pre )) (PreH39 : (ap_window F p4_pre vl_pre )) (PreH40 : (ap_window F p5_pre vl_pre )) (PreH41 : (ap_window F p6_pre vl_pre )) (PreH42 : (ap_window F p7_pre vl_pre )) (PreH43 : (ap_window F p8_pre vl_pre )) (PreH44 : (ap_write_window W output_pre vl_pre )) (PreH45 : (ap_write_window WI index_pre vl_pre )) (PreH46 : (ap_block32_previous ab_pre ib_pre )) (PreH47 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH48 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH49 : (ap_optional_write_window W ab_pre vl_pre )) (PreH50 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH51 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 6 )) ,
  ((&(( &( "b" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_data F )
  **  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "p3" ) )) # Ptr  |-> p3_pre)
  **  ((( &( "p4" ) )) # Ptr  |-> p4_pre)
  **  ((( &( "p5" ) )) # Ptr  |-> p5_pre)
  **  ((( &( "p6" ) )) # Ptr  |-> p6_pre)
  **  ((( &( "p7" ) )) # Ptr  |-> p7_pre)
  **  ((( &( "p8" ) )) # Ptr  |-> p8_pre)
  **  ((( &( "ab" ) )) # Ptr  |-> ab_pre)
  **  ((( &( "ib" ) )) # Ptr  |-> ib_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "index" ) )) # Ptr  |-> index_pre)
  **  ((( &( "idx" ) )) # UInt  |-> idx_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition ap_rvv_block32_partial_solve_wit_32_aux := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (PreH1 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p7_pre) (0)) )) (PreH2 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p7_pre) (1)) )) (PreH3 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p7_pre) (2)) )) (PreH4 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p7_pre) (3)) )) (PreH5 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p7_pre) (4)) )) (PreH6 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p7_pre) (5)) )) (PreH7 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p7_pre) (6)) )) (PreH8 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p7_pre) (7)) )) (PreH9 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p7_pre) (8)) )) (PreH10 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p7_pre) (9)) )) (PreH11 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p7_pre) (10)) )) (PreH12 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p7_pre) (11)) )) (PreH13 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p7_pre) (12)) )) (PreH14 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p7_pre) (13)) )) (PreH15 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p7_pre) (14)) )) (PreH16 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p7_pre) (15)) )) (PreH17 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p7_pre) (16)) )) (PreH18 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p7_pre) (17)) )) (PreH19 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p7_pre) (18)) )) (PreH20 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p7_pre) (19)) )) (PreH21 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p7_pre) (20)) )) (PreH22 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p7_pre) (21)) )) (PreH23 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p7_pre) (22)) )) (PreH24 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p7_pre) (23)) )) (PreH25 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p7_pre) (24)) )) (PreH26 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p7_pre) (25)) )) (PreH27 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p7_pre) (26)) )) (PreH28 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p7_pre) (27)) )) (PreH29 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p7_pre) (28)) )) (PreH30 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p7_pre) (29)) )) (PreH31 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p7_pre) (30)) )) (PreH32 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p7_pre) (31)) )) (PreH33 : (0 < vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (ap_window F p0_pre vl_pre )) (PreH36 : (ap_window F p1_pre vl_pre )) (PreH37 : (ap_window F p2_pre vl_pre )) (PreH38 : (ap_window F p3_pre vl_pre )) (PreH39 : (ap_window F p4_pre vl_pre )) (PreH40 : (ap_window F p5_pre vl_pre )) (PreH41 : (ap_window F p6_pre vl_pre )) (PreH42 : (ap_window F p7_pre vl_pre )) (PreH43 : (ap_window F p8_pre vl_pre )) (PreH44 : (ap_write_window W output_pre vl_pre )) (PreH45 : (ap_write_window WI index_pre vl_pre )) (PreH46 : (ap_block32_previous ab_pre ib_pre )) (PreH47 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH48 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH49 : (ap_optional_write_window W ab_pre vl_pre )) (PreH50 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH51 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 6 )) ,
  ((&(( &( "b" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p7_pre) (0)) ) ” 
  &&  “ (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p7_pre) (1)) ) ” 
  &&  “ (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p7_pre) (2)) ) ” 
  &&  “ (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p7_pre) (3)) ) ” 
  &&  “ (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p7_pre) (4)) ) ” 
  &&  “ (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p7_pre) (5)) ) ” 
  &&  “ (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p7_pre) (6)) ) ” 
  &&  “ (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p7_pre) (7)) ) ” 
  &&  “ (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p7_pre) (8)) ) ” 
  &&  “ (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p7_pre) (9)) ) ” 
  &&  “ (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p7_pre) (10)) ) ” 
  &&  “ (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p7_pre) (11)) ) ” 
  &&  “ (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p7_pre) (12)) ) ” 
  &&  “ (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p7_pre) (13)) ) ” 
  &&  “ (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p7_pre) (14)) ) ” 
  &&  “ (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p7_pre) (15)) ) ” 
  &&  “ (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p7_pre) (16)) ) ” 
  &&  “ (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p7_pre) (17)) ) ” 
  &&  “ (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p7_pre) (18)) ) ” 
  &&  “ (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p7_pre) (19)) ) ” 
  &&  “ (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p7_pre) (20)) ) ” 
  &&  “ (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p7_pre) (21)) ) ” 
  &&  “ (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p7_pre) (22)) ) ” 
  &&  “ (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p7_pre) (23)) ) ” 
  &&  “ (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p7_pre) (24)) ) ” 
  &&  “ (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p7_pre) (25)) ) ” 
  &&  “ (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p7_pre) (26)) ) ” 
  &&  “ (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p7_pre) (27)) ) ” 
  &&  “ (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p7_pre) (28)) ) ” 
  &&  “ (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p7_pre) (29)) ) ” 
  &&  “ (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p7_pre) (30)) ) ” 
  &&  “ (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p7_pre) (31)) ) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 6 ) ”
  &&  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
  **  (StructPredvfloat32m8_t ( &( "b" ) ) (make_record_vfloat32m8_t (r0) (r1) (r2) (r3) (r4) (r5) (r6) (r7) (r8) (r9) (r10) (r11) (r12) (r13) (r14) (r15) (r16) (r17) (r18) (r19) (r20) (r21) (r22) (r23) (r24) (r25) (r26) (r27) (r28) (r29) (r30) (r31)) )
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
.

Definition ap_rvv_block32_partial_solve_wit_32 := ap_rvv_block32_partial_solve_wit_32_pure -> ap_rvv_block32_partial_solve_wit_32_aux.

Definition ap_rvv_block32_partial_solve_wit_33_pure := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (PreH1 : (0 < vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (ap_window F p0_pre vl_pre )) (PreH4 : (ap_window F p1_pre vl_pre )) (PreH5 : (ap_window F p2_pre vl_pre )) (PreH6 : (ap_window F p3_pre vl_pre )) (PreH7 : (ap_window F p4_pre vl_pre )) (PreH8 : (ap_window F p5_pre vl_pre )) (PreH9 : (ap_window F p6_pre vl_pre )) (PreH10 : (ap_window F p7_pre vl_pre )) (PreH11 : (ap_window F p8_pre vl_pre )) (PreH12 : (ap_write_window W output_pre vl_pre )) (PreH13 : (ap_write_window WI index_pre vl_pre )) (PreH14 : (ap_block32_previous ab_pre ib_pre )) (PreH15 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH16 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH17 : (ap_optional_write_window W ab_pre vl_pre )) (PreH18 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH19 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 7 )) ,
  (UndefStructPredvfloat32m8_t ( &( "b" ) ) )
  **  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "p3" ) )) # Ptr  |-> p3_pre)
  **  ((( &( "p4" ) )) # Ptr  |-> p4_pre)
  **  ((( &( "p5" ) )) # Ptr  |-> p5_pre)
  **  ((( &( "p6" ) )) # Ptr  |-> p6_pre)
  **  ((( &( "p7" ) )) # Ptr  |-> p7_pre)
  **  ((( &( "p8" ) )) # Ptr  |-> p8_pre)
  **  ((( &( "ab" ) )) # Ptr  |-> ab_pre)
  **  ((( &( "ib" ) )) # Ptr  |-> ib_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "index" ) )) # Ptr  |-> index_pre)
  **  ((( &( "idx" ) )) # UInt  |-> idx_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ”
.

Definition ap_rvv_block32_partial_solve_wit_33_aux := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (PreH1 : (0 < vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (ap_window F p0_pre vl_pre )) (PreH4 : (ap_window F p1_pre vl_pre )) (PreH5 : (ap_window F p2_pre vl_pre )) (PreH6 : (ap_window F p3_pre vl_pre )) (PreH7 : (ap_window F p4_pre vl_pre )) (PreH8 : (ap_window F p5_pre vl_pre )) (PreH9 : (ap_window F p6_pre vl_pre )) (PreH10 : (ap_window F p7_pre vl_pre )) (PreH11 : (ap_window F p8_pre vl_pre )) (PreH12 : (ap_write_window W output_pre vl_pre )) (PreH13 : (ap_write_window WI index_pre vl_pre )) (PreH14 : (ap_block32_previous ab_pre ib_pre )) (PreH15 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH16 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH17 : (ap_optional_write_window W ab_pre vl_pre )) (PreH18 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH19 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 7 )) ,
  (UndefStructPredvfloat32m8_t ( &( "b" ) ) )
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 7 ) ”
  &&  (ap_data F )
  **  (UndefStructPredvfloat32m8_t ( &( "b" ) ) )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
.

Definition ap_rvv_block32_partial_solve_wit_33 := ap_rvv_block32_partial_solve_wit_33_pure -> ap_rvv_block32_partial_solve_wit_33_aux.

Definition ap_rvv_block32_partial_solve_wit_34 := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (retval: Z) (PreH1 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p8_pre) (0)) )) (PreH2 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p8_pre) (1)) )) (PreH3 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p8_pre) (2)) )) (PreH4 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p8_pre) (3)) )) (PreH5 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p8_pre) (4)) )) (PreH6 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p8_pre) (5)) )) (PreH7 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p8_pre) (6)) )) (PreH8 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p8_pre) (7)) )) (PreH9 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p8_pre) (8)) )) (PreH10 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p8_pre) (9)) )) (PreH11 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p8_pre) (10)) )) (PreH12 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p8_pre) (11)) )) (PreH13 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p8_pre) (12)) )) (PreH14 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p8_pre) (13)) )) (PreH15 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p8_pre) (14)) )) (PreH16 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p8_pre) (15)) )) (PreH17 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p8_pre) (16)) )) (PreH18 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p8_pre) (17)) )) (PreH19 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p8_pre) (18)) )) (PreH20 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p8_pre) (19)) )) (PreH21 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p8_pre) (20)) )) (PreH22 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p8_pre) (21)) )) (PreH23 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p8_pre) (22)) )) (PreH24 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p8_pre) (23)) )) (PreH25 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p8_pre) (24)) )) (PreH26 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p8_pre) (25)) )) (PreH27 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p8_pre) (26)) )) (PreH28 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p8_pre) (27)) )) (PreH29 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p8_pre) (28)) )) (PreH30 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p8_pre) (29)) )) (PreH31 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p8_pre) (30)) )) (PreH32 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p8_pre) (31)) )) (PreH33 : (0 < vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (ap_window F p0_pre vl_pre )) (PreH36 : (ap_window F p1_pre vl_pre )) (PreH37 : (ap_window F p2_pre vl_pre )) (PreH38 : (ap_window F p3_pre vl_pre )) (PreH39 : (ap_window F p4_pre vl_pre )) (PreH40 : (ap_window F p5_pre vl_pre )) (PreH41 : (ap_window F p6_pre vl_pre )) (PreH42 : (ap_window F p7_pre vl_pre )) (PreH43 : (ap_window F p8_pre vl_pre )) (PreH44 : (ap_write_window W output_pre vl_pre )) (PreH45 : (ap_write_window WI index_pre vl_pre )) (PreH46 : (ap_block32_previous ab_pre ib_pre )) (PreH47 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH48 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH49 : (ap_optional_write_window W ab_pre vl_pre )) (PreH50 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH51 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 7 )) ,
  (ap_data F )
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> r0)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> r1)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> r2)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> r3)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> r4)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> r5)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> r6)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> r7)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> r8)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> r9)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> r10)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> r11)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> r12)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> r13)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> r14)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> r15)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> r16)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> r17)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> r18)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> r19)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> r20)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> r21)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> r22)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> r23)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> r24)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> r25)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> r26)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> r27)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> r28)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> r29)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> r30)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> r31)
  **  (UndefStructPredvfloat32m8_t ( &( "b" ) ) )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p8_pre) (0)) ) ” 
  &&  “ (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p8_pre) (1)) ) ” 
  &&  “ (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p8_pre) (2)) ) ” 
  &&  “ (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p8_pre) (3)) ) ” 
  &&  “ (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p8_pre) (4)) ) ” 
  &&  “ (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p8_pre) (5)) ) ” 
  &&  “ (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p8_pre) (6)) ) ” 
  &&  “ (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p8_pre) (7)) ) ” 
  &&  “ (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p8_pre) (8)) ) ” 
  &&  “ (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p8_pre) (9)) ) ” 
  &&  “ (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p8_pre) (10)) ) ” 
  &&  “ (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p8_pre) (11)) ) ” 
  &&  “ (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p8_pre) (12)) ) ” 
  &&  “ (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p8_pre) (13)) ) ” 
  &&  “ (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p8_pre) (14)) ) ” 
  &&  “ (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p8_pre) (15)) ) ” 
  &&  “ (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p8_pre) (16)) ) ” 
  &&  “ (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p8_pre) (17)) ) ” 
  &&  “ (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p8_pre) (18)) ) ” 
  &&  “ (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p8_pre) (19)) ) ” 
  &&  “ (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p8_pre) (20)) ) ” 
  &&  “ (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p8_pre) (21)) ) ” 
  &&  “ (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p8_pre) (22)) ) ” 
  &&  “ (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p8_pre) (23)) ) ” 
  &&  “ (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p8_pre) (24)) ) ” 
  &&  “ (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p8_pre) (25)) ) ” 
  &&  “ (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p8_pre) (26)) ) ” 
  &&  “ (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p8_pre) (27)) ) ” 
  &&  “ (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p8_pre) (28)) ) ” 
  &&  “ (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p8_pre) (29)) ) ” 
  &&  “ (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p8_pre) (30)) ) ” 
  &&  “ (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p8_pre) (31)) ) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 7 ) ”
  &&  ((&(( &( "b" ) )->ₛ "s31")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> r0)
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
.

Definition ap_rvv_block32_partial_solve_wit_35_pure := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (PreH1 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p8_pre) (0)) )) (PreH2 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p8_pre) (1)) )) (PreH3 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p8_pre) (2)) )) (PreH4 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p8_pre) (3)) )) (PreH5 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p8_pre) (4)) )) (PreH6 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p8_pre) (5)) )) (PreH7 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p8_pre) (6)) )) (PreH8 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p8_pre) (7)) )) (PreH9 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p8_pre) (8)) )) (PreH10 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p8_pre) (9)) )) (PreH11 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p8_pre) (10)) )) (PreH12 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p8_pre) (11)) )) (PreH13 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p8_pre) (12)) )) (PreH14 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p8_pre) (13)) )) (PreH15 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p8_pre) (14)) )) (PreH16 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p8_pre) (15)) )) (PreH17 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p8_pre) (16)) )) (PreH18 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p8_pre) (17)) )) (PreH19 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p8_pre) (18)) )) (PreH20 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p8_pre) (19)) )) (PreH21 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p8_pre) (20)) )) (PreH22 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p8_pre) (21)) )) (PreH23 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p8_pre) (22)) )) (PreH24 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p8_pre) (23)) )) (PreH25 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p8_pre) (24)) )) (PreH26 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p8_pre) (25)) )) (PreH27 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p8_pre) (26)) )) (PreH28 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p8_pre) (27)) )) (PreH29 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p8_pre) (28)) )) (PreH30 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p8_pre) (29)) )) (PreH31 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p8_pre) (30)) )) (PreH32 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p8_pre) (31)) )) (PreH33 : (0 < vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (ap_window F p0_pre vl_pre )) (PreH36 : (ap_window F p1_pre vl_pre )) (PreH37 : (ap_window F p2_pre vl_pre )) (PreH38 : (ap_window F p3_pre vl_pre )) (PreH39 : (ap_window F p4_pre vl_pre )) (PreH40 : (ap_window F p5_pre vl_pre )) (PreH41 : (ap_window F p6_pre vl_pre )) (PreH42 : (ap_window F p7_pre vl_pre )) (PreH43 : (ap_window F p8_pre vl_pre )) (PreH44 : (ap_write_window W output_pre vl_pre )) (PreH45 : (ap_write_window WI index_pre vl_pre )) (PreH46 : (ap_block32_previous ab_pre ib_pre )) (PreH47 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH48 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH49 : (ap_optional_write_window W ab_pre vl_pre )) (PreH50 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH51 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 7 )) ,
  ((&(( &( "b" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_data F )
  **  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "p3" ) )) # Ptr  |-> p3_pre)
  **  ((( &( "p4" ) )) # Ptr  |-> p4_pre)
  **  ((( &( "p5" ) )) # Ptr  |-> p5_pre)
  **  ((( &( "p6" ) )) # Ptr  |-> p6_pre)
  **  ((( &( "p7" ) )) # Ptr  |-> p7_pre)
  **  ((( &( "p8" ) )) # Ptr  |-> p8_pre)
  **  ((( &( "ab" ) )) # Ptr  |-> ab_pre)
  **  ((( &( "ib" ) )) # Ptr  |-> ib_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "index" ) )) # Ptr  |-> index_pre)
  **  ((( &( "idx" ) )) # UInt  |-> idx_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition ap_rvv_block32_partial_solve_wit_35_aux := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (r31: fp32) (r30: fp32) (r29: fp32) (r28: fp32) (r27: fp32) (r26: fp32) (r25: fp32) (r24: fp32) (r23: fp32) (r22: fp32) (r21: fp32) (r20: fp32) (r19: fp32) (r18: fp32) (r17: fp32) (r16: fp32) (r15: fp32) (r14: fp32) (r13: fp32) (r12: fp32) (r11: fp32) (r10: fp32) (r9: fp32) (r8: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (PreH1 : (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p8_pre) (0)) )) (PreH2 : (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p8_pre) (1)) )) (PreH3 : (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p8_pre) (2)) )) (PreH4 : (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p8_pre) (3)) )) (PreH5 : (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p8_pre) (4)) )) (PreH6 : (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p8_pre) (5)) )) (PreH7 : (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p8_pre) (6)) )) (PreH8 : (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p8_pre) (7)) )) (PreH9 : (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p8_pre) (8)) )) (PreH10 : (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p8_pre) (9)) )) (PreH11 : (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p8_pre) (10)) )) (PreH12 : (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p8_pre) (11)) )) (PreH13 : (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p8_pre) (12)) )) (PreH14 : (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p8_pre) (13)) )) (PreH15 : (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p8_pre) (14)) )) (PreH16 : (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p8_pre) (15)) )) (PreH17 : (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p8_pre) (16)) )) (PreH18 : (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p8_pre) (17)) )) (PreH19 : (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p8_pre) (18)) )) (PreH20 : (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p8_pre) (19)) )) (PreH21 : (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p8_pre) (20)) )) (PreH22 : (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p8_pre) (21)) )) (PreH23 : (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p8_pre) (22)) )) (PreH24 : (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p8_pre) (23)) )) (PreH25 : (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p8_pre) (24)) )) (PreH26 : (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p8_pre) (25)) )) (PreH27 : (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p8_pre) (26)) )) (PreH28 : (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p8_pre) (27)) )) (PreH29 : (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p8_pre) (28)) )) (PreH30 : (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p8_pre) (29)) )) (PreH31 : (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p8_pre) (30)) )) (PreH32 : (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p8_pre) (31)) )) (PreH33 : (0 < vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (ap_window F p0_pre vl_pre )) (PreH36 : (ap_window F p1_pre vl_pre )) (PreH37 : (ap_window F p2_pre vl_pre )) (PreH38 : (ap_window F p3_pre vl_pre )) (PreH39 : (ap_window F p4_pre vl_pre )) (PreH40 : (ap_window F p5_pre vl_pre )) (PreH41 : (ap_window F p6_pre vl_pre )) (PreH42 : (ap_window F p7_pre vl_pre )) (PreH43 : (ap_window F p8_pre vl_pre )) (PreH44 : (ap_write_window W output_pre vl_pre )) (PreH45 : (ap_write_window WI index_pre vl_pre )) (PreH46 : (ap_block32_previous ab_pre ib_pre )) (PreH47 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH48 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH49 : (ap_optional_write_window W ab_pre vl_pre )) (PreH50 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH51 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 7 )) ,
  ((&(( &( "b" ) )->ₛ "s31")) # Float  |-> r31)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |-> r30)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |-> r29)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |-> r28)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |-> r27)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |-> r26)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |-> r25)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |-> r24)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |-> r23)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |-> r22)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |-> r21)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |-> r20)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |-> r19)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |-> r18)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |-> r17)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |-> r16)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> r15)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> r14)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> r13)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> r12)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> r11)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> r10)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> r9)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> r8)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> r7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> r6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> r5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> r4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> r0)
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (apr_float_lane 0 vl_pre r0 (ap_load_lane (F) (p8_pre) (0)) ) ” 
  &&  “ (apr_float_lane 1 vl_pre r1 (ap_load_lane (F) (p8_pre) (1)) ) ” 
  &&  “ (apr_float_lane 2 vl_pre r2 (ap_load_lane (F) (p8_pre) (2)) ) ” 
  &&  “ (apr_float_lane 3 vl_pre r3 (ap_load_lane (F) (p8_pre) (3)) ) ” 
  &&  “ (apr_float_lane 4 vl_pre r4 (ap_load_lane (F) (p8_pre) (4)) ) ” 
  &&  “ (apr_float_lane 5 vl_pre r5 (ap_load_lane (F) (p8_pre) (5)) ) ” 
  &&  “ (apr_float_lane 6 vl_pre r6 (ap_load_lane (F) (p8_pre) (6)) ) ” 
  &&  “ (apr_float_lane 7 vl_pre r7 (ap_load_lane (F) (p8_pre) (7)) ) ” 
  &&  “ (apr_float_lane 8 vl_pre r8 (ap_load_lane (F) (p8_pre) (8)) ) ” 
  &&  “ (apr_float_lane 9 vl_pre r9 (ap_load_lane (F) (p8_pre) (9)) ) ” 
  &&  “ (apr_float_lane 10 vl_pre r10 (ap_load_lane (F) (p8_pre) (10)) ) ” 
  &&  “ (apr_float_lane 11 vl_pre r11 (ap_load_lane (F) (p8_pre) (11)) ) ” 
  &&  “ (apr_float_lane 12 vl_pre r12 (ap_load_lane (F) (p8_pre) (12)) ) ” 
  &&  “ (apr_float_lane 13 vl_pre r13 (ap_load_lane (F) (p8_pre) (13)) ) ” 
  &&  “ (apr_float_lane 14 vl_pre r14 (ap_load_lane (F) (p8_pre) (14)) ) ” 
  &&  “ (apr_float_lane 15 vl_pre r15 (ap_load_lane (F) (p8_pre) (15)) ) ” 
  &&  “ (apr_float_lane 16 vl_pre r16 (ap_load_lane (F) (p8_pre) (16)) ) ” 
  &&  “ (apr_float_lane 17 vl_pre r17 (ap_load_lane (F) (p8_pre) (17)) ) ” 
  &&  “ (apr_float_lane 18 vl_pre r18 (ap_load_lane (F) (p8_pre) (18)) ) ” 
  &&  “ (apr_float_lane 19 vl_pre r19 (ap_load_lane (F) (p8_pre) (19)) ) ” 
  &&  “ (apr_float_lane 20 vl_pre r20 (ap_load_lane (F) (p8_pre) (20)) ) ” 
  &&  “ (apr_float_lane 21 vl_pre r21 (ap_load_lane (F) (p8_pre) (21)) ) ” 
  &&  “ (apr_float_lane 22 vl_pre r22 (ap_load_lane (F) (p8_pre) (22)) ) ” 
  &&  “ (apr_float_lane 23 vl_pre r23 (ap_load_lane (F) (p8_pre) (23)) ) ” 
  &&  “ (apr_float_lane 24 vl_pre r24 (ap_load_lane (F) (p8_pre) (24)) ) ” 
  &&  “ (apr_float_lane 25 vl_pre r25 (ap_load_lane (F) (p8_pre) (25)) ) ” 
  &&  “ (apr_float_lane 26 vl_pre r26 (ap_load_lane (F) (p8_pre) (26)) ) ” 
  &&  “ (apr_float_lane 27 vl_pre r27 (ap_load_lane (F) (p8_pre) (27)) ) ” 
  &&  “ (apr_float_lane 28 vl_pre r28 (ap_load_lane (F) (p8_pre) (28)) ) ” 
  &&  “ (apr_float_lane 29 vl_pre r29 (ap_load_lane (F) (p8_pre) (29)) ) ” 
  &&  “ (apr_float_lane 30 vl_pre r30 (ap_load_lane (F) (p8_pre) (30)) ) ” 
  &&  “ (apr_float_lane 31 vl_pre r31 (ap_load_lane (F) (p8_pre) (31)) ) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 7 ) ”
  &&  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
  **  (StructPredvfloat32m8_t ( &( "b" ) ) (make_record_vfloat32m8_t (r0) (r1) (r2) (r3) (r4) (r5) (r6) (r7) (r8) (r9) (r10) (r11) (r12) (r13) (r14) (r15) (r16) (r17) (r18) (r19) (r20) (r21) (r22) (r23) (r24) (r25) (r26) (r27) (r28) (r29) (r30) (r31)) )
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
.

Definition ap_rvv_block32_partial_solve_wit_35 := ap_rvv_block32_partial_solve_wit_35_pure -> ap_rvv_block32_partial_solve_wit_35_aux.

Definition ap_rvv_block32_partial_solve_wit_36_pure := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (PreH1 : (0 < vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (ap_window F p0_pre vl_pre )) (PreH4 : (ap_window F p1_pre vl_pre )) (PreH5 : (ap_window F p2_pre vl_pre )) (PreH6 : (ap_window F p3_pre vl_pre )) (PreH7 : (ap_window F p4_pre vl_pre )) (PreH8 : (ap_window F p5_pre vl_pre )) (PreH9 : (ap_window F p6_pre vl_pre )) (PreH10 : (ap_window F p7_pre vl_pre )) (PreH11 : (ap_window F p8_pre vl_pre )) (PreH12 : (ap_write_window W output_pre vl_pre )) (PreH13 : (ap_write_window WI index_pre vl_pre )) (PreH14 : (ap_block32_previous ab_pre ib_pre )) (PreH15 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH16 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH17 : (ap_optional_write_window W ab_pre vl_pre )) (PreH18 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH19 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 8 )) ,
  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "p3" ) )) # Ptr  |-> p3_pre)
  **  ((( &( "p4" ) )) # Ptr  |-> p4_pre)
  **  ((( &( "p5" ) )) # Ptr  |-> p5_pre)
  **  ((( &( "p6" ) )) # Ptr  |-> p6_pre)
  **  ((( &( "p7" ) )) # Ptr  |-> p7_pre)
  **  ((( &( "p8" ) )) # Ptr  |-> p8_pre)
  **  ((( &( "ab" ) )) # Ptr  |-> ab_pre)
  **  ((( &( "ib" ) )) # Ptr  |-> ib_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "index" ) )) # Ptr  |-> index_pre)
  **  ((( &( "idx" ) )) # UInt  |-> idx_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ”
.

Definition ap_rvv_block32_partial_solve_wit_36_aux := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (PreH1 : (0 < vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (ap_window F p0_pre vl_pre )) (PreH4 : (ap_window F p1_pre vl_pre )) (PreH5 : (ap_window F p2_pre vl_pre )) (PreH6 : (ap_window F p3_pre vl_pre )) (PreH7 : (ap_window F p4_pre vl_pre )) (PreH8 : (ap_window F p5_pre vl_pre )) (PreH9 : (ap_window F p6_pre vl_pre )) (PreH10 : (ap_window F p7_pre vl_pre )) (PreH11 : (ap_window F p8_pre vl_pre )) (PreH12 : (ap_write_window W output_pre vl_pre )) (PreH13 : (ap_write_window WI index_pre vl_pre )) (PreH14 : (ap_block32_previous ab_pre ib_pre )) (PreH15 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH16 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH17 : (ap_optional_write_window W ab_pre vl_pre )) (PreH18 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH19 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 8 )) ,
  (ap_data F )
  **  (ap_output W O )
  **  (ap_index WI I )
  **  (StructPredvfloat32m8_t ( &( "a" ) ) A )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 8 ) ”
  &&  (ap_output W O )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(vfloat32m8_t_s0) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(vfloat32m8_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(vfloat32m8_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(vfloat32m8_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> (A.(vfloat32m8_t_s4) ))
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> (A.(vfloat32m8_t_s5) ))
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> (A.(vfloat32m8_t_s6) ))
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> (A.(vfloat32m8_t_s7) ))
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> (A.(vfloat32m8_t_s8) ))
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> (A.(vfloat32m8_t_s9) ))
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> (A.(vfloat32m8_t_s10) ))
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> (A.(vfloat32m8_t_s11) ))
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> (A.(vfloat32m8_t_s12) ))
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> (A.(vfloat32m8_t_s13) ))
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> (A.(vfloat32m8_t_s14) ))
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> (A.(vfloat32m8_t_s15) ))
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |-> (A.(vfloat32m8_t_s16) ))
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |-> (A.(vfloat32m8_t_s17) ))
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |-> (A.(vfloat32m8_t_s18) ))
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |-> (A.(vfloat32m8_t_s19) ))
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |-> (A.(vfloat32m8_t_s20) ))
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |-> (A.(vfloat32m8_t_s21) ))
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |-> (A.(vfloat32m8_t_s22) ))
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |-> (A.(vfloat32m8_t_s23) ))
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |-> (A.(vfloat32m8_t_s24) ))
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |-> (A.(vfloat32m8_t_s25) ))
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |-> (A.(vfloat32m8_t_s26) ))
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |-> (A.(vfloat32m8_t_s27) ))
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |-> (A.(vfloat32m8_t_s28) ))
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |-> (A.(vfloat32m8_t_s29) ))
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |-> (A.(vfloat32m8_t_s30) ))
  **  ((&(( &( "a" ) )->ₛ "s31")) # Float  |-> (A.(vfloat32m8_t_s31) ))
  **  (ap_data F )
  **  (ap_index WI I )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
.

Definition ap_rvv_block32_partial_solve_wit_36 := ap_rvv_block32_partial_solve_wit_36_pure -> ap_rvv_block32_partial_solve_wit_36_aux.

Definition ap_rvv_block32_partial_solve_wit_37_pure := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (PreH1 : (0 < vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (ap_window F p0_pre vl_pre )) (PreH4 : (ap_window F p1_pre vl_pre )) (PreH5 : (ap_window F p2_pre vl_pre )) (PreH6 : (ap_window F p3_pre vl_pre )) (PreH7 : (ap_window F p4_pre vl_pre )) (PreH8 : (ap_window F p5_pre vl_pre )) (PreH9 : (ap_window F p6_pre vl_pre )) (PreH10 : (ap_window F p7_pre vl_pre )) (PreH11 : (ap_window F p8_pre vl_pre )) (PreH12 : (ap_write_window W output_pre vl_pre )) (PreH13 : (ap_write_window WI index_pre vl_pre )) (PreH14 : (ap_block32_previous ab_pre ib_pre )) (PreH15 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH16 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH17 : (ap_optional_write_window W ab_pre vl_pre )) (PreH18 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH19 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 8 )) ,
  (ap_output W (ap_output_write (O) (output_pre) (vl_pre) ((ap_fpack32 ((A.(vfloat32m8_t_s0) )) ((A.(vfloat32m8_t_s1) )) ((A.(vfloat32m8_t_s2) )) ((A.(vfloat32m8_t_s3) )) ((A.(vfloat32m8_t_s4) )) ((A.(vfloat32m8_t_s5) )) ((A.(vfloat32m8_t_s6) )) ((A.(vfloat32m8_t_s7) )) ((A.(vfloat32m8_t_s8) )) ((A.(vfloat32m8_t_s9) )) ((A.(vfloat32m8_t_s10) )) ((A.(vfloat32m8_t_s11) )) ((A.(vfloat32m8_t_s12) )) ((A.(vfloat32m8_t_s13) )) ((A.(vfloat32m8_t_s14) )) ((A.(vfloat32m8_t_s15) )) ((A.(vfloat32m8_t_s16) )) ((A.(vfloat32m8_t_s17) )) ((A.(vfloat32m8_t_s18) )) ((A.(vfloat32m8_t_s19) )) ((A.(vfloat32m8_t_s20) )) ((A.(vfloat32m8_t_s21) )) ((A.(vfloat32m8_t_s22) )) ((A.(vfloat32m8_t_s23) )) ((A.(vfloat32m8_t_s24) )) ((A.(vfloat32m8_t_s25) )) ((A.(vfloat32m8_t_s26) )) ((A.(vfloat32m8_t_s27) )) ((A.(vfloat32m8_t_s28) )) ((A.(vfloat32m8_t_s29) )) ((A.(vfloat32m8_t_s30) )) ((A.(vfloat32m8_t_s31) ))))) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(vfloat32m8_t_s0) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(vfloat32m8_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(vfloat32m8_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(vfloat32m8_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> (A.(vfloat32m8_t_s4) ))
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> (A.(vfloat32m8_t_s5) ))
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> (A.(vfloat32m8_t_s6) ))
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> (A.(vfloat32m8_t_s7) ))
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> (A.(vfloat32m8_t_s8) ))
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> (A.(vfloat32m8_t_s9) ))
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> (A.(vfloat32m8_t_s10) ))
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> (A.(vfloat32m8_t_s11) ))
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> (A.(vfloat32m8_t_s12) ))
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> (A.(vfloat32m8_t_s13) ))
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> (A.(vfloat32m8_t_s14) ))
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> (A.(vfloat32m8_t_s15) ))
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |-> (A.(vfloat32m8_t_s16) ))
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |-> (A.(vfloat32m8_t_s17) ))
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |-> (A.(vfloat32m8_t_s18) ))
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |-> (A.(vfloat32m8_t_s19) ))
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |-> (A.(vfloat32m8_t_s20) ))
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |-> (A.(vfloat32m8_t_s21) ))
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |-> (A.(vfloat32m8_t_s22) ))
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |-> (A.(vfloat32m8_t_s23) ))
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |-> (A.(vfloat32m8_t_s24) ))
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |-> (A.(vfloat32m8_t_s25) ))
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |-> (A.(vfloat32m8_t_s26) ))
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |-> (A.(vfloat32m8_t_s27) ))
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |-> (A.(vfloat32m8_t_s28) ))
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |-> (A.(vfloat32m8_t_s29) ))
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |-> (A.(vfloat32m8_t_s30) ))
  **  ((&(( &( "a" ) )->ₛ "s31")) # Float  |-> (A.(vfloat32m8_t_s31) ))
  **  ((( &( "p0" ) )) # Ptr  |-> p0_pre)
  **  ((( &( "p1" ) )) # Ptr  |-> p1_pre)
  **  ((( &( "p2" ) )) # Ptr  |-> p2_pre)
  **  ((( &( "p3" ) )) # Ptr  |-> p3_pre)
  **  ((( &( "p4" ) )) # Ptr  |-> p4_pre)
  **  ((( &( "p5" ) )) # Ptr  |-> p5_pre)
  **  ((( &( "p6" ) )) # Ptr  |-> p6_pre)
  **  ((( &( "p7" ) )) # Ptr  |-> p7_pre)
  **  ((( &( "p8" ) )) # Ptr  |-> p8_pre)
  **  ((( &( "ab" ) )) # Ptr  |-> ab_pre)
  **  ((( &( "ib" ) )) # Ptr  |-> ib_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "index" ) )) # Ptr  |-> index_pre)
  **  ((( &( "idx" ) )) # UInt  |-> idx_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (ap_data F )
  **  (ap_index WI I )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ”
.

Definition ap_rvv_block32_partial_solve_wit_37_aux := 
forall (vl_pre: Z) (idx_pre: Z) (index_pre: Z) (output_pre: Z) (ib_pre: Z) (ab_pre: Z) (p8_pre: Z) (p7_pre: Z) (p6_pre: Z) (p5_pre: Z) (p4_pre: Z) (p3_pre: Z) (p2_pre: Z) (p1_pre: Z) (p0_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (F: APMap) (A: Recordvfloat32m8_t) (J: Recordvuint32m8_t) (PreH1 : (0 < vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (ap_window F p0_pre vl_pre )) (PreH4 : (ap_window F p1_pre vl_pre )) (PreH5 : (ap_window F p2_pre vl_pre )) (PreH6 : (ap_window F p3_pre vl_pre )) (PreH7 : (ap_window F p4_pre vl_pre )) (PreH8 : (ap_window F p5_pre vl_pre )) (PreH9 : (ap_window F p6_pre vl_pre )) (PreH10 : (ap_window F p7_pre vl_pre )) (PreH11 : (ap_window F p8_pre vl_pre )) (PreH12 : (ap_write_window W output_pre vl_pre )) (PreH13 : (ap_write_window WI index_pre vl_pre )) (PreH14 : (ap_block32_previous ab_pre ib_pre )) (PreH15 : (ap_optional_output_readable O ab_pre vl_pre )) (PreH16 : (ap_optional_index_readable I ib_pre vl_pre )) (PreH17 : (ap_optional_write_window W ab_pre vl_pre )) (PreH18 : (ap_optional_write_window WI ib_pre vl_pre )) (PreH19 : (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 8 )) ,
  (ap_output W (ap_output_write (O) (output_pre) (vl_pre) ((ap_fpack32 ((A.(vfloat32m8_t_s0) )) ((A.(vfloat32m8_t_s1) )) ((A.(vfloat32m8_t_s2) )) ((A.(vfloat32m8_t_s3) )) ((A.(vfloat32m8_t_s4) )) ((A.(vfloat32m8_t_s5) )) ((A.(vfloat32m8_t_s6) )) ((A.(vfloat32m8_t_s7) )) ((A.(vfloat32m8_t_s8) )) ((A.(vfloat32m8_t_s9) )) ((A.(vfloat32m8_t_s10) )) ((A.(vfloat32m8_t_s11) )) ((A.(vfloat32m8_t_s12) )) ((A.(vfloat32m8_t_s13) )) ((A.(vfloat32m8_t_s14) )) ((A.(vfloat32m8_t_s15) )) ((A.(vfloat32m8_t_s16) )) ((A.(vfloat32m8_t_s17) )) ((A.(vfloat32m8_t_s18) )) ((A.(vfloat32m8_t_s19) )) ((A.(vfloat32m8_t_s20) )) ((A.(vfloat32m8_t_s21) )) ((A.(vfloat32m8_t_s22) )) ((A.(vfloat32m8_t_s23) )) ((A.(vfloat32m8_t_s24) )) ((A.(vfloat32m8_t_s25) )) ((A.(vfloat32m8_t_s26) )) ((A.(vfloat32m8_t_s27) )) ((A.(vfloat32m8_t_s28) )) ((A.(vfloat32m8_t_s29) )) ((A.(vfloat32m8_t_s30) )) ((A.(vfloat32m8_t_s31) ))))) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(vfloat32m8_t_s0) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(vfloat32m8_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(vfloat32m8_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(vfloat32m8_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> (A.(vfloat32m8_t_s4) ))
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> (A.(vfloat32m8_t_s5) ))
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> (A.(vfloat32m8_t_s6) ))
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> (A.(vfloat32m8_t_s7) ))
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> (A.(vfloat32m8_t_s8) ))
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> (A.(vfloat32m8_t_s9) ))
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> (A.(vfloat32m8_t_s10) ))
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> (A.(vfloat32m8_t_s11) ))
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> (A.(vfloat32m8_t_s12) ))
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> (A.(vfloat32m8_t_s13) ))
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> (A.(vfloat32m8_t_s14) ))
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> (A.(vfloat32m8_t_s15) ))
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |-> (A.(vfloat32m8_t_s16) ))
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |-> (A.(vfloat32m8_t_s17) ))
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |-> (A.(vfloat32m8_t_s18) ))
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |-> (A.(vfloat32m8_t_s19) ))
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |-> (A.(vfloat32m8_t_s20) ))
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |-> (A.(vfloat32m8_t_s21) ))
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |-> (A.(vfloat32m8_t_s22) ))
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |-> (A.(vfloat32m8_t_s23) ))
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |-> (A.(vfloat32m8_t_s24) ))
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |-> (A.(vfloat32m8_t_s25) ))
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |-> (A.(vfloat32m8_t_s26) ))
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |-> (A.(vfloat32m8_t_s27) ))
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |-> (A.(vfloat32m8_t_s28) ))
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |-> (A.(vfloat32m8_t_s29) ))
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |-> (A.(vfloat32m8_t_s30) ))
  **  ((&(( &( "a" ) )->ₛ "s31")) # Float  |-> (A.(vfloat32m8_t_s31) ))
  **  (ap_data F )
  **  (ap_index WI I )
  **  (StructPredvuint32m8_t ( &( "i" ) ) J )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_window F p0_pre vl_pre ) ” 
  &&  “ (ap_window F p1_pre vl_pre ) ” 
  &&  “ (ap_window F p2_pre vl_pre ) ” 
  &&  “ (ap_window F p3_pre vl_pre ) ” 
  &&  “ (ap_window F p4_pre vl_pre ) ” 
  &&  “ (ap_window F p5_pre vl_pre ) ” 
  &&  “ (ap_window F p6_pre vl_pre ) ” 
  &&  “ (ap_window F p7_pre vl_pre ) ” 
  &&  “ (ap_window F p8_pre vl_pre ) ” 
  &&  “ (ap_write_window W output_pre vl_pre ) ” 
  &&  “ (ap_write_window WI index_pre vl_pre ) ” 
  &&  “ (ap_block32_previous ab_pre ib_pre ) ” 
  &&  “ (ap_optional_output_readable O ab_pre vl_pre ) ” 
  &&  “ (ap_optional_index_readable I ib_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window W ab_pre vl_pre ) ” 
  &&  “ (ap_optional_write_window WI ib_pre vl_pre ) ” 
  &&  “ (ap_block32_acc A J F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 8 ) ”
  &&  (ap_index WI I )
  **  ((&(( &( "i" ) )->ₛ "s0")) # UInt  |-> (J.(vuint32m8_t_s0) ))
  **  ((&(( &( "i" ) )->ₛ "s1")) # UInt  |-> (J.(vuint32m8_t_s1) ))
  **  ((&(( &( "i" ) )->ₛ "s2")) # UInt  |-> (J.(vuint32m8_t_s2) ))
  **  ((&(( &( "i" ) )->ₛ "s3")) # UInt  |-> (J.(vuint32m8_t_s3) ))
  **  ((&(( &( "i" ) )->ₛ "s4")) # UInt  |-> (J.(vuint32m8_t_s4) ))
  **  ((&(( &( "i" ) )->ₛ "s5")) # UInt  |-> (J.(vuint32m8_t_s5) ))
  **  ((&(( &( "i" ) )->ₛ "s6")) # UInt  |-> (J.(vuint32m8_t_s6) ))
  **  ((&(( &( "i" ) )->ₛ "s7")) # UInt  |-> (J.(vuint32m8_t_s7) ))
  **  ((&(( &( "i" ) )->ₛ "s8")) # UInt  |-> (J.(vuint32m8_t_s8) ))
  **  ((&(( &( "i" ) )->ₛ "s9")) # UInt  |-> (J.(vuint32m8_t_s9) ))
  **  ((&(( &( "i" ) )->ₛ "s10")) # UInt  |-> (J.(vuint32m8_t_s10) ))
  **  ((&(( &( "i" ) )->ₛ "s11")) # UInt  |-> (J.(vuint32m8_t_s11) ))
  **  ((&(( &( "i" ) )->ₛ "s12")) # UInt  |-> (J.(vuint32m8_t_s12) ))
  **  ((&(( &( "i" ) )->ₛ "s13")) # UInt  |-> (J.(vuint32m8_t_s13) ))
  **  ((&(( &( "i" ) )->ₛ "s14")) # UInt  |-> (J.(vuint32m8_t_s14) ))
  **  ((&(( &( "i" ) )->ₛ "s15")) # UInt  |-> (J.(vuint32m8_t_s15) ))
  **  ((&(( &( "i" ) )->ₛ "s16")) # UInt  |-> (J.(vuint32m8_t_s16) ))
  **  ((&(( &( "i" ) )->ₛ "s17")) # UInt  |-> (J.(vuint32m8_t_s17) ))
  **  ((&(( &( "i" ) )->ₛ "s18")) # UInt  |-> (J.(vuint32m8_t_s18) ))
  **  ((&(( &( "i" ) )->ₛ "s19")) # UInt  |-> (J.(vuint32m8_t_s19) ))
  **  ((&(( &( "i" ) )->ₛ "s20")) # UInt  |-> (J.(vuint32m8_t_s20) ))
  **  ((&(( &( "i" ) )->ₛ "s21")) # UInt  |-> (J.(vuint32m8_t_s21) ))
  **  ((&(( &( "i" ) )->ₛ "s22")) # UInt  |-> (J.(vuint32m8_t_s22) ))
  **  ((&(( &( "i" ) )->ₛ "s23")) # UInt  |-> (J.(vuint32m8_t_s23) ))
  **  ((&(( &( "i" ) )->ₛ "s24")) # UInt  |-> (J.(vuint32m8_t_s24) ))
  **  ((&(( &( "i" ) )->ₛ "s25")) # UInt  |-> (J.(vuint32m8_t_s25) ))
  **  ((&(( &( "i" ) )->ₛ "s26")) # UInt  |-> (J.(vuint32m8_t_s26) ))
  **  ((&(( &( "i" ) )->ₛ "s27")) # UInt  |-> (J.(vuint32m8_t_s27) ))
  **  ((&(( &( "i" ) )->ₛ "s28")) # UInt  |-> (J.(vuint32m8_t_s28) ))
  **  ((&(( &( "i" ) )->ₛ "s29")) # UInt  |-> (J.(vuint32m8_t_s29) ))
  **  ((&(( &( "i" ) )->ₛ "s30")) # UInt  |-> (J.(vuint32m8_t_s30) ))
  **  ((&(( &( "i" ) )->ₛ "s31")) # UInt  |-> (J.(vuint32m8_t_s31) ))
  **  (ap_output W (ap_output_write (O) (output_pre) (vl_pre) ((ap_fpack32 ((A.(vfloat32m8_t_s0) )) ((A.(vfloat32m8_t_s1) )) ((A.(vfloat32m8_t_s2) )) ((A.(vfloat32m8_t_s3) )) ((A.(vfloat32m8_t_s4) )) ((A.(vfloat32m8_t_s5) )) ((A.(vfloat32m8_t_s6) )) ((A.(vfloat32m8_t_s7) )) ((A.(vfloat32m8_t_s8) )) ((A.(vfloat32m8_t_s9) )) ((A.(vfloat32m8_t_s10) )) ((A.(vfloat32m8_t_s11) )) ((A.(vfloat32m8_t_s12) )) ((A.(vfloat32m8_t_s13) )) ((A.(vfloat32m8_t_s14) )) ((A.(vfloat32m8_t_s15) )) ((A.(vfloat32m8_t_s16) )) ((A.(vfloat32m8_t_s17) )) ((A.(vfloat32m8_t_s18) )) ((A.(vfloat32m8_t_s19) )) ((A.(vfloat32m8_t_s20) )) ((A.(vfloat32m8_t_s21) )) ((A.(vfloat32m8_t_s22) )) ((A.(vfloat32m8_t_s23) )) ((A.(vfloat32m8_t_s24) )) ((A.(vfloat32m8_t_s25) )) ((A.(vfloat32m8_t_s26) )) ((A.(vfloat32m8_t_s27) )) ((A.(vfloat32m8_t_s28) )) ((A.(vfloat32m8_t_s29) )) ((A.(vfloat32m8_t_s30) )) ((A.(vfloat32m8_t_s31) ))))) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(vfloat32m8_t_s0) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(vfloat32m8_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(vfloat32m8_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(vfloat32m8_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> (A.(vfloat32m8_t_s4) ))
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> (A.(vfloat32m8_t_s5) ))
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> (A.(vfloat32m8_t_s6) ))
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> (A.(vfloat32m8_t_s7) ))
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> (A.(vfloat32m8_t_s8) ))
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> (A.(vfloat32m8_t_s9) ))
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> (A.(vfloat32m8_t_s10) ))
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> (A.(vfloat32m8_t_s11) ))
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> (A.(vfloat32m8_t_s12) ))
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> (A.(vfloat32m8_t_s13) ))
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> (A.(vfloat32m8_t_s14) ))
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> (A.(vfloat32m8_t_s15) ))
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |-> (A.(vfloat32m8_t_s16) ))
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |-> (A.(vfloat32m8_t_s17) ))
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |-> (A.(vfloat32m8_t_s18) ))
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |-> (A.(vfloat32m8_t_s19) ))
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |-> (A.(vfloat32m8_t_s20) ))
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |-> (A.(vfloat32m8_t_s21) ))
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |-> (A.(vfloat32m8_t_s22) ))
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |-> (A.(vfloat32m8_t_s23) ))
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |-> (A.(vfloat32m8_t_s24) ))
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |-> (A.(vfloat32m8_t_s25) ))
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |-> (A.(vfloat32m8_t_s26) ))
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |-> (A.(vfloat32m8_t_s27) ))
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |-> (A.(vfloat32m8_t_s28) ))
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |-> (A.(vfloat32m8_t_s29) ))
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |-> (A.(vfloat32m8_t_s30) ))
  **  ((&(( &( "a" ) )->ₛ "s31")) # Float  |-> (A.(vfloat32m8_t_s31) ))
  **  (ap_data F )
.

Definition ap_rvv_block32_partial_solve_wit_37 := ap_rvv_block32_partial_solve_wit_37_pure -> ap_rvv_block32_partial_solve_wit_37_aux.

Module Type VC_Correct.


Axiom proof_of_ap_rvv_block32_safety_wit_1 : ap_rvv_block32_safety_wit_1.
Axiom proof_of_ap_rvv_block32_safety_wit_2 : ap_rvv_block32_safety_wit_2.
Axiom proof_of_ap_rvv_block32_safety_wit_3 : ap_rvv_block32_safety_wit_3.
Axiom proof_of_ap_rvv_block32_safety_wit_4 : ap_rvv_block32_safety_wit_4.
Axiom proof_of_ap_rvv_block32_safety_wit_5 : ap_rvv_block32_safety_wit_5.
Axiom proof_of_ap_rvv_block32_safety_wit_6 : ap_rvv_block32_safety_wit_6.
Axiom proof_of_ap_rvv_block32_safety_wit_7 : ap_rvv_block32_safety_wit_7.
Axiom proof_of_ap_rvv_block32_safety_wit_8 : ap_rvv_block32_safety_wit_8.
Axiom proof_of_ap_rvv_block32_entail_wit_1_1 : ap_rvv_block32_entail_wit_1_1.
Axiom proof_of_ap_rvv_block32_entail_wit_1_2 : ap_rvv_block32_entail_wit_1_2.
Axiom proof_of_ap_rvv_block32_entail_wit_2 : ap_rvv_block32_entail_wit_2.
Axiom proof_of_ap_rvv_block32_entail_wit_3 : ap_rvv_block32_entail_wit_3.
Axiom proof_of_ap_rvv_block32_entail_wit_4 : ap_rvv_block32_entail_wit_4.
Axiom proof_of_ap_rvv_block32_entail_wit_5 : ap_rvv_block32_entail_wit_5.
Axiom proof_of_ap_rvv_block32_entail_wit_6 : ap_rvv_block32_entail_wit_6.
Axiom proof_of_ap_rvv_block32_entail_wit_7 : ap_rvv_block32_entail_wit_7.
Axiom proof_of_ap_rvv_block32_entail_wit_8 : ap_rvv_block32_entail_wit_8.
Axiom proof_of_ap_rvv_block32_entail_wit_9 : ap_rvv_block32_entail_wit_9.
Axiom proof_of_ap_rvv_block32_return_wit_1 : ap_rvv_block32_return_wit_1.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_1_pure : ap_rvv_block32_partial_solve_wit_1_pure.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_1 : ap_rvv_block32_partial_solve_wit_1.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_2 : ap_rvv_block32_partial_solve_wit_2.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_3_pure : ap_rvv_block32_partial_solve_wit_3_pure.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_3 : ap_rvv_block32_partial_solve_wit_3.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_4 : ap_rvv_block32_partial_solve_wit_4.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_5_pure : ap_rvv_block32_partial_solve_wit_5_pure.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_5 : ap_rvv_block32_partial_solve_wit_5.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_6 : ap_rvv_block32_partial_solve_wit_6.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_7_pure : ap_rvv_block32_partial_solve_wit_7_pure.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_7 : ap_rvv_block32_partial_solve_wit_7.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_8_pure : ap_rvv_block32_partial_solve_wit_8_pure.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_8 : ap_rvv_block32_partial_solve_wit_8.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_9 : ap_rvv_block32_partial_solve_wit_9.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_10_pure : ap_rvv_block32_partial_solve_wit_10_pure.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_10 : ap_rvv_block32_partial_solve_wit_10.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_11 : ap_rvv_block32_partial_solve_wit_11.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_12_pure : ap_rvv_block32_partial_solve_wit_12_pure.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_12 : ap_rvv_block32_partial_solve_wit_12.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_13 : ap_rvv_block32_partial_solve_wit_13.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_14_pure : ap_rvv_block32_partial_solve_wit_14_pure.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_14 : ap_rvv_block32_partial_solve_wit_14.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_15_pure : ap_rvv_block32_partial_solve_wit_15_pure.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_15 : ap_rvv_block32_partial_solve_wit_15.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_16 : ap_rvv_block32_partial_solve_wit_16.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_17_pure : ap_rvv_block32_partial_solve_wit_17_pure.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_17 : ap_rvv_block32_partial_solve_wit_17.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_18_pure : ap_rvv_block32_partial_solve_wit_18_pure.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_18 : ap_rvv_block32_partial_solve_wit_18.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_19 : ap_rvv_block32_partial_solve_wit_19.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_20_pure : ap_rvv_block32_partial_solve_wit_20_pure.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_20 : ap_rvv_block32_partial_solve_wit_20.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_21_pure : ap_rvv_block32_partial_solve_wit_21_pure.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_21 : ap_rvv_block32_partial_solve_wit_21.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_22 : ap_rvv_block32_partial_solve_wit_22.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_23_pure : ap_rvv_block32_partial_solve_wit_23_pure.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_23 : ap_rvv_block32_partial_solve_wit_23.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_24_pure : ap_rvv_block32_partial_solve_wit_24_pure.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_24 : ap_rvv_block32_partial_solve_wit_24.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_25 : ap_rvv_block32_partial_solve_wit_25.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_26_pure : ap_rvv_block32_partial_solve_wit_26_pure.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_26 : ap_rvv_block32_partial_solve_wit_26.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_27_pure : ap_rvv_block32_partial_solve_wit_27_pure.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_27 : ap_rvv_block32_partial_solve_wit_27.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_28 : ap_rvv_block32_partial_solve_wit_28.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_29_pure : ap_rvv_block32_partial_solve_wit_29_pure.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_29 : ap_rvv_block32_partial_solve_wit_29.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_30_pure : ap_rvv_block32_partial_solve_wit_30_pure.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_30 : ap_rvv_block32_partial_solve_wit_30.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_31 : ap_rvv_block32_partial_solve_wit_31.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_32_pure : ap_rvv_block32_partial_solve_wit_32_pure.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_32 : ap_rvv_block32_partial_solve_wit_32.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_33_pure : ap_rvv_block32_partial_solve_wit_33_pure.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_33 : ap_rvv_block32_partial_solve_wit_33.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_34 : ap_rvv_block32_partial_solve_wit_34.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_35_pure : ap_rvv_block32_partial_solve_wit_35_pure.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_35 : ap_rvv_block32_partial_solve_wit_35.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_36_pure : ap_rvv_block32_partial_solve_wit_36_pure.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_36 : ap_rvv_block32_partial_solve_wit_36.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_37_pure : ap_rvv_block32_partial_solve_wit_37_pure.
Axiom proof_of_ap_rvv_block32_partial_solve_wit_37 : ap_rvv_block32_partial_solve_wit_37.

End VC_Correct.
