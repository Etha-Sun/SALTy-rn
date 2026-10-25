From Coq Require Import ZArith Lia List.
From DwChw Require Export NeonKernelMaskFacts.
Local Open Scope Z_scope.
Local Opaque dw_get dw_image dw_neon_results dw_neon_vector_pixel.

Definition dw_neon_read4(F:DwROMap)(p x:Z):Z->fp32:=
 dw_fp4(dw_get F(p+4*x))(dw_get F(p+4*(x+1)))
  (dw_get F(p+4*(x+2)))(dw_get F(p+4*(x+3))).
Lemma dw_neon_read4_lane:forall F p x i,
 0<=i<4->dw_neon_read4 F p x i=dw_get F(p+4*(x+i)).
Proof.
 intros F p x i Hi;assert(i=0\/i=1\/i=2\/i=3)by lia.
 destruct H as[->|[->|[->| -> ]]];unfold dw_neon_read4;
 apply(f_equal(dw_get F));ring.
Qed.

Lemma dw_neon_tail_mask_image:forall F input zero H N y x n,
 0<=x->1<=n<=4->x+n=N->x mod 4=0->
 forall k,0<=k<4->
 dw_neon_masked4(dw_mask_index N)
  (dw_neon_read4 F(dw_row_base input zero H N y)x)k=
 dw_image F input zero H N y(x+k).
Proof.
 intros F input zero H N y x n Hx Hn HN Hmod k Hk.
 rewrite(dw_neon_tail_mask_index N x n Hmod Hn ltac:(lia)).
 rewrite dw_neon_masked4_lane by assumption.
 destruct(Z.ltb_spec k n).
 - rewrite dw_neon_read4_lane by exact Hk;apply dw_row_image;lia.
 - symmetry;apply dw_image_right_zero;lia.
Qed.

Lemma dw_neon_tail_pixel_row:forall F input zero weights H N y x n
 prev0 prev1 prev2 lo hi r0 r1 r2 r3,
 0<=x->1<=n<=4->x+n=N->x mod 4=0->
 prev0=dw_image F input zero H N(y-1)(x-1)->
 prev1=dw_image F input zero H N y(x-1)->
 prev2=dw_image F input zero H N(y+1)(x-1)->
 dw_neon_vector_match4 r0 r1 r2 r3
  (dw_neon_vector_pixel F weights
   (dw_neon_masked4(dw_mask_index N)(dw_neon_read4 F(dw_row_base input zero H N(y-1))x))
   (dw_neon_masked4(dw_mask_index N)(dw_neon_read4 F(dw_row_base input zero H N y)x))
   (dw_neon_masked4(dw_mask_index N)(dw_neon_read4 F(dw_row_base input zero H N(y+1))x))
   prev0 prev1 prev2 fp32_zero fp32_zero fp32_zero lo hi)->
 forall i,0<=i<n->dw_fp4 r0 r1 r2 r3 i=
 dw_neon_results F input zero weights H N lo hi(y*N+x+i).
Proof.
 intros F input zero weights H N y x n prev0 prev1 prev2 lo hi r0 r1 r2 r3 Hx Hn HN Hmod Hp0 Hp1 Hp2 HG i Hi.
 unfold dw_neon_vector_match4 in HG;rewrite HG by lia.
 replace(y*N+x+i)with(y*N+(x+i))by ring.
 rewrite dw_neon_result_row_index by lia.
 eapply dw_neon_vector_pixel_padded_window.
 - lia.
 - apply(dw_neon_tail_mask_image F input zero H N(y-1)x n);assumption.
 - apply(dw_neon_tail_mask_image F input zero H N y x n);assumption.
 - apply(dw_neon_tail_mask_image F input zero H N(y+1)x n);assumption.
 - exact Hp0.
 - exact Hp1.
 - exact Hp2.
 - symmetry;apply dw_image_right_zero;lia.
 - symmetry;apply dw_image_right_zero;lia.
 - symmetry;apply dw_image_right_zero;lia.
Qed.
Print Assumptions dw_neon_read4_lane.
Print Assumptions dw_neon_tail_mask_image.
Print Assumptions dw_neon_tail_pixel_row.
