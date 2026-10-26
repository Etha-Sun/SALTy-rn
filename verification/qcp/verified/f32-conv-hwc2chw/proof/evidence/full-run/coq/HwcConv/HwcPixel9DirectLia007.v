From HwcConv Require Import HwcRvvPixel9Automation4.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque hc_data hc_get hc_rvv_rows_group hc_rvv_row_group_value hc_rvv_pixel9_prefix hc_rvv_pixel9_fold dw_rvv_fma.
Lemma proof_of_hc_rvv_pixel9_raw_entail_wit_8 : HwcConv.pixel9_unit_goal.hc_rvv_pixel9_raw_entail_wit_8.
Proof. unfold HwcConv.pixel9_unit_goal.hc_rvv_pixel9_raw_entail_wit_8;right.
 intros vl_pre lane_pre x_pre width_pre w_pre p2_pre p1_pre p0_pre F A_2 bias R PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19.
 rewrite(hp_v4_eta R).
 pose proof(hc_pixel9_prefix_next R A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre lane_pre 6 2 0 vl_pre (ltac:(lia)) eq_refl PreH19 PreH1)as HNext.
 apply _derivable1_andp_intros;[apply hp_pure_right;exact HNext|exact(hp_true_left emp)]. Qed.
Definition ExactSecond : HwcConv.pixel9_unit_goal.hc_rvv_pixel9_raw_entail_wit_8 := proof_of_hc_rvv_pixel9_raw_entail_wit_8.
Print Assumptions proof_of_hc_rvv_pixel9_raw_entail_wit_8.
Print Assumptions ExactSecond.
