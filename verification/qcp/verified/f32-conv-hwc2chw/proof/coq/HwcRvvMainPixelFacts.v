From HwcConv Require Import HwcRvvPixel9Model HwcRvvPixel9SourceFacts RvvKernelModel.
From Coq Require Import ZArith List Ring.
Local Open Scope Z_scope.
Local Opaque hc_rvv_source_fold hc_canonical_min hc_canonical_max.
Lemma hc_rvv_main_clamped_prefix : forall A B R F input zero weights H W top y x ch lane vl lo hi,
 hc_acc_prefix A F input zero weights H W top y x ch lane 27 vl ->
 hc_clamp_max B A lo vl -> hc_clamp_min R B hi vl ->
 forall i,0<=i<vl ->
 hc_vget R i=hc_rvv_raw F input zero weights H W top lo hi ch lane y (x+i).
Proof.
 intros A B R F input zero weights H W top y x ch lane vl lo hi HA HB HR i Hi.
 rewrite (HR i Hi),(HB i Hi),(HA i Hi).
 replace(Z.to_nat 27)with(length(hc_terms F input zero weights H W top y(x+i)(ch/4)lane))by(rewrite hc_terms_length;reflexivity).
 rewrite firstn_all;reflexivity.
Qed.
Lemma hc_rvv_main_pixel9_clamped : forall A B R F input zero weights H W top y x ch lane vl lo hi,
 hc_rvv_pixel9_prefix A F
 (hc_row_base input zero H W(2*y-top))
 (hc_row_base input zero H W(2*y-top+1))
 (hc_row_base input zero H W(2*y-top+2))
 (weights+4*(112*(ch/4)))W x lane 9 vl ->
 hc_clamp_max B A lo vl -> hc_clamp_min R B hi vl ->
 forall i,0<=i<vl ->
 hc_vget R i=hc_rvv_raw F input zero weights H W top lo hi ch lane y (x+i).
Proof. intros A B R F input zero weights H W top y x ch lane vl lo hi HA HB HR.
 apply (hc_rvv_main_clamped_prefix A B R F input zero weights H W top y x ch lane vl lo hi).
 - now apply hc_pixel9_prefix9_source27_contract.
 - exact HB.
 - exact HR.
Qed.
Lemma hc_rvv_main_row1_bases : forall input zero H W top y,
 hc_row_base input zero H W(2*y-top+2)=hc_row_base input zero H W(2*(y+1)-top) /\
 hc_row_base input zero H W(2*y-top+3)=hc_row_base input zero H W(2*(y+1)-top+1) /\
 hc_row_base input zero H W(2*y-top+4)=hc_row_base input zero H W(2*(y+1)-top+2).
Proof. intros;repeat split;f_equal;ring. Qed.
Lemma hc_rvv_main_value_observation : forall A B R F input zero weights H W top y x ch lane vl lo hi,
 hc_acc_prefix A F input zero weights H W top y x ch lane 27 vl ->
 hc_clamp_max B A lo vl -> hc_clamp_min R B hi vl ->
 forall i,0<=i<vl ->
 dw_observe (hc_neon_pixel F input zero weights H W top y(x+i)(ch/4)lane lo hi) (hc_vget R i).
Proof.
 intros A B R F input zero weights H W top y x ch lane vl lo hi HA HB HR i Hi.
 rewrite (hc_rvv_main_clamped_prefix A B R F input zero weights H W top y x ch lane vl lo hi HA HB HR i Hi).
 apply hc_rvv_source_result_observation.
Qed.
Print Assumptions hc_rvv_main_clamped_prefix.
Print Assumptions hc_rvv_main_pixel9_clamped.
Print Assumptions hc_rvv_main_row1_bases.
Print Assumptions hc_rvv_main_value_observation.
