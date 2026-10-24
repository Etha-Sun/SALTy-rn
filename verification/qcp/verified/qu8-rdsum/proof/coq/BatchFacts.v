From Coq Require Import ZArith Lia.
From Qu8Rdsum Require Export RvvBounds RowFacts.
Local Open Scope Z_scope.
Lemma rd_batch_column_bound : forall M base rows channels stride col start count,
 (forall q,rd_present M q ->0<=rd_get M q<=255) ->
 rd_inputs M base rows channels stride ->
 0<=start ->0<=count ->start+count<=rows ->0<=col<channels+8 ->
 0*count<=rd_column M(base+start*stride)count stride col<=255*count.
Proof.
 intros M base rows channels stride col start count HM Hin Hstart Hcount Hrows Hcol.
 apply rd_column_bound;[assumption|].
 intros j Hj;apply HM.
 replace(rd_row_address(base+start*stride)stride j col)
 with(rd_row_address base stride(start+j)col)by(unfold rd_row_address;ring).
 apply Hin;lia.
Qed.
Lemma rd_finished_acc16_value : forall M base rows channels stride col r cb i vl,
 (forall q,rd_present M q ->0<=rd_get M q<=255) ->
 rd_inputs M base rows channels stride ->0<r<=rows ->cb<=0 ->
 0<=col ->0<=i<vl ->col+vl<=channels+8 ->
 rd_acc16 M base stride col(rows-r)(rd_done r cb)i vl =
 rd_column M(base+(rows-r)*stride)(rd_min252 r)stride(col+i).
Proof.
 intros M base rows channels stride col r cb i vl HM Hin Hr Hcb Hcol Hi Hspan.
 unfold rd_acc16;rewrite(proj2(Z.ltb_lt i vl)ltac:(lia));rewrite rd_done_finish by assumption.
 apply rd_u16_in_range.
 pose proof(rd_min252_range r ltac:(lia))as HC.
 pose proof(rd_batch_column_bound M base rows channels stride(col+i)(rows-r)(rd_min252 r)
 HM Hin ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia));nia.
Qed.
Lemma rd_acc32_batch_step : forall M base rows channels stride col r cb i vl,
 (forall q,rd_present M q ->0<=rd_get M q<=255) ->
 rd_inputs M base rows channels stride ->0<r<=rows ->cb<=0 ->
 0<=col ->0<=i ->col+vl<=channels+8 ->
 rd_active_wadd32(rd_acc32 M base stride col(rows-r)i vl)
 (rd_acc16 M base stride col(rows-r)(rd_done r cb)i vl)i vl =
 rd_acc32 M base stride col(rows-(r-rd_min252 r))i vl.
Proof.
 intros M base rows channels stride col r cb i vl HM Hin Hr Hcb Hcol Hi Hspan.
 destruct(Z_lt_ge_dec i vl)as[Ha|Ha].
 - rewrite(rd_finished_acc16_value M base rows channels stride col r cb i vl HM Hin Hr Hcb Hcol ltac:(lia)Hspan).
   unfold rd_active_wadd32,rd_acc32;rewrite(proj2(Z.ltb_lt i vl)Ha).
   pose proof(rs_u32_bound(rd_column M base(rows-r)stride(col+i)))as HB.
   pose proof(rd_min252_range r ltac:(lia))as HC.
   pose proof(rd_batch_column_bound M base rows channels stride(col+i)(rows-r)(rd_min252 r)
    HM Hin ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia))as HBatch.
   rewrite rs_add_u32_wrap by nia;rewrite rs_u32_add_l.
   replace(rows-(r-rd_min252 r))with((rows-r)+rd_min252 r)by ring.
   rewrite rd_column_append by lia;reflexivity.
 - unfold rd_active_wadd32,rd_acc32;rewrite(proj2(Z.ltb_ge i vl)ltac:(lia));reflexivity.
Qed.
Print Assumptions rd_batch_column_bound.
Print Assumptions rd_finished_acc16_value.
Print Assumptions rd_acc32_batch_step.
