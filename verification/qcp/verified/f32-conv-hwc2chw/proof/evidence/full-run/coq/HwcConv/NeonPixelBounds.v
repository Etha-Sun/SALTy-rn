From Coq Require Import ZArith Lia.
From HwcConv Require Export NeonRowsPixelModel.
Local Open Scope Z_scope.
Lemma hc_neon_x_bound:forall width x,0<width->0<=x->x<(width+1)÷2->0<=2*x<width.
Proof. intros width x Hw Hx Hb;rewrite Z.quot_div_nonneg in Hb by lia.
 pose proof(Z.div_mod(width+1)2 ltac:(lia)).
 pose proof(Z.mod_pos_bound(width+1)2 ltac:(lia));lia. Qed.
Lemma hc_window_slice:forall F p n k r,hc_window F p n->0<=k->0<=r->k+r<=n->hc_window F(p+4*k)r.
Proof. unfold hc_window;intros F p n k r[Hp[Hn Hwin]]Hk Hr Hkr;repeat split;try lia.
 intros i Hi;replace(p+4*k+4*i)with(p+4*(k+i))by ring;apply Hwin;lia. Qed.
Lemma hc_window_shrink:forall F p n r,hc_window F p n->0<=r<=n->hc_window F p r.
Proof. unfold hc_window;intros F p n r[Hp[Hn Hwin]]Hr;repeat split;try lia;intros;apply Hwin;lia. Qed.
Print Assumptions hc_neon_x_bound.
Print Assumptions hc_window_slice.
Print Assumptions hc_window_shrink.
