From HwcConv Require Export HwcRvv336PlainAddress.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac hr_mask_prepare:=hr_prepare;
 rewrite ?hr_v4_eta,?hr_m4_eta,?hr_u4_eta in *;
 lazymatch goal with HX:?nx<(?nwidth+1)÷2 |- _=>
 lazymatch goal with HW:hc_window ?fmap ?prow ((3*nwidth+3)%Z) |- _=>
 let HQ:=fresh "Hquot"in assert(HQ:(nwidth+1)÷2=(nwidth+1)/2)by(apply Z.quot_div_nonneg;lia);
 rewrite HQ in *;
 let HFP:=fresh "Hfootprint"in
 assert(HFP:hc_footprint prow(3*nwidth+3))by(unfold hc_footprint,hc_u64_limit;repeat split;lia);
 let HC:=fresh "Hcounts"in
 assert(HC:unsigned_last_nbits(nwidth+1)64=nwidth+1 /\
 unsigned_last_nbits((nwidth+1)/2-nx)64=(nwidth+1)/2-nx /\ 0<(nwidth+1)/2-nx)
 by(eapply hr_count_casts;[exact HFP|lia|split;lia]);
 let HWC:=fresh "Hwidthcast"in let HRC:=fresh "Hremainingcast"in let HRP:=fresh "Hremainingpos"in
 destruct HC as[HWC[HRC HRP]];
 try rewrite HWC in *;try rewrite HQ in *;try rewrite HRC in *
 end end;
 try lazymatch goal with HM:hc_mask_and ?mrec ?gerec ?ltrec ?nvl |- _=>
 let HE:=fresh "Hendcast"in
 assert(HE:unsigned_last_nbits(nvl-1)32=nvl-1)by(apply hr_end32_cast;lia);rewrite HE in * end;
 rewrite ?hr_land1_mod2 in *.
Ltac hr_mask_window:=
 lazymatch goal with HM:hc_mask_and ?mrec ?gerec ?ltrec ?nvl |-hc_masked_window ?fmap ?baseptr ?nstride ?mrec ?nvl=>
 lazymatch goal with HG:hc_mask_ge gerec ?idrec ?sindex nvl |- _=>
 lazymatch goal with HL:hc_mask_lt ltrec idrec ?eindex nvl |- _=>
 lazymatch goal with HID:hc_rvv_id idrec nvl |- _=>
 lazymatch goal with HW:hc_window fmap ?prow ((3*?nwidth+3)%Z) |- _=>
 first[solve[eapply hr_masked_window_from_col with(width:=nwidth);
 [unfold hc_footprint,hc_u64_limit;repeat split;lia|eassumption|lia|];
 intros i HI Hmask;
 let HB:=fresh "Hmaskindex"in
 assert(HB:sindex<=i<eindex)by(eapply hr_and_mask_index;[exact HID|exact HG|exact HL|exact HM|exact HI|exact Hmask]);
 eapply hr_col_from_indices with(vl:=nvl)(s:=sindex)(e:=eindex);
 [lia|lia|assumption|lia|lia|lia|lia|lia|intros;lia|intros;lia|exact HB]]|solve[eapply hr_masked_window_from_col_plain with(width:=nwidth);
 [unfold hc_footprint,hc_u64_limit;repeat split;lia|eassumption|lia|];
 intros i HI Hmask;
 let HB:=fresh "Hmaskindex"in
 assert(HB:sindex<=i<eindex)by(eapply hr_and_mask_index;[exact HID|exact HG|exact HL|exact HM|exact HI|exact Hmask]);
 eapply hr_col_from_indices with(vl:=nvl)(s:=sindex)(e:=eindex);
 [lia|lia|assumption|lia|lia|lia|lia|lia|intros;lia|intros;lia|exact HB]]|solve[eapply hr_masked_window_from_col_plain with(width:=nwidth)(x:=0%Z)(dx:=0%Z);
 [unfold hc_footprint,hc_u64_limit;repeat split;lia|eassumption|lia|];
 intros i HI Hmask;
 let HB:=fresh "Hmaskindex"in
 assert(HB:sindex<=i<eindex)by(eapply hr_and_mask_index;[exact HID|exact HG|exact HL|exact HM|exact HI|exact Hmask]);
 eapply hr_col_from_indices with(vl:=nvl)(s:=sindex)(e:=eindex);
 [lia|lia|assumption|lia|lia|lia|lia|lia|intros;lia|intros;lia|exact HB]]]
 end end end end end.
Ltac hr_mask_pure:=lazymatch goal with
 | |-?P|--coq_prop ?Q=>apply hr_pure_right;first[hr_weight_atom|hr_mask_window]
 | |-?P|--andp ?Q ?S=>apply _derivable1_andp_intros;[hr_mask_pure|hr_mask_pure]
 | |-?P|--truep=>unfold derivable1,truep;intros;exact I end.
Ltac hr_mask_solve:=first[solve[hr_intro;hr_mask_prepare;hr_mask_pure]|solve[left;hr_intro;hr_mask_prepare;hr_mask_pure]|solve[right;hr_intro;hr_mask_prepare;hr_mask_pure]].
