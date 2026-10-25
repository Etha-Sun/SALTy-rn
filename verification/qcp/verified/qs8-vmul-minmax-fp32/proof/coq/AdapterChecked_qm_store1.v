From Qs8Mul Require Import qm_store1_goal Adapter_qm_store1_0 Adapter_qm_store1_1.
Module Checked : Qs8Mul.qm_store1_goal.VC_Correct.
Definition proof_of_qm_store1_safety_wit_1 := Qs8Mul.Adapter_qm_store1_0.proof_of_qm_store1_safety_wit_1.
Definition proof_of_qm_store1_return_wit_1 := Qs8Mul.Adapter_qm_store1_1.proof_of_qm_store1_return_wit_1.
End Checked.
Module ExactChecked : Qs8Mul.qm_store1_goal.VC_Correct := Checked.
Print Assumptions Checked.proof_of_qm_store1_safety_wit_1.
Print Assumptions Checked.proof_of_qm_store1_return_wit_1.
