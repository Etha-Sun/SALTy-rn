From Coq Require Import ZArith Lia List.
From Qs8Rdsum Require Export RvvFacts.
Local Open Scope Z_scope.
Definition rd_group_row(M:RDMap)(base stride col start cb j:Z):Z :=
 if Z.ltb j cb then rd_get M(rd_row_address(base+start*stride)stride j col)else 0.
Definition rd_group7(M:RDMap)(base stride col start cb:Z):Z :=
 rd_group_row M base stride col start cb 0+
 rd_group_row M base stride col start cb 1+
 rd_group_row M base stride col start cb 2+
 rd_group_row M base stride col start cb 3+
 rd_group_row M base stride col start cb 4+
 rd_group_row M base stride col start cb 5+
 rd_group_row M base stride col start cb 6.
Lemma rd_group7_column : forall M base stride col start cb,0<=cb ->
 rd_group7 M base stride col start cb=
 rd_column M(base+start*stride)(Z.min cb 7)stride col.
Proof.
 intros M base stride col start cb Hcb;destruct(Z_le_gt_dec cb 7).
 - rewrite Z.min_l by lia;assert(cb=0 \/ cb=1 \/ cb=2 \/ cb=3 \/ cb=4 \/ cb=5 \/ cb=6 \/ cb=7)by lia.
   destruct H as[ ->|[->|[->|[->|[->|[->|[->| ->]]]]]]];
   cbv [rd_group7 rd_group_row rd_column rd_sum_rows Z.to_nat Z.of_nat Z.ltb Z.compare Pos.compare Pos.compare_cont Pos.to_nat Pos.of_succ_nat Pos.iter_op Nat.add Pos.succ];ring.
 - unfold rd_group7,rd_group_row;rewrite Z.min_r by lia.
   repeat match goal with |- context[Z.ltb ?j cb]=>replace(Z.ltb j cb)with true by(symmetry;apply Z.ltb_lt;lia)end.
   cbv [rd_column rd_sum_rows Z.to_nat Z.of_nat Pos.to_nat Pos.of_succ_nat Pos.iter_op Nat.add Pos.succ];ring.
Qed.
Lemma rd_done_step7 : forall r cb,0<cb<=rd_min252 r ->
 rd_done r(cb-7)=rd_done r cb+Z.min cb 7.
Proof.
 intros r cb H;unfold rd_done;rewrite(Z.min_r(rd_min252 r)(rd_min252 r-cb))by lia.
 destruct(Z_le_gt_dec cb 7).
 - rewrite(Z.min_l cb 7)by lia;rewrite Z.min_l by lia;lia.
 - rewrite(Z.min_r cb 7)by lia;rewrite Z.min_r by lia;lia.
Qed.
Lemma rd_batch16_step7 : forall M base stride col start count cb,
 0<=count -> 0<=cb ->
 rs_s16(rs_s16(rd_column M(base+start*stride)count stride col)+
 rd_group7 M base stride col(start+count)cb)=
 rs_s16(rd_column M(base+start*stride)(count+Z.min cb 7)stride col).
Proof.
 intros;rewrite rd_group7_column by assumption;rewrite rd_s16_add_l.
 replace(base+(start+count)*stride)with(base+start*stride+count*stride)by ring.
 rewrite <-rd_column_append by(apply Z.min_glb;lia)||lia;reflexivity.
Qed.
Print Assumptions rd_group7_column.
Print Assumptions rd_done_step7.
Print Assumptions rd_batch16_step7.
