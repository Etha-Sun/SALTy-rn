From HwcConv Require Import Main443ChannelFacts Main443CallTactics Main443V4InitExtras.
From SimpleC.SL Require Import Mem SeparationLogic.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_entail_wit_4_4 : HwcConv.neon_unit_goal.test_neon_entail_wit_4_4.
Proof.
 unfold HwcConv.neon_unit_goal.test_neon_entail_wit_4_4;right;intros;hcm_constants;hmi_zero.
 hcm_channel_context.
 multimatch goal with HW:WLocal=hc_addr64 ?e,HF:hc_footprint ?e 112|-_=>
 let HE:=fresh "Hwordexact"in assert(HE:hc_addr64 e=e)by(unfold hc_addr64;apply Z.mod_small;unfold hc_footprint,hc_u64_limit in HF;lia);rewrite HE in HW;rewrite HW in * end.
 subst i0 i1 i2 i3 i4.
 repeat multimatch goal with HP:(?a < ?b -> _ /\ _)|-_=>
 let HX:=fresh "Hchannel"in assert(HX:a<b)by lia;let HPair:=fresh "Hchannelpair"in pose proof(HP HX)as HPair;clear HP;destruct HPair end.
 Exists LMax_2 LMin_2.
 hmi_init_dispatch3.
 all:try solve[hmi_v4_output].
 all:try assumption.
 all:try solve[unfold hc_output_address,hc_store_channel,hc_store_row in *;repeat first[rewrite Z.min_l in * by lia|rewrite Z.min_r in * by lia];hmi_output_solve].
 all:try solve[multimatch goal with HP:?p=hc_addr64 ?e|-?p=hc_addr64 ?f=>rewrite HP;apply(f_equal hc_addr64);unfold hc_output_address,hc_store_channel,hc_store_row;
 repeat first[rewrite Z.min_l by lia|rewrite Z.min_r by lia];ring end].
 all:match goal with|-?G=>idtac "CHANNEL_REMAINING" G end.
Qed.
End Checked.
