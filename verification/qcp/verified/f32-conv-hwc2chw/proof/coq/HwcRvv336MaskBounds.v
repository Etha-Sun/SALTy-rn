From HwcConv Require Export HwcRvv336MaskMath.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma hr_and_mask_index:forall id ge lt m vl s e i,
 hc_rvv_id id vl ->hc_mask_ge ge id s vl ->hc_mask_lt lt id e vl ->
 hc_mask_and m ge lt vl ->0<=i<vl ->hc_mget m i=1 ->s<=i<e.
Proof.
 intros id ge lt m vl s e i HID HG HL HA HI HM.
 unfold hc_rvv_id in HID;unfold hc_mask_ge in HG;unfold hc_mask_lt in HL;unfold hc_mask_and in HA.
 rewrite HA,HG,HL,HID in HM by exact HI.
 destruct(Z.leb s i)eqn:HS;destruct(Z.ltb i e)eqn:HE;cbn in HM;try discriminate.
 apply Z.leb_le in HS;apply Z.ltb_lt in HE;lia.
Qed.
Lemma hr_col_from_indices:forall width x dx vl s e i,
 0<width->0<=x->x<(width+1)/2->0<=dx<3->0<=vl->vl<=(width+1)/2-x->
 0<=s->e<=vl->
 (dx=0->x=0->1<=s)->
 (dx=2->width mod 2<>0->vl=(width+1)/2-x->e<=vl-1)->
 s<=i<e->0<=2*(x+i)+dx-1<width.
Proof.
 intros width x dx vl s e i HW HX HXB HD HV HVB HS HE HLEFT HRIGHT HI.
 assert(HL:0<=2*(x+i)+dx-1).
 { destruct(Z.eq_dec dx 0);destruct(Z.eq_dec x 0);try(specialize(HLEFT e0 e1));lia. }
 split;[exact HL|].
 pose proof(Z.mod_pos_bound width 2 ltac:(lia))as HR.
 pose proof(Z.div_mod(width+1)2 ltac:(lia))as Hdiv.
 assert(HRcases:width mod 2=0\/width mod 2=1)by lia.
 destruct HRcases as[HReven|HRodd].
 - assert(HRplus:(width+1)mod 2=1)by(rewrite Z.add_mod by lia;rewrite HReven;reflexivity).
   rewrite HRplus in Hdiv;lia.
 - assert(HRplus:(width+1)mod 2=0)by(rewrite Z.add_mod by lia;rewrite HRodd;reflexivity).
   rewrite HRplus in Hdiv.
   destruct(Z.eq_dec dx 2)as[HD2|HD2];[|lia].
   destruct(Z.eq_dec vl((width+1)/2-x))as[HLast|HLast].
   + assert(HElast:e<=vl-1)by(apply HRIGHT;lia);lia.
   + lia.
Qed.
Print Assumptions hr_and_mask_index.
Print Assumptions hr_col_from_indices.
