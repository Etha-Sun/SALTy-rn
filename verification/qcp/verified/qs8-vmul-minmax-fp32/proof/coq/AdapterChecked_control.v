From Qs8Mul Require Import control_goal Adapter_control_0.
Module Checked : Qs8Mul.control_goal.VC_Correct.
Definition proof_of_qm_assert_return_wit_1 := Qs8Mul.Adapter_control_0.proof_of_qm_assert_return_wit_1.
End Checked.
Module ExactChecked : Qs8Mul.control_goal.VC_Correct := Checked.
Print Assumptions Checked.proof_of_qm_assert_return_wit_1.
