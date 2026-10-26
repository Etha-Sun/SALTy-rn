From Coq Require Import ZArith Lia List.
From ArgmaxPool Require Import RvvUpdateIntoProbeSupport RvvUpdateIntoProbeFacts probe_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_ap_update_fullframe_probe_return_wit_1:ArgmaxPool.probe_goal.ap_update_fullframe_probe_return_wit_1.
Proof.
 unfold ArgmaxPool.probe_goal.ap_update_fullframe_probe_return_wit_1;left;apb_intro.
 match goal with j:Recordvuint32m8_t|-_=>rename j into Jout end.
 set(A:=(make_record_vfloat32m8_t r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 r17 r18 r19 r20 r21 r22 r23 r24 r25 r26 r27 r28 r29 r30 r31))in *.
 set(V:=(make_record_vuint32m8_t r0_2 r1_2 r2_2 r3_2 r4_2 r5_2 r6_2 r7_2 r8_2 r9_2 r10_2 r11_2 r12_2 r13_2 r14_2 r15_2 r16_2 r17_2 r18_2 r19_2 r20_2 r21_2 r22_2 r23_2 r24_2 r25_2 r26_2 r27_2 r28_2 r29_2 r30_2 r31_2))in *.
 set(B:=(make_record_vfloat32m8_t r0_3 r1_3 r2_3 r3_3 r4_3 r5_3 r6_3 r7_3 r8_3 r9_3 r10_3 r11_3 r12_3 r13_3 r14_3 r15_3 r16_3 r17_3 r18_3 r19_3 r20_3 r21_3 r22_3 r23_3 r24_3 r25_3 r26_3 r27_3 r28_3 r29_3 r30_3 r31_3))in *.
 assert(Hwritten:ap_probe_written F pa_pre pb_pre Old New vl_pre output_pre index_pre
 (ap_output_write O output_pre vl_pre(apup_float R))(ap_index_write I index_pre vl_pre(apup_int Jout))).
 { apply(apup_written F pa_pre pb_pre Old New vl_pre output_pre index_pre O I R Jout A V B).
 - lia.
 - rewrite <-PreH103;exact PreH1.
 - intros j Hj;unfold A.
   assert(Hcases:j=0 \/ j=1 \/ j=2 \/ j=3 \/ j=4 \/ j=5 \/ j=6 \/ j=7 \/ j=8 \/ j=9 \/ j=10 \/ j=11 \/ j=12 \/ j=13 \/ j=14 \/ j=15 \/ j=16 \/ j=17 \/ j=18 \/ j=19 \/ j=20 \/ j=21 \/ j=22 \/ j=23 \/ j=24 \/ j=25 \/ j=26 \/ j=27 \/ j=28 \/ j=29 \/ j=30 \/ j=31)by lia.
   repeat match goal with H:_ \/ _|-_=>destruct H end;subst j;
   cbv beta iota zeta delta [apup_float ap_fpack32 List.nth Z.to_nat Pos.to_nat Pos.iter_op Nat.add vfloat32m8_t_s0 vfloat32m8_t_s1 vfloat32m8_t_s2 vfloat32m8_t_s3 vfloat32m8_t_s4 vfloat32m8_t_s5 vfloat32m8_t_s6 vfloat32m8_t_s7 vfloat32m8_t_s8 vfloat32m8_t_s9 vfloat32m8_t_s10 vfloat32m8_t_s11 vfloat32m8_t_s12 vfloat32m8_t_s13 vfloat32m8_t_s14 vfloat32m8_t_s15 vfloat32m8_t_s16 vfloat32m8_t_s17 vfloat32m8_t_s18 vfloat32m8_t_s19 vfloat32m8_t_s20 vfloat32m8_t_s21 vfloat32m8_t_s22 vfloat32m8_t_s23 vfloat32m8_t_s24 vfloat32m8_t_s25 vfloat32m8_t_s26 vfloat32m8_t_s27 vfloat32m8_t_s28 vfloat32m8_t_s29 vfloat32m8_t_s30 vfloat32m8_t_s31 vuint32m8_t_s0 vuint32m8_t_s1 vuint32m8_t_s2 vuint32m8_t_s3 vuint32m8_t_s4 vuint32m8_t_s5 vuint32m8_t_s6 vuint32m8_t_s7 vuint32m8_t_s8 vuint32m8_t_s9 vuint32m8_t_s10 vuint32m8_t_s11 vuint32m8_t_s12 vuint32m8_t_s13 vuint32m8_t_s14 vuint32m8_t_s15 vuint32m8_t_s16 vuint32m8_t_s17 vuint32m8_t_s18 vuint32m8_t_s19 vuint32m8_t_s20 vuint32m8_t_s21 vuint32m8_t_s22 vuint32m8_t_s23 vuint32m8_t_s24 vuint32m8_t_s25 vuint32m8_t_s26 vuint32m8_t_s27 vuint32m8_t_s28 vuint32m8_t_s29 vuint32m8_t_s30 vuint32m8_t_s31];
   lazymatch goal with |-?x = ?y=>match goal with H:apr_float_lane ?n vl_pre x y|-_=>apply H;lia end end.
 - intros j Hj;unfold B.
   assert(Hcases:j=0 \/ j=1 \/ j=2 \/ j=3 \/ j=4 \/ j=5 \/ j=6 \/ j=7 \/ j=8 \/ j=9 \/ j=10 \/ j=11 \/ j=12 \/ j=13 \/ j=14 \/ j=15 \/ j=16 \/ j=17 \/ j=18 \/ j=19 \/ j=20 \/ j=21 \/ j=22 \/ j=23 \/ j=24 \/ j=25 \/ j=26 \/ j=27 \/ j=28 \/ j=29 \/ j=30 \/ j=31)by lia.
   repeat match goal with H:_ \/ _|-_=>destruct H end;subst j;
   cbv beta iota zeta delta [apup_float ap_fpack32 List.nth Z.to_nat Pos.to_nat Pos.iter_op Nat.add vfloat32m8_t_s0 vfloat32m8_t_s1 vfloat32m8_t_s2 vfloat32m8_t_s3 vfloat32m8_t_s4 vfloat32m8_t_s5 vfloat32m8_t_s6 vfloat32m8_t_s7 vfloat32m8_t_s8 vfloat32m8_t_s9 vfloat32m8_t_s10 vfloat32m8_t_s11 vfloat32m8_t_s12 vfloat32m8_t_s13 vfloat32m8_t_s14 vfloat32m8_t_s15 vfloat32m8_t_s16 vfloat32m8_t_s17 vfloat32m8_t_s18 vfloat32m8_t_s19 vfloat32m8_t_s20 vfloat32m8_t_s21 vfloat32m8_t_s22 vfloat32m8_t_s23 vfloat32m8_t_s24 vfloat32m8_t_s25 vfloat32m8_t_s26 vfloat32m8_t_s27 vfloat32m8_t_s28 vfloat32m8_t_s29 vfloat32m8_t_s30 vfloat32m8_t_s31 vuint32m8_t_s0 vuint32m8_t_s1 vuint32m8_t_s2 vuint32m8_t_s3 vuint32m8_t_s4 vuint32m8_t_s5 vuint32m8_t_s6 vuint32m8_t_s7 vuint32m8_t_s8 vuint32m8_t_s9 vuint32m8_t_s10 vuint32m8_t_s11 vuint32m8_t_s12 vuint32m8_t_s13 vuint32m8_t_s14 vuint32m8_t_s15 vuint32m8_t_s16 vuint32m8_t_s17 vuint32m8_t_s18 vuint32m8_t_s19 vuint32m8_t_s20 vuint32m8_t_s21 vuint32m8_t_s22 vuint32m8_t_s23 vuint32m8_t_s24 vuint32m8_t_s25 vuint32m8_t_s26 vuint32m8_t_s27 vuint32m8_t_s28 vuint32m8_t_s29 vuint32m8_t_s30 vuint32m8_t_s31];
   lazymatch goal with |-?x = ?y=>match goal with H:apr_float_lane ?n vl_pre x y|-_=>apply H;lia end end.
 - intros j Hj;unfold V.
   rewrite <-PreH102.
   assert(Hcases:j=0 \/ j=1 \/ j=2 \/ j=3 \/ j=4 \/ j=5 \/ j=6 \/ j=7 \/ j=8 \/ j=9 \/ j=10 \/ j=11 \/ j=12 \/ j=13 \/ j=14 \/ j=15 \/ j=16 \/ j=17 \/ j=18 \/ j=19 \/ j=20 \/ j=21 \/ j=22 \/ j=23 \/ j=24 \/ j=25 \/ j=26 \/ j=27 \/ j=28 \/ j=29 \/ j=30 \/ j=31)by lia.
   repeat match goal with H:_ \/ _|-_=>destruct H end;subst j;
   cbv beta iota zeta delta [apup_int ap_ipack32 List.nth Z.to_nat Pos.to_nat Pos.iter_op Nat.add vfloat32m8_t_s0 vfloat32m8_t_s1 vfloat32m8_t_s2 vfloat32m8_t_s3 vfloat32m8_t_s4 vfloat32m8_t_s5 vfloat32m8_t_s6 vfloat32m8_t_s7 vfloat32m8_t_s8 vfloat32m8_t_s9 vfloat32m8_t_s10 vfloat32m8_t_s11 vfloat32m8_t_s12 vfloat32m8_t_s13 vfloat32m8_t_s14 vfloat32m8_t_s15 vfloat32m8_t_s16 vfloat32m8_t_s17 vfloat32m8_t_s18 vfloat32m8_t_s19 vfloat32m8_t_s20 vfloat32m8_t_s21 vfloat32m8_t_s22 vfloat32m8_t_s23 vfloat32m8_t_s24 vfloat32m8_t_s25 vfloat32m8_t_s26 vfloat32m8_t_s27 vfloat32m8_t_s28 vfloat32m8_t_s29 vfloat32m8_t_s30 vfloat32m8_t_s31 vuint32m8_t_s0 vuint32m8_t_s1 vuint32m8_t_s2 vuint32m8_t_s3 vuint32m8_t_s4 vuint32m8_t_s5 vuint32m8_t_s6 vuint32m8_t_s7 vuint32m8_t_s8 vuint32m8_t_s9 vuint32m8_t_s10 vuint32m8_t_s11 vuint32m8_t_s12 vuint32m8_t_s13 vuint32m8_t_s14 vuint32m8_t_s15 vuint32m8_t_s16 vuint32m8_t_s17 vuint32m8_t_s18 vuint32m8_t_s19 vuint32m8_t_s20 vuint32m8_t_s21 vuint32m8_t_s22 vuint32m8_t_s23 vuint32m8_t_s24 vuint32m8_t_s25 vuint32m8_t_s26 vuint32m8_t_s27 vuint32m8_t_s28 vuint32m8_t_s29 vuint32m8_t_s30 vuint32m8_t_s31];
   lazymatch goal with |-?x = ?y=>match goal with H:apr_int_lane ?n vl_pre x y|-_=>apply H;lia end end.
 }
 pose proof(apup_frames O I output_pre index_pre vl_pre(apup_float R)(apup_int Jout)ltac:(lia))as Hframes.
 Exists(ap_output_write O output_pre vl_pre(apup_float R)).
 Exists(ap_index_write I index_pre vl_pre(apup_int Jout)).
 unfold apup_float,apup_int in *.
 apu_frame.
Qed.
End Checked.
Print Assumptions Checked.proof_of_ap_update_fullframe_probe_return_wit_1.
