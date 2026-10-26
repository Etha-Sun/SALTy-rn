From HwcConv Require Import RvvMain401GeometryTactics.
From Coq Require Import Lia Ring.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque hc_data hc_output hc_get hc_present hc_rvv_raw hc_rvv_source_fold dw_rvv_fma hc_progress hc_visible.
Module Checked.
Lemma proof_of_test_rvv_entail_wit_2_1:HwcConv.rvv_unit_goal.test_rvv_entail_wit_2_1.
Proof. unfold HwcConv.rvv_unit_goal.test_rvv_entail_wit_2_1;left;hmi_prepare;hmi_context;hr401g_dispatch. Qed.
Lemma proof_of_test_rvv_entail_wit_2_2:HwcConv.rvv_unit_goal.test_rvv_entail_wit_2_2.
Proof. unfold HwcConv.rvv_unit_goal.test_rvv_entail_wit_2_2;left;hmi_prepare;hmi_context;hr401g_dispatch. Qed.
Lemma proof_of_test_rvv_entail_wit_2_3:HwcConv.rvv_unit_goal.test_rvv_entail_wit_2_3.
Proof. unfold HwcConv.rvv_unit_goal.test_rvv_entail_wit_2_3;left;hmi_prepare;hmi_context;hr401g_dispatch. Qed.
Lemma proof_of_test_rvv_entail_wit_2_4:HwcConv.rvv_unit_goal.test_rvv_entail_wit_2_4.
Proof. unfold HwcConv.rvv_unit_goal.test_rvv_entail_wit_2_4;left;hmi_prepare;hmi_context;hr401g_dispatch. Qed.
Lemma proof_of_test_rvv_entail_wit_2_5:HwcConv.rvv_unit_goal.test_rvv_entail_wit_2_5.
Proof. unfold HwcConv.rvv_unit_goal.test_rvv_entail_wit_2_5;left;hmi_prepare;hmi_context;hr401g_dispatch. Qed.
Lemma proof_of_test_rvv_entail_wit_2_6:HwcConv.rvv_unit_goal.test_rvv_entail_wit_2_6.
Proof. unfold HwcConv.rvv_unit_goal.test_rvv_entail_wit_2_6;left;hmi_prepare;hmi_context;hr401g_dispatch. Qed.
End Checked.
Print Assumptions Checked.proof_of_test_rvv_entail_wit_2_1.
Print Assumptions Checked.proof_of_test_rvv_entail_wit_2_2.
Print Assumptions Checked.proof_of_test_rvv_entail_wit_2_3.
Print Assumptions Checked.proof_of_test_rvv_entail_wit_2_4.
Print Assumptions Checked.proof_of_test_rvv_entail_wit_2_5.
Print Assumptions Checked.proof_of_test_rvv_entail_wit_2_6.
