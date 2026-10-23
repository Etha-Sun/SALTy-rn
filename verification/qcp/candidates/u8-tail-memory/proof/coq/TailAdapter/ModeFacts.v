From Coq Require Import ZArith Lia String.
From SimpleC.SL Require Export Mem SeparationLogic.
Import Snaive_C_Rules64.
Lemma typed_field_address : forall (R:rvalue_expr)(t f:string),
 eval_addr_expr(RE_addr_of(LE_arrow_field(RE_const(eval_addr_expr R)(FET_alias t))f)) =
 eval_addr_expr(RE_addr_of(LE_arrow_field R f)).
Proof. intros;apply eval_addr_expr_congr;apply RE_addr_of_congr;apply LE_arrow_field_congr;[apply eval_addr|reflexivity]. Qed.
Print Assumptions typed_field_address.
