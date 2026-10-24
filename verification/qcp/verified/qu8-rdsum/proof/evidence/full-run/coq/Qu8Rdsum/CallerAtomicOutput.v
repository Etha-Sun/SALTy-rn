From Coq Require Import ZArith Lia.
From Qu8Rdsum Require Export CallerAtomicHalf StoreModel PartialRangeFacts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma rd_result_lane_range : forall Map b rows s j Init,
 0<=rd_result_lane Map b rows s j Init<=4294967295.
Proof. intros;unfold rd_result_lane;apply rs_u32_bound. Qed.
Lemma rd_partial_word_range : forall Map b rows Ch stride k Init i,
 0<=k<=Ch ->Zlength Init=Ch ->rd_init_range Init ->0<=i<Ch ->
 0<=Znth i(rd_partial Map b rows Ch stride k Init)0<=4294967295.
Proof.
 intros Map b rows Ch stride k Init i Hk Hl Hr Hi.
 pose proof(rd_partial_init_range Map b rows Ch stride k Init Hk Hl Hr)as HA.
 apply HA;rewrite rd_partial_length by assumption;exact Hi.
Qed.
Ltac rd_output_word_term t := lazymatch t with
 |rd_result_lane ?Map ?b ?rows ?s ?j ?Init=>constr:(rd_result_lane_range Map b rows s j Init)
 |Znth ?i(rd_partial ?Map ?b ?rows ?Ch ?s ?k ?Init)0=>
  constr:(rd_partial_word_range Map b rows Ch s k Init i
  ltac:(lia)ltac:(lia)ltac:(assumption)ltac:(lia))
 |rs_add_u32 ?a ?b=>let HA:=rd_output_word_term a in let HB:=rd_output_word_term b in constr:(rd_add32_bound a b HA HB)
 |_=>rd_atomic_word_term t
 end.
Ltac rd_output_atomic_goal := first[assumption|reflexivity
 |match goal with |- 0 <= ?t=>let H:=rd_output_word_term t in exact(proj1 H)end
 |match goal with |- ?t <= 4294967295=>let H:=rd_output_word_term t in exact(proj2 H)end
 |rd_half_atomic_goal].
Ltac rd_output_atomic_pure := rd_wide_partial;rd_wide_bits;rd_limits;rd_bit_bounds;
 unfold derivable1,andp,coq_prop;intros;
 repeat match goal with |- _ /\ _=>split end;
 rd_output_atomic_goal.
Ltac rd_output_atomic_record := rd_wide_partial;rd_wide_bits;rd_limits;rd_bit_bounds;
 try(unfold UndefStructPreduint32x2_t,UndefStructPreduint32x4_t);
 rewrite ?local_field_address;repeat progress rewrite <-logic_equiv_andp_assoc;
 first[solve[apply _derivable1_andp_intros;[rd_output_atomic_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]]
 |solve[opaque_leaves;sepcon_assoc_change;fast_cancel]
 |solve[rd_output_record_pure_first]].
Print Assumptions rd_result_lane_range.
Print Assumptions rd_partial_word_range.
