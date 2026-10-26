From Coq Require Import ZArith Lia Ring List.
From ExpMinusMax Require Import rvv_unit_goal RvvMemorySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_rvv_entail_wit_6_5:ExpMinusMax.rvv_unit_goal.test_rvv_entail_wit_6_5.
Proof.
 unfold ExpMinusMax.rvv_unit_goal.test_rvv_entail_wit_6_5;left;intros S Q M P N O W F n input output A_2 retval EMRV21 retval_2 EMRV22 retval_3 EMRV23 retval_4 PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18.

 assert(Hvalid:em_valid F W P M Q S N)by assumption.
 assert(HN:0<N)by(unfold em_valid in Hvalid;tauto).
 assert(Hdec:N=4*(Z.quot N 4)+Z.rem N 4)by(apply Z.quot_rem;lia).
 assert(Hr:Z.rem N 4=0)by(
  emkf_alias;assert(Hcases:Z.rem N 4=0\/Z.rem N 4=1\/Z.rem N 4=2\/Z.rem N 4=3)by lia;
  destruct Hcases as[He|[He|[He|He]]];rewrite He in *;try lia;try congruence;exfalso;
  match goal with H:Z.land _ _=0|-_=>solve[discriminate H]|H:Z.land _ _<>0|-_=>solve[apply H;reflexivity]end).

 emkf_alias;rewrite Hr in *;rewrite ?emrm_eta16 in *;unfold em_same in *.
 subst retval retval_2 retval_3 retval_4.
 repeat match goal with H:em_rvv_slide_p ?V ?o ?vl ?B|-_=>
  let E:=fresh "Hslide"in assert(E:em_get_vfloat32m4_t B 0=em_get_vfloat32m4_t V o)by(eapply emrm_slide_first;[exact H|lia|lia]);clear H;rewrite E in * end.
 assert(HA:em_rvv_acc_prefix F P M(Z.quot N 4)A_2)by assumption.
 rewrite(emrm_sum_tail F P M N A_2 ltac:(lia) HA),Hr.
 cbn[em_rvv_tail Z.eqb].
 replace(4*Z.quot N 4)with N by lia.
 Exists EMRV23 EMRV22 EMRV21 A_2.
 sepcon_assoc_change.
 sep_apply(emm_open_sum F W P M Q S N(em_rvv_output_prefix F P M Q N O)Hvalid).
 unfold em_rvv_pair_record;emk_frame.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_rvv_entail_wit_6_5.
