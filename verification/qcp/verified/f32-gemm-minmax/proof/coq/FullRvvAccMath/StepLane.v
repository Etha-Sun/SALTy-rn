From Coq Require Import ZArith Lia.
From FullDomainRvv Require Import FullState.
From FullRvvAccMath Require Import AccSteps BiasInit.
Local Open Scope Z_scope.

Lemma active_lane_fma_step : forall A W K row b d vl lane x wt out,
  0 <= d -> 0 <= panel_wbase K b+8*(d+1) -> 0 <= lane ->
  active_value vl lane x (full_acc A W K row b lane d) ->
  active_value vl lane wt
    (rvv_at (sublist (panel_wbase K b+8*(d+1))
                    (panel_wbase K b+8*(d+1)+vl) W) lane) ->
  active_value vl lane out (fma_rne (rvv_at A (row*K+d)) wt x) ->
  active_value vl lane out (full_acc A W K row b lane (d+1)).
Proof.
  intros A W K row b d vl lane x wt out Hd Hb Hj Hx Hw Ho.
  unfold active_value in *; intro Hlane.
  specialize (Hx Hlane); specialize (Hw Hlane); specialize (Ho Hlane).
  unfold bit_same in *; subst x wt out.
  rewrite full_acc_step by lia.
  rewrite rvv_at_sublist_full by lia.
  f_equal; f_equal; lia.
Qed.

Print Assumptions active_lane_fma_step.
