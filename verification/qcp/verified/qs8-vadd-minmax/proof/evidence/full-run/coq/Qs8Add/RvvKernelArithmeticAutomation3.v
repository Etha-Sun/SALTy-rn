From Qs8Add Require Export RvvKernelReadBounds RvvKernelCallAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac qa_rvv_range_proof t :=
 lazymatch t with
 | qa_active_sub ?i ?vl ?a ?b => constr:(qa_active_sub_range i vl a b)
 | qa_active_mul ?i ?vl ?a ?b => constr:(qa_active_mul_range i vl a b)
 | qa_active_macc ?i ?vl ?a ?c ?b => constr:(qa_active_macc_range i vl a c b)
 | qa_active_rnu ?i ?vl ?a ?d => constr:(qa_active_rnu_range i vl a d)
 | qa_active_sll ?i ?vl ?a ?d => constr:(qa_active_sll_range i vl a d)
 | qa_active_clip16 ?i ?vl ?a => constr:(qa_active_clip16_range i vl a)
 | qa_active_add ?i ?vl ?a ?b => constr:(qa_active_add_range i vl a b)
 | qa_active_clip8 ?i ?vl ?a => constr:(qa_active_clip8_range i vl a)
 | qa_active_sext ?i ?vl ?a =>
   let Ha:=qa_rvv_range_proof a in
   constr:(qa_active_sext_range i vl a ltac:(pose proof Ha;lia))
 | qa_active_mov ?i ?vl ?a =>
   constr:(qa_active_mov_range i vl a ltac:(lia))
 | qa_active_max ?i ?vl ?a ?b =>
   let Ha:=qa_rvv_range_proof a in let Hb:=qa_rvv_range_proof b in
   constr:(qa_active_max_range i vl a b ltac:(pose proof Ha;lia)ltac:(pose proof Hb;lia))
 | qa_active_min ?i ?vl ?a ?b =>
   let Ha:=qa_rvv_range_proof a in let Hb:=qa_rvv_range_proof b in
   constr:(qa_active_min_range i vl a b ltac:(pose proof Ha;lia)ltac:(pose proof Hb;lia))
 | s8_read_lane ?i ?vl ?idx ?L =>
   let HF:=match goal with H:Forall(fun x:Z=>-128<=x<=127)L|-_=>constr:(H)end in
   constr:(qa_read_lane_range i vl idx L HF ltac:(lia)ltac:(lia)ltac:(lia))
 | _ => constr:((ltac:(lia)) : -128<=t<=127)
 end.
Ltac qa_bound_active t :=
 let proof:=qa_rvv_range_proof t in let H:=fresh "HactiveRange"in pose proof proof as H;
 let v:=fresh "activeword"in let E:=fresh "Eactive"in remember t as v eqn:E.
Ltac qa_rvv_active_target_ranges :=
 repeat first[
 match goal with |-context[qa_active_min ?i ?vl ?a ?b]=>qa_bound_active (qa_active_min i vl a b) end
 |match goal with |-context[qa_active_max ?i ?vl ?a ?b]=>qa_bound_active (qa_active_max i vl a b) end
 |match goal with |-context[qa_active_mul ?i ?vl ?a ?b]=>qa_bound_active (qa_active_mul i vl a b) end
 |match goal with |-context[qa_active_macc ?i ?vl ?a ?c ?b]=>qa_bound_active (qa_active_macc i vl a c b) end
 |match goal with |-context[qa_active_rnu ?i ?vl ?a ?d]=>qa_bound_active (qa_active_rnu i vl a d) end
 |match goal with |-context[qa_active_sll ?i ?vl ?a ?d]=>qa_bound_active (qa_active_sll i vl a d) end
 |match goal with |-context[qa_active_clip16 ?i ?vl ?a]=>qa_bound_active (qa_active_clip16 i vl a) end
 |match goal with |-context[qa_active_add ?i ?vl ?a ?b]=>qa_bound_active (qa_active_add i vl a b) end
 |match goal with |-context[qa_active_clip8 ?i ?vl ?a]=>qa_bound_active (qa_active_clip8 i vl a) end
 |match goal with |-context[qa_active_sext ?i ?vl ?a]=>qa_bound_active (qa_active_sext i vl a) end
 |match goal with |-context[qa_active_sub ?i ?vl ?a ?b]=>qa_bound_active (qa_active_sub i vl a b) end
 |match goal with |-context[qa_active_mov ?i ?vl ?a]=>qa_bound_active (qa_active_mov i vl a) end
 |match goal with |-context[s8_read_lane ?i ?vl ?idx ?L]=>qa_bound_active (s8_read_lane i vl idx L) end
 ].
Ltac qa_rvv_kernel_arith_pure :=
 unfold derivable1,andp,coq_prop;intros;
 first[solve[repeat first[assumption|split|reflexivity];lia]
 |qa_rem_bounds;qa_rvv_active_target_ranges;qa_target_ranges;
 unfold qa_min,qa_max;repeat first[assumption|split|reflexivity];lia].
Ltac qa_rvv_kernel_arith_frame :=
 unfold UndefStructPredint8x8_t,UndefStructPredint8x16_t,UndefStructPredint16x4_t,UndefStructPredint16x8_t,UndefStructPredint32x4_t,UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPreduint8x8_t;
 rewrite ?local_field_address,?byte_typed_field_address;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first [apply _derivable1_andp_intros;
  [qa_rvv_kernel_arith_pure
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel].
