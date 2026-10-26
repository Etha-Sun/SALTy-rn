From HwcConv Require Export Main443TailMemorySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac hct_word_index n rem:=
 multimatch goal with HF:hc_footprint ?input(3*?h*?nn+3)|-_=>
 constr_eq nn n;
 let HN:=fresh "Hwidth64"in pose proof(hcm_footprint_width_range input h n ltac:(lia)ltac:(lia)HF)as HN;
 let HQ:=fresh "HQ"in let HQ1:=fresh "HQ1"in
 pose proof(hcm_word_quot_index n rem HN ltac:(lia))as[HQ HQ1];
 rewrite !Z.quot_div_nonneg in HQ,HQ1 by lia;try rewrite HQ1 in * end.
Ltac hct_clamped_lane:=multimatch goal with
 HM:hc_neon_min4 ?rr ?b ?mx,HX:hc_neon_max4 ?b ?a ?mn,
 HA:hc_neon_rows_acc ?a ?f ?p0 ?p1 ?p2 ?w ?n ?cx 9,
 HL:hc_neon_dup4 ?mn ?lo,HH:hc_neon_dup4 ?mx ?hi |-
 hc_fget ?rr ?lane=hc_neon_raw ?f ?input ?zero ?weights ?h ?n ?top ?lo ?hi ?ch ?y ?x=>
 unfold hc_neon_raw;
 eapply(hcm_clamped_pixel_lane f input zero weights h n top y x(ch/4)lane p0 p1 p2 w a b rr mn mx lo hi);
 [f_equal;ring|f_equal;ring|f_equal;ring|reflexivity|exact HA|exact HX|exact HM|exact HL|exact HH|assumption]
 end.
Ltac hct_large_context:=
 repeat progress(rewrite Z.quot_div_nonneg in * by lia);
 multimatch goal with
 HD:hc_input_domain ?f ?input ?zero ?weights ?params ?h ?n ?top ?start ?finish ?C,
 HM:Z.rem(?C - ?c)4=0|-_=>
 let HNext:=fresh "HNextMod"in assert(HNext:(C-(c-4))mod 4=0)by
 (replace(C-(c-4))with((C-c)+1*4)by ring;rewrite Z.mod_add by lia;
 let HA:=fresh "HAlign"in pose proof HM as HA;rewrite Z.rem_mod_nonneg in HA by lia;exact HA);
 let HF:=fresh "HNextFoot"in let HW:=fresh "HNextWin"in
 pose proof(hcm_weight_block_resource f input zero weights params h n top start finish C(c-4)HD ltac:(lia)HNext)as[HF HW]
 end.
Ltac hct_large_finish:=first[
 solve[rewrite Z.rem_mod_nonneg by lia;assumption]|
 solve[eapply hcm_packed_next_pointer;[lia|eassumption]]].
