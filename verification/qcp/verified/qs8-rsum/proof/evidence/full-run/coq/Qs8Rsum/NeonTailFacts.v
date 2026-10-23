From Coq Require Import ZArith Lia List.
From Qs8Rsum Require Import NeonSupport.
Import ListNotations.
Local Open Scope Z_scope.
Lemma rs_mask16_values : forall (A:list Z) idx r,
 1<=r<16 -> rs_sum[(if Z.ltb 0 r then Znth(idx+0)A 0 else 0);(if Z.ltb 1 r then Znth(idx+1)A 0 else 0);(if Z.ltb 2 r then Znth(idx+2)A 0 else 0);(if Z.ltb 3 r then Znth(idx+3)A 0 else 0);(if Z.ltb 4 r then Znth(idx+4)A 0 else 0);(if Z.ltb 5 r then Znth(idx+5)A 0 else 0);(if Z.ltb 6 r then Znth(idx+6)A 0 else 0);(if Z.ltb 7 r then Znth(idx+7)A 0 else 0);(if Z.ltb 8 r then Znth(idx+8)A 0 else 0);(if Z.ltb 9 r then Znth(idx+9)A 0 else 0);(if Z.ltb 10 r then Znth(idx+10)A 0 else 0);(if Z.ltb 11 r then Znth(idx+11)A 0 else 0);(if Z.ltb 12 r then Znth(idx+12)A 0 else 0);(if Z.ltb 13 r then Znth(idx+13)A 0 else 0);(if Z.ltb 14 r then Znth(idx+14)A 0 else 0);(if Z.ltb 15 r then Znth(idx+15)A 0 else 0)]=rs_chunk A idx (Z.to_nat r).
Proof.
 intros A idx r Hr;assert(Hcases:r=1 \/ r=2 \/ r=3 \/ r=4 \/ r=5 \/ r=6 \/ r=7 \/ r=8 \/ r=9 \/ r=10 \/ r=11 \/ r=12 \/ r=13 \/ r=14 \/ r=15)by lia.
 destruct Hcases as[H1|[H2|[H3|[H4|[H5|[H6|[H7|[H8|[H9|[H10|[H11|[H12|[H13|[H14|H15]]]]]]]]]]]]]].
 - subst r;change(rs_sum[Znth(idx+0)A 0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0]=rs_chunk A idx 1%nat);cbn[rs_sum fold_right rs_chunk Z.of_nat Pos.of_succ_nat Pos.succ];ring.
 - subst r;change(rs_sum[Znth(idx+0)A 0;Znth(idx+1)A 0;0;0;0;0;0;0;0;0;0;0;0;0;0;0]=rs_chunk A idx 2%nat);cbn[rs_sum fold_right rs_chunk Z.of_nat Pos.of_succ_nat Pos.succ];ring.
 - subst r;change(rs_sum[Znth(idx+0)A 0;Znth(idx+1)A 0;Znth(idx+2)A 0;0;0;0;0;0;0;0;0;0;0;0;0;0]=rs_chunk A idx 3%nat);cbn[rs_sum fold_right rs_chunk Z.of_nat Pos.of_succ_nat Pos.succ];ring.
 - subst r;change(rs_sum[Znth(idx+0)A 0;Znth(idx+1)A 0;Znth(idx+2)A 0;Znth(idx+3)A 0;0;0;0;0;0;0;0;0;0;0;0;0]=rs_chunk A idx 4%nat);cbn[rs_sum fold_right rs_chunk Z.of_nat Pos.of_succ_nat Pos.succ];ring.
 - subst r;change(rs_sum[Znth(idx+0)A 0;Znth(idx+1)A 0;Znth(idx+2)A 0;Znth(idx+3)A 0;Znth(idx+4)A 0;0;0;0;0;0;0;0;0;0;0;0]=rs_chunk A idx 5%nat);cbn[rs_sum fold_right rs_chunk Z.of_nat Pos.of_succ_nat Pos.succ];ring.
 - subst r;change(rs_sum[Znth(idx+0)A 0;Znth(idx+1)A 0;Znth(idx+2)A 0;Znth(idx+3)A 0;Znth(idx+4)A 0;Znth(idx+5)A 0;0;0;0;0;0;0;0;0;0;0]=rs_chunk A idx 6%nat);cbn[rs_sum fold_right rs_chunk Z.of_nat Pos.of_succ_nat Pos.succ];ring.
 - subst r;change(rs_sum[Znth(idx+0)A 0;Znth(idx+1)A 0;Znth(idx+2)A 0;Znth(idx+3)A 0;Znth(idx+4)A 0;Znth(idx+5)A 0;Znth(idx+6)A 0;0;0;0;0;0;0;0;0;0]=rs_chunk A idx 7%nat);cbn[rs_sum fold_right rs_chunk Z.of_nat Pos.of_succ_nat Pos.succ];ring.
 - subst r;change(rs_sum[Znth(idx+0)A 0;Znth(idx+1)A 0;Znth(idx+2)A 0;Znth(idx+3)A 0;Znth(idx+4)A 0;Znth(idx+5)A 0;Znth(idx+6)A 0;Znth(idx+7)A 0;0;0;0;0;0;0;0;0]=rs_chunk A idx 8%nat);cbn[rs_sum fold_right rs_chunk Z.of_nat Pos.of_succ_nat Pos.succ];ring.
 - subst r;change(rs_sum[Znth(idx+0)A 0;Znth(idx+1)A 0;Znth(idx+2)A 0;Znth(idx+3)A 0;Znth(idx+4)A 0;Znth(idx+5)A 0;Znth(idx+6)A 0;Znth(idx+7)A 0;Znth(idx+8)A 0;0;0;0;0;0;0;0]=rs_chunk A idx 9%nat);cbn[rs_sum fold_right rs_chunk Z.of_nat Pos.of_succ_nat Pos.succ];ring.
 - subst r;change(rs_sum[Znth(idx+0)A 0;Znth(idx+1)A 0;Znth(idx+2)A 0;Znth(idx+3)A 0;Znth(idx+4)A 0;Znth(idx+5)A 0;Znth(idx+6)A 0;Znth(idx+7)A 0;Znth(idx+8)A 0;Znth(idx+9)A 0;0;0;0;0;0;0]=rs_chunk A idx 10%nat);cbn[rs_sum fold_right rs_chunk Z.of_nat Pos.of_succ_nat Pos.succ];ring.
 - subst r;change(rs_sum[Znth(idx+0)A 0;Znth(idx+1)A 0;Znth(idx+2)A 0;Znth(idx+3)A 0;Znth(idx+4)A 0;Znth(idx+5)A 0;Znth(idx+6)A 0;Znth(idx+7)A 0;Znth(idx+8)A 0;Znth(idx+9)A 0;Znth(idx+10)A 0;0;0;0;0;0]=rs_chunk A idx 11%nat);cbn[rs_sum fold_right rs_chunk Z.of_nat Pos.of_succ_nat Pos.succ];ring.
 - subst r;change(rs_sum[Znth(idx+0)A 0;Znth(idx+1)A 0;Znth(idx+2)A 0;Znth(idx+3)A 0;Znth(idx+4)A 0;Znth(idx+5)A 0;Znth(idx+6)A 0;Znth(idx+7)A 0;Znth(idx+8)A 0;Znth(idx+9)A 0;Znth(idx+10)A 0;Znth(idx+11)A 0;0;0;0;0]=rs_chunk A idx 12%nat);cbn[rs_sum fold_right rs_chunk Z.of_nat Pos.of_succ_nat Pos.succ];ring.
 - subst r;change(rs_sum[Znth(idx+0)A 0;Znth(idx+1)A 0;Znth(idx+2)A 0;Znth(idx+3)A 0;Znth(idx+4)A 0;Znth(idx+5)A 0;Znth(idx+6)A 0;Znth(idx+7)A 0;Znth(idx+8)A 0;Znth(idx+9)A 0;Znth(idx+10)A 0;Znth(idx+11)A 0;Znth(idx+12)A 0;0;0;0]=rs_chunk A idx 13%nat);cbn[rs_sum fold_right rs_chunk Z.of_nat Pos.of_succ_nat Pos.succ];ring.
 - subst r;change(rs_sum[Znth(idx+0)A 0;Znth(idx+1)A 0;Znth(idx+2)A 0;Znth(idx+3)A 0;Znth(idx+4)A 0;Znth(idx+5)A 0;Znth(idx+6)A 0;Znth(idx+7)A 0;Znth(idx+8)A 0;Znth(idx+9)A 0;Znth(idx+10)A 0;Znth(idx+11)A 0;Znth(idx+12)A 0;Znth(idx+13)A 0;0;0]=rs_chunk A idx 14%nat);cbn[rs_sum fold_right rs_chunk Z.of_nat Pos.of_succ_nat Pos.succ];ring.
 - subst r;change(rs_sum[Znth(idx+0)A 0;Znth(idx+1)A 0;Znth(idx+2)A 0;Znth(idx+3)A 0;Znth(idx+4)A 0;Znth(idx+5)A 0;Znth(idx+6)A 0;Znth(idx+7)A 0;Znth(idx+8)A 0;Znth(idx+9)A 0;Znth(idx+10)A 0;Znth(idx+11)A 0;Znth(idx+12)A 0;Znth(idx+13)A 0;Znth(idx+14)A 0;0]=rs_chunk A idx 15%nat);cbn[rs_sum fold_right rs_chunk Z.of_nat Pos.of_succ_nat Pos.succ];ring.

Qed.
Lemma rs_tail_sum16_values : forall (A:list Z) idx r,
 0<=idx -> idx+r<=Zlength A -> 1<=r<16 ->
 (forall i:Z,0<=i<16 -> -128<=Znth(idx+i)A 0<=127) ->
 rs_sum[rs_mul_s8(Znth(idx+0)A 0)(Znth(16-r+0)rs_onemask 0);rs_mul_s8(Znth(idx+1)A 0)(Znth(16-r+1)rs_onemask 0);rs_mul_s8(Znth(idx+2)A 0)(Znth(16-r+2)rs_onemask 0);rs_mul_s8(Znth(idx+3)A 0)(Znth(16-r+3)rs_onemask 0);rs_mul_s8(Znth(idx+4)A 0)(Znth(16-r+4)rs_onemask 0);rs_mul_s8(Znth(idx+5)A 0)(Znth(16-r+5)rs_onemask 0);rs_mul_s8(Znth(idx+6)A 0)(Znth(16-r+6)rs_onemask 0);rs_mul_s8(Znth(idx+7)A 0)(Znth(16-r+7)rs_onemask 0);rs_mul_s8(Znth(idx+8)A 0)(Znth(16-r+8)rs_onemask 0);rs_mul_s8(Znth(idx+9)A 0)(Znth(16-r+9)rs_onemask 0);rs_mul_s8(Znth(idx+10)A 0)(Znth(16-r+10)rs_onemask 0);rs_mul_s8(Znth(idx+11)A 0)(Znth(16-r+11)rs_onemask 0);rs_mul_s8(Znth(idx+12)A 0)(Znth(16-r+12)rs_onemask 0);rs_mul_s8(Znth(idx+13)A 0)(Znth(16-r+13)rs_onemask 0);rs_mul_s8(Znth(idx+14)A 0)(Znth(16-r+14)rs_onemask 0);rs_mul_s8(Znth(idx+15)A 0)(Znth(16-r+15)rs_onemask 0)]=rs_prefix A(idx+r)-rs_prefix A idx.
Proof.
 intros A idx r Hi Hlen Hr Hb.
 repeat rewrite rs_masked_s8 by(first[lia|apply Hb;lia]).
 rewrite rs_mask16_values by exact Hr.
 pose proof(rs_prefix_chunk(Z.to_nat r)A idx Hi ltac:(lia))as Hstep.
 replace(Z.of_nat(Z.to_nat r))with r in Hstep by lia;lia.
Qed.
Print Assumptions rs_mask16_values.
Print Assumptions rs_tail_sum16_values.
