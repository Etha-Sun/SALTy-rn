From Coq Require Import ZArith List Lia.
From Qs8NeonGoals Require Import G0383.
From Qs8Gemm Require Import KernelFrame NeonMac NeonOutput.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma qs8_uint64_identity : forall x,
 0<=x<=18446744073709551615 -> unsigned_last_nbits x 64=x.
Proof. intros;apply unsigned_last_nbits_eq;change(0<=x<18446744073709551616);lia. Qed.
Lemma checked_full4:test_neon_entail_wit_4_4.
Proof.
 unfold test_neon_entail_wit_4_4;intros.
 rewrite ?sizeof_char,?sizeof_float in *.
 assert(Hk:k=4)by lia;subst k.
 replace(8*(kc_pre-4)+0)with(8*((kc_pre-4)+0))by ring.
 replace(8*(kc_pre-4)+8)with(8*((kc_pre-4)+1))by ring.
 replace(8*(kc_pre-4)+16)with(8*((kc_pre-4)+2))by ring.
 replace(8*(kc_pre-4)+24)with(8*((kc_pre-4)+3))by ring.
 rewrite ?qs8_mac_tail4 by lia.
 replace(kc_pre-4+4)with kc_pre by lia.
 rewrite ?Z.sub_0_r,?Z.add_0_l,?Z.add_0_r.
 change(4+1)with 5;change(4+2)with 6;change(4+3)with 7.
 rewrite ?qs8_neon_quant_formula.
 assert(Hd:0<=nc_pre-nc)by lia.
 assert(Hmod:(nc_pre-nc) mod 8=0)by(rewrite <-Z.rem_mod_nonneg by lia;assumption).
 rewrite ?Z.quot_div_nonneg in * by lia.
 pose proof(qs8_completed_neon_tile kc_pre (nc_pre-nc) 8 A Ps magic offset lo hi Hd Hmod ltac:(lia))as Hb.
 unfold qs8_output_prefix,qs8_append,qs8_take,sublist in *.
 change(Z.to_nat 8)with 8%nat in Hb;cbn[Z.to_nat firstn skipn]in Hb.
 rewrite <-Hb.
 replace(nc_pre-(nc-8))with(nc_pre-nc+8)by lia.
 destruct(Z.eq_dec nc 8)as[Hlast|Hmore].
 - Left;qs8_kernel_frame.
 - Right.
   assert(Hq:(nc_pre-nc+8)/8=(nc_pre-nc)/8+1).
   { rewrite ?Z.quot_div_nonneg by lia.
     replace(nc_pre-nc+8)with(nc_pre-nc+1*8)by ring.
     rewrite Z.div_add by lia;reflexivity. }
   assert(Hr:Z.rem(nc_pre-nc+8)8=0).
   { rewrite Z.rem_mod_nonneg by lia;rewrite Z.add_mod by lia;rewrite Hmod;reflexivity. }
   assert(Hlen:(nc_pre-nc+8)/8<Zlength Ps).
   { match goal with H:domain_shape 1 nc_pre kc_pre Ps|-_=>pose proof H as Hshape end;unfold domain_shape in Hshape.
     destruct Hshape as (_&_&_&_&_&Hlen&_).
     rewrite Hlen;unfold panels;rewrite ?Z.quot_div_nonneg by lia.
     pose proof(Z.div_mod(nc_pre-nc)8 ltac:(lia)).
     pose proof(Z.div_mod(nc_pre+7)8 ltac:(lia)).
     pose proof(Z.mod_pos_bound(nc_pre+7)8 ltac:(lia)).
     replace(nc_pre-nc+8)with(nc_pre-nc+1*8)by ring.
     rewrite Z.div_add by lia;lia. }
   pose proof(qs8_extent_bounds kc_pre ltac:(lia))as Hextent.
   match goal with H:data_capacity nc_pre kc_pre a_pre w_pre c_pre|-_=>pose proof H as Hcap end.
   unfold data_capacity in Hcap;destruct Hcap as(Ha&Hw&Hc&Hacap&Hwcap&Hccap).
   rewrite (qs8_uint64_identity c0)by lia.
   rewrite (qs8_uint64_identity a0)by lia.
   rewrite (qs8_uint64_identity (a0+4)) by lia.
   rewrite (qs8_uint64_identity (a0+4-kc_pre)) by lia.
   rewrite !qs8_uint64_identity by lia.
   rewrite Hq.
   assert(Hwstep:w+32+32=w_pre+(((nc_pre-nc)/8+1)*(64+8*kc_pre))).
   { match goal with H:w=_|-_=>rewrite H;ring end. }
   qs8_kernel_frame.
Qed.
Print Assumptions checked_full4.
