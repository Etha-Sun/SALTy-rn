From Coq Require Import ZArith Lia List.
From DwChw Require Export RvvKernelVectorValueFacts VectorPixelFacts.
Local Open Scope Z_scope.

Lemma dw_rvv_result_row_index:forall F input zero weights H N lo hi y c,
 0<N->0<=c<N->
 dw_rvv_results F input zero weights H N lo hi(y*N+c)=
 dw_pixel_rvv F input zero weights H N y c lo hi.
Proof.
 intros F input zero weights H N lo hi y c HN Hc.
 unfold dw_rvv_results;replace(y*N+c)with(c+y*N)by ring.
 rewrite Z.div_add,Z.mod_add by lia.
 rewrite Z.div_small,Z.mod_small by lia;rewrite Z.add_0_l;reflexivity.
Qed.

Lemma dw_values8_pixel_row:forall F input zero weights H N y x vl
 (A0 A1 A2:Z->fp32)prev0 prev1 prev2 next0 next1 next2 lo hi
 r0 r1 r2 r3 r4 r5 r6 r7,
 0<N->0<=x->0<=vl<=8->x+vl<=N->
 (forall k,0<=k<vl->A0 k=dw_image F input zero H N(y-1)(x+k))->
 (forall k,0<=k<vl->A1 k=dw_image F input zero H N y(x+k))->
 (forall k,0<=k<vl->A2 k=dw_image F input zero H N(y+1)(x+k))->
 prev0=dw_image F input zero H N(y-1)(x-1)->
 prev1=dw_image F input zero H N y(x-1)->
 prev2=dw_image F input zero H N(y+1)(x-1)->
 next0=dw_image F input zero H N(y-1)(x+vl)->
 next1=dw_image F input zero H N y(x+vl)->
 next2=dw_image F input zero H N(y+1)(x+vl)->
 dw_vector_match8 vl r0 r1 r2 r3 r4 r5 r6 r7
  (dw_vector_pixel F weights A0 A1 A2 prev0 prev1 prev2 next0 next1 next2 lo hi vl)->
 forall i,0<=i<vl->
 nth(Z.to_nat i)(dw_values8 r0 r1 r2 r3 r4 r5 r6 r7 vl)fp32_zero=
 dw_rvv_results F input zero weights H N lo hi(y*N+x+i).
Proof.
 intros F input zero weights H N y x vl A0 A1 A2 prev0 prev1 prev2 next0 next1 next2 lo hi r0 r1 r2 r3 r4 r5 r6 r7 HN Hx Hvl Hend HA0 HA1 HA2 Hp0 Hp1 Hp2 Hn0 Hn1 Hn2 HG i Hi.
 rewrite dw_values8_nth_active by exact Hi.
 unfold dw_vector_match8 in HG;rewrite(HG i Hi).
 replace(y*N+x+i)with(y*N+(x+i))by ring.
 rewrite dw_rvv_result_row_index by lia.
 eapply dw_vector_pixel_active_window;eassumption.
Qed.

Lemma dw_prev_after_chunk:forall F p x vl,
 0<=x->0<vl->
 dw_get F(p+4*x+(vl-1)*4)=dw_prev F p(x+vl).
Proof.
 intros F p x vl Hx Hvl;unfold dw_prev.
 destruct(Z.eqb_spec(x+vl)0);[lia|f_equal;ring].
Qed.
Print Assumptions dw_rvv_result_row_index.
Print Assumptions dw_values8_pixel_row.
Print Assumptions dw_prev_after_chunk.
