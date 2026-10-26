From HwcConv Require Import HwcRvvPixel9Automation3.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque hc_data hc_get hc_rvv_rows_group hc_rvv_row_group_value hc_rvv_pixel9_prefix hc_rvv_pixel9_fold dw_rvv_fma.
Lemma proof_of_hc_rvv_pixel9_raw_entail_wit_1 : HwcConv.pixel9_unit_goal.hc_rvv_pixel9_raw_entail_wit_1.
Proof. unfold HwcConv.pixel9_unit_goal.hc_rvv_pixel9_raw_entail_wit_1;right;hp_intro.
 change(sizeof(FLOAT))with 4 in PreH2;unfold hc_same_bits in PreH2.
 replace(w_pre+lane_pre*4)with(w_pre+4*lane_pre)in PreH2 by ring.
 change(retval=hc_rvv_pixel9_bias F w_pre lane_pre)in PreH2;subst retval;hp_norm;hp2_rhs. Qed.
Definition ExactSecond : HwcConv.pixel9_unit_goal.hc_rvv_pixel9_raw_entail_wit_1 := proof_of_hc_rvv_pixel9_raw_entail_wit_1.
Print Assumptions proof_of_hc_rvv_pixel9_raw_entail_wit_1.
Print Assumptions ExactSecond.
