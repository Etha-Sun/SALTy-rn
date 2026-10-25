From Coq Require Import ZArith Lia Bool.
From Qs8Mul Require Import Model Bits NanFacts ArithmeticFacts NaNQuantization.
Local Open Scope Z_scope.
Lemma qm_land_sign_cases : forall u:Z,
 Z.land u 2147483648=0 \/ Z.land u 2147483648=2147483648.
Proof.
 intro u. change 2147483648 with (2^31).
 destruct(Z.testbit u 31)eqn:Hbit.
 - right. apply Z.bits_inj. intro i.
   rewrite Z.land_spec, !Z.pow2_bits_eqb by lia.
   destruct(Z.eqb_spec 31 i)as[Heq|Hneq].
   + subst i. rewrite Hbit. reflexivity.
   + now rewrite andb_false_r.
 - left. apply Z.bits_inj. intro i.
   rewrite Z.land_spec,Z.pow2_bits_eqb by lia.
   rewrite Z.bits_0.
   destruct(Z.eqb_spec 31 i)as[Heq|Hneq].
   + subst i. rewrite Hbit. reflexivity.
   + now rewrite andb_false_r.
Qed.
Lemma qm_word_top_bit:forall u,0<=u<=4294967295 ->
 Z.testbit u 31=(2147483648<=?u).
Proof.
 intros u Hu;pose proof(Z.testbit_spec u 31 ltac:(lia))as[l[h[Hl He]]].
 change(0<=l<2147483648)in Hl.
 destruct(Z.testbit u 31)eqn:E.
 - change(u=l+(1+2*h)*2147483648)in He.
   destruct(Z.leb_spec 2147483648 u);[reflexivity|lia].
 - change(u=l+(0+2*h)*2147483648)in He.
   destruct(Z.leb_spec 2147483648 u);[lia|reflexivity].
Qed.
Lemma qm_nan_word_ranges:forall u,0<=u<=4294967295 -> qm_nan_bits u=1 ->
 (2139095040<u<=2147483647) \/ (4286578688<u<=4294967295).
Proof.
 intros u Hu Hn;unfold qm_nan_bits,qm_abs_bits in Hn.
 replace 2147483647 with(Z.ones 31)in Hn by reflexivity.
 rewrite Z.land_ones in Hn by lia.
 change((if 2139095040<?u mod 2147483648 then 1 else 0)=1)in Hn.
 destruct(Z.ltb_spec 2139095040(u mod 2147483648))as[Hm|Hm];[|discriminate].
 destruct(Z_lt_ge_dec u 2147483648).
 - left;rewrite Z.mod_small in Hm by lia;lia.
 - right;assert(He:u mod 2147483648=u-2147483648).
   { replace u with(u-2147483648+1*2147483648)at 1 by lia.
     rewrite Z.mod_add by lia;apply Z.mod_small;lia. }
   rewrite He in Hm;lia.
Qed.
Lemma qm_nan_quantization_same_top_bit:forall u v oz lo hi,
 0<=u<=4294967295 -> 0<=v<=4294967295 ->
 qm_nan_bits u=1 -> qm_nan_bits v=1 ->
 Z.testbit u 31=Z.testbit v 31 -> -32768<=oz<=32767 ->
 qm_quant_bits u oz lo hi=qm_quant_bits v oz lo hi.
Proof.
 intros u v oz lo hi Hu Hv Hnu Hnv Hsign Hz.
 rewrite !qm_word_top_bit in Hsign by assumption.
 destruct(qm_nan_word_ranges u Hu Hnu)as[Up|Un];
 destruct(qm_nan_word_ranges v Hv Hnv)as[Vp|Vn].
 - apply qm_quantization_preserves_only_nan_sign;[assumption|left;auto].
 - assert(Eu:(2147483648<=?u)=false)by(apply Z.leb_gt;lia).
   assert(Ev:(2147483648<=?v)=true)by(apply Z.leb_le;lia).
   rewrite Eu,Ev in Hsign;discriminate.
 - assert(Eu:(2147483648<=?u)=true)by(apply Z.leb_le;lia).
   assert(Ev:(2147483648<=?v)=false)by(apply Z.leb_gt;lia).
   rewrite Eu,Ev in Hsign;discriminate.
 - apply qm_quantization_preserves_only_nan_sign;[assumption|right;auto].
Qed.
Lemma qm_signed_canonical_range:forall u,
 0<=Z.lor 2143289344(Z.land u 2147483648)<=4294967295.
Proof.
 intro u;apply qm_lor_word;[lia|].
 destruct(qm_land_sign_cases u);rewrite H;lia.
Qed.
Lemma qm_signed_canonical_nan:forall u,
 qm_nan_bits(Z.lor 2143289344(Z.land u 2147483648))=1.
Proof.
 intro u;unfold qm_nan_bits,qm_abs_bits;rewrite Z.land_lor_distr_l.
 change(Z.land 2143289344 2147483647)with 2143289344.
 rewrite <-Z.land_assoc;change(Z.land 2147483648 2147483647)with 0.
 rewrite Z.land_0_r,Z.lor_0_r;reflexivity.
Qed.
Lemma qm_restored_nan_quantization:forall u oz lo hi,
 0<=u<=4294967295 -> qm_nan_bits u=1 -> -32768<=oz<=32767 ->
 qm_quant_bits(Z.lor u 4194304)oz lo hi=
 qm_quant_bits(Z.lor 2143289344(Z.land u 2147483648))oz lo hi.
Proof.
 intros u oz lo hi Hu Hn Hz;apply qm_nan_quantization_same_top_bit.
 - apply qm_lor_word;[assumption|lia].
 - apply qm_signed_canonical_range.
 - apply qm_quiet_preserves_nan;assumption.
 - apply qm_signed_canonical_nan.
 - rewrite !Z.lor_spec,Z.land_spec.
   change(Z.testbit 4194304 31)with false.
   change(Z.testbit 2143289344 31)with false.
   change(Z.testbit 2147483648 31)with true.
   rewrite orb_false_r,orb_false_l,andb_true_r;reflexivity.
 - assumption.
Qed.
Lemma qm_signed_canonical_bits:forall x,
 bits_of_fp32(qm_sign qm_canonical_nan x)=
 Z.lor 2143289344(Z.land(bits_of_fp32 x)2147483648).
Proof.
 intro x;unfold qm_sign.
 change(bits_of_fp32 qm_canonical_nan)with 2143289344.
 change(Z.land 2143289344 2147483647)with 2143289344.
 apply bits_of_fp32_of_bits;apply qm_signed_canonical_range.
Qed.
Print Assumptions qm_word_top_bit.
Print Assumptions qm_nan_word_ranges.
Print Assumptions qm_nan_quantization_same_top_bit.
Print Assumptions qm_restored_nan_quantization.
Print Assumptions qm_signed_canonical_bits.
