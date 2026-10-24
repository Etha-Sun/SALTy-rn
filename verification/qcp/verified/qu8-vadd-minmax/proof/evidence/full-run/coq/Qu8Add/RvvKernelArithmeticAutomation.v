From Qu8Add Require Export ByteBridge RvvKernelReadBounds RvvKernelCallAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac qu_rvv_range_proof t :=
 lazymatch t with
 | qu_active_subu ?i ?vl ?a ?b => constr:(qu_active_subu_range i vl a b)
 | qu_active_mul ?i ?vl ?a ?b => constr:(qu_active_mul_range i vl a b)
 | qu_active_macc ?i ?vl ?a ?c ?b => constr:(qu_active_macc_range i vl a c b)
 | qu_active_rnu ?i ?vl ?a ?d => constr:(qu_active_rnu_range i vl a d)
 | qu_active_sll ?i ?vl ?a ?d => constr:(qu_active_sll_range i vl a d)
 | qu_active_clip16 ?i ?vl ?a => constr:(qu_active_clip16_range i vl a)
 | qu_active_add ?i ?vl ?a ?b => constr:(qu_active_add_range i vl a b)
 | qu_s16 ?a => constr:(qu_s16_range a)
 | qu_u16 ?a => constr:(qu_u16_range a)
 | qu_active_sext ?i ?vl ?a => let Ha:=qu_rvv_range_proof a in constr:(qu_active_sext_range i vl a ltac:(pose proof Ha;lia))
 | qu_active_mov ?i ?vl ?a => constr:(qu_active_mov_range i vl a ltac:(lia))
 | qu_active_max16 ?i ?vl ?a => let Ha:=qu_rvv_range_proof a in constr:(qu_active_max16_range i vl a ltac:(pose proof Ha;lia))
 | qu_active_clipu8 ?i ?vl ?a => let Ha:=qu_rvv_range_proof a in constr:(qu_active_clipu8_range i vl a ltac:(pose proof Ha;lia))
 | qu_active_max ?i ?vl ?a ?b => let Ha:=qu_rvv_range_proof a in let Hb:=qu_rvv_range_proof b in constr:(qu_active_max_range i vl a b ltac:(pose proof Ha;lia)ltac:(pose proof Hb;lia))
 | qu_active_min ?i ?vl ?a ?b => let Ha:=qu_rvv_range_proof a in let Hb:=qu_rvv_range_proof b in constr:(qu_active_min_range i vl a b ltac:(pose proof Ha;lia)ltac:(pose proof Hb;lia))
 | u8_read_lane ?i ?vl ?idx ?L => let HF:=match goal with H:Forall(fun x:Z=>0<=x<=255)L|-_=>constr:(H)end in constr:(qu_read_lane_range i vl idx L HF ltac:(lia)ltac:(lia)ltac:(lia))
 | _ => constr:((ltac:(lia)):0<=t<=255)
 end.
Ltac qu_bound_active t := let Ht:=qu_rvv_range_proof t in let H:=fresh "HactiveRange"in pose proof Ht as H;let v:=fresh "activeword"in let E:=fresh "Eactive"in remember t as v eqn:E.
Ltac qu_rvv_active_target_ranges := repeat first[
 match goal with |-context[u8_read_lane ?i ?vl ?idx ?L]=>qu_bound_active (u8_read_lane i vl idx L)end
 | match goal with |-context[qu_active_min ?i ?vl ?a ?b]=>qu_bound_active (qu_active_min i vl a b)end
 | match goal with |-context[qu_active_max ?i ?vl ?a ?b]=>qu_bound_active (qu_active_max i vl a b)end
 | match goal with |-context[qu_active_clipu8 ?i ?vl ?a]=>qu_bound_active (qu_active_clipu8 i vl a)end
 | match goal with |-context[qu_active_max16 ?i ?vl ?a]=>qu_bound_active (qu_active_max16 i vl a)end
 | match goal with |-context[qu_active_mov ?i ?vl ?a]=>qu_bound_active (qu_active_mov i vl a)end
 | match goal with |-context[qu_active_sext ?i ?vl ?a]=>qu_bound_active (qu_active_sext i vl a)end
 | match goal with |-context[qu_active_add ?i ?vl ?a ?b]=>qu_bound_active (qu_active_add i vl a b)end
 | match goal with |-context[qu_active_clip16 ?i ?vl ?a]=>qu_bound_active (qu_active_clip16 i vl a)end
 | match goal with |-context[qu_active_sll ?i ?vl ?a ?d]=>qu_bound_active (qu_active_sll i vl a d)end
 | match goal with |-context[qu_active_rnu ?i ?vl ?a ?d]=>qu_bound_active (qu_active_rnu i vl a d)end
 | match goal with |-context[qu_active_macc ?i ?vl ?a ?c ?b]=>qu_bound_active (qu_active_macc i vl a c b)end
 | match goal with |-context[qu_active_mul ?i ?vl ?a ?b]=>qu_bound_active (qu_active_mul i vl a b)end
 | match goal with |-context[qu_active_subu ?i ?vl ?a ?b]=>qu_bound_active (qu_active_subu i vl a b)end].
Ltac qu_rvv_kernel_arith_pure := unfold derivable1,andp,coq_prop;intros;first[solve[repeat first[assumption|split|reflexivity];lia]|qu_rem_bounds;qu_rvv_active_target_ranges;qu_target_ranges;unfold qu_umin,qu_umax;repeat first[assumption|split|reflexivity];lia].
Ltac qu_rvv_kernel_arith_frame :=
 unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t,UndefStructPreduint16x8_t,UndefStructPredint16x4_t,UndefStructPredint16x8_t,UndefStructPredint32x4_t,UndefStructPredvuint8m2_t,UndefStructPredvuint16m4_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t;
 rewrite ?local_field_address,?byte_typed_field_address;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;[qu_rvv_kernel_arith_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]|opaque_leaves;sepcon_assoc_change;fast_cancel].
