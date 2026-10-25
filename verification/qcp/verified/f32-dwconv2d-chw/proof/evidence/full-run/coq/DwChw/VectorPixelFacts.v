From Coq Require Import ZArith Lia.
From DwChw Require Export VectorPixelModel ProgramModel.
Local Open Scope Z_scope.

Lemma dw_slide_up_active_window:forall(A B:Z->fp32)prev x vl i,
 (forall k,0<=k<vl->A k=B(x+k))->prev=B(x-1)->0<=i<vl->
 dw_rvv_slide_up A prev i=B(x+i-1).
Proof.
 intros A B prev x vl i HA Hp Hi;unfold dw_rvv_slide_up.
 destruct(Z.eqb_spec i 0)as[->|Hnonzero].
 - rewrite Hp;f_equal;lia.
 - rewrite HA by lia;f_equal;lia.
Qed.
Lemma dw_slide_down_active_window:forall(A B:Z->fp32)next x vl i,
 (forall k,0<=k<vl->A k=B(x+k))->next=B(x+vl)->0<=i<vl->
 dw_rvv_slide_down A next vl i=B(x+i+1).
Proof.
 intros A B next x vl i HA Hn Hi;unfold dw_rvv_slide_down.
 destruct(Z.ltb_spec(i+1)vl)as[Hactive|Hlast].
 - rewrite HA by lia;f_equal;lia.
 - rewrite Hn;f_equal;lia.
Qed.

(* Exact structural equality of the same opaque nine-FMA/clamp expression.
   The input/zero row selection remains in dw_image, including all FP bits. *)
Lemma dw_vector_pixel_active_window:forall F input zero weights H N y x
 (A0 A1 A2:Z->fp32)prev0 prev1 prev2 next0 next1 next2 lo hi vl i,
 0<=x->0<=vl<=8->x+vl<=N->0<=i<vl->
 (forall k,0<=k<vl->A0 k=dw_image F input zero H N(y-1)(x+k))->
 (forall k,0<=k<vl->A1 k=dw_image F input zero H N y(x+k))->
 (forall k,0<=k<vl->A2 k=dw_image F input zero H N(y+1)(x+k))->
 prev0=dw_image F input zero H N(y-1)(x-1)->
 prev1=dw_image F input zero H N y(x-1)->
 prev2=dw_image F input zero H N(y+1)(x-1)->
 next0=dw_image F input zero H N(y-1)(x+vl)->
 next1=dw_image F input zero H N y(x+vl)->
 next2=dw_image F input zero H N(y+1)(x+vl)->
 dw_vector_pixel F weights A0 A1 A2 prev0 prev1 prev2 next0 next1 next2 lo hi vl i=
 dw_pixel_rvv F input zero weights H N y(x+i)lo hi.
Proof.
 intros F input zero weights H N y x A0 A1 A2 prev0 prev1 prev2 next0 next1 next2 lo hi vl i Hx Hvl HN Hi HA0 HA1 HA2 Hp0 Hp1 Hp2 Hn0 Hn1 Hn2.
 pose proof(dw_slide_up_active_window A0(fun z=>dw_image F input zero H N(y-1)z)prev0 x vl i HA0 Hp0 Hi)as U0.
 pose proof(dw_slide_up_active_window A1(fun z=>dw_image F input zero H N y z)prev1 x vl i HA1 Hp1 Hi)as U1.
 pose proof(dw_slide_up_active_window A2(fun z=>dw_image F input zero H N(y+1)z)prev2 x vl i HA2 Hp2 Hi)as U2.
 pose proof(dw_slide_down_active_window A0(fun z=>dw_image F input zero H N(y-1)z)next0 x vl i HA0 Hn0 Hi)as D0.
 pose proof(dw_slide_down_active_window A1(fun z=>dw_image F input zero H N y z)next1 x vl i HA1 Hn1 Hi)as D1.
 pose proof(dw_slide_down_active_window A2(fun z=>dw_image F input zero H N(y+1)z)next2 x vl i HA2 Hn2 Hi)as D2.
 cbn beta in U0,U1,U2,D0,D1,D2.
 unfold dw_vector_pixel,dw_pixel_rvv,dw_load.
 rewrite U0,U1,U2,D0,D1,D2,(HA0 i Hi),(HA1 i Hi),(HA2 i Hi).
 rewrite Z.add_0_r;reflexivity.
Qed.
Lemma dw_vector_match8_active_ext:forall vl r0 r1 r2 r3 r4 r5 r6 r7 G K,
 dw_vector_match8 vl r0 r1 r2 r3 r4 r5 r6 r7 G->
 (forall i,0<=i<vl->G i=K i)->
 dw_vector_match8 vl r0 r1 r2 r3 r4 r5 r6 r7 K.
Proof. unfold dw_vector_match8;intros vl r0 r1 r2 r3 r4 r5 r6 r7 G K HG HE i Hi;rewrite(HG i Hi);apply HE;assumption. Qed.
Print Assumptions dw_slide_up_active_window.
Print Assumptions dw_slide_down_active_window.
Print Assumptions dw_vector_pixel_active_window.
Print Assumptions dw_vector_match8_active_ext.
