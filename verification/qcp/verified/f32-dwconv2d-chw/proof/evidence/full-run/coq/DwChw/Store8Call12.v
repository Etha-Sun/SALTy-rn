From Coq Require Import Lia.
From DwChw Require Import Store8CallTactics.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_dw_get8_return_wit_6 : DwChw.store8_unit_goal.dw_get8_return_wit_6.
Proof. unfold DwChw.store8_unit_goal.dw_get8_return_wit_6;dw_neon_borrow_start.
 try replace k_pre with 5 in * by lia.
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop,dw_same;intros;cbn[dw_fp8];reflexivity.
 - opaque_leaves;sepcon_assoc_change;fast_cancel.
Qed.
Print Assumptions proof_of_dw_get8_return_wit_6.
