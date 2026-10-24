From Coq Require Import ZArith Lia.
From Qu8Rdsum Require Export SelectedFacts StoreFacts ControlLoopFacts FastFrame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma rd_wadd16_bound : forall a b,0<=rd_wadd16 a b<=65535.
Proof. intros;unfold rd_wadd16;apply rd_u16_bound. Qed.
Lemma rd_add32_bound : forall a b,
 0<=a<=4294967295 -> 0<=b<=4294967295 ->
 0<=rs_add_u32 a b<=4294967295.
Proof. intros;rewrite rs_add_u32_wrap by assumption;apply rs_u32_bound. Qed.
Ltac rd_limits := rewrite ?sizeof_char,?sizeof_int,?sizeof_uchar,?sizeof_uint in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int.max_signed with 2147483647 in *;
 try change Int.max_unsigned with 4294967295 in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 repeat progress(rewrite ?Z.mul_1_r,?Z.mul_1_l,?Z.add_0_r,?Z.add_0_l in *).
Ltac rd_array_ranges :=
 lazymatch goal with |- ?P |-- ?Q =>
  first[match P with context[UIntArray.full ?p ?n ?A]=>
   prop_apply(rd_full_init_range p n A);let HR:=fresh "HArrayRange"in Intros_p HR;
   prop_apply(UIntArray.full_Zlength p n A);let HL:=fresh "HArrayLen"in Intros_p HL
  end|idtac]
 end.
Ltac rd_map_ranges :=
 lazymatch goal with |- ?P |-- ?Q =>
  first[match P with context[rd_mem ?M]=>
   prop_apply(rd_mem_range M);let HM:=fresh "HMapRange"in Intros_p HM;
   prop_apply(rd_mem_addresses M);let HA:=fresh "HMapAddress"in Intros_p HA
  end|idtac]
 end.
Ltac rd_term_bound t :=
 lazymatch goal with H : _<=t<=_ |- _ => fail 0 | _ =>
 lazymatch t with
 | rd_acc32 ?M ?b ?s ?c ?n ?i ?v=>let H:=fresh "HBound"in pose proof(rd_acc32_range M b s c n i v)as H
 | rd_acc16 ?M ?b ?s ?c ?st ?n ?i ?v=>let H:=fresh "HBound"in pose proof(rd_acc16_range M b s c st n i v)as H
 | rd_wadd16 ?a ?b=>let H:=fresh "HBound"in pose proof(rd_wadd16_bound a b)as H
 | rd_active_wadd16 ?a ?b ?i ?v=>let H:=fresh "HBound"in pose proof(rd_active_wadd16_range a b i v)as H
 | rs_add_u32 ?a ?b=>try rd_term_bound a;try rd_term_bound b;let H:=fresh "HBound"in assert(H:0<=t<=4294967295)by(apply rd_add32_bound;lia)
 | Znth ?i ?A 0=>match goal with HR:rd_init_range A |- _=>let H:=fresh "HBound"in pose proof(HR i ltac:(lia))as H end
 end end.
Ltac rd_collect_bounds := repeat progress(
 multimatch goal with |- context[rd_acc32 ?M ?b ?s ?c ?n ?i ?v]=>rd_term_bound(rd_acc32 M b s c n i v)
 | |- context[rd_acc16 ?M ?b ?s ?c ?st ?n ?i ?v]=>rd_term_bound(rd_acc16 M b s c st n i v)
 | |- context[rd_wadd16 ?a ?b]=>rd_term_bound(rd_wadd16 a b)
 | |- context[rd_active_wadd16 ?a ?b ?i ?v]=>rd_term_bound(rd_active_wadd16 a b i v)
 | |- context[rs_add_u32 ?a ?b]=>rd_term_bound(rs_add_u32 a b)
 | |- context[Znth ?i ?A 0]=>rd_term_bound(Znth i A 0)
 end).
Ltac rd_caller := rd_limits;
 first[solve[entailer!;lia]|try rd_array_ranges;try rd_map_ranges;try rd_collect_bounds;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]
 |solve[apply _derivable1_andp_intros;[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia|opaque_leaves;sepcon_assoc_change;fast_cancel]]
 |solve[opaque_leaves;sepcon_assoc_change;fast_cancel]
 |solve[entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel)]]].
