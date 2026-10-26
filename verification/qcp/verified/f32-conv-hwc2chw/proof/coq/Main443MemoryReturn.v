From HwcConv Require Import Main443Tactics Main443ProgressFacts.
From SimpleC.SL Require Import Mem SeparationLogic.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_return_wit_1 : HwcConv.neon_unit_goal.test_neon_return_wit_1.
Proof. unfold HwcConv.neon_unit_goal.test_neon_return_wit_1;right;intros;rewrite hcm_progress_final by lia;apply derivable1_refl. Qed.
End Checked.
Definition Second : HwcConv.neon_unit_goal.test_neon_return_wit_1:=Checked.proof_of_test_neon_return_wit_1.
Print Assumptions Checked.proof_of_test_neon_return_wit_1.
Print Assumptions Second.
