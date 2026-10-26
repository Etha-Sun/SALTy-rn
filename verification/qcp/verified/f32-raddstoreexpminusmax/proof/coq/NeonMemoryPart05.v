From Coq Require Import ZArith Lia Ring List.
From ExpMinusMax Require Import neon_unit_goal NeonMemorySupport NeonMemoryPart12.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_entail_wit_5_2:ExpMinusMax.neon_unit_goal.test_neon_entail_wit_5_2.
Proof.
 unfold ExpMinusMax.neon_unit_goal.test_neon_entail_wit_5_2;left;intros S Q M P N O W F batch input output A_2 retval EMStage20 EMStage21 EMStage22 EMStage23 EMStage24 EMStage25 EMStage26 EMStage27 EMStage28 EMStage29 EMStage30 EMStage31 EMStage32 EMStage33 EMStage34 EMStage35 EMStage36 EMStage37 retval_2 PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35.
 assert(Hvalid:em_valid F W P M Q S N)by assumption.
 assert(HN:0<N)by(unfold em_valid in *;tauto).
 assert(Hdec:N=4*(Z.quot N 4)+Z.rem N 4)by(apply Z.quot_rem;lia).
 assert(Hr:Z.rem N 4=1)by(
  emk_prepare;assert(Hcases:Z.rem N 4=0\/Z.rem N 4=1\/Z.rem N 4=2\/Z.rem N 4=3)by lia;
  destruct Hcases as[He|[He|[He|He]]];rewrite He in *;subst batch;try lia;try congruence;exfalso;
  match goal with H:Z.land _ _=0|-_=>solve[discriminate H] |H:Z.land _ _<>0|-_=>solve[apply H;reflexivity] end).
 unfold em_same,em_same_record4,em_same_record_i4,em_same_record_u4 in *;subst.
 emk_prepare;fold em_neon_expression.
 assert(HG:0<=Z.quot N 4)by(apply Z.quot_pos;lia).
 match goal with |-context[em_neon_reint_u_f ?v]=>
 let E:=fresh "Evalue" in assert(E:em_neon_reint_u_f v=em_neon_expression(em_load_record4 F(P+16*Z.quot N 4))(em_neon_dup(em_get F M)))by reflexivity;
 rewrite E end.
 set(V:=em_neon_expression(em_load_record4 F(P+16*Z.quot N 4))(em_neon_dup(em_get F M))).
 assert(HV:forall j,0<=j<4->em_get_float32x4_t V j=em_arm_value(em_get F(P+4*(4*Z.quot N 4+j)))(em_get F M))by(intros;apply emm_load_expression;assumption).
 replace(Q+16*Z.quot N 4)with(Q+4*(4*Z.quot N 4))by ring.
 rewrite(em_arm_prefix_low1 F P M Q (4*Z.quot N 4) O V ltac:(lia) HV).
 replace(4*Z.quot N 4+1)with N by lia.
 rewrite (emm_sum_tail F P M N ltac:(lia)),Hr.
 cbn[em_arm_tail Z.eqb].
 replace(4*Z.quot N 4)with(N-1)by lia.
 Exists(em_arm_acc_record F P M(Z.quot N 4)).
 replace(N-0)with N by lia.
 sepcon_assoc_change.
 sep_apply(emm_open_sum F W P M Q S N(em_arm_output_prefix F P M Q N O) Hvalid).
 rewrite ?emm_low0,?emm_high0,?emm_reduce_low.
 emk_frame.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_entail_wit_5_2.
