From Coq Require Import ZArith Lia List.
From Qs8Rvv Require Import rvv_goal.
From Qs8Gemm Require Import KernelFrame QuantChain OutputTile.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma qs8_uint64_identity : forall x,
 0<=x<=18446744073709551615 -> unsigned_last_nbits x 64=x.
Proof. intros;apply unsigned_last_nbits_eq;change(0<=x<18446744073709551616);lia. Qed.
Lemma checked_output_step:test_rvv_entail_wit_4.
Proof.
 unfold test_rvv_entail_wit_4;intros.
 subst k;rewrite Z.sub_0_r in *.
 rewrite ?sizeof_char,?sizeof_float in *.
 assert(Hd:0<=nc_pre-nc) by lia.
 assert(Hmod:(nc_pre-nc) mod 8=0) by (rewrite <-Z.rem_mod_nonneg by lia;assumption).
 assert(E0:qs8_active_z vl 0 r0_24
  (qs8_quant(qs8_acc kc_pre ((nc_pre-nc)/8) 0 A Ps)
    (qs8_scale((nc_pre-nc)/8)0 Ps)magic offset lo hi)).
 { rewrite <-Z.quot_div_nonneg by lia.
   unfold qs8_active_z;intro Hlane;rewrite <-(PreH209 Hlane).
   exact(qs8_quant_chain vl 0 lo hi offset magic
     (qs8_scale((nc_pre-nc)÷8)0 Ps)
     r0 r0_2 r0_3 r0_4 r0_5 r0_6 r0_7 r0_8 r0_9 r0_10 r0_11 r0_12 r0_13 r0_14 r0_15 r0_16 r0_17 r0_18 r0_19 r0_20 r0_21 r0_22 r0_23 r0_24 Hlane
     PreH1 PreH9 PreH17 PreH25 PreH33 PreH41 PreH49 PreH57 PreH65 PreH73 PreH81 PreH89 PreH97 PreH105 PreH113 PreH121 PreH129 PreH137 PreH145 PreH153 PreH161 PreH169 PreH177). }
 assert(E1:qs8_active_z vl 1 r1_24
  (qs8_quant(qs8_acc kc_pre ((nc_pre-nc)/8) 1 A Ps)
    (qs8_scale((nc_pre-nc)/8)1 Ps)magic offset lo hi)).
 { rewrite <-Z.quot_div_nonneg by lia.
   unfold qs8_active_z;intro Hlane;rewrite <-(PreH210 Hlane).
   exact(qs8_quant_chain vl 1 lo hi offset magic
     (qs8_scale((nc_pre-nc)÷8)1 Ps)
     r1 r1_2 r1_3 r1_4 r1_5 r1_6 r1_7 r1_8 r1_9 r1_10 r1_11 r1_12 r1_13 r1_14 r1_15 r1_16 r1_17 r1_18 r1_19 r1_20 r1_21 r1_22 r1_23 r1_24 Hlane
     PreH2 PreH10 PreH18 PreH26 PreH34 PreH42 PreH50 PreH58 PreH66 PreH74 PreH82 PreH90 PreH98 PreH106 PreH114 PreH122 PreH130 PreH138 PreH146 PreH154 PreH162 PreH170 PreH178). }
 assert(E2:qs8_active_z vl 2 r2_24
  (qs8_quant(qs8_acc kc_pre ((nc_pre-nc)/8) 2 A Ps)
    (qs8_scale((nc_pre-nc)/8)2 Ps)magic offset lo hi)).
 { rewrite <-Z.quot_div_nonneg by lia.
   unfold qs8_active_z;intro Hlane;rewrite <-(PreH211 Hlane).
   exact(qs8_quant_chain vl 2 lo hi offset magic
     (qs8_scale((nc_pre-nc)÷8)2 Ps)
     r2 r2_2 r2_3 r2_4 r2_5 r2_6 r2_7 r2_8 r2_9 r2_10 r2_11 r2_12 r2_13 r2_14 r2_15 r2_16 r2_17 r2_18 r2_19 r2_20 r2_21 r2_22 r2_23 r2_24 Hlane
     PreH3 PreH11 PreH19 PreH27 PreH35 PreH43 PreH51 PreH59 PreH67 PreH75 PreH83 PreH91 PreH99 PreH107 PreH115 PreH123 PreH131 PreH139 PreH147 PreH155 PreH163 PreH171 PreH179). }
 assert(E3:qs8_active_z vl 3 r3_24
  (qs8_quant(qs8_acc kc_pre ((nc_pre-nc)/8) 3 A Ps)
    (qs8_scale((nc_pre-nc)/8)3 Ps)magic offset lo hi)).
 { rewrite <-Z.quot_div_nonneg by lia.
   unfold qs8_active_z;intro Hlane;rewrite <-(PreH212 Hlane).
   exact(qs8_quant_chain vl 3 lo hi offset magic
     (qs8_scale((nc_pre-nc)÷8)3 Ps)
     r3 r3_2 r3_3 r3_4 r3_5 r3_6 r3_7 r3_8 r3_9 r3_10 r3_11 r3_12 r3_13 r3_14 r3_15 r3_16 r3_17 r3_18 r3_19 r3_20 r3_21 r3_22 r3_23 r3_24 Hlane
     PreH4 PreH12 PreH20 PreH28 PreH36 PreH44 PreH52 PreH60 PreH68 PreH76 PreH84 PreH92 PreH100 PreH108 PreH116 PreH124 PreH132 PreH140 PreH148 PreH156 PreH164 PreH172 PreH180). }
 assert(E4:qs8_active_z vl 4 r4_24
  (qs8_quant(qs8_acc kc_pre ((nc_pre-nc)/8) 4 A Ps)
    (qs8_scale((nc_pre-nc)/8)4 Ps)magic offset lo hi)).
 { rewrite <-Z.quot_div_nonneg by lia.
   unfold qs8_active_z;intro Hlane;rewrite <-(PreH213 Hlane).
   exact(qs8_quant_chain vl 4 lo hi offset magic
     (qs8_scale((nc_pre-nc)÷8)4 Ps)
     r4 r4_2 r4_3 r4_4 r4_5 r4_6 r4_7 r4_8 r4_9 r4_10 r4_11 r4_12 r4_13 r4_14 r4_15 r4_16 r4_17 r4_18 r4_19 r4_20 r4_21 r4_22 r4_23 r4_24 Hlane
     PreH5 PreH13 PreH21 PreH29 PreH37 PreH45 PreH53 PreH61 PreH69 PreH77 PreH85 PreH93 PreH101 PreH109 PreH117 PreH125 PreH133 PreH141 PreH149 PreH157 PreH165 PreH173 PreH181). }
 assert(E5:qs8_active_z vl 5 r5_24
  (qs8_quant(qs8_acc kc_pre ((nc_pre-nc)/8) 5 A Ps)
    (qs8_scale((nc_pre-nc)/8)5 Ps)magic offset lo hi)).
 { rewrite <-Z.quot_div_nonneg by lia.
   unfold qs8_active_z;intro Hlane;rewrite <-(PreH214 Hlane).
   exact(qs8_quant_chain vl 5 lo hi offset magic
     (qs8_scale((nc_pre-nc)÷8)5 Ps)
     r5 r5_2 r5_3 r5_4 r5_5 r5_6 r5_7 r5_8 r5_9 r5_10 r5_11 r5_12 r5_13 r5_14 r5_15 r5_16 r5_17 r5_18 r5_19 r5_20 r5_21 r5_22 r5_23 r5_24 Hlane
     PreH6 PreH14 PreH22 PreH30 PreH38 PreH46 PreH54 PreH62 PreH70 PreH78 PreH86 PreH94 PreH102 PreH110 PreH118 PreH126 PreH134 PreH142 PreH150 PreH158 PreH166 PreH174 PreH182). }
 assert(E6:qs8_active_z vl 6 r6_24
  (qs8_quant(qs8_acc kc_pre ((nc_pre-nc)/8) 6 A Ps)
    (qs8_scale((nc_pre-nc)/8)6 Ps)magic offset lo hi)).
 { rewrite <-Z.quot_div_nonneg by lia.
   unfold qs8_active_z;intro Hlane;rewrite <-(PreH215 Hlane).
   exact(qs8_quant_chain vl 6 lo hi offset magic
     (qs8_scale((nc_pre-nc)÷8)6 Ps)
     r6 r6_2 r6_3 r6_4 r6_5 r6_6 r6_7 r6_8 r6_9 r6_10 r6_11 r6_12 r6_13 r6_14 r6_15 r6_16 r6_17 r6_18 r6_19 r6_20 r6_21 r6_22 r6_23 r6_24 Hlane
     PreH7 PreH15 PreH23 PreH31 PreH39 PreH47 PreH55 PreH63 PreH71 PreH79 PreH87 PreH95 PreH103 PreH111 PreH119 PreH127 PreH135 PreH143 PreH151 PreH159 PreH167 PreH175 PreH183). }
 assert(E7:qs8_active_z vl 7 r7_24
  (qs8_quant(qs8_acc kc_pre ((nc_pre-nc)/8) 7 A Ps)
    (qs8_scale((nc_pre-nc)/8)7 Ps)magic offset lo hi)).
 { rewrite <-Z.quot_div_nonneg by lia.
   unfold qs8_active_z;intro Hlane;rewrite <-(PreH216 Hlane).
   exact(qs8_quant_chain vl 7 lo hi offset magic
     (qs8_scale((nc_pre-nc)÷8)7 Ps)
     r7 r7_2 r7_3 r7_4 r7_5 r7_6 r7_7 r7_8 r7_9 r7_10 r7_11 r7_12 r7_13 r7_14 r7_15 r7_16 r7_17 r7_18 r7_19 r7_20 r7_21 r7_22 r7_23 r7_24 Hlane
     PreH8 PreH16 PreH24 PreH32 PreH40 PreH48 PreH56 PreH64 PreH72 PreH80 PreH88 PreH96 PreH104 PreH112 PreH120 PreH128 PreH136 PreH144 PreH152 PreH160 PreH168 PreH176 PreH184). }
 assert(Hlist:completed_values kc_pre (nc_pre-nc+vl) A Ps magic offset lo hi =
   qs8_append(completed_values kc_pre (nc_pre-nc) A Ps magic offset lo hi)
    (qs8_take vl [r0_24;r1_24;r2_24;r3_24;r4_24;r5_24;r6_24;r7_24])).
 { apply qs8_completed_tile;try assumption;lia. }
 repeat match goal with
 | H:qs8_active_z _ _ _ _ |- _ => clear H
 | H:qs8_active_f _ _ _ _ |- _ => clear H
 end.
 rewrite <-Hlist.
 fold(qs8_output_prefix c_pre nc_pre (nc_pre-nc+vl) kc_pre A Ps magic offset lo hi).
 assert(HN:nc_pre<=18446744073709551615) by (unfold domain_shape in PreH190;tauto).
 assert(Hv:0<=vl<=nc) by (rewrite PreH204;unfold qs8_min;lia).
 rewrite (qs8_uint64_identity(nc-vl)) by lia.
 replace(nc_pre-(nc-vl)) with (nc_pre-nc+vl) by lia.
 destruct(Z_le_dec nc 8) as [Htail|Hfull].
 - assert(Hvl:vl=nc) by (rewrite PreH204;unfold qs8_min;lia).
   Left;qs8_frame2.
 - assert(Hvl:vl=8) by (rewrite PreH204;unfold qs8_min;lia).
   rewrite Hvl in *;clear Hvl;Right.
   assert(Hq:(nc_pre-nc+8)÷8=(nc_pre-nc)÷8+1).
   { rewrite !Z.quot_div_nonneg by lia.
     replace(nc_pre-nc+8) with (nc_pre-nc+1*8) by ring.
     rewrite Z.div_add by lia;reflexivity. }
   assert(Hr:Z.rem(nc_pre-nc+8)8=0).
   { rewrite Z.rem_mod_nonneg by lia;rewrite Z.add_mod by lia;rewrite Hmod;reflexivity. }
   assert(Hlen:(nc_pre-nc+8)÷8<Zlength Ps).
   { unfold domain_shape in PreH190.
     destruct PreH190 as (_&_&_&_&_&Hlen&_).
     rewrite Hlen;unfold panels;rewrite Z.quot_div_nonneg by lia.
     pose proof(Z.div_mod(nc_pre-nc)8 ltac:(lia)).
     pose proof(Z.div_mod(nc_pre+7)8 ltac:(lia)).
     pose proof(Z.mod_pos_bound(nc_pre+7)8 ltac:(lia)).
     replace(nc_pre-nc+8)with(nc_pre-nc+1*8)by ring.
     rewrite Z.div_add by lia;lia. }
   pose proof(qs8_extent_bounds kc_pre ltac:(lia)) as Hextent.
   pose proof PreH191 as Hcap.
   unfold data_capacity in Hcap;destruct Hcap as (Ha&Hw&Hc&Hacap&Hwcap&Hccap).
   rewrite (qs8_uint64_identity c0) by lia.
   rewrite (qs8_uint64_identity a0) by lia.
   rewrite !qs8_uint64_identity by lia.
   rewrite Hq.
   assert(Hwstep:w+8*4=w_pre+(((nc_pre-nc)÷8+1)*(64+8*kc_pre))).
   { rewrite PreH208;ring. }
   qs8_frame2.
Qed.
Print Assumptions checked_output_step.
