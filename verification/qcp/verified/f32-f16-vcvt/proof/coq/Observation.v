From Coq Require Import ZArith Lia Bool List.
From Flocq.IEEE754 Require Import Binary.
From F32F16 Require Import Bits Model IntegerModel LiteralModel LaneModel NanFacts FloatFacts.
Local Open Scope Z_scope.
Lemma f16_land_bound : forall u b, 0<=b -> 0<=Z.land u b<=b.
Proof.
 intros u b Hb.
 assert (Habs:Z.lor (Z.land u b) b=b).
 { apply Z.bits_inj;intro i;rewrite Z.lor_spec,Z.land_spec;
   destruct(Z.testbit b i),(Z.testbit u i);reflexivity. }
 pose proof (Z.sub_lor_l_same_l b (Z.land u b)) as Hdiff.
 rewrite Habs in Hdiff.
 assert (Hnn:0<=Z.land b (Z.lnot (Z.land u b))) by (apply Z.land_nonneg;left;exact Hb).
 split;[apply Z.land_nonneg;right;exact Hb|lia].
Qed.
Lemma f16_bias_bound : forall x,0<=f16_bias x<=2139095040.
Proof.
 intro x;unfold f16_bias,f16_max32,f16_and32.
 pose proof (f16_land_bound (f16_add32 (bits_of_fp32 (f16_abs x)) 125829120) 2139095040 ltac:(lia)).
 destruct(Z.ltb_spec (Z.land (f16_add32 (bits_of_fp32 (f16_abs x)) 125829120) 2139095040) 1073741824);lia.
Qed.
Lemma f16_bias_nonnan : forall x,
 f16_nan_bits(bits_of_fp32(fp32_of_bits(f16_bias x)))=0.
Proof.
 intro x;pose proof(f16_bias_bound x).
 rewrite bits_of_fp32_of_bits by lia.
 unfold f16_nan_bits,f16_abs_bits.
 replace 2147483647 with (Z.ones 31)by reflexivity.
 rewrite Z.land_ones by lia;change(2^31)with 2147483648.
 rewrite Z.mod_small by lia.
 destruct(Z.ltb_spec 2139095040(f16_bias x));[lia|reflexivity].
Qed.
Lemma f16_snan_zero : forall u,f16_nan_bits u=0 -> f16_snan_bits u=0.
Proof. intros u Hu;unfold f16_snan_bits;rewrite Hu;reflexivity. Qed.
Lemma f16_arm_canonical_left : forall b r,
 f16_nan_bits(bits_of_fp32 b)=0 ->
 f16_arm_result f16_canonical_nan b r=f16_canonical_nan.
Proof.
 intros b r Hb;unfold f16_arm_result,f16_arm_nan.
 change(bits_of_fp32 f16_canonical_nan)with 2143289344.
 change(f16_nan_bits 2143289344)with 1.
 change(f16_snan_bits 2143289344)with 0.
 rewrite(f16_snan_zero _ Hb);reflexivity.
Qed.
Lemma f16_rvv_mul_canonical : forall b,
 f16_rvv_mul f16_canonical_nan b=f16_canonical_nan.
Proof. intro b;destruct b;reflexivity. Qed.
Lemma f16_rvv_add_canonical : forall b,
 f16_rvv_add f16_canonical_nan b=f16_canonical_nan.
Proof. intro b;destruct b;reflexivity. Qed.
Lemma f16_mul_representative : forall r b,
 f16_nan_bits(bits_of_fp32 b)=0 ->
 f16_arm_mul(f16_rvv_result r)b=f16_rvv_mul(f16_rvv_result r)b.
Proof.
 intros r b Hb;unfold f16_rvv_result at 1 2.
 destruct(Z.eqb_spec(f16_nan_bits(bits_of_fp32 r))1)as[Hr|Hr].
 - change(f16_arm_mul f16_canonical_nan b=f16_rvv_mul f16_canonical_nan b).
   rewrite f16_rvv_mul_canonical;unfold f16_arm_mul;apply f16_arm_canonical_left;exact Hb.
 - unfold f16_arm_mul,f16_arm_result,f16_rvv_mul,f16_rvv_result.
   destruct(f16_nan_cases(bits_of_fp32 r))as[H0|H1];[rewrite H0,Hb;reflexivity|contradiction].
Qed.
Lemma f16_add_representative : forall r b,
 f16_nan_bits(bits_of_fp32 b)=0 ->
 f16_arm_add(f16_rvv_result r)b=f16_rvv_add(f16_rvv_result r)b.
Proof.
 intros r b Hb;unfold f16_rvv_result at 1 2.
 destruct(Z.eqb_spec(f16_nan_bits(bits_of_fp32 r))1)as[Hr|Hr].
 - change(f16_arm_add f16_canonical_nan b=f16_rvv_add f16_canonical_nan b).
   rewrite f16_rvv_add_canonical;unfold f16_arm_add;apply f16_arm_canonical_left;exact Hb.
 - unfold f16_arm_add,f16_arm_result,f16_rvv_add,f16_rvv_result.
   destruct(f16_nan_cases(bits_of_fp32 r))as[H0|H1];[rewrite H0,Hb;reflexivity|contradiction].
Qed.
Lemma f16_mul_nonnan_inputs : forall a b,
 f16_nan_bits(bits_of_fp32 a)=0 -> f16_nan_bits(bits_of_fp32 b)=0 ->
 f16_arm_mul a b=f16_rvv_mul a b.
Proof. intros a b Ha Hb;unfold f16_arm_mul,f16_arm_result,f16_rvv_mul,f16_rvv_result;rewrite Ha,Hb;reflexivity. Qed.
Lemma f16_core_nonnan : forall x,
 f16_nan_bits(bits_of_fp32 x)=0 -> f16_arm_core x=f16_rvv_core x.
Proof.
 intros x Hx;assert(Ha:f16_nan_bits(bits_of_fp32(f16_abs x))=0)by(now rewrite f16_abs_nan).
 assert(Hhi:f16_nan_bits(bits_of_fp32 f16_scale_hi)=0)by reflexivity.
 assert(Hlo:f16_nan_bits(bits_of_fp32 f16_scale_lo)=0)by reflexivity.
 unfold f16_arm_core,f16_rvv_core.
 rewrite(f16_mul_nonnan_inputs(f16_abs x)f16_scale_hi Ha Hhi).
 unfold f16_rvv_mul.
 rewrite f16_mul_representative by exact Hlo.
 unfold f16_rvv_mul.
 apply f16_add_representative;apply f16_bias_nonnan.
Qed.
Lemma f16_select16_zero : forall a b,
 f16_select16 0 a b=f16_narrow16 b.
Proof.
 intros a b;unfold f16_select16,f16_narrow16.
 rewrite Z.land_0_l,Z.lxor_0_l,Z.lor_0_l.
 rewrite Z.land_comm;replace 65535 with (Z.ones 16)by reflexivity.
 rewrite Z.land_ones by lia;change(2^16)with 65536;rewrite Z.mod_mod by lia;reflexivity.
Qed.
Lemma f16_select16_all : forall a b,
 f16_select16 65535 a b=f16_narrow16 a.
Proof.
 intros a b;unfold f16_select16,f16_narrow16.
 rewrite Z.lxor_nilpotent,Z.land_0_l,Z.lor_0_r.
 rewrite Z.land_comm;replace 65535 with (Z.ones 16)by reflexivity.
 rewrite Z.land_ones by lia;change(2^16)with 65536;rewrite Z.mod_mod by lia;reflexivity.
Qed.
Lemma f16_core_half_narrow : forall x,
 f16_narrow16(f16_core_half x)=f16_core_half x.
Proof. intro x;unfold f16_core_half,f16_add16,f16_narrow16;rewrite Z.mod_mod by lia;reflexivity. Qed.
Lemma f16_pointwise_bits : forall x,f16_arm_lane x=f16_rvv_lane x.
Proof.
 intro x;unfold f16_arm_lane,f16_rvv_lane,f16_gt32.
 destruct(Z.ltb_spec 2139095040(bits_of_fp32(f16_abs x)))as[Hn|Hn].
 - change(f16_narrow16 4294967295)with 65535.
   rewrite f16_select16_all;change(f16_narrow16 32256)with 32256;reflexivity.
 - change(f16_narrow16 0)with 0;rewrite f16_select16_zero,f16_core_half_narrow.
   f_equal;f_equal;apply f16_core_nonnan.
   unfold f16_nan_bits;rewrite f16_abs_bits_exact in Hn.
   destruct(Z.ltb_spec 2139095040(f16_abs_bits(bits_of_fp32 x)));[lia|reflexivity].
Qed.
Lemma f16_output_range : forall x,0<=f16_arm_lane x<65536.
Proof. intro x;unfold f16_arm_lane,f16_or16,f16_narrow16;apply Z.mod_pos_bound;lia. Qed.
Lemma f16_values_equal : forall n xs,f16_values n xs=f16_rvv_values n xs.
Proof. intros n xs;unfold f16_values,f16_rvv_values;f_equal;apply map_ext;exact f16_pointwise_bits. Qed.
Print Assumptions f16_pointwise_bits.
Print Assumptions f16_values_equal.
Print Assumptions f16_output_range.
