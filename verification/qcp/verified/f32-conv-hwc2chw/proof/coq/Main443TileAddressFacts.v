From HwcConv Require Export Main443WindowFacts RvvKernelModel.
From Coq Require Import ZArith Lia Ring.
Local Open Scope Z_scope.
Lemma hcm_tile_addr:forall W output hs cs C start finish ow y c x n lane dy,
 hc_output_owned W output hs cs C start finish ow->
 0<=start->start<=y<finish->0<=c<C->0<=x->0<n->x+n<=ow->
 0<output->0<ow->4*ow<=hs->finish*hs<=cs->
 output+(C-1)*cs+(finish-1)*hs+4*ow<=hc_u64_limit->
 0<=lane<4->0<=dy<=1->
 hc_addr64(hc_output_address output hs cs(hc_store_channel C c lane)(hc_store_row finish y dy)x)=
 hc_output_address output hs cs(hc_store_channel C c lane)(hc_store_row finish y dy)x.
Proof.
 intros W output hs cs C start finish ow y c x n lane dy HW HS HY HC HX HN HXN HO HOW HHS HCS HB HL HD.
 pose proof(hcm_clipped_output_window W output hs cs C start finish ow y c lane dy x n HW HS HY HC HL HD HX HN HXN HO HOW HHS HCS HB)as[_[HE HR]];exact HE.
Qed.
Lemma hcm_addr_reorder:forall output cs c hs y x,
 hc_addr64(output+cs*c+hs*y+4*x)=hc_addr64(hc_output_address output hs cs c y x).
Proof. intros;f_equal;unfold hc_output_address;ring. Qed.
Print Assumptions hcm_tile_addr.
Print Assumptions hcm_addr_reorder.
