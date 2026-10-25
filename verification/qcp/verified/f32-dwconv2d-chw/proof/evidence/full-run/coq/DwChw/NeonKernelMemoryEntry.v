From Coq Require Import ZArith Lia.
From DwChw Require Import RvvKernelMemoryFacts NeonKernelTactics neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque dw_data dw_output dw_progress dw_neon_results dw_row_base dw_get dw_mask7_word.
Ltac dw_neon_entry_context:=
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;
 unfold dw_same in *;subst;
 repeat rewrite ?Z.sub_diag,?Z.quot_0_l,?Z.mod_0_l,?Z.add_0_r,?Z.mul_0_r in * by lia;
 try(match goal with HP:dw_outer_pointers ?input ?zero ?output ?height ?width ?rem _ _ _ _ _ _ _ _|-_=>
  unfold dw_outer_pointers in HP;destruct HP as[Hbad|HP];[exfalso;lia|];
  cbv zeta in HP;repeat match type of HP with _/\_=>destruct HP as[? HP]end;
  repeat match goal with HE:_<=rem->_|-_=>first[specialize(HE ltac:(lia))|clear HE]end
 end);
 subst;
 unfold dw_store_row in *;
 repeat match goal with |-context[Z.min ?a ?b]=>
 first[rewrite(Z.min_l a b)in * by lia|rewrite(Z.min_r a b)in * by lia]end;
 repeat match goal with |-context[dw_row_base ?a ?b ?h ?n ?y]=>
 first[rewrite(dw_row_base_before a b h n y ltac:(lia))in *|rewrite(dw_row_base_after a b h n y ltac:(lia))in *|rewrite(dw_row_base_inside a b h n y ltac:(lia))in *]end;
 dw_neon_context;
 unfold dw_footprint,dw_u64_limit in *;
 repeat match goal with HE:_ /\ _|-_=>destruct HE end;
 repeat match goal with|-context[unsigned_last_nbits ?p 64]=>
 rewrite(unsigned_last_nbits_eq p 64)in * by(change(0<=p<18446744073709551616);nia)end;
 unfold dw_load,dw_previous4 in *;rewrite ?dw_c_literal_zero in *;cbn[Z.eqb]in *;
 repeat rewrite ?Z.mul_0_r,?Z.add_0_r,?Z.add_0_l in *;
 repeat match goal with|-context[unsigned_last_nbits(3-Z.land(Z.shiftr(4*?n)2-1)3)64]=>
 fold(dw_mask_index_source n);rewrite(dw_mask_index_source_exact n)end;
 rewrite dw_progress_start by lia;
 repeat progress rewrite<-logic_equiv_andp_assoc.
Lemma proof_of_test_neon_entail_wit_1_1:DwChw.neon_unit_goal.test_neon_entail_wit_1_1.
Proof.
 unfold DwChw.neon_unit_goal.test_neon_entail_wit_1_1;left;intros;dw_neon_entry_context.
 all:try solve[lia].
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat match goal with|-_ /\ _=>split end;try dw_neon_fact;try ring;try congruence;try nia.
 - repeat match goal with|-context[dw_get ?F ?p]=>progress ring_simplify p end.
   opaque_leaves;sepcon_assoc_change;fast_cancel.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_1_1.
Lemma proof_of_test_neon_entail_wit_1_2:DwChw.neon_unit_goal.test_neon_entail_wit_1_2.
Proof.
 unfold DwChw.neon_unit_goal.test_neon_entail_wit_1_2;left;intros;dw_neon_entry_context.
 all:try solve[lia].
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat match goal with|-_ /\ _=>split end;try dw_neon_fact;try ring;try congruence;try nia.
 - repeat match goal with|-context[dw_get ?F ?p]=>progress ring_simplify p end.
   opaque_leaves;sepcon_assoc_change;fast_cancel.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_1_2.
Lemma proof_of_test_neon_entail_wit_1_3:DwChw.neon_unit_goal.test_neon_entail_wit_1_3.
Proof.
 unfold DwChw.neon_unit_goal.test_neon_entail_wit_1_3;left;intros;dw_neon_entry_context.
 all:try solve[lia].
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat match goal with|-_ /\ _=>split end;try dw_neon_fact;try ring;try congruence;try nia.
 - repeat match goal with|-context[dw_get ?F ?p]=>progress ring_simplify p end.
   opaque_leaves;sepcon_assoc_change;fast_cancel.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_1_3.
Lemma proof_of_test_neon_entail_wit_1_4:DwChw.neon_unit_goal.test_neon_entail_wit_1_4.
Proof.
 unfold DwChw.neon_unit_goal.test_neon_entail_wit_1_4;left;intros;dw_neon_entry_context.
 all:try solve[lia].
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat match goal with|-_ /\ _=>split end;try dw_neon_fact;try ring;try congruence;try nia.
 - repeat match goal with|-context[dw_get ?F ?p]=>progress ring_simplify p end.
   opaque_leaves;sepcon_assoc_change;fast_cancel.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_1_4.
