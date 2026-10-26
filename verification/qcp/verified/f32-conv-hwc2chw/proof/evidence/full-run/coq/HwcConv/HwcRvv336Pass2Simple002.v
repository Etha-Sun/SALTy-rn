From HwcConv Require Import HwcRvv336Pure.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque hc_data hc_get hc_rvv_rows_group hc_rvv_row_group_value dw_rvv_fma dw_arm_fma.
Lemma proof_of_hc_rvv_rows_fma3_safety_wit_4 : HwcConv.rvv_fma3_unit_goal.hc_rvv_rows_fma3_safety_wit_4.
Proof. unfold HwcConv.rvv_fma3_unit_goal.hc_rvv_rows_fma3_safety_wit_4;hr_solve. Qed.
Definition ExactSecond : HwcConv.rvv_fma3_unit_goal.hc_rvv_rows_fma3_safety_wit_4 := proof_of_hc_rvv_rows_fma3_safety_wit_4.
Print Assumptions proof_of_hc_rvv_rows_fma3_safety_wit_4.
Print Assumptions ExactSecond.
