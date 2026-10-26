From HwcConv Require Import HwcRvv336RestFrame.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque hc_data hc_get hc_present hc_rvv_rows_group hc_rvv_row_group_value dw_rvv_fma dw_arm_fma.
Lemma proof_of_hc_rvv_rows_fma3_partial_solve_wit_87 : HwcConv.rvv_fma3_unit_goal.hc_rvv_rows_fma3_partial_solve_wit_87.
Proof. unfold HwcConv.rvv_fma3_unit_goal.hc_rvv_rows_fma3_partial_solve_wit_87, HwcConv.rvv_fma3_unit_goal.hc_rvv_rows_fma3_partial_solve_wit_87_aux; hr_intro; subst x_pre;subst dx_pre;hr_mask_prepare;hrm_rhs.
all:eapply hr_masked_window_from_col_plain with(p:=p1_pre)(width:=width_pre)(x:=0)(dx:=0)(ci:=ci_pre)(m:=R)(vl:=vl_pre).
all:try solve[unfold hc_footprint,hc_u64_limit;repeat split;lia].
all:try eassumption.
all:intros i HI Hmask.
all:assert(HB:1<=i<vl_pre)by(eapply hr_and_mask_index;[exact PreH15|exact PreH10|exact PreH8|exact PreH6|exact HI|exact Hmask]).
all:(eapply hr_col_from_indices with(vl:=vl_pre)(s:=1)(e:=vl_pre);[lia|lia|assumption|lia|lia|lia|lia|lia|intros;lia|intros;lia|exact HB]).
Qed.
Definition ExactSecond : HwcConv.rvv_fma3_unit_goal.hc_rvv_rows_fma3_partial_solve_wit_87 := proof_of_hc_rvv_rows_fma3_partial_solve_wit_87.
Print Assumptions proof_of_hc_rvv_rows_fma3_partial_solve_wit_87.
Print Assumptions ExactSecond.
