From Coq Require Import ZArith Lia Bool.
From Flocq.IEEE754 Require Import Binary.
From Qs8Gemm Require Import Model Bits NanFacts FloatFacts.
Local Open Scope Z_scope.

Lemma qs8_land_bound : forall u b, 0<=b -> 0<=Z.land u b<=b.
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
Lemma qs8_land_quiet : forall u,
 Z.land u 4194304 = if Z.testbit u 22 then 4194304 else 0.
Proof.
 intro u;change (Z.land u (2^22)=if Z.testbit u 22 then 2^22 else 0).
 apply Z.bits_inj;intro i;rewrite Z.land_spec,Z.pow2_bits_eqb by lia.
 destruct (Z.eqb_spec 22 i);subst.
 - destruct(Z.testbit u 22);rewrite ?Z.pow2_bits_true,?Z.bits_0 by lia;reflexivity.
 - destruct(Z.testbit u 22);rewrite ?Z.pow2_bits_false,?Z.bits_0 by lia;
   apply Bool.andb_false_r.
Qed.
Lemma qs8_quiet_id : forall u,
 Z.land u 4194304<>0 -> Z.lor u 4194304=u.
Proof.
 intros u H;rewrite qs8_land_quiet in H.
 assert(Hb:Z.testbit u 22=true) by (destruct(Z.testbit u 22);congruence).
 change(Z.lor u (2^22)=u);apply Z.bits_inj;intro i.
 rewrite Z.lor_spec,Z.pow2_bits_eqb by lia.
 destruct(Z.eqb_spec 22 i);subst;[rewrite Hb;reflexivity|apply Bool.orb_false_r].
Qed.
Lemma qs8_quiet_range : forall u,
 0<=u<=4294967295 -> 0<=Z.lor u 4194304<=4294967295.
Proof.
 intros u Hu.
 assert(Hu32:Z.land u 4294967295=u).
 { replace 4294967295 with (Z.ones 32) by reflexivity.
   rewrite Z.land_ones by lia;change(2^32)with 4294967296;apply Z.mod_small;lia. }
 pose proof(qs8_land_bound (Z.lor u 4194304) 4294967295 ltac:(lia)) as H.
 rewrite Z.land_lor_distr_l,Hu32 in H.
 change(Z.land 4194304 4294967295)with 4194304 in H;exact H.
Qed.
Lemma qs8_quiet_not_snan : forall u,
 f16_snan_bits (Z.lor u 4194304)=0.
Proof.
 intro u;unfold f16_snan_bits.
 rewrite Z.land_lor_distr_l.
 change(Z.land 4194304 4194304)with 4194304.
 rewrite qs8_land_quiet.
 destruct(Z.testbit u 22);cbn;
 destruct(Z.eqb (f16_nan_bits (Z.lor u 4194304)) 1);reflexivity.
Qed.
Lemma qs8_snan_zero : forall u,
 f16_nan_bits u=0 -> f16_snan_bits u=0.
Proof. intros u H;unfold f16_snan_bits;rewrite H;reflexivity. Qed.
Lemma qs8_of_Z_not_nan : forall z,
 f16_nan_bits(bits_of_fp32(fp32_of_Z z))=0.
Proof.
 intro z;destruct(f16_nan_cases(bits_of_fp32(fp32_of_Z z))) as [H|H];auto.
 apply f16_nan_fp32 in H.
 unfold fp32_isNaN,fp32_of_Z,fp32_of_real,Binary.binary_normalize in H.
 rewrite Binary.is_nan_BSN2B' in H;discriminate.
Qed.

Definition qs8_mul_repaired (a b:fp32) : fp32 :=
 if Z.eqb(f16_nan_bits(bits_of_fp32 b)) 1 then f16_quiet b else f16_rvv_mul a b.
Definition qs8_add_repaired (a b:fp32) : fp32 :=
 if Z.eqb(f16_snan_bits(bits_of_fp32 b)) 1 then f16_quiet b else
 if Z.eqb(f16_nan_bits(bits_of_fp32 a)) 1 then a else
 if Z.eqb(f16_nan_bits(bits_of_fp32 b)) 1 then f16_quiet b else f16_rvv_add a b.

Lemma qs8_mul_repaired_correct : forall a b,
 f16_nan_bits(bits_of_fp32 a)=0 -> qs8_mul_repaired a b=f16_arm_mul a b.
Proof.
 intros a b Ha;unfold qs8_mul_repaired,f16_arm_mul,f16_arm_result,f16_arm_nan.
 rewrite Ha,qs8_snan_zero by exact Ha;cbn.
 destruct(f16_nan_cases(bits_of_fp32 b)) as [Hb|Hb];rewrite Hb;cbn.
 - unfold f16_rvv_mul,f16_rvv_result;reflexivity.
 - unfold f16_quiet,f16_snan_bits;rewrite Hb;cbn.
   destruct(Z.eqb_spec(Z.land(bits_of_fp32 b)4194304)0);[reflexivity|].
   rewrite qs8_quiet_id by assumption;reflexivity.
Qed.
Lemma qs8_add_repaired_correct : forall a b,
 f16_snan_bits(bits_of_fp32 a)=0 -> qs8_add_repaired a b=f16_arm_add a b.
Proof.
 intros a b Ha;unfold qs8_add_repaired,f16_arm_add,f16_arm_result,f16_arm_nan;rewrite Ha;cbn.
 destruct(Z.eqb_spec(f16_snan_bits(bits_of_fp32 b))1) as [Hs|Hs].
 - pose proof(f16_snan_implies_nan _ Hs) as Hb;rewrite Hb,Bool.orb_true_r;reflexivity.
 - destruct(f16_nan_cases(bits_of_fp32 a)) as [Han|Han];
   destruct(f16_nan_cases(bits_of_fp32 b)) as [Hbn|Hbn];rewrite Han,Hbn;cbn;
   try (rewrite fp32_of_bits_of_fp32;reflexivity);try reflexivity.
   unfold f16_quiet;rewrite qs8_quiet_id;[reflexivity|].
   intro Hq;apply Hs;unfold f16_snan_bits;rewrite Hbn,Hq;reflexivity.
Qed.
Print Assumptions qs8_mul_repaired_correct.
Print Assumptions qs8_add_repaired_correct.
Print Assumptions qs8_of_Z_not_nan.

Lemma qs8_rvv_result_not_snan : forall r,
 f16_snan_bits(bits_of_fp32(f16_rvv_result r))=0.
Proof.
 intro r;unfold f16_rvv_result.
 destruct(f16_nan_cases(bits_of_fp32 r)) as [H|H];rewrite H;cbn.
 - apply qs8_snan_zero;exact H.
 - reflexivity.
Qed.
Lemma qs8_mul_repaired_not_snan : forall a b,
 f16_snan_bits(bits_of_fp32(qs8_mul_repaired a b))=0.
Proof.
 intros a b;unfold qs8_mul_repaired.
 destruct(Z.eqb(f16_nan_bits(bits_of_fp32 b))1).
 - unfold f16_quiet;rewrite bits_of_fp32_of_bits by (apply qs8_quiet_range;apply fp32_bits_range).
   apply qs8_quiet_not_snan.
 - unfold f16_rvv_mul;apply qs8_rvv_result_not_snan.
Qed.
Lemma qs8_repaired_float_chain : forall acc scale magic,
 qs8_add_repaired(qs8_mul_repaired(fp32_of_Z acc)scale)magic =
 f16_arm_add(f16_arm_mul(fp32_of_Z acc)scale)magic.
Proof.
 intros;rewrite qs8_add_repaired_correct by apply qs8_mul_repaired_not_snan.
 rewrite qs8_mul_repaired_correct by apply qs8_of_Z_not_nan;reflexivity.
Qed.
Print Assumptions qs8_repaired_float_chain.

Lemma qs8_wrap_signed_bits : forall u,
 IntegerFold.wrap32 (CastModel.signed32_view u)=IntegerFold.wrap32 u.
Proof.
 intro u;change(unsigned_last_nbits(signed_last_nbits u 32)32=unsigned_last_nbits u 32).
 apply unsigned_signed_revolutive;lia.
Qed.
Lemma qs8_wrap_small : forall u, 0<=u<=4294967295 -> IntegerFold.wrap32 u=u.
Proof. intros;unfold IntegerFold.wrap32,IntegerFold.modulus;apply Z.mod_small;lia. Qed.
Lemma qs8_wrap_or : forall a b,
 IntegerFold.wrap32(Z.lor a b)=Z.lor(IntegerFold.wrap32 a)(IntegerFold.wrap32 b).
Proof.
 intros;unfold IntegerFold.wrap32,IntegerFold.modulus.
 change(4294967296)with(2^32).
 rewrite <-!Z.land_ones by lia;apply Z.land_lor_distr_l.
Qed.
Lemma qs8_wrap_and : forall a b,
 IntegerFold.wrap32(Z.land a b)=Z.land(IntegerFold.wrap32 a)(IntegerFold.wrap32 b).
Proof.
 intros;unfold IntegerFold.wrap32,IntegerFold.modulus.
 change(4294967296)with(2^32).
 rewrite <-!Z.land_ones by lia;apply Z.bits_inj;intro i;repeat rewrite Z.land_spec.
 destruct(Z.testbit a i),(Z.testbit b i),(Z.testbit(Z.ones 32)i);reflexivity.
Qed.
Lemma qs8_uninterpret_reinterpret : forall x,
 qs8_uninterpret(qs8_reinterpret x)=x.
Proof.
 intro x;unfold qs8_uninterpret,qs8_reinterpret.
 rewrite qs8_wrap_signed_bits,qs8_wrap_small by apply fp32_bits_range.
 apply fp32_of_bits_of_fp32.
Qed.
Lemma qs8_or_reinterpret : forall x mask,
 0<=mask<=4294967295 ->
 qs8_or32(qs8_reinterpret x)mask=CastModel.signed32_view(Z.lor(bits_of_fp32 x)mask).
Proof.
 intros x mask Hm;unfold qs8_or32,qs8_wrap_signed,qs8_reinterpret.
 rewrite qs8_wrap_or,qs8_wrap_signed_bits,!qs8_wrap_small by (try assumption;apply fp32_bits_range).
 reflexivity.
Qed.
Lemma qs8_and_reinterpret : forall x mask,
 0<=mask<=2147483647 ->
 qs8_and32(qs8_reinterpret x)mask=Z.land(bits_of_fp32 x)mask.
Proof.
 intros x mask Hm;unfold qs8_and32,qs8_wrap_signed,qs8_reinterpret.
 rewrite qs8_wrap_and,qs8_wrap_signed_bits,!qs8_wrap_small by (try lia;apply fp32_bits_range).
 apply CastModel.signed32_view_low;pose proof(qs8_land_bound(bits_of_fp32 x)mask ltac:(lia));lia.
Qed.
Lemma qs8_quiet_reinterpret : forall x,
 qs8_or32(qs8_reinterpret x)4194304=qs8_reinterpret(f16_quiet x).
Proof.
 intro x;rewrite qs8_or_reinterpret by lia;unfold qs8_reinterpret,f16_quiet.
 rewrite bits_of_fp32_of_bits by (apply qs8_quiet_range;apply fp32_bits_range);reflexivity.
Qed.
Lemma qs8_magic_nan_mask : forall x,
 qs8_gt(qs8_and32(qs8_reinterpret x)2147483647)2139095040=qs8_nan x.
Proof.
 intro x;rewrite qs8_and_reinterpret by lia.
 unfold qs8_gt,qs8_nan,f16_nan_bits,f16_abs_bits.
 repeat match goal with |-context[Z.ltb ?a ?b]=>destruct(Z.ltb_spec a b)
 | |-context[Z.eqb ?a ?b]=>destruct(Z.eqb_spec a b) end;try reflexivity;lia.
Qed.
Lemma qs8_magic_snan_mask : forall x,
 qs8_mask_and(qs8_nan x)(qs8_eq(qs8_and32(qs8_reinterpret x)4194304)0)=
 f16_snan_bits(bits_of_fp32 x).
Proof.
 intro x;rewrite qs8_and_reinterpret by lia.
 unfold qs8_mask_and,qs8_eq,qs8_nan,f16_snan_bits.
 destruct(f16_nan_cases(bits_of_fp32 x)) as [H|H];rewrite H;cbn;
 destruct(Z.eqb(Z.land(bits_of_fp32 x)4194304)0);reflexivity.
Qed.
Definition qs8_product_bits (a scale:fp32):Z :=
 qs8_merge(qs8_reinterpret(f16_rvv_mul a scale))
 (qs8_or32(qs8_reinterpret scale)4194304)(qs8_nan scale).
Lemma qs8_product_bits_exact : forall a scale,
 qs8_product_bits a scale=qs8_reinterpret(qs8_mul_repaired a scale).
Proof.
 intros a scale;unfold qs8_product_bits;rewrite qs8_quiet_reinterpret.
 unfold qs8_mul_repaired,qs8_merge,qs8_nan.
 destruct(f16_nan_cases(bits_of_fp32 scale)) as [H|H];rewrite H;reflexivity.
Qed.
Definition qs8_sum_bits (p magic:fp32):Z :=
 let mb:=qs8_reinterpret magic in
 let mn:=qs8_gt(qs8_and32 mb 2147483647)2139095040 in
 let ms:=qs8_mask_and mn (qs8_eq(qs8_and32 mb 4194304)0) in
 let mq:=qs8_or32 mb 4194304 in
 qs8_merge(qs8_merge(qs8_merge(qs8_reinterpret(f16_rvv_add p magic))mq mn)
 (qs8_reinterpret p)(qs8_nan p))mq ms.
Lemma qs8_sum_bits_exact : forall p magic,
 qs8_sum_bits p magic=qs8_reinterpret(qs8_add_repaired p magic).
Proof.
 intros p magic;unfold qs8_sum_bits;rewrite qs8_magic_nan_mask,qs8_magic_snan_mask,qs8_quiet_reinterpret.
 unfold qs8_merge,qs8_add_repaired,qs8_nan.
 destruct(f16_nan_cases(bits_of_fp32 p)) as [Hp|Hp];
 destruct(f16_nan_cases(bits_of_fp32 magic)) as [Hm|Hm];
 unfold f16_snan_bits;rewrite Hp,Hm;cbn;
 destruct(Z.eqb(Z.land(bits_of_fp32 magic)4194304)0);reflexivity.
Qed.
Lemma qs8_actual_repair_bits : forall acc scale magic,
 qs8_sum_bits(qs8_uninterpret(qs8_product_bits(fp32_of_Z acc)scale))magic =
 qs8_reinterpret(f16_arm_add(f16_arm_mul(fp32_of_Z acc)scale)magic).
Proof.
 intros;rewrite qs8_product_bits_exact,qs8_uninterpret_reinterpret,qs8_sum_bits_exact,
 qs8_repaired_float_chain;reflexivity.
Qed.
Print Assumptions qs8_actual_repair_bits.
