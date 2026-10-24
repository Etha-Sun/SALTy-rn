From GemmRvv Require Import HelperChecked.
From GemmFullRvvVC15 Require Import unit_goal.
Module CheckedIdentity.
Lemma proof_of_qcp_identity_return_wit_1 : GemmFullRvvVC15.unit_goal.qcp_identity_return_wit_1.
Proof. exact HelperChecked.Checked.proof_of_qcp_identity_return_wit_1. Qed.
End CheckedIdentity.
Print Assumptions CheckedIdentity.proof_of_qcp_identity_return_wit_1.
