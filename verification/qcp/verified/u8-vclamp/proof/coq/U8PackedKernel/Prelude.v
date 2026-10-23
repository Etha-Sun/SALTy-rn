From SimpleC.SL Require Import Mem SeparationLogic.
(* Elaboration prerequisite for QCP nested field_addr exports; no goal modification. *)
Coercion eval_addr_expr : rvalue_expr >-> addr.
