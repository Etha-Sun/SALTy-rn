From SimpleC.SL Require Import Mem SeparationLogic.
From HwcConv Require Import assert_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope sac.
Module CheckedAssert:HwcConv.assert_unit_goal.VC_Correct.
Lemma proof_of_hc_assert_return_wit_1:HwcConv.assert_unit_goal.hc_assert_return_wit_1.
Proof. unfold HwcConv.assert_unit_goal.hc_assert_return_wit_1;intros;entailer!. Qed.
End CheckedAssert.
Module ExactSecondAssert:HwcConv.assert_unit_goal.VC_Correct:=CheckedAssert.
Print Assumptions HwcConv.AssertChecked.CheckedAssert.proof_of_hc_assert_return_wit_1.
