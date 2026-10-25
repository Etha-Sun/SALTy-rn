From DwChw Require Import PropagatingTactics.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_dw_chw_propagating_max_return_wit_1 : DwChw.propagating_unit_goal.dw_chw_propagating_max_return_wit_1.
Proof. unfold DwChw.propagating_unit_goal.dw_chw_propagating_max_return_wit_1;left;intros;autorewrite with dw_fields in *.
 Exists r7_5 r6_5 r5_5 r4_5 r3_5 r2_5 r1_5 r0_5.
 repeat progress rewrite <-logic_equiv_andp_assoc.
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat match goal with|-_/\_=>split end;dw_prop_lane.
 - opaque_leaves;sepcon_assoc_change;fast_cancel.
Qed.
Print Assumptions proof_of_dw_chw_propagating_max_return_wit_1.
