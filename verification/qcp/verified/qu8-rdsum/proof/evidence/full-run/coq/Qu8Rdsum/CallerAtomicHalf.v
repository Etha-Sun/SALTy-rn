From Coq Require Import ZArith Lia.
From Qu8Rdsum Require Export CallerAtomicRanges.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Ltac rd_atomic_half_term t := lazymatch t with
 |rd_acc16 ?Map ?b ?s ?c ?st ?n ?i ?vl=>constr:(rd_acc16_range Map b s c st n i vl)
 |rd_active_wadd16 ?a ?b ?i ?vl=>constr:(rd_active_wadd16_range a b i vl)
 |rd_wadd16 ?a ?b=>constr:(rd_wadd16_bound a b)
 end.
Ltac rd_half_atomic_goal := first[assumption
 |match goal with |- 0 <= ?t=>let H:=rd_atomic_half_term t in exact(proj1 H)end
 |match goal with |- ?t <= 65535=>let H:=rd_atomic_half_term t in exact(proj2 H)end
 |solve[apply Z.lt_le_incl;assumption]
 |rd_atomic_goal].
Ltac rd_half_atomic_pure := rd_limits;
 let HR:=fresh "HReadableByteRange"in try rd_inner_capture_ranges HR;
 unfold derivable1,andp,coq_prop;intros;
 repeat match goal with |- _ /\ _=>split end;
 rd_half_atomic_goal.
Ltac rd_half_atomic_record := rd_limits;
 try(unfold UndefStructPredvuint8m2_t,UndefStructPredvuint16m4_t,UndefStructPredvuint32m8_t);
 rewrite ?local_field_address;repeat progress rewrite <-logic_equiv_andp_assoc;
 first[solve[apply _derivable1_andp_intros;[rd_half_atomic_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]]
 |solve[opaque_leaves;sepcon_assoc_change;fast_cancel]
 |solve[rd_output_record_pure_first]].
