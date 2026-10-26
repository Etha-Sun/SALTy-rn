From Coq Require Import ZArith Lia Ring List.
From ExpMinusMax Require Import neon_unit_goal NeonMemorySupport NeonMemoryPart12.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_entail_wit_5_4:ExpMinusMax.neon_unit_goal.test_neon_entail_wit_5_4.
Proof.
 unfold ExpMinusMax.neon_unit_goal.test_neon_entail_wit_5_4;left;intros S Q M P N O W F batch input output A_2 retval EMStage20 EMStage21 EMStage22 EMStage23 EMStage24 EMStage25 EMStage26 EMStage27 EMStage28 EMStage29 EMStage30 EMStage31 EMStage32 EMStage33 EMStage34 EMStage35 EMStage36 EMStage37 PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34.
 assert(HN:0<N)by(unfold em_valid in *;tauto).
 assert(Hdec:N=4*(Z.quot N 4)+Z.rem N 4)by(apply Z.quot_rem;lia).
 assert(Hr:Z.rem N 4=0)by(
  emk_prepare;assert(Hcases:Z.rem N 4=0\/Z.rem N 4=1\/Z.rem N 4=2\/Z.rem N 4=3)by lia;
  destruct Hcases as[He|[He|[He|He]]];rewrite He in *;subst batch;try lia;try congruence;exfalso;
  match goal with H:Z.land _ _=0|-_=>solve[discriminate H] |H:Z.land _ _<>0|-_=>solve[apply H;reflexivity] end).
 exfalso;emk_prepare;rewrite Hr in *;subst batch;contradiction PreH21;reflexivity.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_entail_wit_5_4.
