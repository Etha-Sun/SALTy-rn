From Coq Require Import ZArith List Lia.
From DwChw Require Export RvvKernelProgressAtFacts.
Local Open Scope Z_scope.

Lemma dw_write_row_different:forall xs O output N row x n r c,
 0<N->0<=c<N->0<=x->0<=n->x+n<=N->Z.of_nat(length xs)=n->r<>row->
 dw_write_values O(output+4*(row*N+x))xs(output+4*(r*N+c))=O(output+4*(r*N+c)).
Proof.
 intros;rewrite dw_write_values_row_cell with(n:=n)by assumption.
 destruct(Z.eq_dec r row);[contradiction|reflexivity].
Qed.
Lemma dw_write_row_hit:forall xs O output N row x n c,
 0<N->0<=c<N->0<=x->0<=n->x+n<=N->Z.of_nat(length xs)=n->x<=c<x+n->
 dw_write_values O(output+4*(row*N+x))xs(output+4*(row*N+c))=
 Some(nth(Z.to_nat(c-x))xs fp32_zero).
Proof.
 intros;rewrite dw_write_values_row_cell with(n:=n)by assumption.
 destruct(Z.eq_dec row row);[|contradiction].
 destruct(Z_le_dec x c);[|lia];destruct(Z_lt_dec c(x+n));[reflexivity|lia].
Qed.
Lemma dw_write_row_outside_columns:forall xs O output N row x n r c,
 0<N->0<=c<N->0<=x->0<=n->x+n<=N->Z.of_nat(length xs)=n->
 (c<x \/ x+n<=c)->
 dw_write_values O(output+4*(row*N+x))xs(output+4*(r*N+c))=O(output+4*(r*N+c)).
Proof.
 intros;rewrite dw_write_values_row_cell with(n:=n)by assumption.
 destruct(Z.eq_dec r row);[|reflexivity].
 destruct(Z_le_dec x c);[|reflexivity];destruct(Z_lt_dec c(x+n));[lia|reflexivity].
Qed.
Lemma dw_write_row_outside_matrix:forall xs O output H N row x n q,
 0<N->0<=row<H->0<=x->0<=n->x+n<=N->Z.of_nat(length xs)=n->
 ~(output<=q<output+4*H*N /\ (q-output)mod 4=0)->
 dw_write_values O(output+4*(row*N+x))xs q=O q.
Proof.
 intros xs O output H N row x n q HN Hr Hx Hn Hend Hlen Hout.
 apply dw_write_values_frame;intros i Hi Eq;apply Hout;rewrite Eq.
 assert(HiZ:0<=Z.of_nat i<n)by(rewrite<-Hlen;lia).
 split.
 - assert(Hprod:(row+1)*N<=H*N)by(apply Z.mul_le_mono_nonneg_r;lia).
   split;nia.
 - replace(output+4*(row*N+x)+4*Z.of_nat i-output)
    with((row*N+x+Z.of_nat i)*4)by ring.
   apply Z.mod_mul;lia.
Qed.
Lemma dw_store_row_in_tile:forall H y j,
 0<=y<H->0<=j<=2->0<=dw_store_row H y j<Z.min H(y+3).
Proof.
 intros H y j Hy Hj;unfold dw_store_row.
 pose proof(Z.le_min_l(y+j)(H-1));pose proof(Z.le_min_r(y+j)(H-1)).
 split;[apply Z.min_glb;lia|].
 destruct(Z.min_spec H(y+3))as[[? ->]|[? ->]];lia.
Qed.
Print Assumptions dw_write_row_different.
Print Assumptions dw_write_row_hit.
Print Assumptions dw_write_row_outside_columns.
Print Assumptions dw_write_row_outside_matrix.
Print Assumptions dw_store_row_in_tile.
