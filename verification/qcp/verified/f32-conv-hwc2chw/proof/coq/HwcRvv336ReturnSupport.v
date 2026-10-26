From HwcConv Require Export HwcRvv336PlainAddress.
From Coq Require Import Reals Lra.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma hrr_literal_zero:fp32_of_real(0.0%R)=fp32_zero.
Proof.
 replace(0.0%R)with(0%R)by(unfold Q2R;simpl;ring).
 unfold fp32_of_real,rounded32.
 rewrite Generic_fmt.round_0 by apply BinarySingleNaN.valid_rnd_round_mode.
 rewrite Generic_fmt.scaled_mantissa_0,Raux.Ztrunc_IZR.
 rewrite Raux.Rlt_bool_false by lra;reflexivity.
Qed.
Lemma hrr_input_at:forall F p width x dx ci vl i Z L X M,
 hc_footprint p(3*width+3)->0<=ci<3->0<=i<vl->
 2*(x+i)+dx-1<width->
 hc_rvv_splat Z fp32_zero vl->
 hc_masked_load L F
 (unsigned_last_nbits((unsigned_last_nbits((unsigned_last_nbits p 64)-12)64)+unsigned_last_nbits((unsigned_last_nbits(x*24)64)+(dx*3+ci)*4)64)64)24 M vl->
 hc_isa_merge X Z L M vl->
 hc_mget M i=(if 2*(x+i)+dx-1<?0 then 0 else 1)->
 hc_vget X i=hc_neon_row_input F p(2*(x+i)+dx-1)ci.
Proof.
 intros F p width x dx ci vl i Z L X M HF HC HI Hcol HZ HL HX HM.
 rewrite HX by exact HI;rewrite HM;unfold hc_neon_row_input.
 destruct(Z.ltb (2*(x+i)+dx-1)0)eqn:HN;simpl.
 - apply HZ;exact HI.
 - assert(HM1:hc_mget M i=1)by exact HM.
   apply Z.ltb_ge in HN.
   rewrite HL by assumption.
   rewrite hr_source_address;unfold hc_addr64.
   rewrite Z.mod_small;[reflexivity|unfold hc_footprint,hc_u64_limit in HF;lia].
Qed.
Print Assumptions hrr_literal_zero.
Print Assumptions hrr_input_at.
Lemma hrr_mask_at:forall id ge lt m vl s e i,
 hc_rvv_id id vl->hc_mask_ge ge id s vl->hc_mask_lt lt id e vl->
 hc_mask_and m ge lt vl->0<=i<vl->
 hc_mget m i=if andb(s<=?i)(i<?e)then 1 else 0.
Proof. intros id ge lt m vl s e i HI HG HL HA HX.
 rewrite HA,HG,HL,HI by exact HX.
 destruct(s<=?i);destruct(i<?e);reflexivity. Qed.
Lemma hrr_weight_address:forall w dx ci k lane,
 w+((4+((dx*9+ci*3+k)*4))+lane)*4=w+4*(4+(dx*9+ci*3+k)*4+lane).
Proof. intros;ring. Qed.
Print Assumptions hrr_mask_at.
Print Assumptions hrr_weight_address.

Ltac hrr_bools:=repeat match goal with
 | |-context[Z.ltb ?a ?b]=>let H:=fresh "Hbool" in
   first[assert(H:(a<?b)=true)by(apply Z.ltb_lt;lia)|assert(H:(a<?b)=false)by(apply Z.ltb_ge;lia)];rewrite H
 | |-context[Z.leb ?a ?b]=>let H:=fresh "Hbool" in
   first[assert(H:(a<=?b)=true)by(apply Z.leb_le;lia)|assert(H:(a<=?b)=false)by(apply Z.leb_gt;lia)];rewrite H
 end.

Lemma hrr_input_plain:forall F p width x dx ci vl i Z L X M,
 hc_footprint p(3*width+3)->0<=ci<3->0<=i<vl->
 2*(x+i)+dx-1<width->
 hc_rvv_splat Z fp32_zero vl->
 hc_masked_load L F
 (unsigned_last_nbits((unsigned_last_nbits((unsigned_last_nbits p 64)-12)64)+(x*24+(dx*3+ci)*4))64)24 M vl->
 hc_isa_merge X Z L M vl->
 hc_mget M i=(if 2*(x+i)+dx-1<?0 then 0 else 1)->
 hc_vget X i=hc_neon_row_input F p(2*(x+i)+dx-1)ci.
Proof.
 intros F p width x dx ci vl i Z L X M HF HC HI Hcol HZ HL HX HM.
 rewrite HX by exact HI;rewrite HM;unfold hc_neon_row_input.
 destruct(Z.ltb (2*(x+i)+dx-1)0)eqn:HN;simpl.
 - apply HZ;exact HI.
 - assert(HM1:hc_mget M i=1)by exact HM.
   apply Z.ltb_ge in HN.
   rewrite HL by assumption.
   rewrite hr_source_address_plain;unfold hc_addr64.
   rewrite Z.mod_small;[reflexivity|unfold hc_footprint,hc_u64_limit in HF;lia].
Qed.
Print Assumptions hrr_input_plain.
