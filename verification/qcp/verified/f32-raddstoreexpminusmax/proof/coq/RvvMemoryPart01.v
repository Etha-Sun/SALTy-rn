From Coq Require Import ZArith Lia Ring List.
From ExpMinusMax Require Import rvv_unit_goal RvvMemorySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_rvv_entail_wit_2 : ExpMinusMax.rvv_unit_goal.test_rvv_entail_wit_2.
Proof.
 unfold ExpMinusMax.rvv_unit_goal.test_rvv_entail_wit_2;left;intros S Q M P N O W F batch retval EMRV1 PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20.
 subst retval;Exists EMRV1 0.
 change(em_rvv_output_prefix F P M Q(4*0)O)with O.
 assert(HA:em_rvv_acc_prefix F P M 0 EMRV1)by(apply emrm_acc_zero;assumption).
 emk_literal;emk_prepare;rewrite PreH11,PreH18.
 replace(Z.quot (4*N)4)with N by(rewrite Z.mul_comm;rewrite Z.quot_mul by lia;reflexivity).
 replace(N-4*0)with N by ring.
 emk_frame.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_rvv_entail_wit_2.
