From Coq Require Import ZArith Lia Ring List.
From ExpMinusMax Require Import rvv_unit_goal RvvMemorySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_rvv_entail_wit_6_1:ExpMinusMax.rvv_unit_goal.test_rvv_entail_wit_6_1.
Proof.
 unfold ExpMinusMax.rvv_unit_goal.test_rvv_entail_wit_6_1;left;intros S Q M P N O W F n input output A_2 retval EMRV21 retval_2 EMRV22 retval_3 EMRV23 retval_4 retval_8 EMRV24 EMRV25 EMRV26 EMRV27 EMRV28 EMRV29 EMRV30 EMRV31 EMRV32 EMRV33 EMRV34 EMRV35 EMRV36 EMRV37 EMRV38 EMRV39 EMRV40 EMRV41 EMRV42 retval_5 EMRV43 retval_6 EMRV44 retval_7 PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43 PreH44 PreH45 PreH46 PreH47 PreH48.

 assert(Hvalid:em_valid F W P M Q S N)by assumption.
 assert(HN:0<N)by(unfold em_valid in Hvalid;tauto).
 assert(Hdec:N=4*(Z.quot N 4)+Z.rem N 4)by(apply Z.quot_rem;lia).
 assert(Hr:Z.rem N 4=3)by(
  emkf_alias;assert(Hcases:Z.rem N 4=0\/Z.rem N 4=1\/Z.rem N 4=2\/Z.rem N 4=3)by lia;
  destruct Hcases as[He|[He|[He|He]]];rewrite He in *;try lia;try congruence;exfalso;
  match goal with H:Z.land _ _=0|-_=>solve[discriminate H]|H:Z.land _ _<>0|-_=>solve[apply H;reflexivity]end).
 emkf_alias;rewrite Hr in *;rewrite ?emrm_eta16 in *.
 pose proof(em_rvv_expression_active F(P+16*Z.quot N 4)(em_get F M)3 EMRV24 EMRV25 EMRV26 EMRV27 EMRV29 EMRV30 EMRV31 EMRV32 EMRV33 EMRV34 EMRV35 EMRV36 EMRV37 EMRV38 EMRV39 EMRV40 EMRV42 EMRV28 EMRV41 ltac:(lia) ltac:(assumption) ltac:(assumption) ltac:(assumption) ltac:(assumption) ltac:(assumption) ltac:(assumption) ltac:(assumption) ltac:(assumption) ltac:(assumption) ltac:(assumption) ltac:(assumption) ltac:(assumption) ltac:(assumption) ltac:(assumption) ltac:(assumption) ltac:(assumption) ltac:(assumption) ltac:(assumption) ltac:(assumption))as HX.
 assert(Hwrite:em_rvv_write(em_rvv_output_prefix F P M Q(4*Z.quot N 4)O)(Q+16*Z.quot N 4)3 EMRV42=em_rvv_output_prefix F P M Q N O).
 { replace(Q+16*Z.quot N 4)with(Q+4*(4*Z.quot N 4))by ring.
 replace(em_rvv_output_prefix F P M Q N O)with(em_rvv_output_prefix F P M Q(4*Z.quot N 4+3)O)by(f_equal;lia).
 apply emrm_output_append;[lia|lia|]. unfold em_rvv_active_float in HX;intros j Hj;rewrite HX by exact Hj;f_equal;f_equal;ring. }
 rewrite Hwrite.
 unfold em_same in *.
 repeat match goal with H:@eq fp32 ?x ?v|-_=>is_var x;subst x end.
 repeat match goal with H:em_rvv_slide_p ?V ?o ?vl ?B|-_=>
  let E:=fresh "Hslide"in assert(E:em_get_vfloat32m4_t B 0=em_get_vfloat32m4_t V o)by(eapply emrm_slide_first;[exact H|lia|lia]);clear H;rewrite E in * end.
 assert(HA:em_rvv_acc_prefix F P M(Z.quot N 4)A_2)by assumption.
 rewrite(emrm_sum_tail F P M N A_2 ltac:(lia) HA),Hr.
 cbn[em_rvv_tail Z.eqb].
 unfold em_rvv_active_float in HX;rewrite !HX by lia.
 replace(P+16*Z.quot N 4+4*0)with(P+16*Z.quot N 4)by ring.
 replace(P+16*Z.quot N 4+4*1)with(P+16*Z.quot N 4+4)by ring.
 replace(P+16*Z.quot N 4+4*2)with(P+16*Z.quot N 4+8)by ring.
 Exists EMRV23 EMRV22 EMRV21 A_2.
 sepcon_assoc_change.
 sep_apply(emm_open_sum F W P M Q S N(em_rvv_output_prefix F P M Q N O)Hvalid).
 unfold em_rvv_pair_record;emk_frame.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_rvv_entail_wit_6_1.
