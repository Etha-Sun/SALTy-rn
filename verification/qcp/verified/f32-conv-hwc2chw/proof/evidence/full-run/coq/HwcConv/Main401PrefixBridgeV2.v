From HwcConv Require Export RvvKernelModel HwcRvvPixel9Model HwcRvvPixel9SourceFacts.
From Coq Require Import ZArith Ring.
Local Open Scope Z_scope.
Local Opaque hc_rvv_pixel9_prefix hc_acc_prefix hc_rvv_pixel9_fold hc_row_base hc_get dw_rvv_fma.
Lemma hm401_prefix_row0 : forall R F input zero weights H N top y x ch lane vl i0 i1 i2 i3 i4 w,
 hc_outer_input input zero H N top y i0 i1 i2 i3 i4 ->
 w=weights+448*(ch/4) ->
 hc_rvv_pixel9_prefix R F i0 i1 i2 w N x lane 9 vl ->
 hc_acc_prefix R F input zero weights H N top y x ch lane 27 vl.
Proof.
 intros R F input zero weights H N top y x ch lane vl i0 i1 i2 i3 i4 w HR HW HP.
 unfold hc_outer_input in HR;destruct HR as[E0[E1[E2[E3 E4]]]].
 subst i0 i1 i2 i3 i4 w.
 replace(weights+448*(ch/4))with(weights+4*(112*(ch/4)))in HP by ring.
 now apply hc_pixel9_prefix9_source27_contract.
Qed.
Lemma hm401_prefix_row1 : forall R F input zero weights H N top y x ch lane vl i0 i1 i2 i3 i4 w,
 hc_outer_input input zero H N top y i0 i1 i2 i3 i4 ->
 w=weights+448*(ch/4) ->
 hc_rvv_pixel9_prefix R F i2 i3 i4 w N x lane 9 vl ->
 hc_acc_prefix R F input zero weights H N top (y+1) x ch lane 27 vl.
Proof.
 intros R F input zero weights H N top y x ch lane vl i0 i1 i2 i3 i4 w HR HW HP.
 unfold hc_outer_input in HR;destruct HR as[E0[E1[E2[E3 E4]]]].
 subst i0 i1 i2 i3 i4 w.
 apply hc_pixel9_prefix9_source27_contract.
 replace(2*(y+1)-top+2)with(2*y-top+4)by ring.
 replace(2*(y+1)-top+1)with(2*y-top+3)by ring.
 replace(2*(y+1)-top)with(2*y-top+2)by ring.
 replace(weights+4*(112*(ch/4)))with(weights+448*(ch/4))by ring.
 exact HP.
Qed.
Print Assumptions hm401_prefix_row0.
Print Assumptions hm401_prefix_row1.
