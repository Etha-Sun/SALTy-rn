From HwcConv Require Import Main401PrefixChecked.
Module Independent : HwcConv.Main401PrefixChecked.ExactPrefixAssert.
 Lemma proof_of_test_rvv_entail_wit_3:HwcConv.rvv_unit_goal.test_rvv_entail_wit_3.
 Proof. exact HwcConv.Main401PrefixChecked.Checked.proof_of_test_rvv_entail_wit_3. Qed.
End Independent.
Print Assumptions Independent.proof_of_test_rvv_entail_wit_3.
