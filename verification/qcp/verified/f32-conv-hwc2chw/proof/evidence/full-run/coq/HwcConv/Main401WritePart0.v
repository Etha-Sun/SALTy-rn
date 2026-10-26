From HwcConv Require Import Main401CallTactics Main401WindowFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_rvv_partial_solve_wit_70_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_70_pure.
Proof. unfold HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_70_pure;left;intros;subst.
 repeat rewrite Z.quot_div_nonneg in * by lia.
 repeat match goal with HV:hc_rvv_vl _ _|-_=>unfold hc_rvv_vl in HV;destruct HV as[HV ?] end.
 entailer!;try assumption;try lia;try(eapply hm401_clipped_write_window;eauto;lia). Qed.
Lemma proof_of_test_rvv_partial_solve_wit_72_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_72_pure.
Proof. unfold HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_72_pure;left;intros;subst.
 repeat rewrite Z.quot_div_nonneg in * by lia.
 repeat match goal with HV:hc_rvv_vl _ _|-_=>unfold hc_rvv_vl in HV;destruct HV as[HV ?] end.
 entailer!;try assumption;try lia;try(eapply hm401_clipped_write_window;eauto;lia). Qed.
Lemma proof_of_test_rvv_partial_solve_wit_74_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_74_pure.
Proof. unfold HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_74_pure;left;intros;subst.
 repeat rewrite Z.quot_div_nonneg in * by lia.
 repeat match goal with HV:hc_rvv_vl _ _|-_=>unfold hc_rvv_vl in HV;destruct HV as[HV ?] end.
 entailer!;try assumption;try lia;try(eapply hm401_clipped_write_window;eauto;lia). Qed.
Lemma proof_of_test_rvv_partial_solve_wit_76_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_76_pure.
Proof. unfold HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_76_pure;left;intros;subst.
 repeat rewrite Z.quot_div_nonneg in * by lia.
 repeat match goal with HV:hc_rvv_vl _ _|-_=>unfold hc_rvv_vl in HV;destruct HV as[HV ?] end.
 entailer!;try assumption;try lia;try(eapply hm401_clipped_write_window;eauto;lia). Qed.
End Checked.
