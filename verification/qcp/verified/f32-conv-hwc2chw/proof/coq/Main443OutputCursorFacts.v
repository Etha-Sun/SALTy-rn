From HwcConv Require Import RvvKernelModel Main443WindowFacts.
From Coq Require Import ZArith Lia Ring.
Local Open Scope Z_scope.
Lemma hcm_cursor_active_exact:forall output hs cs C finish ow c y x,
 0<output->0<ow->0<finish->4*ow<=hs->finish*hs<=cs->
 output+(C-1)*cs+(finish-1)*hs+4*ow<=hc_u64_limit->
 0<=c<C->0<=y<finish->0<=x<ow->
 hc_addr64(hc_output_address output hs cs c y x)=hc_output_address output hs cs c y x.
Proof.
 intros output hs cs C finish ow c y x HO HW HF HH HC HB Hc Hy Hx.
 pose proof(hcm_output_address_range output hs cs C finish ow c y x HO HW HF HH HC HB Hc Hy Hx)as HA.
 unfold hc_addr64;apply Z.mod_small;unfold hc_u64_limit in HA;lia.
Qed.
Lemma hcm_cursor_onepast_only_last:forall output hs cs C finish ow c y x,
 0<output->0<ow->0<finish->4*ow<=hs->finish*hs<=cs->
 output+(C-1)*cs+(finish-1)*hs+4*ow<=hc_u64_limit->
 0<=c<C->0<=y<finish->0<=x<=ow->
 let a:=hc_output_address output hs cs c y x in
 0<a<=hc_u64_limit /\ (a=hc_u64_limit->x=ow).
Proof.
 intros output hs cs C finish ow c y x HO HW HF HH HC HB Hc Hy Hx a.
 assert(Hhs:0<hs)by lia;assert(Hcs:0<cs)by nia.
 assert(Hchannel:c*cs<=(C-1)*cs)by nia.
 assert(Hrow:y*hs<=(finish-1)*hs)by nia.
 unfold a,hc_output_address;split;[nia|intro HA;nia].
Qed.
Lemma hcm_cursor_following_uintptr_update:forall a step,
 unsigned_last_nbits(unsigned_last_nbits a 64+step)64=hc_addr64(a+step).
Proof.
 intros;change(hc_addr64(hc_addr64 a+step)=hc_addr64(a+step));unfold hc_addr64.
 rewrite(Z.add_mod(a mod 18446744073709551616)step 18446744073709551616)by lia;
 rewrite Z.mod_mod by lia;symmetry;apply Z.add_mod;lia.
Qed.
Definition active_second:=hcm_cursor_active_exact.
Definition endpoint_second:=hcm_cursor_onepast_only_last.
Definition update_second:=hcm_cursor_following_uintptr_update.
Print Assumptions hcm_cursor_active_exact.
Print Assumptions hcm_cursor_onepast_only_last.
Print Assumptions hcm_cursor_following_uintptr_update.
Print Assumptions active_second.
Print Assumptions endpoint_second.
Print Assumptions update_second.
