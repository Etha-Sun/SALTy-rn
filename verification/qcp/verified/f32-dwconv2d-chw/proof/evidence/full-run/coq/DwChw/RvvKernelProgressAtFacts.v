From Coq Require Import ZArith List Lia.
From DwChw Require Export RvvKernelWriteWindowFacts.
Local Open Scope Z_scope.

Lemma dw_output_index_split:forall output H N q,
 0<N->output<=q<output+4*H*N->(q-output)mod 4=0->
 let k:=(q-output)/4 in let r:=k/N in let c:=k mod N in
 0<=r<H /\ 0<=c<N /\ q=output+4*(r*N+c).
Proof.
 intros output H N q HN Hq Ha.
 pose proof(Z.div_mod(q-output)4 ltac:(lia))as Hd.
 assert(Hk:0<=(q-output)/4<H*N).
 { split;[apply Z.div_pos;lia|apply Z.div_lt_upper_bound;lia]. }
 pose proof(Z.mod_pos_bound((q-output)/4)N HN)as Hc.
 pose proof(Z.div_mod((q-output)/4)N ltac:(lia))as Hr.
 cbn zeta;split.
 - split;[apply Z.div_pos;lia|apply Z.div_lt_upper_bound;nia].
 - split;[exact Hc|nia].
Qed.

Lemma dw_progress_cell:forall R O output H N y x r c,
 0<N->0<=r<H->0<=c<N->
 dw_progress R O output H N y x(output+4*(r*N+c))=
 if orb(r<?y)(andb(r<?Z.min H(y+3))(c<?x))then Some(R(r*N+c))
 else O(output+4*(r*N+c)).
Proof.
 intros R O output H N y x r c HN Hr Hc.
 assert(Hindex:0<=r*N+c<H*N)by nia.
 assert(Elo:(output<=?output+4*(r*N+c))=true)by(apply Z.leb_le;lia).
 assert(Ehi:(output+4*(r*N+c)<?output+4*H*N)=true)by(apply Z.ltb_lt;nia).
 assert(Ediv4:(output+4*(r*N+c)-output)/4=r*N+c).
 { replace(output+4*(r*N+c)-output)with((r*N+c)*4)by ring;apply Z.div_mul;lia. }
 assert(Emod4:(output+4*(r*N+c)-output)mod 4=0).
 { replace(output+4*(r*N+c)-output)with((r*N+c)*4)by ring;apply Z.mod_mul;lia. }
 assert(Erow:(r*N+c)/N=r).
 { replace(r*N+c)with(c+r*N)by ring;rewrite Z.div_add by lia;rewrite Z.div_small by lia;lia. }
 assert(Ecol:(r*N+c)mod N=c).
 { replace(r*N+c)with(c+r*N)by ring;rewrite Z.mod_add by lia;apply Z.mod_small;lia. }
 unfold dw_progress;rewrite Elo,Ehi,Emod4;cbn[andb Z.eqb];rewrite Ediv4,Erow,Ecol;reflexivity.
Qed.

Lemma dw_write_values_row_cell:forall xs O output N row x n r c,
 0<N->0<=c<N->0<=x->0<=n->x+n<=N->Z.of_nat(length xs)=n->
 dw_write_values O(output+4*(row*N+x))xs(output+4*(r*N+c))=
 if Z.eq_dec r row then
  if Z_le_dec x c then
   if Z_lt_dec c(x+n)then Some(nth(Z.to_nat(c-x))xs fp32_zero)
   else O(output+4*(r*N+c))
  else O(output+4*(r*N+c))
 else O(output+4*(r*N+c)).
Proof.
 intros xs O output N row x n r c HN Hc Hx Hn Hend Hlen.
 rewrite dw_write_values_cell,Hlen.
 destruct(Z.eq_dec r row)as[->|Hneq].
 - replace(output+4*(row*N+c)-(output+4*(row*N+x)))with((c-x)*4)by ring.
   rewrite Z.mod_mul by lia;destruct(Z.eq_dec 0 0);[|contradiction].
   rewrite Z.div_mul by lia.
   destruct(Z_le_dec(output+4*(row*N+x))(output+4*(row*N+c)));
   destruct(Z_lt_dec(output+4*(row*N+c))(output+4*(row*N+x)+4*n));
   destruct(Z_le_dec x c);destruct(Z_lt_dec c(x+n));try lia;reflexivity.
 - destruct(Z_le_dec(output+4*(row*N+x))(output+4*(r*N+c)));[|reflexivity].
   destruct(Z_lt_dec(output+4*(r*N+c))(output+4*(row*N+x)+4*n));[|reflexivity].
   exfalso;apply Hneq.
   destruct(Z.lt_trichotomy r row)as[Hbefore|[E|Hafter]];[|exact E|].
   + assert(Hprod:(r+1)*N<=row*N)by(apply Z.mul_le_mono_nonneg_r;lia);nia.
   + assert(Hprod:(row+1)*N<=r*N)by(apply Z.mul_le_mono_nonneg_r;lia);nia.
Qed.

Print Assumptions dw_output_index_split.
Print Assumptions dw_progress_cell.
Print Assumptions dw_write_values_row_cell.
