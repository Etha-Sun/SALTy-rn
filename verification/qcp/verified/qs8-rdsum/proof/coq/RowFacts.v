From Coq Require Import ZArith Lia List.
From Qs8Rdsum Require Export ProgramModel IntegerFacts.
Local Open Scope Z_scope.
Lemma rd_sum_rows_append : forall n m M base stride col,
 rd_sum_rows M base stride col((m+n)%nat) = rd_sum_rows M base stride col m +
 rd_sum_rows M(base+Z.of_nat m*stride)stride col n.
Proof.
 induction n as[|n IH];intros.
 - rewrite Nat.add_0_r;cbn;lia.
 - rewrite Nat.add_succ_r;cbn[rd_sum_rows];rewrite IH.
   unfold rd_row_address;rewrite Nat2Z.inj_add.
   replace(base+(Z.of_nat m+Z.of_nat n)*stride+col)with(base+Z.of_nat m*stride+Z.of_nat n*stride+col)by ring;lia.
Qed.
Lemma rd_column_append : forall M base stride col m n,0<=m ->0<=n ->
 rd_column M base(m+n)stride col=rd_column M base m stride col+
 rd_column M(base+m*stride)n stride col.
Proof.
 intros;unfold rd_column;rewrite Z2Nat.inj_add by lia;rewrite rd_sum_rows_append;rewrite Z2Nat.id by lia;reflexivity.
Qed.
Lemma rd_sum_rows_bound : forall n M base stride col lo hi,
 (forall i:Z,0<=i<Z.of_nat n -> lo<=rd_get M(rd_row_address base stride i col)<=hi) ->
 lo*Z.of_nat n<=rd_sum_rows M base stride col n<=hi*Z.of_nat n.
Proof.
 induction n as[|n IH];intros;[cbn;lia|].
 assert(Hn:lo*Z.of_nat n<=rd_sum_rows M base stride col n<=hi*Z.of_nat n).
 { apply IH;intros;apply H;rewrite Nat2Z.inj_succ;lia. }
 pose proof(H(Z.of_nat n)ltac:(rewrite Nat2Z.inj_succ;lia)).
 cbn[rd_sum_rows];rewrite Nat2Z.inj_succ;nia.
Qed.
Lemma rd_column_bound : forall M base stride col n lo hi,0<=n ->
 (forall i:Z,0<=i<n ->lo<=rd_get M(rd_row_address base stride i col)<=hi) ->
 lo*n<=rd_column M base n stride col<=hi*n.
Proof. intros;unfold rd_column;pose proof(rd_sum_rows_bound (Z.to_nat n) M base stride col lo hi)as HH;rewrite Z2Nat.id in HH by lia;apply HH;assumption. Qed.
Print Assumptions rd_sum_rows_append.
Print Assumptions rd_column_append.
Print Assumptions rd_sum_rows_bound.
Print Assumptions rd_column_bound.
