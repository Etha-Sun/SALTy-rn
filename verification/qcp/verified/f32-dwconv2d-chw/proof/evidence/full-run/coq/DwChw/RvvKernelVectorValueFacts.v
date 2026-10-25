From Coq Require Import ZArith List Lia.
From DwChw Require Export RvvKernelMemoryFacts Store8Model.
Local Open Scope Z_scope.

Lemma dw_values8_length:forall a0 a1 a2 a3 a4 a5 a6 a7 n,
 0<=n->Z.of_nat(length(dw_values8 a0 a1 a2 a3 a4 a5 a6 a7 n))=n.
Proof. intros;unfold dw_values8;rewrite map_length,seq_length,Z2Nat.id by lia;reflexivity. Qed.

Lemma dw_values8_nth_active:forall a0 a1 a2 a3 a4 a5 a6 a7 n i,
 0<=i<n->
 nth(Z.to_nat i)(dw_values8 a0 a1 a2 a3 a4 a5 a6 a7 n)fp32_zero=
 dw_fp8 a0 a1 a2 a3 a4 a5 a6 a7 i.
Proof.
 intros a0 a1 a2 a3 a4 a5 a6 a7 n i Hi.
 assert(Hnat:(Z.to_nat i<Z.to_nat n)%nat)by(apply Z2Nat.inj_lt;lia).
 unfold dw_values8.
 rewrite nth_indep with(d':=dw_fp8 a0 a1 a2 a3 a4 a5 a6 a7 0).
 - pose proof(@List.map_nth nat fp32
   (fun j:nat=>dw_fp8 a0 a1 a2 a3 a4 a5 a6 a7(Z.of_nat j))
   (seq 0(Z.to_nat n))0%nat(Z.to_nat i))as Emap.
   rewrite seq_nth in Emap by lia;cbn[Nat.add]in Emap;rewrite Z2Nat.id in Emap by lia;exact Emap.
 - rewrite map_length,seq_length;exact Hnat.
Qed.

Lemma dw_row_image:forall F input zero H N y x,
 0<=x<N->
 dw_get F(dw_row_base input zero H N y+4*x)=dw_image F input zero H N y x.
Proof.
 intros F input zero H N y x Hx.
 unfold dw_row_base,dw_image.
 assert(Ex:(x<?0)=false)by(apply Z.ltb_ge;lia).
 assert(En:(N<=?x)=false)by(apply Z.leb_gt;lia).
 rewrite Ex,En;cbn[orb].
 destruct(orb(y<?0)(H<=?y));[reflexivity|f_equal;ring].
Qed.

Lemma dw_prev_image:forall F input zero H N y x,
 0<=x<=N->
 dw_prev F(dw_row_base input zero H N y)x=dw_image F input zero H N y(x-1).
Proof.
 intros F input zero H N y x Hx;unfold dw_prev.
 destruct(Z.eqb_spec x 0)as[->|Hnz].
 - unfold dw_image;reflexivity.
 - apply dw_row_image;lia.
Qed.

Lemma dw_fp8_active_all:forall vl a0 a1 a2 a3 a4 a5 a6 a7(B:Z->fp32),
 0<=vl<=8->
 dw_fp_match 0 vl a0(B 0)->dw_fp_match 1 vl a1(B 1)->
 dw_fp_match 2 vl a2(B 2)->dw_fp_match 3 vl a3(B 3)->
 dw_fp_match 4 vl a4(B 4)->dw_fp_match 5 vl a5(B 5)->
 dw_fp_match 6 vl a6(B 6)->dw_fp_match 7 vl a7(B 7)->
 forall i,0<=i<vl->dw_fp8 a0 a1 a2 a3 a4 a5 a6 a7 i=B i.
Proof.
 intros vl a0 a1 a2 a3 a4 a5 a6 a7 B Hvl H0 H1 H2 H3 H4 H5 H6 H7 i Hi.
 assert(Hcases:i=0 \/ i=1 \/ i=2 \/ i=3 \/ i=4 \/ i=5 \/ i=6 \/ i=7)by lia.
 destruct Hcases as[->|[->|[->|[->|[->|[->|[->| -> ]]]]]]];
 cbn[dw_fp8 List.nth Z.to_nat];
 lazymatch goal with H:dw_fp_match ?j vl ?a(B ?j)|-?a=B ?j=>
  unfold dw_fp_match in H;destruct H;[lia|assumption]end.
Qed.
Print Assumptions dw_values8_length.
Print Assumptions dw_values8_nth_active.
Print Assumptions dw_row_image.
Print Assumptions dw_prev_image.
Print Assumptions dw_fp8_active_all.
