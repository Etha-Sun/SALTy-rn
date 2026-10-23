From Coq Require Import ZArith Lia.
From Qu8Rsum Require Export IntegerFacts VectorModel.
Local Open Scope Z_scope.
Lemma rs_active_u32_bound : forall a b i vl,
 0<=a<=4294967295 -> 0<=b<=4294967295 ->
 0<=rs_active_u32 a b i vl<=4294967295.
Proof.
 intros a b i vl Ha Hb;unfold rs_active_u32;destruct(Z.ltb i vl).
 - rewrite rs_add_u32_wrap by assumption;apply rs_u32_bound.
 - exact Ha.
Qed.
Print Assumptions rs_active_u32_bound.
Ltac rs_term_bound t :=
 lazymatch t with
 | rs_active_u32 ?a ?b ?i ?vl =>
   apply rs_active_u32_bound;[rs_term_bound a|rs_term_bound b]
 | _ => lia
 end.
Ltac rs_bound_arith :=
 first[assumption|reflexivity|lia
 |match goal with
  | |- context[rs_active_u32 ?a ?b ?i ?vl] =>
    let t:=constr:(rs_active_u32 a b i vl) in
    let H:=fresh "Hactive_range" in
    assert(H : 0<=t<=4294967295) by (rs_term_bound t);lia
  end].
