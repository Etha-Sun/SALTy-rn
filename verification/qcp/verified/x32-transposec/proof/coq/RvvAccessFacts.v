From X32Transpose Require Export AddressFacts.
From Coq Require Import ZArith Lia.
Local Open Scope Z_scope.
Lemma xt_rvv_loop_window:forall F W G bw vl bh,
 xt_valid F W G->0<bh<=xt_height G->0<bw<=xt_total G->0<vl<=bw->
 xt_window F(xt_current_input G(xt_total G-bw)(xt_height G-bh))vl.
Proof.
 intros F W G bw vl bh Hv Hbh Hbw Hvl.
 assert(Hheight:0<xt_height G)by lia.
 pose proof(xt_total_cols F W G Hv Hheight)as Hcols.
 eapply xt_current_input_window;[exact Hv|lia|lia|lia|lia].
Qed.
Lemma xt_rvv_loop_store:forall F W G bw vl bh,
 xt_valid F W G->0<bh<=xt_height G->0<bw<=xt_total G->0<vl<=bw->vl<=32->
 xt_stride_valid W(xt_current_output G(xt_total G-bw)(xt_height G-bh))(xt_output_stride G)vl /\
 xt_stride_distinct(xt_current_output G(xt_total G-bw)(xt_height G-bh))(xt_output_stride G)vl.
Proof.
 intros F W G bw vl bh Hv Hbh Hbw Hvl H32.
 assert(Hheight:0<xt_height G)by lia.
 pose proof(xt_total_cols F W G Hv Hheight)as Hcols.
 eapply xt_current_output_stride;[exact Hv|lia|lia|lia|lia].
Qed.
Print Assumptions xt_rvv_loop_window.
Print Assumptions xt_rvv_loop_store.
