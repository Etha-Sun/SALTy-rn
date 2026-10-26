From HwcConv Require Import HwcRvv336ReturnSupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_hc_rvv_rows_fma3_return_wit_1:
 HwcConv.rvv_fma3_unit_goal.hc_rvv_rows_fma3_return_wit_1.
Proof.
 unfold HwcConv.rvv_fma3_unit_goal.hc_rvv_rows_fma3_return_wit_1.
 right;intros.
 rewrite ?hr_v4_eta,?hr_m4_eta,?hr_u4_eta in *.
 change(sizeof(FLOAT))with 4 in *.
 unfold hc_same_bits in *.
 rewrite ?hrr_weight_address in *.
 replace(dx_pre*9+ci_pre*3+0)with(dx_pre*9+ci_pre*3)in * by ring.
 subst retval retval_2 retval_3.
 unfold derivable1,andp,coq_prop;intros mem [HT HE];split;[|exact HE].
 unfold hc_rvv_rows_group;intros i HI.
 rewrite Z.quot_div_nonneg in * by lia.
 assert(HCasts:unsigned_last_nbits(width_pre+1)64=width_pre+1 /\
 unsigned_last_nbits((width_pre+1)/2-x_pre)64=(width_pre+1)/2-x_pre /\
 0<(width_pre+1)/2-x_pre).
 { eapply hr_count_casts;[exact PreH40|lia|lia]. }
 destruct HCasts as[HC1[HC2 HC3]].
 rewrite HC1 in PreH22;rewrite Z.quot_div_nonneg in PreH22 by lia;rewrite HC2 in PreH22.
 rewrite hr_land1_mod2 in PreH23.
 pose proof(Z.mod_pos_bound width_pre 2 ltac:(lia))as HMod.
 assert(HOdd:width_pre mod 2=1)by lia.
 assert(HPar:(width_pre+1)mod 2=0)by(rewrite Z.add_mod by lia;rewrite HOdd;reflexivity).
 pose proof(Z.div_mod(width_pre+1)2 ltac:(lia))as HDiv;rewrite HPar in HDiv.
 assert(HEnd:unsigned_last_nbits(vl_pre-1)32=vl_pre-1)by(apply hr_end32_cast;lia).
 rewrite HEnd in PreH18.
 destruct(Z_lt_dec i(vl_pre-1))as[HActive|HSkip].
 - assert(Hcol:0<=2*(x_pre+i)+dx_pre-1<width_pre)by lia.
   assert(HM:hc_mget R_6 i=1).
   { rewrite(hrr_mask_at R_3 R_4 R_5 R_6 vl_pre 0(vl_pre-1)i)by assumption.
     hrr_bools;reflexivity. }
   assert(HMp:hc_mget R_6 i=(if 2*(x_pre+i)+dx_pre-1<?0 then 0 else 1)).
   { rewrite HM;hrr_bools;reflexivity. }
   rewrite hrr_literal_zero in PreH27.
   assert(HX0:hc_vget R_8 i=hc_neon_row_input F p0_pre(2*(x_pre+i)+dx_pre-1)ci_pre).
   { eapply hrr_input_at;[exact PreH40|lia|exact HI|lia|exact PreH27|exact PreH15|exact PreH14|exact HMp]. }
   assert(HX1:hc_vget R_11 i=hc_neon_row_input F p1_pre(2*(x_pre+i)+dx_pre-1)ci_pre).
   { eapply hrr_input_at;[exact PreH41|lia|exact HI|lia|exact PreH27|exact PreH10|exact PreH9|exact HMp]. }
   assert(HX2:hc_vget R_14 i=hc_neon_row_input F p2_pre(2*(x_pre+i)+dx_pre-1)ci_pre).
   { eapply hrr_input_at;[exact PreH42|lia|exact HI|lia|exact PreH27|exact PreH5|exact PreH4|exact HMp]. }
   unfold hc_rvv_row_group_value;hrr_bools.
   rewrite PreH1,PreH6,PreH11 by exact HI;rewrite HM;cbn.
   rewrite HX0,HX1,HX2;subst dx_pre;reflexivity.
 - assert(Hcol:width_pre<=2*(x_pre+i)+dx_pre-1)by lia.
   assert(HM:hc_mget R_6 i=0).
   { rewrite(hrr_mask_at R_3 R_4 R_5 R_6 vl_pre 0(vl_pre-1)i)by assumption.
     hrr_bools;reflexivity. }
   unfold hc_rvv_row_group_value;hrr_bools.
   rewrite PreH1 by exact HI;rewrite HM;cbn.
   rewrite PreH6 by exact HI;rewrite HM;cbn.
   rewrite PreH11 by exact HI;rewrite HM;reflexivity.
Qed.
End Checked.
Print Assumptions Checked.proof_of_hc_rvv_rows_fma3_return_wit_1.
