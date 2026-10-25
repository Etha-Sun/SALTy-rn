From Coq Require Import ZArith Lia.
From DwChw Require Export NeonVectorPixelModel VectorPixelFacts ProgressModel.
Local Open Scope Z_scope.

(* Migrated from VectorPixelFacts: only the exact four-lane neighbours and
   the original NEON nine-FMA/clamp tree are used.  This is a value theorem;
   memory permissions and the actual mask instruction remain caller duties. *)
Lemma dw_neon_vector_pixel_padded_window:forall F input zero weights H N y x
 (A0 A1 A2:Z->fp32)prev0 prev1 prev2 next0 next1 next2 lo hi i,
 0<=i<4->
 (forall k,0<=k<4->A0 k=dw_image F input zero H N(y-1)(x+k))->
 (forall k,0<=k<4->A1 k=dw_image F input zero H N y(x+k))->
 (forall k,0<=k<4->A2 k=dw_image F input zero H N(y+1)(x+k))->
 prev0=dw_image F input zero H N(y-1)(x-1)->
 prev1=dw_image F input zero H N y(x-1)->
 prev2=dw_image F input zero H N(y+1)(x-1)->
 next0=dw_image F input zero H N(y-1)(x+4)->
 next1=dw_image F input zero H N y(x+4)->
 next2=dw_image F input zero H N(y+1)(x+4)->
 dw_neon_vector_pixel F weights A0 A1 A2 prev0 prev1 prev2 next0 next1 next2 lo hi i=
 dw_pixel F input zero weights H N y(x+i)lo hi.
Proof.
 intros F input zero weights H N y x A0 A1 A2 prev0 prev1 prev2 next0 next1 next2 lo hi i Hi HA0 HA1 HA2 Hp0 Hp1 Hp2 Hn0 Hn1 Hn2.
 pose proof(dw_slide_up_active_window A0(fun z=>dw_image F input zero H N(y-1)z)prev0 x 4 i HA0 Hp0 Hi)as U0.
 pose proof(dw_slide_up_active_window A1(fun z=>dw_image F input zero H N y z)prev1 x 4 i HA1 Hp1 Hi)as U1.
 pose proof(dw_slide_up_active_window A2(fun z=>dw_image F input zero H N(y+1)z)prev2 x 4 i HA2 Hp2 Hi)as U2.
 pose proof(dw_slide_down_active_window A0(fun z=>dw_image F input zero H N(y-1)z)next0 x 4 i HA0 Hn0 Hi)as D0.
 pose proof(dw_slide_down_active_window A1(fun z=>dw_image F input zero H N y z)next1 x 4 i HA1 Hn1 Hi)as D1.
 pose proof(dw_slide_down_active_window A2(fun z=>dw_image F input zero H N(y+1)z)next2 x 4 i HA2 Hn2 Hi)as D2.
 cbn beta in U0,U1,U2,D0,D1,D2.
 unfold dw_neon_vector_pixel,dw_pixel,dw_load.
 rewrite U0,U1,U2,D0,D1,D2,(HA0 i Hi),(HA1 i Hi),(HA2 i Hi).
 rewrite Z.add_0_r;reflexivity.
Qed.

Lemma dw_image_right_zero:forall F input zero H N y x,
 N<=x->dw_image F input zero H N y x=fp32_zero.
Proof.
 intros;unfold dw_image;destruct(Z.ltb_spec x 0);[reflexivity|].
 destruct(Z.leb_spec N x);[reflexivity|lia].
Qed.

Lemma dw_neon_tail_window:forall F input zero H N y x w(A:Z->fp32),
 0<=w<=4->x+w=N->
 (forall k,0<=k<w->A k=dw_image F input zero H N y(x+k))->
 (forall k,w<=k<4->A k=fp32_zero)->
 forall k,0<=k<4->A k=dw_image F input zero H N y(x+k).
Proof.
 intros F input zero H N y x w A Hw HN HA Hz k Hk.
 destruct(Z_lt_dec k w).
 - apply HA;lia.
 - rewrite Hz by lia;symmetry;apply dw_image_right_zero;lia.
Qed.

Lemma dw_neon_vector_pixel_tail_window:forall F input zero weights H N y x w
 (A0 A1 A2:Z->fp32)prev0 prev1 prev2 lo hi i,
 0<w<=4->x+w=N->0<=i<w->
 (forall k,0<=k<w->A0 k=dw_image F input zero H N(y-1)(x+k))->
 (forall k,0<=k<w->A1 k=dw_image F input zero H N y(x+k))->
 (forall k,0<=k<w->A2 k=dw_image F input zero H N(y+1)(x+k))->
 (forall k,w<=k<4->A0 k=fp32_zero)->
 (forall k,w<=k<4->A1 k=fp32_zero)->
 (forall k,w<=k<4->A2 k=fp32_zero)->
 prev0=dw_image F input zero H N(y-1)(x-1)->
 prev1=dw_image F input zero H N y(x-1)->
 prev2=dw_image F input zero H N(y+1)(x-1)->
 dw_neon_vector_pixel F weights A0 A1 A2 prev0 prev1 prev2
  fp32_zero fp32_zero fp32_zero lo hi i=
 dw_pixel F input zero weights H N y(x+i)lo hi.
Proof.
 intros F input zero weights H N y x w A0 A1 A2 prev0 prev1 prev2 lo hi i Hw HN Hi HA0 HA1 HA2 Hz0 Hz1 Hz2 Hp0 Hp1 Hp2.
 eapply dw_neon_vector_pixel_padded_window.
 - lia.
 - apply(dw_neon_tail_window F input zero H N(y-1)x w A0);assumption||lia.
 - apply(dw_neon_tail_window F input zero H N y x w A1);assumption||lia.
 - apply(dw_neon_tail_window F input zero H N(y+1)x w A2);assumption||lia.
 - exact Hp0.
 - exact Hp1.
 - exact Hp2.
 - symmetry;apply dw_image_right_zero;lia.
 - symmetry;apply dw_image_right_zero;lia.
 - symmetry;apply dw_image_right_zero;lia.
Qed.

Lemma dw_neon_vector_match4_ext:forall r0 r1 r2 r3 G K,
 dw_neon_vector_match4 r0 r1 r2 r3 G->
 (forall i,0<=i<4->G i=K i)->dw_neon_vector_match4 r0 r1 r2 r3 K.
Proof. unfold dw_neon_vector_match4;intros r0 r1 r2 r3 G K HG HK i Hi;rewrite HG by exact Hi;apply HK;exact Hi. Qed.

Lemma dw_neon_result_row_index:forall F input zero weights H N lo hi y x,
 0<N->0<=x<N->
 dw_neon_results F input zero weights H N lo hi(y*N+x)=
 dw_pixel F input zero weights H N y x lo hi.
Proof.
 intros F input zero weights H N lo hi y x HN Hx.
 unfold dw_neon_results.
 replace(y*N+x)with(x+y*N)by ring.
 rewrite Z.div_add,Z.mod_add by lia.
 rewrite Z.div_small,Z.mod_small by lia.
 rewrite Z.add_0_l;reflexivity.
Qed.

Print Assumptions dw_neon_vector_pixel_padded_window.
Print Assumptions dw_image_right_zero.
Print Assumptions dw_neon_tail_window.
Print Assumptions dw_neon_vector_pixel_tail_window.
Print Assumptions dw_neon_vector_match4_ext.
Print Assumptions dw_neon_result_row_index.
