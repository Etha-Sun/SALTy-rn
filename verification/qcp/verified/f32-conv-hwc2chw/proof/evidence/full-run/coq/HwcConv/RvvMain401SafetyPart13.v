From HwcConv Require Import RvvMain401ArithmeticSupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque hc_data hc_output hc_get hc_present hc_rvv_raw hc_rvv_source_fold dw_rvv_fma hc_rvv_pixel9_prefix.
Module Checked.
Lemma proof_of_test_rvv_safety_wit_209:HwcConv.rvv_unit_goal.test_rvv_safety_wit_209.
Proof. unfold HwcConv.rvv_unit_goal.test_rvv_safety_wit_209;hr401_solve. Qed.
End Checked.
Print Assumptions Checked.proof_of_test_rvv_safety_wit_209.
