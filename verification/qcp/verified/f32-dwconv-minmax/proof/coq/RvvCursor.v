From Coq Require Import ZArith Lia.
From Dwconv Require Export ProgramChunkFacts.
Local Open Scope Z_scope.
(* Only the final, never-read-again weight pointer is unconstrained. *)
Definition dw_rvv_weight_cursor(channels c w weights:Z):Prop:=
 c=0 \/ w=weights+16*(channels-c).
Lemma dw_rvv_weight_cursor_active : forall channels c w weights,
 0<c -> dw_rvv_weight_cursor channels c w weights ->
 w=weights+16*(channels-c).
Proof. unfold dw_rvv_weight_cursor;intros;tauto || lia. Qed.
Lemma dw_rvv_weight_cursor_step : forall channels c w weights,
 0<c -> dw_rvv_weight_cursor channels c w weights ->
 dw_rvv_weight_cursor channels (c-dw_take c) (w+64) weights.
Proof.
 intros channels c w weights Hc Hcursor.
 pose proof(dw_rvv_weight_cursor_active channels c w weights Hc Hcursor)as Hw.
 unfold dw_rvv_weight_cursor,dw_take;destruct(Z_le_dec c 4)as[H|H].
 - rewrite Z.min_l by assumption;left;lia.
 - rewrite Z.min_r by lia;right;lia.
Qed.
Lemma dw_rvv_retired_tail_cursor_counterexample :
 ~(4096+64=4096+16*(1-(1-1))).
Proof. lia. Qed.
Print Assumptions dw_rvv_weight_cursor_active.
Print Assumptions dw_rvv_weight_cursor_step.
Print Assumptions dw_rvv_retired_tail_cursor_counterexample.
