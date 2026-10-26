From Coq Require Import ZArith Lia Ring List.
From ExpMinusMax Require Import neon_unit_goal NeonMemorySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_entail_wit_2 : ExpMinusMax.neon_unit_goal.test_neon_entail_wit_2.
Proof.
 unfold ExpMinusMax.neon_unit_goal.test_neon_entail_wit_2;left;intros S Q M P N O W F batch PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16.
 Exists(em_neon_dup fp32_zero) 0.
 change(em_arm_output_prefix F P M Q (4*0) O)with O.
 assert(HA:em_same_record4 (em_neon_dup fp32_zero)(em_arm_acc_record F P M 0))by reflexivity.
 emk_frame.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_entail_wit_2.
