From Coq Require Import ZArith Lia Ring List.
From ArgmaxPool Require Export APBlockMainControlSupport KernelOuterFacts.
Local Open Scope Z_scope.
Lemma apbmc_group_output:forall F P D pixel group O I,0<=group->0<=app_channels D->
 app_rvv_partial_output F P D pixel group(app_channels D)O I=
 app_rvv_partial_output F P D pixel(group+1)0 O I.
Proof. intros;unfold app_rvv_partial_output,app_partial_output;rewrite app_pass_partial_full,app_pass_partial_zero by assumption;reflexivity. Qed.
Lemma apbmc_pixel_output:forall F P D pixel O I,0<=pixel->
 app_rvv_partial_output F P D pixel(app_groups(app_rows D))0 O I=
 app_rvv_partial_output F P D(pixel+1)0 0 O I.
Proof. intros;unfold app_rvv_partial_output,app_partial_output;rewrite !app_pass_partial_zero.
 cbn[app_pass_complete];rewrite app_pixel_before_step by assumption;reflexivity. Qed.
Print Assumptions apbmc_group_output.
Print Assumptions apbmc_pixel_output.
Lemma apbmc_group_index:forall F P D pixel group O I,0<=group->0<=app_channels D->
 app_rvv_partial_index F P D pixel group(app_channels D)O I=
 app_rvv_partial_index F P D pixel(group+1)0 O I.
Proof. intros;unfold app_rvv_partial_index,app_partial_index;rewrite app_pass_partial_full,app_pass_partial_zero by assumption;reflexivity. Qed.
Lemma apbmc_pixel_index:forall F P D pixel O I,0<=pixel->
 app_rvv_partial_index F P D pixel(app_groups(app_rows D))0 O I=
 app_rvv_partial_index F P D(pixel+1)0 0 O I.
Proof. intros;unfold app_rvv_partial_index,app_partial_index;rewrite !app_pass_partial_zero.
 cbn[app_pass_complete];rewrite app_pixel_before_step by assumption;reflexivity. Qed.
Print Assumptions apbmc_group_index.
Print Assumptions apbmc_pixel_index.
