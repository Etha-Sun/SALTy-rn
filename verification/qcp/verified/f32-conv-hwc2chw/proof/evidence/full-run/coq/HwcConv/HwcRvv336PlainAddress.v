From HwcConv Require Export HwcRvv336CountFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma hr_source_address_plain:forall p x dx ci i,
 hc_addr64(unsigned_last_nbits((unsigned_last_nbits((unsigned_last_nbits p 64)-12)64)+(x*24+(dx*3+ci)*4))64+i*24)=
 hc_addr64(p+4*(3*(2*(x+i)+dx-1)+ci)).
Proof.
 intros p x dx ci i.
 replace(p+4*(3*(2*(x+i)+dx-1)+ci))with((p-12)+(x*24+(dx*3+ci)*4)+i*24)by ring.
 unfold hc_addr64,unsigned_last_nbits.
 change(2^64)with 18446744073709551616.
 apply hr_mod_congr_add.
 - rewrite Z.mod_mod by lia;apply hr_mod_congr_add.
   + rewrite Z.mod_mod by lia;apply hr_mod_congr_sub;[apply Z.mod_mod;lia|reflexivity].
   + reflexivity.
 - reflexivity.
Qed.
Lemma hr_masked_window_from_col_plain:forall F p width x dx ci m vl,
 hc_footprint p(3*width+3)->hc_window F p(3*width+3)->0<=ci<3->
 (forall i,0<=i<vl->hc_mget m i=1->0<=2*(x+i)+dx-1<width)->
 hc_masked_window F
 (unsigned_last_nbits((unsigned_last_nbits((unsigned_last_nbits p 64)-12)64)+(x*24+(dx*3+ci)*4))64)24 m vl.
Proof.
 intros F p width x dx ci m vl HF HW HC HM i HI Hm.
 rewrite hr_source_address_plain.
 assert(Hcol:0<=2*(x+i)+dx-1<width)by(apply HM;assumption).
 unfold hc_addr64;rewrite Z.mod_small.
 - eapply hc_window_lane;[exact HW|lia].
 - unfold hc_footprint,hc_u64_limit in HF;lia.
Qed.
Print Assumptions hr_source_address_plain.
Print Assumptions hr_masked_window_from_col_plain.
