From HwcConv Require Import RvvKernelModel.
From Coq Require Import ZArith Lia Ring.
Local Open Scope Z_scope.
Lemma hcm_input_cursor_step:forall p N iw,
 hc_footprint p(3*N+3)->0<=iw<=N->4<=iw->
 hc_addr64(p+12*(N-iw))+48=hc_addr64(p+12*(N-(iw-4))).
Proof.
 intros p N iw[HP[HC HB]]HI HW;unfold hc_addr64,hc_u64_limit in *.
 rewrite !Z.mod_small by lia;ring.
Qed.
Lemma hcm_output_cursor_step:forall output hs cs c y x,
 hc_output_address output hs cs c y x+8=hc_output_address output hs cs c y(x+2).
Proof. intros;unfold hc_output_address;ring. Qed.
Lemma hcm_width_step:forall N iw,0<=iw<=N->4<=iw->
 Z.quot(N-(iw-4))2=Z.quot(N-iw)2+2.
Proof.
 intros;rewrite !Z.quot_div_nonneg by lia;
 replace(N-(iw-4))with((N-iw)+2*2)by ring;rewrite Z.div_add by lia;reflexivity.
Qed.
Print Assumptions hcm_input_cursor_step.
Print Assumptions hcm_output_cursor_step.
Print Assumptions hcm_width_step.
