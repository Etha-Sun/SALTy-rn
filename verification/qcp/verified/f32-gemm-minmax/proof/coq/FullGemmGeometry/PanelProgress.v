From Coq Require Import ZArith Lia.
From FullDomainRvv Require Import FullModel.
Local Open Scope Z_scope.
Lemma panel_progress_arith : forall n r,0<r<=n ->Z.rem(n-r)8=0 ->
 let b:=(n-r)÷8 in let width:=panel_cols n b in
 width=Z.min 8 r /\ panel_count(n-(r-width))=b+1 /\
 (8<r ->0<r-width /\ Z.rem(n-(r-width))8=0) /\
 (r<=8 ->r-width=0).
Proof.
 intros n r Hr Hrem.
 pose proof(Z.quot_rem(n-r)8 ltac:(lia))as E;rewrite Hrem in E.
 pose proof(Z.quot_pos(n-r)8 ltac:(lia)ltac:(lia))as Q.
 cbn zeta;unfold panel_cols.
 replace(n-8*((n-r)÷8))with r by lia.
 destruct(Z_le_dec r 8)as[L|L].
 - rewrite Z.min_r by lia;repeat split;try lia.
   unfold panel_count;symmetry;apply Z.div_unique with(r:=r-1);lia.
 - rewrite Z.min_l by lia;repeat split;try lia.
   + unfold panel_count;symmetry;apply Z.div_unique with(r:=7);lia.
   + replace(n-(r-8))with((((n-r)÷8)+1)*8)by lia.
     apply Z.rem_mul;lia.
Qed.
Print Assumptions panel_progress_arith.
