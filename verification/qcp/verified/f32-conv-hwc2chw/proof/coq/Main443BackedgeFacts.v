From HwcConv Require Export Main443BoundaryModFacts Main443TailProgressFacts Main443ChannelFacts.
From Coq Require Import ZArith Lia Ring.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma hcm_round_consumed:forall N iw,
 0<=iw<=N->iw<4->Z.rem(N-iw)4=0->SupportModel.hc_round_model N=N-iw.
Proof.
 intros N iw HI HW HM;rewrite Z.rem_mod_nonneg in HM by lia.
 pose proof(Z.div_mod(N-iw)4 ltac:(lia))as HD.
 assert(HE:N mod 4=iw).
 { replace N with(iw+((N-iw)/4)*4)by lia;rewrite Z.mod_add by lia;apply Z.mod_small;lia. }
 unfold SupportModel.hc_round_model;rewrite HE;reflexivity.
Qed.
Lemma hcm_input_rewind:forall p N iw,
 hc_footprint p(3*N+3)->0<=iw<=N->iw<4->Z.rem(N-iw)4=0->
 unsigned_last_nbits(unsigned_last_nbits(hc_addr64(p+12*(N-iw)))64-12*SupportModel.hc_round_model N)64=p.
Proof.
 intros p N iw HF HI HW HM;hmb_mod_nf2.
 rewrite(hcm_round_consumed N iw HI HW HM).
 replace(p+12*(N-iw)-12*(N-iw))with p by ring.
 unfold hc_addr64;apply Z.mod_small;unfold hc_footprint,hc_u64_limit in HF;lia.
Qed.
Lemma hcm_output_rewind:forall output hs cs c y x n ow,
 x+n=ow->
 unsigned_last_nbits(unsigned_last_nbits(hc_output_address output hs cs c y x+4*n)64+hc_addr64(4*cs-4*ow))64=
 hc_addr64(hc_output_address output hs cs(c+4)y 0).
Proof.
 intros;hmb_mod_nf2;apply(f_equal hc_addr64);unfold hc_output_address;nia.
Qed.
Lemma hcm_packed_next_index:forall C c,0<=C-c->
 (C-(c-4))/4=(C-c)/4+1.
Proof.
 intros;replace(C-(c-4))with((C-c)+1*4)by ring;rewrite Z.div_add by lia;reflexivity.
Qed.
Lemma hcm_packed_next_pointer:forall weights C c,
 0<=C-c->hc_footprint(weights+448*((C-(c-4))/4))112->
 weights+448*((C-c)/4)+448=hc_addr64(weights+448*((C-(c-4))/4)).
Proof.
 intros weights C c HC HF;rewrite hcm_packed_next_index in * by exact HC.
 unfold hc_addr64;rewrite Z.mod_small by(unfold hc_footprint,hc_u64_limit in HF;lia);ring.
Qed.
Print Assumptions hcm_round_consumed.
Print Assumptions hcm_input_rewind.
Print Assumptions hcm_output_rewind.
Print Assumptions hcm_packed_next_index.
Print Assumptions hcm_packed_next_pointer.
