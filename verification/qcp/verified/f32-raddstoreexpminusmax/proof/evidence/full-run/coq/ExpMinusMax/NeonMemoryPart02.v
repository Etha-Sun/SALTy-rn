From Coq Require Import ZArith Lia Ring List.
From ExpMinusMax Require Import neon_unit_goal NeonMemorySupport NeonMemoryPart10.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_entail_wit_3 : ExpMinusMax.neon_unit_goal.test_neon_entail_wit_3.
Proof.
 unfold ExpMinusMax.neon_unit_goal.test_neon_entail_wit_3;left;intros S Q M P N O W F output input batch G_2 A_2 EMStage1 EMStage2 EMStage3 EMStage4 EMStage5 EMStage6 EMStage7 EMStage8 EMStage9 EMStage10 EMStage11 EMStage12 EMStage13 EMStage14 EMStage15 EMStage16 EMStage17 EMStage18 EMStage19 PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28.
 unfold em_same_record4,em_same_record_i4,em_same_record_u4 in *;subst.
 emk_prepare;fold em_neon_expression.
 replace(Q+16*G_2)with(Q+4*(4*G_2))by ring.
 assert(Hwrite:em_write_record4(em_arm_output_prefix F P M Q(4*G_2)O)(Q+4*(4*G_2))
 (em_neon_expression(em_load_record4 F(P+16*G_2))(em_neon_dup(em_get F M)))=
 em_arm_output_prefix F P M Q(4*G_2+4)O).
 { apply em_arm_prefix_record4;[lia|intros j Hj;apply emm_load_expression;exact Hj]. }
 match goal with |-context[em_write_record4 ?A ?ptr ?V]=>
 let E:=fresh "Evalue" in assert(E:V=em_neon_expression(em_load_record4 F(P+16*G_2))(em_neon_dup(em_get F M)))by reflexivity;
 rewrite E end.
 rewrite Hwrite.
 replace(4*G_2+4)with(4*(G_2+1))by ring.
 Exists(em_arm_acc_record F P M(G_2+1))(G_2+1).
 rewrite emm_acc_record_step by lia.
 emk_frame.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_entail_wit_3.
