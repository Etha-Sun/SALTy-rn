From SimpleC.SL Require Import Mem SeparationLogic.
From Dwconv Require Import control_goal.
Import Snaive_C_Rules64.
Module CheckedControl : Dwconv.control_goal.VC_Correct.
Lemma proof_of_dw_assert_return_wit_1 : Dwconv.control_goal.dw_assert_return_wit_1.
Proof. unfold Dwconv.control_goal.dw_assert_return_wit_1;intros;apply derivable1_refl. Qed.
End CheckedControl.
Print Assumptions CheckedControl.proof_of_dw_assert_return_wit_1.
