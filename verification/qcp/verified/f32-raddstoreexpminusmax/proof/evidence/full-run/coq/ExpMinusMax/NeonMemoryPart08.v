From Coq Require Import ZArith Lia Ring List.
From ExpMinusMax Require Import neon_unit_goal NeonMemorySupport NeonMemoryPart12.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_entail_wit_5_5:ExpMinusMax.neon_unit_goal.test_neon_entail_wit_5_5.
Proof.
 unfold ExpMinusMax.neon_unit_goal.test_neon_entail_wit_5_5;left;intros S Q M P N O W F batch input output A_2 retval PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12.
 assert(Hvalid:em_valid F W P M Q S N)by assumption.
 assert(HN:0<N)by(unfold em_valid in *;tauto).
 assert(Hdec:N=4*(Z.quot N 4)+Z.rem N 4)by(apply Z.quot_rem;lia).
 assert(Hr:Z.rem N 4=0)by(
  emk_prepare;assert(Hcases:Z.rem N 4=0\/Z.rem N 4=1\/Z.rem N 4=2\/Z.rem N 4=3)by lia;
  destruct Hcases as[He|[He|[He|He]]];rewrite He in *;subst batch;try lia;try congruence;exfalso;
  match goal with H:Z.land _ _=0|-_=>solve[discriminate H] |H:Z.land _ _<>0|-_=>solve[apply H;reflexivity] end).
 unfold em_same,em_same_record4,em_same_record_i4,em_same_record_u4 in *;subst.
 emk_prepare;fold em_neon_expression.
 rewrite (emm_sum_tail F P M N ltac:(lia)),Hr.
 cbn[em_arm_tail Z.eqb].
 replace(4*Z.quot N 4)with(N-0)by lia.
 Exists(em_arm_acc_record F P M(Z.quot N 4)).
 replace(N-0)with N by lia.
 sepcon_assoc_change.
 sep_apply(emm_open_sum F W P M Q S N(em_arm_output_prefix F P M Q N O) Hvalid).
 emk_frame.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_entail_wit_5_5.
