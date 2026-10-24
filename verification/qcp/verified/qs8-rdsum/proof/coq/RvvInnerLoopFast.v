From Coq Require Import ZArith Lia.
From Qs8Rdsum Require Import CallerOrigin ResourceLift PointerStepFacts rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac rd_fold_chains := repeat progress(match goal with
 | |- context[rd_active_wadd16(rd_active_wadd16(rd_active_wadd16(rd_active_wadd16(rd_active_wadd16(rd_active_wadd16(rd_active_wadd16(?a) ?x0 ?i ?vl) ?x1 ?i ?vl) ?x2 ?i ?vl) ?x3 ?i ?vl) ?x4 ?i ?vl) ?x5 ?i ?vl) ?x6 ?i ?vl] =>
 change (rd_active_wadd16(rd_active_wadd16(rd_active_wadd16(rd_active_wadd16(rd_active_wadd16(rd_active_wadd16(rd_active_wadd16(a) x0 i vl) x1 i vl) x2 i vl) x3 i vl) x4 i vl) x5 i vl) x6 i vl) with(rd_chain16 a x0 x1 x2 x3 x4 x5 x6 i vl)
 end).
Ltac rd_inner_pure :=
 unfold derivable1,andp,coq_prop;intros;
 repeat match goal with |- _ /\ _=>split end;
 try assumption;try reflexivity;try lia;
 try(apply rd_rem_step7;lia||assumption);
 try(apply rd_pointer_group_step_flat;lia||assumption);
 try(apply rd_pointer_group_step_flat_zero;lia||assumption).
Lemma proof_of_test_rvv_entail_wit_10 : Qs8Rdsum.rvv_unit_goal.test_rvv_entail_wit_10.
Proof.
 unfold Qs8Rdsum.rvv_unit_goal.test_rvv_entail_wit_10;try left;intros;rd_limits;subst input output input_increment i0 i1 i2 i3 i4 i5 i6.
 rd_map_ranges_owned.
 rd_fold_chains.
 match goal with HA:(forall q,rd_present M q ->0<=q<=18446744073709551615) |- _=>
 repeat match goal with
 | |- context[rd_chain16 (rd_acc16 M input_pre input_stride_pre (channels_pre-channels) (rows_pre-r)(rd_done r current_batch) ?i vl) _ _ _ _ _ _ _ ?i vl]=>
 rewrite(rd_selected_acc16_step_zero_offset M input_pre rows_pre channels_pre input_stride_pre
 (channels_pre-channels)r current_batch zero_pre i vl HA PreH16 PreH17
 ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)PreH28 PreH25 ltac:(lia)ltac:(lia)
 ltac:(apply rd_zero_size_covers;right;split;lia))
 end end.
 fold rd_u64;repeat rewrite rd_u64_add_left.
 rewrite ?local_field_address;repeat progress rewrite <-logic_equiv_andp_assoc.
 apply _derivable1_andp_intros;
 [rd_inner_pure|opaque_leaves;sepcon_assoc_change;fast_cancel].
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_10.
