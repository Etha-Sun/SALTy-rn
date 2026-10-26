(* PRIVATE UNCHECKED PROOF CANDIDATE. No Coq command has checked this file.
   Retain failed variants before any future editing/replay. *)
From HwcConv Require Import CachedRowsBridgeGoals.
Import ListNotations. Local Open Scope Z_scope.
Local Opaque dw_arm_fma hc_get hc_row_base.

Lemma hc_cached_fold_flat_map : forall (A B S:Type)(step:S->B->S)
 (part:A->list B)(gs:list A)(a:S),
 fold_left step(flat_map part gs)a =
 fold_left(fun z g=>fold_left step(part g)z)gs a.
Proof.
 intros A B S step part gs;induction gs as[|g gs IH];intro a.
 - reflexivity.
 - cbn[flat_map];rewrite fold_left_app;apply IH.
Qed.
Lemma hc_cached_fold_pointwise : forall (A S:Type)(f g:S->A->S),
 (forall a x,f a x=g a x)->forall xs a,fold_left f xs a=fold_left g xs a.
Proof.
 intros A S f g H xs;induction xs as[|x xs IH];intro a;cbn[fold_left].
 - reflexivity.
 - rewrite H;apply IH.
Qed.
Lemma hc_cached_group : hc_cached_group_statement.
Proof.
 unfold hc_cached_group_statement;intros acc F input zero weights H W top y x block lane dx ci.
 assert(Haddr:forall ky,
 (weights+448*block)+4*(4+(dx*9+ci*3+ky)*4+lane)=
 weights+4*(112*block+4+(dx*9+ci*3+ky)*4+lane))by(intro;ring).
 unfold hc_neon_row_group.
 cbn[seq map fold_left hc_tap hwc_arm_tap hc_image hc_neon_row_input Z.of_nat Pos.of_succ_nat].
 unfold hc_tap,hwc_arm_tap,hc_image,hc_neon_row_input.
 cbn[Z.of_nat Pos.of_succ_nat Pos.succ].
 replace(2*y-top+0)with(2*y-top)by ring.
 repeat rewrite Z.add_0_r.
 replace(weights+448*block+4*(4+(dx*9+ci*3)*4+lane))
 with(weights+4*(112*block+4+(dx*9+ci*3)*4+lane))by ring.
 repeat rewrite Haddr.
 destruct(W<=?2*x+dx-1);reflexivity.
Qed.
Lemma hc_cached_terms_layout : forall F input zero weights H W top y x block lane,
 hc_terms F input zero weights H W top y x block lane =
 flat_map(fun g=>map(fun ky=>hc_tap F input zero weights H W top y x block lane
 (fst g)(snd g)(Z.of_nat ky))(seq 0 3))hc_neon_groups.
Proof. reflexivity. Qed.
Lemma hc_cached_fold9 : hc_cached_fold9_statement.
Proof.
 unfold hc_cached_fold9_statement;intros F input zero weights H W top y x block lane.
 unfold hc_neon_rows_fold.
 change(fold_left
 (fun a g=>hc_neon_row_group a F
 (hc_row_base input zero H W(2*y-top))
 (hc_row_base input zero H W(2*y-top+1))
 (hc_row_base input zero H W(2*y-top+2))
 (weights+448*block)W x(fst g)(snd g)lane)
 hc_neon_groups(hc_get F(weights+448*block+4*lane)) =
 hwc_arm_fold(hc_terms F input zero weights H W top y x block lane)
 (hc_get F(weights+4*(112*block+lane)))).
 unfold hwc_arm_fold;rewrite hc_cached_terms_layout,hc_cached_fold_flat_map.
 replace(weights+448*block+4*lane)with(weights+4*(112*block+lane))by ring.
 apply hc_cached_fold_pointwise;intros a[dx ci];cbn[fst snd].
 apply hc_cached_group.
Qed.
Lemma hc_cached_pixel : hc_cached_pixel_statement.
Proof.
 unfold hc_cached_pixel_statement;intros.
 rewrite hc_cached_fold9;reflexivity.
Qed.
Lemma hc_cached_second_row : hc_cached_second_row_statement.
Proof.
 unfold hc_cached_second_row_statement;intros;repeat split;f_equal;ring.
Qed.
Lemma hc_cached_columns : hc_cached_column_statement.
Proof.
 unfold hc_cached_column_statement;intros N iw HN HI HM.
 set(q:=(N-iw)/4).
 assert(Hq:0<=q)by(unfold q;apply Z.div_pos;lia).
 assert(Hdecomp:N-iw=4*q).
 { pose proof(Z.div_mod(N-iw)4 ltac:(lia));unfold q;lia. }
 assert(Hx:(N-iw)/2=2*q).
 { replace(N-iw)with((2*q)*2)by lia;rewrite Z.div_mul by lia;reflexivity. }
 pose proof(Z.div_mod(N+1)2 ltac:(lia)).
 pose proof(Z.mod_pos_bound(N+1)2 ltac:(lia)).
 rewrite Hx;repeat split;intros;lia.
Qed.
Print Assumptions hc_cached_group.
Print Assumptions hc_cached_fold9.
Print Assumptions hc_cached_pixel.
Print Assumptions hc_cached_second_row.
Print Assumptions hc_cached_columns.
