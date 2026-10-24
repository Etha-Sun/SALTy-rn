From Coq Require Import ZArith Lia.
From Qu8Rdsum Require Export CallerOutputFirst LoopResourceFacts RvvBounds MemoryModel LoadModel.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
(* This bounds the mathematical default value only. It proves no readable
   window and cannot replace any actual C load's separate window obligation. *)
Lemma rd_get_total_range : forall Map p,
 (forall q,rd_present Map q ->0<=rd_get Map q<=255) ->
 0<=rd_get Map p<=255.
Proof.
 intros Map p HR;unfold rd_get;destruct(Map p)as[v|]eqn:E;[|lia].
 specialize(HR p ltac:(unfold rd_present;eexists;exact E)).
 unfold rd_get in HR;rewrite E in HR;exact HR.
Qed.
Lemma rd_read_lane_total_range : forall Map p i vl,
 (forall q,rd_present Map q ->0<=rd_get Map q<=255) ->
 0<=rd_read_lane Map p i vl<=255.
Proof. intros;unfold rd_read_lane;destruct(Z.ltb i vl);[apply rd_get_total_range;assumption|lia]. Qed.
Ltac rd_atomic_word_term t :=
 lazymatch t with
 |rd_acc32 ?Map ?b ?s ?c ?n ?i ?vl=>constr:(rd_acc32_range Map b s c n i vl)
 |rd_out_lane(rd_partial ?Map ?b ?rows ?Ch ?stride ?k ?Init)?k ?i ?vl=>
  constr:(rd_partial_out_lane_range Map b rows Ch stride Init k i vl
   ltac:(assumption)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia))
 |rd_active_wadd32 ?a ?b ?i ?vl=>let HA:=rd_atomic_word_term a in let HB:=rd_atomic_word_term b in
  constr:(rd_active_wadd32_range a b i vl HA HB)
 end.
Ltac rd_atomic_byte_term t :=
 lazymatch t with rd_read_lane ?Map ?p ?i ?vl=>
 match goal with HR:(forall q,rd_present Map q ->0<=rd_get Map q<=255) |- _=>
 constr:(rd_read_lane_total_range Map p i vl HR)
 end end.
Ltac rd_atomic_goal := first[assumption
 |match goal with |- 0 <= ?t =>let H:=rd_atomic_byte_term t in exact(proj1 H)end
 |match goal with |- ?t <= 255 =>let H:=rd_atomic_byte_term t in exact(proj2 H)end
 |match goal with |- 0 <= ?t =>let H:=rd_atomic_word_term t in exact(proj1 H)end
 |match goal with |- ?t <= 4294967295 =>let H:=rd_atomic_word_term t in exact(proj2 H)end
 |lia].
Ltac rd_atomic_pure := rd_limits;
 let HR:=fresh "HReadableByteRange"in try rd_inner_capture_ranges HR;
 unfold derivable1,andp,coq_prop;intros;
 repeat match goal with |- _ /\ _=>split end;
 rd_atomic_goal.
Ltac rd_atomic_record := rd_limits;
 try(unfold UndefStructPredvuint8m2_t,UndefStructPredvuint16m4_t,UndefStructPredvuint32m8_t);
 rewrite ?local_field_address;repeat progress rewrite <-logic_equiv_andp_assoc;
 first[solve[apply _derivable1_andp_intros;[rd_atomic_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]]
 |solve[opaque_leaves;sepcon_assoc_change;fast_cancel]
 |solve[rd_output_record_pure_first]].
Print Assumptions rd_get_total_range.
Print Assumptions rd_read_lane_total_range.
