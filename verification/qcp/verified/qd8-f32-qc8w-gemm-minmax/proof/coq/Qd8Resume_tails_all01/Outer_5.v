From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qd8API Require Import neon_full_goal.
From Qd8Frame Require Import KernelFrame.
From Qd8Resume_mactails01 Require Import KernelMacTails.
From Qd8Resume_block04 Require Import KernelOutputBlock.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_entail_wit_4_5:neon_full_goal.test_neon_entail_wit_4_5.
Proof.
 unfold neon_full_goal.test_neon_entail_wit_4_5;intros.
 assert(Hk:k=4)by(rewrite ?sizeof_char in *;lia);subst k cn_stride;rewrite ?sizeof_char,?sizeof_float in *.
 rewrite ?qd8_mac_tail4 by lia.
 replace(kc_pre-4+4)with kc_pre by lia.
 rewrite ?Z.sub_0_r,?Z.add_0_l,?Z.add_0_r.
 replace (4+1) with 5 by reflexivity;replace (4+2) with 6 by reflexivity;replace (4+3) with 7 by reflexivity.
 rewrite ?qd8_final_lane_formula.
 unfold qd8_fappend.
 rewrite qd8_write_eight by lia.
 replace (nc_pre-(nc-8)) with (nc_pre-nc+8) by lia.
 destruct (Z.eq_dec nc 8) as [Hnc|Hnc].
 - subst nc;Left;qd8_frame.
 - Right.
   assert (Hq:Z.quot (nc_pre-nc+8) 8=Z.quot (nc_pre-nc) 8+1).
   { rewrite !Z.quot_div_nonneg by lia.
     replace (nc_pre-nc+8) with (nc_pre-nc+1*8) by ring.
     rewrite Z.div_add by lia;reflexivity. }
   assert (Hr:Z.rem (nc_pre-nc+8) 8=0).
   { rewrite Z.rem_mod_nonneg by lia;rewrite Z.rem_mod_nonneg in PreH20 by lia.
     rewrite Z.add_mod by lia;rewrite PreH20;reflexivity. }
   assert (Hextent:kc_pre<=a_read_extent kc_pre).
   { unfold a_read_extent;pose proof(Z.div_mod(kc_pre+7)8 ltac:(lia));
     pose proof(Z.mod_pos_bound(kc_pre+7)8 ltac:(lia));lia. }
   unfold data_capacity in PreH13;destruct PreH13 as (Ha & Hw & Hc & Hwa & Hacap & Hwcap & Hccap).
   assert (Hlen:Z.quot (nc_pre-nc+8) 8 < Zlength Ps).
   { unfold domain_shape in PreH12;destruct PreH12 as (_ & _ & _ & Hplen & _).
     rewrite Hplen;unfold panels.
     rewrite Z.quot_div_nonneg by lia.
     rewrite Z.rem_mod_nonneg in PreH20 by lia.
     pose proof(Z.div_mod(nc_pre-nc)8 ltac:(lia)).
     pose proof(Z.div_mod(nc_pre+7)8 ltac:(lia)).
     pose proof(Z.mod_pos_bound(nc_pre+7)8 ltac:(lia)).
     replace(nc_pre-nc+8)with(nc_pre-nc+1*8)by ring.
     rewrite Z.div_add by lia;lia. }
   unfold unsigned_last_nbits.
   change (2^64) with 18446744073709551616.
   rewrite (Z.mod_small c0 18446744073709551616) by lia.
   rewrite (Z.mod_small a0 18446744073709551616) by lia.
   rewrite (Z.mod_small (a0+4) 18446744073709551616) by lia.
   repeat rewrite Z.mod_small by lia.
   rewrite Hq.
   assert (Hwstep:w+8*4+((4+4+4+4)*4)=w_pre+(Z.quot(nc_pre-nc)8+1)*(96+8*kc_pre)).
   { rewrite PreH28;ring. }
   assert (Hcapacity:data_capacity nc_pre kc_pre a_pre w_pre c_pre)
     by (unfold data_capacity;tauto).
   qd8_frame.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_entail_wit_4_5.
