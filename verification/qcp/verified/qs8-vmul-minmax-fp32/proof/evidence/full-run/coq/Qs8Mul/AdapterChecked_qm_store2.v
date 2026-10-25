From Qs8Mul Require Import qm_store2_goal Adapter_qm_store2_0 Adapter_qm_store2_1 Adapter_qm_store2_2.
Module Checked : Qs8Mul.qm_store2_goal.VC_Correct.
Definition proof_of_qm_store2_safety_wit_1 := Qs8Mul.Adapter_qm_store2_0.proof_of_qm_store2_safety_wit_1.
Definition proof_of_qm_store2_safety_wit_2 := Qs8Mul.Adapter_qm_store2_1.proof_of_qm_store2_safety_wit_2.
Definition proof_of_qm_store2_return_wit_1 := Qs8Mul.Adapter_qm_store2_2.proof_of_qm_store2_return_wit_1.
End Checked.
Module ExactChecked : Qs8Mul.qm_store2_goal.VC_Correct := Checked.
Print Assumptions Checked.proof_of_qm_store2_safety_wit_1.
Print Assumptions Checked.proof_of_qm_store2_safety_wit_2.
Print Assumptions Checked.proof_of_qm_store2_return_wit_1.
