From Coq Require Import ZArith Lia List.
From DwChw Require Export RvvKernelProgressTileFacts RvvKernelVectorValueFacts NeonKernelFacts.
Local Open Scope Z_scope.

Lemma dw_fp4_from_four:forall(A:Z->fp32)i,
 0<=i<4->dw_fp4(A 0)(A 1)(A 2)(A 3)i=A i.
Proof.
 intros A i Hi;assert(i=0\/i=1\/i=2\/i=3)by lia.
 destruct H as[->|[->|[->| -> ]]];reflexivity.
Qed.

Lemma dw_neon_row_four:forall F input zero H N y x k,
 0<=x->x+4<=N->0<=k<4->
 dw_fp4(dw_get F(dw_row_base input zero H N y+4*(x+0)))
 (dw_get F(dw_row_base input zero H N y+4*(x+1)))
 (dw_get F(dw_row_base input zero H N y+4*(x+2)))
 (dw_get F(dw_row_base input zero H N y+4*(x+3)))k=
 dw_image F input zero H N y(x+k).
Proof.
 intros F input zero H N y x k Hx HN Hk.
 rewrite(dw_fp4_from_four(fun i=>dw_get F(dw_row_base input zero H N y+4*(x+i)))k Hk).
 apply dw_row_image;lia.
Qed.

Lemma dw_neon_previous_last:forall F p x,
 dw_previous4 F p x 3=dw_prev F p x.
Proof.
 intros;unfold dw_previous4,dw_prev;destruct(Z.eqb x 0);[reflexivity|f_equal;ring].
Qed.

Lemma dw_pack4_nth_active:forall a b c d i,
 0<=i<4->nth(Z.to_nat i)(dw_pack4 a b c d)fp32_zero=dw_fp4 a b c d i.
Proof. reflexivity. Qed.

Lemma dw_pack4_pixel_row:forall F input zero weights H N y x
 (A0 A1 A2:Z->fp32)prev0 prev1 prev2 next0 next1 next2 lo hi r0 r1 r2 r3,
 0<N->0<=x->x+4<=N->
 (forall k,0<=k<4->A0 k=dw_image F input zero H N(y-1)(x+k))->
 (forall k,0<=k<4->A1 k=dw_image F input zero H N y(x+k))->
 (forall k,0<=k<4->A2 k=dw_image F input zero H N(y+1)(x+k))->
 prev0=dw_image F input zero H N(y-1)(x-1)->
 prev1=dw_image F input zero H N y(x-1)->
 prev2=dw_image F input zero H N(y+1)(x-1)->
 next0=dw_image F input zero H N(y-1)(x+4)->
 next1=dw_image F input zero H N y(x+4)->
 next2=dw_image F input zero H N(y+1)(x+4)->
 dw_neon_vector_match4 r0 r1 r2 r3
  (dw_neon_vector_pixel F weights A0 A1 A2 prev0 prev1 prev2 next0 next1 next2 lo hi)->
 forall i,0<=i<4->nth(Z.to_nat i)(dw_pack4 r0 r1 r2 r3)fp32_zero=
 dw_neon_results F input zero weights H N lo hi(y*N+x+i).
Proof.
 intros F input zero weights H N y x A0 A1 A2 prev0 prev1 prev2 next0 next1 next2 lo hi r0 r1 r2 r3 HN Hx Hend HA0 HA1 HA2 Hp0 Hp1 Hp2 Hn0 Hn1 Hn2 HG i Hi.
 rewrite dw_pack4_nth_active by exact Hi;unfold dw_neon_vector_match4 in HG;rewrite(HG i Hi).
 replace(y*N+x+i)with(y*N+(x+i))by ring.
 rewrite dw_neon_result_row_index by lia.
 eapply dw_neon_vector_pixel_padded_window;eassumption.
Qed.
Print Assumptions dw_fp4_from_four.
Print Assumptions dw_neon_row_four.
Print Assumptions dw_neon_previous_last.
Print Assumptions dw_pack4_nth_active.
Print Assumptions dw_pack4_pixel_row.
