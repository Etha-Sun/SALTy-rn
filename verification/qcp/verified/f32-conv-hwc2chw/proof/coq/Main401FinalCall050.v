From HwcConv Require Import Main401WindowProjectedTactics2.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque hc_data hc_output hc_get hc_progress hc_visible hc_acc_prefix hc_rvv_raw hc_rvv_pixel9_prefix hc_rvv_pixel9_fold hc_canonical_min hc_canonical_max.
Lemma actual : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_50.
Proof. unfold HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_50, HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_50_aux;hm401_final. Qed.
Definition exact_second : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_50 := actual.
Print Assumptions actual.
Print Assumptions exact_second.
