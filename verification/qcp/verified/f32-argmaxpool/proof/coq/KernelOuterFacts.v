From Coq Require Import ZArith Lia List.
From ArgmaxPool Require Export APKernelModel KernelCursorFacts.
Import ListNotations. Local Open Scope Z_scope.
Lemma app_pixel_before_step:forall side F P D pixel S,0<=pixel->
 app_pixel_before side F P D(pixel+1)S=
 app_finish_pixel side F P D pixel(app_pixel_before side F P D pixel S).
Proof.
 intros;unfold app_pixel_before;rewrite Z2Nat.inj_add by lia.
 change(Z.to_nat 1)with 1%nat;rewrite Nat.add_1_r,seq_S,fold_left_app.
 cbn[fold_left];rewrite Nat.add_0_l,Z2Nat.id by lia;reflexivity.
Qed.
Lemma apmk_completed_output_pixel:forall F P D pixel O I,0<=pixel->
 app_neon_partial_output F P D pixel(app_groups(app_rows D))0 O I=
 app_neon_partial_output F P D(pixel+1)0 0 O I.
Proof.
 intros;unfold app_neon_partial_output,app_partial_output;rewrite !app_pass_partial_zero.
 cbn[app_pass_complete];rewrite app_pixel_before_step by assumption;reflexivity.
Qed.
Lemma apmk_completed_index_pixel:forall F P D pixel O I,0<=pixel->
 app_neon_partial_index F P D pixel(app_groups(app_rows D))0 O I=
 app_neon_partial_index F P D(pixel+1)0 0 O I.
Proof.
 intros;unfold app_neon_partial_index,app_partial_index;rewrite !app_pass_partial_zero.
 cbn[app_pass_complete];rewrite app_pixel_before_step by assumption;reflexivity.
Qed.
Lemma apmk_pixel_nonzero:forall F P W WI D pixel,
 app_valid F P W WI D->0<=pixel<app_pixels D->
 0<app_output_at D pixel/\0<app_index_at D pixel.
Proof.
 intros F P W WI D pixel [[HP[HK[HC HG]]]HN]Hp.
 destruct(HG pixel Hp)as[HT[HR[HW HI]]];split;[exact(proj1 HW)|exact(proj1 HI)].
Qed.
Print Assumptions app_pixel_before_step.
Print Assumptions apmk_completed_output_pixel.
Print Assumptions apmk_completed_index_pixel.
Print Assumptions apmk_pixel_nonzero.
