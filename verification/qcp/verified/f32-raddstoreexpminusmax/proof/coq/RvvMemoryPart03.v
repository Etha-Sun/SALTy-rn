From Coq Require Import ZArith Lia Ring List.
From ExpMinusMax Require Import rvv_unit_goal RvvMemorySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_rvv_entail_wit_4:ExpMinusMax.rvv_unit_goal.test_rvv_entail_wit_4.
Proof.
 unfold ExpMinusMax.rvv_unit_goal.test_rvv_entail_wit_4;left;intros S Q M P N O W F G_2 A_2 vl input output EMRV2 EMRV3 EMRV4 EMRV5 EMRV6 EMRV7 EMRV8 EMRV9 EMRV10 EMRV11 EMRV12 EMRV13 EMRV14 EMRV15 EMRV16 EMRV17 EMRV18 EMRV19 EMRV20 PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30.

 pose proof(em_rvv_expression_active F input(em_get F M)vl EMRV2 EMRV3 EMRV4 EMRV5 EMRV7 EMRV8 EMRV9 EMRV10 EMRV11 EMRV12 EMRV13 EMRV14 EMRV15 EMRV16 EMRV17 EMRV18 EMRV20 EMRV6 EMRV19 ltac:(lia) PreH19 PreH18 PreH17 PreH16 PreH15 PreH14 PreH13 PreH12 PreH11 PreH10 PreH9 PreH8 PreH7 PreH6 PreH5 PreH4 PreH3 PreH2 PreH1)as HX.
 subst vl input output;rewrite PreH29.
 assert(Hacc:em_rvv_acc_prefix F P M(G_2+1)(em_rvv_add_tu A_2 EMRV20 4))by(eapply emrm_acc_step;eauto).
 assert(Hwrite:em_rvv_write(em_rvv_output_prefix F P M Q(4*G_2)O)(Q+16*G_2)4 EMRV20=em_rvv_output_prefix F P M Q(4*(G_2+1))O).
 { replace(Q+16*G_2)with(Q+4*(4*G_2))by ring.
 replace(4*(G_2+1))with(4*G_2+4)by ring.
 apply emrm_output_append;[lia|lia|]. unfold em_rvv_active_float in HX;intros j Hj;rewrite HX by exact Hj.
 f_equal;f_equal;ring. }
 rewrite Hwrite;replace(N-4*G_2-4)with(N-4*(G_2+1))by ring;Exists(em_rvv_add_tu A_2 EMRV20 4)(G_2+1);emk_frame.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_rvv_entail_wit_4.
