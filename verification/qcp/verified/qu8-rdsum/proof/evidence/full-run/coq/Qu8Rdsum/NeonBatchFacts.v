From Coq Require Import ZArith Lia.
From Qu8Rdsum Require Export BatchFacts ControlLoopFacts PointerStepFacts.
Local Open Scope Z_scope.
Lemma rd_neon_acc32_batch_step : forall M base rows channels stride c32 c16 r cb i j w32 w16,
 (forall q,rd_present M q ->0<=rd_get M q<=255) ->
 rd_inputs M base rows channels stride ->0<r<=rows ->cb<=0 ->
 0<=c16 ->0<=i<w32 ->0<=j<w16 ->c16+w16<=channels+8 ->c32+i=c16+j ->
 rs_add_u32(rd_acc32 M base stride c32(rows-r)i w32)
 (rd_acc16 M base stride c16(rows-r)(rd_done r cb)j w16) =
 rd_acc32 M base stride c32(rows-Z.max 0(r-252))i w32.
Proof.
 intros M base rows channels stride c32 c16 r cb i j w32 w16 HM Hin Hr Hcb Hc Hi Hj Hspan Hcols.
 rewrite(rd_finished_acc16_value M base rows channels stride c16 r cb j w16 HM Hin Hr Hcb Hc Hj Hspan).
 unfold rd_acc32;rewrite(proj2(Z.ltb_lt i w32)ltac:(lia)).
 pose proof(rs_u32_bound(rd_column M base(rows-r)stride(c32+i)))as HB.
 pose proof(rd_min252_range r ltac:(lia))as HC.
 pose proof(rd_batch_column_bound M base rows channels stride(c16+j)(rows-r)(rd_min252 r)
 HM Hin ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia))as HBatch.
 rewrite rs_add_u32_wrap by nia;rewrite rs_u32_add_l.
 rewrite <-rd_min252_remainder by lia.
 replace(rows-(r-rd_min252 r))with((rows-r)+rd_min252 r)by ring.
 rewrite rd_column_append by lia;rewrite Hcols;reflexivity.
Qed.
Print Assumptions rd_neon_acc32_batch_step.
