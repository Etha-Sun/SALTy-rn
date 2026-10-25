From Coq Require Import ZArith Lia.
From DwChw Require Import NeonKernelFacts FastFrame neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque dw_data dw_output dw_load dw_mask7_word.
Lemma proof_of_test_neon_partial_solve_wit_19_pure:
 DwChw.neon_unit_goal.test_neon_partial_solve_wit_19_pure.
Proof.
 unfold DwChw.neon_unit_goal.test_neon_partial_solve_wit_19_pure;left;intros.
 pose proof(dw_neon_width_padding F Input Zero Weights Params H N PreH20)as Hpadding.
 unfold derivable1,andp,coq_prop;intros mem Hheap;clear Hheap mem.
 clear -Hpadding PreH8 PreH13.
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *.
 repeat split;lia.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_19:
 DwChw.neon_unit_goal.test_neon_partial_solve_wit_19.
Proof.
 unfold DwChw.neon_unit_goal.test_neon_partial_solve_wit_19,
 DwChw.neon_unit_goal.test_neon_partial_solve_wit_19_aux;intros Hpure;intros.
 pose proof(dw_neon_width_padding F Input Zero Weights Params H N PreH20)as Hpadding.
 repeat progress rewrite<-logic_equiv_andp_assoc.
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros mem Hheap;clear Hheap mem.
   cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *.
   repeat match goal with|-_ /\ _=>split end;first[assumption|lia].
 - opaque_leaves;sepcon_assoc_change;fast_cancel.
Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_19_pure.
Print Assumptions proof_of_test_neon_partial_solve_wit_19.
