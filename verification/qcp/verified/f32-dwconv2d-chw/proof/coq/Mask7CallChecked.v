From Coq Require Import ZArith Lia.
From DwChw Require Import Mask7Model FastFrame mask7_call_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac mask_start := try left;intros;try unfold UndefStructPreduint32x4_t.
Ltac mask_pure := unfold derivable1,andp,coq_prop;intros; repeat match goal with |- _/\_=>split end;first[assumption|reflexivity|lia].
Ltac mask_solve := mask_start;first[solve[apply _derivable1_andp_intros;[mask_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]]|solve[opaque_leaves;sepcon_assoc_change;fast_cancel]|solve[mask_pure]|solve[entailer!;lia]].
Module CheckedMask7Call : DwChw.mask7_call_unit_goal.VC_Correct.
Lemma proof_of_dw_mask7_call_return_wit_1 : DwChw.mask7_call_unit_goal.dw_mask7_call_return_wit_1.
Proof. unfold DwChw.mask7_call_unit_goal.dw_mask7_call_return_wit_1;mask_solve. Qed.
Lemma proof_of_dw_mask7_call_partial_solve_wit_1_pure : DwChw.mask7_call_unit_goal.dw_mask7_call_partial_solve_wit_1_pure.
Proof. unfold DwChw.mask7_call_unit_goal.dw_mask7_call_partial_solve_wit_1_pure;mask_solve. Qed.
Lemma proof_of_dw_mask7_call_partial_solve_wit_1 : DwChw.mask7_call_unit_goal.dw_mask7_call_partial_solve_wit_1.
Proof. unfold DwChw.mask7_call_unit_goal.dw_mask7_call_partial_solve_wit_1,DwChw.mask7_call_unit_goal.dw_mask7_call_partial_solve_wit_1_aux;mask_solve. Qed.
Lemma proof_of_dw_mask7_call_partial_solve_wit_2 : DwChw.mask7_call_unit_goal.dw_mask7_call_partial_solve_wit_2.
Proof. unfold DwChw.mask7_call_unit_goal.dw_mask7_call_partial_solve_wit_2;mask_solve. Qed.
End CheckedMask7Call.
Print Assumptions CheckedMask7Call.proof_of_dw_mask7_call_return_wit_1.
Print Assumptions CheckedMask7Call.proof_of_dw_mask7_call_partial_solve_wit_1_pure.
Print Assumptions CheckedMask7Call.proof_of_dw_mask7_call_partial_solve_wit_1.
Print Assumptions CheckedMask7Call.proof_of_dw_mask7_call_partial_solve_wit_2.
