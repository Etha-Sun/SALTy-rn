From HwcConv Require Import HwcRvv336MaskAutomation9.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque hc_data hc_get hc_rvv_rows_group hc_rvv_row_group_value dw_rvv_fma dw_arm_fma.
Lemma proof_of_hc_rvv_rows_fma3_partial_solve_wit_87_pure : HwcConv.rvv_fma3_unit_goal.hc_rvv_rows_fma3_partial_solve_wit_87_pure.
Proof.
 unfold HwcConv.rvv_fma3_unit_goal.hc_rvv_rows_fma3_partial_solve_wit_87_pure.
 left;hr_intro;subst x_pre;subst dx_pre;hr_mask_prepare.
 repeat apply _derivable1_andp_intros.
 all:try solve[hr_pure].
 all:apply hr_pure_right.
 all:eapply hr_masked_window_from_col_plain with(p:=p1_pre)(width:=width_pre)(x:=0)(dx:=0)(ci:=ci_pre)(m:=R)(vl:=vl_pre).
 all:try solve[unfold hc_footprint,hc_u64_limit;repeat split;lia].
 all:try eassumption.
 all:intros i HI Hmask.
 all:assert(HB:1<=i<vl_pre)by(eapply hr_and_mask_index;[exact PreH15|exact PreH10|exact PreH8|exact PreH6|exact HI|exact Hmask]).
 all:(eapply hr_col_from_indices with(vl:=vl_pre)(s:=1)(e:=vl_pre);[lia|lia|assumption|lia|lia|lia|lia|lia|intros;lia|intros;lia|exact HB]).
Qed.
Definition ExactSecond : HwcConv.rvv_fma3_unit_goal.hc_rvv_rows_fma3_partial_solve_wit_87_pure := proof_of_hc_rvv_rows_fma3_partial_solve_wit_87_pure.
Print Assumptions proof_of_hc_rvv_rows_fma3_partial_solve_wit_87_pure.
Print Assumptions ExactSecond.
