From Coq Require Import ZArith Lia.
From DwChw Require Import NeonKernelFacts FastFrame neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque dw_data dw_output dw_load dw_mask7_word.
Ltac dw_width_padding_context:=
 change(sizeof(FLOAT))with 4 in *;
 match goal with HI:dw_inputs ?F ?input ?zero ?weights ?params ?height ?width|-_=>
 let HP:=fresh "Hpadding"in pose proof(dw_neon_width_padding F input zero weights params height width HI)as HP end.
Ltac dw_width_pure:=unfold derivable1,andp,coq_prop;intros;
 repeat match goal with|-_ /\ _=>split end;first[assumption|lia].
Lemma proof_of_test_neon_partial_solve_wit_19_pure:
 DwChw.neon_unit_goal.test_neon_partial_solve_wit_19_pure.
Proof.
 unfold DwChw.neon_unit_goal.test_neon_partial_solve_wit_19_pure;left;intros.
 dw_width_padding_context;dw_width_pure.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_19:
 DwChw.neon_unit_goal.test_neon_partial_solve_wit_19.
Proof.
 unfold DwChw.neon_unit_goal.test_neon_partial_solve_wit_19,
 DwChw.neon_unit_goal.test_neon_partial_solve_wit_19_aux;intros Hpure;left;intros.
 dw_width_padding_context;repeat progress rewrite<-logic_equiv_andp_assoc.
 apply _derivable1_andp_intros.
 - dw_width_pure.
 - opaque_leaves;sepcon_assoc_change;fast_cancel.
Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_19_pure.
Print Assumptions proof_of_test_neon_partial_solve_wit_19.
