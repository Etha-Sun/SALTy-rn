From HwcConv Require Import rvv_unit_goal RvvMain401ProgressFacts FastFrame.
From Coq Require Import Lia Ring.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_rvv_return_wit_1:HwcConv.rvv_unit_goal.test_rvv_return_wit_1.
Proof.
 unfold HwcConv.rvv_unit_goal.test_rvv_return_wit_1;left;intros.
 rewrite hcm_progress_final by lia.
 apply derivable1_refl.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_rvv_return_wit_1.
