From HwcConv Require Import Main443TailMemorySupport.
From SimpleC.SL Require Import Mem SeparationLogic.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque hc_data hc_output hc_neon_raw hc_neon_pixel hc_neon_dup4 hc_get hc_present.
Module Checked.
Lemma proof_of_test_neon_entail_wit_5_3 : HwcConv.neon_unit_goal.test_neon_entail_wit_5_3.
Proof.
 unfold HwcConv.neon_unit_goal.test_neon_entail_wit_5_3;hcc_prepare;hmi_zero;hct_context.
 pose proof(hcm_width_tail_zero N 0 ltac:(lia)ltac:(rewrite ?Z.sub_0_r;hmi_zero;assumption)eq_refl)as HTail.
 rewrite Z.sub_0_r in HTail;rewrite !Z.quot_div_nonneg in HTail by lia.
 rewrite HTail in *.
 rewrite hcm_progress_channel_complete by lia.
 unfold SupportModel.hc_doz_model in *.
 destruct(Z_le_dec c 4)as[HCsmall|HClarge].
 - rewrite Z.max_l in * by lia;hct_first;Exists LMax_2 LMin_2.
   hct_dispatch.
   all:try assumption;try lia;try tauto.
   all:try solve[hct_outer N 0].
   all:try solve[hct_pending].
   all:match goal with|-?G=>idtac "TAIL_ZERO_SMALL_REMAINING" G end.
 - rewrite Z.max_r in * by lia.
   repeat progress(rewrite Z.quot_div_nonneg in * by lia).
   assert(HNextMod:(Cn-(c-4))mod 4=0).
   { replace(Cn-(c-4))with((Cn-c)+1*4)by ring;rewrite Z.mod_add by lia.
     pose proof PreH31 as HAlign;rewrite Z.rem_mod_nonneg in HAlign by lia;exact HAlign. }
   pose proof(hcm_weight_block_resource F Input Zero Weights Params H N Top Start End Cn(c-4)PreH5 ltac:(lia)HNextMod)as[HNextFoot HNextWin].
   hct_last;Exists LMax_2 LMin_2.
   hct_dispatch.
   all:try assumption;try lia;try tauto.
   all:try solve[hct_outer N 0].
   all:try solve[hct_pending].
   all:try solve[rewrite Z.rem_mod_nonneg by lia;exact HNextMod].
   all:try solve[eapply hcm_packed_next_pointer;[lia|exact HNextFoot]].
   all:match goal with|-?G=>idtac "TAIL_ZERO_LARGE_REMAINING" G end.
Qed.
End Checked.
Definition Second : HwcConv.neon_unit_goal.test_neon_entail_wit_5_3:=Checked.proof_of_test_neon_entail_wit_5_3.
Print Assumptions Checked.proof_of_test_neon_entail_wit_5_3.
Print Assumptions Second.
