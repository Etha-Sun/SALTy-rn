From Coq Require Import ZArith Lia.
From DwChw Require Export NeonKernelTailValueFacts ControlModel.
Local Open Scope Z_scope.
Lemma dw_neon_decrement_at_tail:forall N x n,
 0<=x->1<=n<=4->N=x+n->x mod 4=0->
 ((4*N+15)÷16)*16=4*(x+4).
Proof.
 intros N x n Hx Hn HN Hmod.
 rewrite Z.quot_div_nonneg by lia.
 pose proof(Z.div_mod x 4 ltac:(lia))as Hdivx;rewrite Hmod in Hdivx.
 pose proof(Z.div_mod(4*N+15)16 ltac:(lia))as Hdiv.
 pose proof(Z.mod_pos_bound(4*N+15)16 ltac:(lia))as Hr.
 lia.
Qed.
Lemma dw_progress_doz_end:forall R O output H N rem,
 0<N->0<=rem<=H->
 dw_progress R O output H N(H-rem)N=
 dw_progress R O output H N(H-dw_doz_model rem 3)0.
Proof.
 intros R O output H N rem HN Hrem.
 rewrite dw_progress_tile_end by lia;unfold dw_doz_model.
 destruct(Z_le_dec rem 3).
 - rewrite Z.max_r,Z.min_l by lia;rewrite Z.sub_0_r;reflexivity.
 - rewrite Z.max_l,Z.min_r by lia;f_equal;lia.
Qed.
Print Assumptions dw_neon_decrement_at_tail.
Print Assumptions dw_progress_doz_end.
