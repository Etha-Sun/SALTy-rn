From Coq Require Import ZArith Lia.
From Qu8Rdsum Require Export CallerOutputFirst RvvBounds.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Ltac rd_semantic_bound t :=
 lazymatch goal with H:_<=t<=_ |- _=>fail 0|_=>
 lazymatch t with
 |rd_out_lane(rd_partial ?Map ?b ?rows ?Ch ?stride ?k ?Init)?k ?i ?vl=>
   let H:=fresh "HOutLaneRange"in pose proof(rd_partial_out_lane_range Map b rows Ch stride Init k i vl
   ltac:(assumption)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia))as H
 |rd_active_wadd32 ?a ?b ?i ?vl=>
   let H:=fresh "HActiveWordRange"in assert(H:0<=t<=4294967295)by(apply rd_active_wadd32_range;lia)
 end end.
Ltac rd_semantic_bounds := repeat progress(multimatch goal with
 | |- context[rd_out_lane(rd_partial ?Map ?b ?rows ?Ch ?stride ?k ?Init)?k ?i ?vl]=>rd_semantic_bound(rd_out_lane(rd_partial Map b rows Ch stride k Init)k i vl)
 | |- context[rd_active_wadd32 ?a ?b ?i ?vl]=>rd_semantic_bound(rd_active_wadd32 a b i vl)
 end).
Ltac rd_semantic_pure := rd_wide_partial;rd_wide_bits;rd_limits;
 first[solve[unfold derivable1,andp,coq_prop;intros;rd_output_ranges;rd_collect_bounds;rd_semantic_bounds;rd_collect_bounds;repeat first[assumption|split|reflexivity];lia]
 |rd_output_pure].
Ltac rd_semantic_record := rd_wide_partial;rd_wide_bits;rd_limits;
 try(unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t,UndefStructPreduint16x8_t,UndefStructPreduint32x2_t,UndefStructPreduint32x4_t,UndefStructPredvuint8m2_t,UndefStructPredvuint16m4_t,UndefStructPredvuint32m8_t);
 rewrite ?local_field_address;repeat progress rewrite <-logic_equiv_andp_assoc;
 first[solve[apply _derivable1_andp_intros;[rd_semantic_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]]
 |solve[opaque_leaves;sepcon_assoc_change;fast_cancel]
 |solve[rd_output_record_pure_first]].
