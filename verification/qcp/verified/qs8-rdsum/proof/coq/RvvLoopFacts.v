From Coq Require Import ZArith Lia.
From Qs8Rdsum Require Export LaneStep BatchFacts.
Local Open Scope Z_scope.
Lemma rd_rem_step7 : forall r cb,cb<=rd_min252 r ->
 Z.rem(rd_min252 r-cb)7=0 ->Z.rem(rd_min252 r-(cb-7))7=0.
Proof.
 intros r cb Hcb Hrem;rewrite Z.rem_mod_nonneg in Hrem by lia.
 rewrite Z.rem_mod_nonneg by lia.
 replace(rd_min252 r-(cb-7))with(rd_min252 r-cb+7)by ring.
 rewrite Z.add_mod by lia;rewrite Hrem;reflexivity.
Qed.
Lemma rd_outer_progress_step : forall rows r,0<r ->
 rd_mod252(rows-r)=0 ->rd_progress rows(r-rd_min252 r).
Proof.
 intros rows r Hr Hprogress;destruct(Z_le_gt_dec r 252)as[Hsmall|Hlarge].
 - unfold rd_min252;rewrite Z.min_l by lia;left;lia.
 - right;unfold rd_min252;rewrite Z.min_r by lia;unfold rd_mod252 in *.
   replace(rows-(r-252))with(rows-r+252)by ring.
   rewrite Z.add_mod by lia;rewrite Hprogress;reflexivity.
Qed.
Lemma rd_inner_to_outer_pointer : forall r cb p base stride j,
 0<r ->-6<=cb<=0 ->Z.rem(rd_min252 r-cb)7=0 ->
 rd_inner_gate r cb p(rd_u64(base+(rd_min252 r-cb+j)*stride)) ->
 rd_ptr_gate(r-rd_min252 r)p(rd_u64(base+(rd_min252 r+j)*stride)).
Proof.
 intros r cb p base stride j Hr Hcb Hrem Hgate.
 destruct(Z_le_gt_dec r 252)as[Hsmall|Hlarge].
 - left;unfold rd_min252;rewrite Z.min_l by lia;lia.
 - assert(Ecb:cb=0)by(apply(rd_full_block_exit_zero r cb);lia||assumption).
   apply rd_inner_gate_next in Hgate;[|lia];right;subst cb;rewrite Z.sub_0_r in Hgate;exact Hgate.
Qed.
Print Assumptions rd_rem_step7.
Print Assumptions rd_outer_progress_step.
Print Assumptions rd_inner_to_outer_pointer.
