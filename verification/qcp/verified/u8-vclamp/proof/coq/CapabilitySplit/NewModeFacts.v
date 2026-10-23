From Coq Require Import ZArith String.
From SimpleC.SL Require Import Mem SeparationLogic.
Import Snaive_C_Rules64.
Lemma dot_field_address : forall (L:lvalue_expr)(f:string),
 eval_addr_expr(RE_addr_of(LE_dot_field L f)) =
 eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of L)f)).
Proof. intros;apply eval_addr_expr_congr;apply addr_of_arrow_field. Qed.
Print Assumptions dot_field_address.
