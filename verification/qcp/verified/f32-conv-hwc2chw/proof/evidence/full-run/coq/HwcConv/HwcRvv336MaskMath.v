From HwcConv Require Export HwcRvv336Weight.
From Coq Require Import Ring.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma hr_mod_add_l:forall a b,((a mod 18446744073709551616)+b)mod 18446744073709551616=(a+b)mod 18446744073709551616.
Proof. intros;rewrite Z.add_mod by lia;rewrite Z.mod_mod by lia;symmetry;apply Z.add_mod;lia. Qed.
Lemma hr_mod_add_r:forall a b,(a+(b mod 18446744073709551616))mod 18446744073709551616=(a+b)mod 18446744073709551616.
Proof. intros;rewrite Z.add_mod by lia;rewrite Z.mod_mod by lia;symmetry;apply Z.add_mod;lia. Qed.
Lemma hr_mod_sub_l:forall a b,((a mod 18446744073709551616)-b)mod 18446744073709551616=(a-b)mod 18446744073709551616.
Proof. intros;rewrite Zminus_mod by lia;rewrite Z.mod_mod by lia;symmetry;apply Zminus_mod;lia. Qed.
Lemma hr_mod_congr_add:forall a a' b b',
 a mod 18446744073709551616=a' mod 18446744073709551616->
 b mod 18446744073709551616=b' mod 18446744073709551616->
 (a+b)mod 18446744073709551616=(a'+b')mod 18446744073709551616.
Proof. intros a a' b b' HA HB;rewrite(Z.add_mod a b 18446744073709551616),(Z.add_mod a' b' 18446744073709551616)by lia;rewrite HA,HB;reflexivity. Qed.
Lemma hr_mod_congr_sub:forall a a' b b',
 a mod 18446744073709551616=a' mod 18446744073709551616->
 b mod 18446744073709551616=b' mod 18446744073709551616->
 (a-b)mod 18446744073709551616=(a'-b')mod 18446744073709551616.
Proof. intros a a' b b' HA HB;rewrite(Zminus_mod a b 18446744073709551616),(Zminus_mod a' b' 18446744073709551616)by lia;rewrite HA,HB;reflexivity. Qed.
Lemma hr_source_address:forall p x dx ci i,
 hc_addr64(unsigned_last_nbits((unsigned_last_nbits((unsigned_last_nbits p 64)-12)64)+unsigned_last_nbits((unsigned_last_nbits(x*24)64)+(dx*3+ci)*4)64)64+i*24)=
 hc_addr64(p+4*(3*(2*(x+i)+dx-1)+ci)).
Proof.
 intros p x dx ci i.
 replace(p+4*(3*(2*(x+i)+dx-1)+ci))with((p-12)+(x*24+(dx*3+ci)*4)+i*24)by ring.
 unfold hc_addr64,unsigned_last_nbits.
 change(2^64)with 18446744073709551616.
 apply hr_mod_congr_add.
 - rewrite Z.mod_mod by lia;apply hr_mod_congr_add.
   + rewrite Z.mod_mod by lia;apply hr_mod_congr_sub;[apply Z.mod_mod;lia|reflexivity].
   + rewrite Z.mod_mod by lia;apply hr_mod_congr_add;[apply Z.mod_mod;lia|reflexivity].
 - reflexivity.
Qed.
Lemma hr_masked_window_from_col:forall F p width x dx ci m vl,
 hc_footprint p(3*width+3)->hc_window F p(3*width+3)->0<=ci<3->
 (forall i,0<=i<vl->hc_mget m i=1->0<=2*(x+i)+dx-1<width)->
 hc_masked_window F
 (unsigned_last_nbits((unsigned_last_nbits((unsigned_last_nbits p 64)-12)64)+unsigned_last_nbits((unsigned_last_nbits(x*24)64)+(dx*3+ci)*4)64)64)24 m vl.
Proof.
 intros F p width x dx ci m vl HF HW HC HM i HI Hm.
 rewrite hr_source_address.
 assert(Hcol:0<=2*(x+i)+dx-1<width)by(apply HM;assumption).
 unfold hc_addr64;rewrite Z.mod_small.
 - eapply hc_window_lane;[exact HW|lia].
 - unfold hc_footprint,hc_u64_limit in HF;lia.
Qed.
Lemma hr_land1_mod2:forall w,Z.land w 1=w mod 2.
Proof. intro w;replace 1 with(Z.ones 1)by reflexivity;rewrite Z.land_ones by lia;reflexivity. Qed.
Print Assumptions hr_mod_add_l.
Print Assumptions hr_mod_add_r.
Print Assumptions hr_mod_sub_l.
Print Assumptions hr_source_address.
Print Assumptions hr_masked_window_from_col.
Print Assumptions hr_land1_mod2.
