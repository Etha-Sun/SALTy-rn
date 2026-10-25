From Coq Require Import ZArith Lia.
From Qs8Mul Require Export PrefixFacts VectorValues ScalarBitsFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque rd_mem qm_lane_match qm_fp_lane_match qm_signed_bits.
Ltac qm_bits_pure := unfold derivable1,andp,coq_prop;intros;
 repeat match goal with |- _ /\ _ => split end;
 first[assumption|reflexivity|lia|unfold qm_fp_lane_match,qm_lane_match;right;reflexivity].
Ltac qm_bits_start := intros;change (sizeof(CHAR)) with 1 in *;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 rewrite ?Z.mul_1_r,?Z.add_0_r in *;
 cbn [qm_vec32 qm_list32 qm_fpvec32 qm_extract_i32 Z.to_nat List.nth] in *;
 try unfold UndefStructPredvfloat32m8_t,UndefStructPredvint32m8_t;
 rewrite ?qm_local_field_address;
 repeat progress rewrite <-logic_equiv_andp_assoc.
Ltac qm_bits_finish := first[
 solve[apply _derivable1_andp_intros;[qm_bits_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]]
 |solve[opaque_leaves;sepcon_assoc_change;fast_cancel]
 |solve[qm_bits_pure]
 |solve[entailer!;lia]].
Ltac qm_bits_active :=
 repeat match goal with
 |H:qm_fp_lane_match 0 1 ?x ?y |- _ =>let E:=fresh "Efp" in pose proof(qm_fp_lane_match_active 0 1 x y ltac:(lia) H)as E;clear H;subst x
 |H:qm_lane_match 0 1 ?x ?y |- _ =>let E:=fresh "Eint" in pose proof(qm_lane_match_active 0 1 x y ltac:(lia) H)as E;clear H;subst x
 end;subst.
Ltac qm_bits_return := qm_bits_active;
 cbn [qm_vec32 qm_list32 qm_fpvec32 qm_extract_i32 Z.to_nat List.nth] in *;
 change INT_MAX with 2147483647 in *;
 apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;rewrite qm_integer_nan_classifier;
  match goal with |- context[Z.ltb ?a ?b] =>destruct(Z.ltb a b)eqn:E;[apply Z.ltb_lt in E|apply Z.ltb_ge in E]end;lia
 |entailer!].
