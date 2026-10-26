(* Pure source bridge. No memory permissions or arithmetic domain restrictions. *)
From Coq Require Import List ZArith Lia Ring.
From HwcConv Require Import HwcRvvPixel9Model RvvKernelModel.
Import ListNotations. Local Open Scope Z_scope.
Local Opaque dw_rvv_fma hc_get hc_row_base.
Lemma hc_pixel9_fold_flat_map : forall (A B S:Type)(step:S->B->S)
 (part:A->list B)(gs:list A)(a:S),
 fold_left step(flat_map part gs)a =
 fold_left(fun z g=>fold_left step(part g)z)gs a.
Proof. intros A B S step part gs;induction gs as[|g gs IH];intro a.
 - reflexivity.
 - cbn[flat_map];rewrite fold_left_app;apply IH.
Qed.
Lemma hc_pixel9_fold_pointwise : forall (A S:Type)(f g:S->A->S),
 (forall a x,f a x=g a x)->forall xs a,fold_left f xs a=fold_left g xs a.
Proof. intros A S f g H xs;induction xs as[|x xs IH];intro a;cbn[fold_left].
 - reflexivity.
 - rewrite H;apply IH.
Qed.
Lemma hc_pixel9_group_source3 : forall acc F input zero weights H W top y x block lane dx ci i,
 hc_rvv_row_group_value acc F
 (hc_row_base input zero H W(2*y-top))
 (hc_row_base input zero H W(2*y-top+1))
 (hc_row_base input zero H W(2*y-top+2))
 (weights+448*block)W x dx ci lane i =
 hc_rvv_source_fold
 (map(fun ky=>hc_tap F input zero weights H W top y (x+i) block lane dx ci (Z.of_nat ky))(seq 0 3)) acc.
Proof.
 intros acc F input zero weights H W top y x block lane dx ci i.
 assert(Haddr:forall ky,
 (weights+448*block)+4*(4+(dx*9+ci*3+ky)*4+lane)=
 weights+4*(112*block+4+(dx*9+ci*3+ky)*4+lane))by(intro;ring).
 unfold hc_rvv_row_group_value.
 cbn[seq map hc_rvv_source_fold fold_left hc_tap hc_rvv_source_tap hc_image hc_neon_row_input Z.of_nat Pos.of_succ_nat].
 unfold hc_tap,hc_rvv_source_tap,hc_image,hc_neon_row_input.
 cbn[Z.of_nat Pos.of_succ_nat Pos.succ].
 replace(2*y-top+0)with(2*y-top)by ring.
 repeat rewrite Z.add_0_r.
 replace(weights+448*block+4*(4+(dx*9+ci*3)*4+lane))
 with(weights+4*(112*block+4+(dx*9+ci*3)*4+lane))by ring.
 repeat rewrite Haddr.
 destruct(W<=?2*(x+i)+dx-1);reflexivity.
Qed.
Lemma hc_pixel9_terms_layout : forall F input zero weights H W top y x block lane,
 hc_terms F input zero weights H W top y x block lane =
 flat_map(fun g=>map(fun ky=>hc_tap F input zero weights H W top y x block lane
 (fst g)(snd g)(Z.of_nat ky))(seq 0 3))hc_rvv_pixel9_groups.
Proof. reflexivity. Qed.
Lemma hc_pixel9_fold9_source27 : forall F input zero weights H W top y x block lane i,
 hc_rvv_pixel9_fold F
 (hc_row_base input zero H W(2*y-top))
 (hc_row_base input zero H W(2*y-top+1))
 (hc_row_base input zero H W(2*y-top+2))
 (weights+448*block)W x lane 9 i =
 hc_rvv_source_fold(hc_terms F input zero weights H W top y(x+i)block lane)
 (hc_get F(weights+4*(112*block+lane))).
Proof.
 intros F input zero weights H W top y x block lane i.
 unfold hc_rvv_pixel9_fold,hc_rvv_pixel9_bias.
 change(fold_left
 (fun a g=>hc_rvv_row_group_value a F
 (hc_row_base input zero H W(2*y-top))
 (hc_row_base input zero H W(2*y-top+1))
 (hc_row_base input zero H W(2*y-top+2))
 (weights+448*block)W x(fst g)(snd g)lane i)
 hc_rvv_pixel9_groups(hc_get F(weights+448*block+4*lane)) =
 hc_rvv_source_fold(hc_terms F input zero weights H W top y(x+i)block lane)
 (hc_get F(weights+4*(112*block+lane)))).
 unfold hc_rvv_source_fold.
 rewrite hc_pixel9_terms_layout,hc_pixel9_fold_flat_map.
 replace(weights+448*block+4*lane)with(weights+4*(112*block+lane))by ring.
 apply hc_pixel9_fold_pointwise;intros a[dx ci];cbn[fst snd].
 apply hc_pixel9_group_source3.
Qed.
Lemma hc_pixel9_prefix9_source27 : forall A F input zero weights H W top y x ch lane vl,
 hc_rvv_pixel9_prefix A F
 (hc_row_base input zero H W(2*y-top))
 (hc_row_base input zero H W(2*y-top+1))
 (hc_row_base input zero H W(2*y-top+2))
 (weights+448*(ch/4))W x lane 9 vl ->
 hc_acc_prefix A F input zero weights H W top y x ch lane 27 vl.
Proof.
 intros A F input zero weights H W top y x ch lane vl HA i Hi.
 rewrite HA by exact Hi.
 rewrite hc_pixel9_fold9_source27.
 replace(Z.to_nat 27)with(length(hc_terms F input zero weights H W top y(x+i)(ch/4)lane))by(rewrite hc_terms_length;reflexivity).
 rewrite firstn_all;reflexivity.
Qed.
Lemma hc_pixel9_fold9_source27_contract : forall F input zero weights H W top y x block lane i,
 hc_rvv_pixel9_fold F
 (hc_row_base input zero H W(2*y-top))
 (hc_row_base input zero H W(2*y-top+1))
 (hc_row_base input zero H W(2*y-top+2))
 (weights+4*(112*block))W x lane 9 i =
 hc_rvv_source_fold(hc_terms F input zero weights H W top y(x+i)block lane)
 (hc_get F(weights+4*(112*block+lane))).
Proof. intros;replace(weights+4*(112*block))with(weights+448*block)by ring;
 apply hc_pixel9_fold9_source27. Qed.
Lemma hc_pixel9_prefix9_source27_contract : forall A F input zero weights H W top y x ch lane vl,
 hc_rvv_pixel9_prefix A F
 (hc_row_base input zero H W(2*y-top))
 (hc_row_base input zero H W(2*y-top+1))
 (hc_row_base input zero H W(2*y-top+2))
 (weights+4*(112*(ch/4)))W x lane 9 vl ->
 hc_acc_prefix A F input zero weights H W top y x ch lane 27 vl.
Proof. intros;replace(weights+4*(112*(ch/4)))with(weights+448*(ch/4))in *by ring;
 now apply hc_pixel9_prefix9_source27. Qed.
Print Assumptions hc_pixel9_fold_flat_map.
Print Assumptions hc_pixel9_fold_pointwise.
Print Assumptions hc_pixel9_group_source3.
Print Assumptions hc_pixel9_terms_layout.
Print Assumptions hc_pixel9_fold9_source27.
Print Assumptions hc_pixel9_prefix9_source27.
Print Assumptions hc_pixel9_fold9_source27_contract.
Print Assumptions hc_pixel9_prefix9_source27_contract.
