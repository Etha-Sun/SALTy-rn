From DwChw Require Import PropagatingTactics rvv_extended_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_dw_r_up_return_wit_1 : DwChw.rvv_extended_unit_goal.dw_r_up_return_wit_1.
Proof. unfold DwChw.rvv_extended_unit_goal.dw_r_up_return_wit_1;dw_prop_start.
 Exists r7_2 r6_2 r5_2 r4_2 r3_2 r2_2 r1_2 r0_2.
 repeat progress rewrite <-logic_equiv_andp_assoc.
 apply _derivable1_andp_intros.
 - dw_prop_pure.
 - opaque_leaves;sepcon_assoc_change;fast_cancel.
Qed.
Print Assumptions proof_of_dw_r_up_return_wit_1.
