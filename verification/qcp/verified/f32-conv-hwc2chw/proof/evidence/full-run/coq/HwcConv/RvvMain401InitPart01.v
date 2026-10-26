From HwcConv Require Import RvvMain401GeometryTactics.
From Coq Require Import Lia Ring.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque hc_data hc_output hc_get hc_present hc_rvv_raw hc_rvv_source_fold dw_rvv_fma hc_progress hc_visible.
Module Checked.
Lemma proof_of_test_rvv_entail_wit_2_7:HwcConv.rvv_unit_goal.test_rvv_entail_wit_2_7.
Proof. unfold HwcConv.rvv_unit_goal.test_rvv_entail_wit_2_7;left;hmi_prepare;hmi_context;hr401g_dispatch. Qed.
Lemma proof_of_test_rvv_entail_wit_2_8:HwcConv.rvv_unit_goal.test_rvv_entail_wit_2_8.
Proof. unfold HwcConv.rvv_unit_goal.test_rvv_entail_wit_2_8;left;hmi_prepare;hmi_context;hr401g_dispatch. Qed.
Lemma proof_of_test_rvv_entail_wit_2_9:HwcConv.rvv_unit_goal.test_rvv_entail_wit_2_9.
Proof. unfold HwcConv.rvv_unit_goal.test_rvv_entail_wit_2_9;left;hmi_prepare;hmi_context;hr401g_dispatch. Qed.
Lemma proof_of_test_rvv_entail_wit_2_10:HwcConv.rvv_unit_goal.test_rvv_entail_wit_2_10.
Proof. unfold HwcConv.rvv_unit_goal.test_rvv_entail_wit_2_10;left;hmi_prepare;hmi_context;hr401g_dispatch. Qed.
Lemma proof_of_test_rvv_entail_wit_2_11:HwcConv.rvv_unit_goal.test_rvv_entail_wit_2_11.
Proof. unfold HwcConv.rvv_unit_goal.test_rvv_entail_wit_2_11;left;hmi_prepare;hmi_context;hr401g_dispatch. Qed.
Lemma proof_of_test_rvv_entail_wit_2_12:HwcConv.rvv_unit_goal.test_rvv_entail_wit_2_12.
Proof. unfold HwcConv.rvv_unit_goal.test_rvv_entail_wit_2_12;left;hmi_prepare;hmi_context;hr401g_dispatch. Qed.
End Checked.
Print Assumptions Checked.proof_of_test_rvv_entail_wit_2_7.
Print Assumptions Checked.proof_of_test_rvv_entail_wit_2_8.
Print Assumptions Checked.proof_of_test_rvv_entail_wit_2_9.
Print Assumptions Checked.proof_of_test_rvv_entail_wit_2_10.
Print Assumptions Checked.proof_of_test_rvv_entail_wit_2_11.
Print Assumptions Checked.proof_of_test_rvv_entail_wit_2_12.
