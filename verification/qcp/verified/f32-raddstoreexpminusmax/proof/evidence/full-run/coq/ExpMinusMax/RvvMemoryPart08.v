From Coq Require Import ZArith Lia Ring List.
From ExpMinusMax Require Import rvv_unit_goal RvvMemorySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_rvv_entail_wit_6_4:ExpMinusMax.rvv_unit_goal.test_rvv_entail_wit_6_4.
Proof.
 unfold ExpMinusMax.rvv_unit_goal.test_rvv_entail_wit_6_4;left;intros S Q M P N O W F n input output A_2 retval EMRV21 retval_2 EMRV22 retval_3 EMRV23 retval_4 retval_5 EMRV24 EMRV25 EMRV26 EMRV27 EMRV28 EMRV29 EMRV30 EMRV31 EMRV32 EMRV33 EMRV34 EMRV35 EMRV36 EMRV37 EMRV38 EMRV39 EMRV40 EMRV41 EMRV42 PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43.

 assert(Hvalid:em_valid F W P M Q S N)by assumption.
 assert(HN:0<N)by(unfold em_valid in Hvalid;tauto).
 assert(Hdec:N=4*(Z.quot N 4)+Z.rem N 4)by(apply Z.quot_rem;lia).
 assert(Hr:Z.rem N 4=0)by(
  emkf_alias;assert(Hcases:Z.rem N 4=0\/Z.rem N 4=1\/Z.rem N 4=2\/Z.rem N 4=3)by lia;
  destruct Hcases as[He|[He|[He|He]]];rewrite He in *;try lia;try congruence;exfalso;
  match goal with H:Z.land _ _=0|-_=>solve[discriminate H]|H:Z.land _ _<>0|-_=>solve[apply H;reflexivity]end).
 exfalso;lia.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_rvv_entail_wit_6_4.
