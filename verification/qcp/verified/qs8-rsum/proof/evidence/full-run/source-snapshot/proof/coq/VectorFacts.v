From Coq Require Import ZArith Lia.
From Qs8Rsum Require Export IntegerFacts VectorModel.
Local Open Scope Z_scope.
Lemma rs_active_s32_bound : forall a b i vl,
 -2147483648<=a<=2147483647 -> -2147483648<=b<=2147483647 ->
 -2147483648<=rs_active_s32 a b i vl<=2147483647.
Proof.
 intros a b i vl Ha Hb;unfold rs_active_s32;destruct(Z.ltb i vl).
 - rewrite rs_add_s32_wrap by assumption;apply rs_s32_bound.
 - exact Ha.
Qed.
Print Assumptions rs_active_s32_bound.
Ltac rs_term_bound t :=
 lazymatch t with
 | rs_active_s32 ?a ?b ?i ?vl =>
   apply rs_active_s32_bound;[rs_term_bound a|rs_term_bound b]
 | _ => lia
 end.
Ltac rs_bound_arith :=
 first[assumption|reflexivity|lia
 |match goal with
  | |- context[rs_active_s32 ?a ?b ?i ?vl] =>
    let t:=constr:(rs_active_s32 a b i vl) in
    let H:=fresh "Hactive_range" in
    assert(H : -2147483648<=t<=2147483647) by (rs_term_bound t);lia
  end].
