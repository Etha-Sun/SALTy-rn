From Coq Require Import ZArith Lia Bool.
From Flocq.IEEE754 Require Import Binary.
From Flocq.Core Require Import Raux.
From Qs8Mul Require Import Bits Model NanFacts BitFacts.
Local Open Scope Z_scope.
Lemma qm_magic_nan_zero : qm_nan_bits (bits_of_fp32 qm_magic)=0.
Proof. reflexivity. Qed.
Lemma qm_abs_magic : qm_abs qm_magic = qm_magic.
Proof. reflexivity. Qed.
Lemma qm_snan_zero : forall u, qm_nan_bits u=0 -> qm_snan_bits u=0.
Proof. intros u H;unfold qm_snan_bits;rewrite H;reflexivity. Qed.
Lemma qm_lor_word : forall u q,
 0<=u<=4294967295 -> 0<=q<=4294967295 -> 0<=Z.lor u q<=4294967295.
Proof.
 intros u q Hu Hq.
 assert (Hmask : Z.land (Z.lor u q) 4294967295 = Z.lor u q).
 { rewrite Z.land_lor_distr_l.
   replace 4294967295 with (Z.ones 32) by reflexivity.
   rewrite !Z.land_ones by lia.
   change (Z.lor (u mod 4294967296) (q mod 4294967296)=Z.lor u q).
   rewrite !Z.mod_small by lia. reflexivity. }
 replace 4294967295 with (Z.ones 32) in Hmask by reflexivity.
 rewrite Z.land_ones in Hmask by lia.
 change (Z.lor u q mod 4294967296=Z.lor u q) in Hmask.
 pose proof (Z.mod_pos_bound (Z.lor u q) 4294967296 ltac:(lia)). lia.
Qed.
Lemma qm_quiet_bits : forall x,
 bits_of_fp32 (qm_quiet x)=Z.lor (bits_of_fp32 x) 4194304.
Proof. intro x;unfold qm_quiet;apply bits_of_fp32_of_bits.
 apply qm_lor_word;[apply fp32_bits_range|lia]. Qed.
Lemma qm_quiet_twice : forall x, qm_quiet (qm_quiet x)=qm_quiet x.
Proof. intro x;unfold qm_quiet at 1;rewrite qm_quiet_bits.
 rewrite <- Z.lor_assoc,Z.lor_diag;reflexivity. Qed.
Lemma qm_quiet_nan : forall x,
 qm_nan_bits(bits_of_fp32 x)=1 -> qm_nan_bits(bits_of_fp32(qm_quiet x))=1.
Proof. intros x H;rewrite qm_quiet_bits;apply qm_quiet_preserves_nan;assumption. Qed.
Lemma qm_arm_nan_left : forall x,
 qm_nan_bits(bits_of_fp32 x)=1 ->
 qm_arm_nan x qm_magic=Z.lor (bits_of_fp32 x) 4194304.
Proof.
 intros x H. unfold qm_arm_nan. rewrite (qm_snan_zero _ qm_magic_nan_zero).
 destruct (Z.eqb_spec (qm_snan_bits (bits_of_fp32 x)) 1) as [Hs|Hs];[reflexivity|].
 rewrite H. cbn.
 symmetry. apply qm_lor_quiet_present.
 intro Hz;apply Hs. unfold qm_snan_bits. rewrite H,Hz. reflexivity.
Qed.
Lemma qm_arm_result_left_nan : forall x r,
 qm_nan_bits(bits_of_fp32 x)=1 ->
 qm_arm_result x qm_magic r=qm_quiet x.
Proof.
 intros x r H. unfold qm_arm_result. rewrite H. cbn [Z.eqb orb].
 rewrite qm_arm_nan_left by assumption. reflexivity.
Qed.
Lemma qm_split_word : forall u,
 0<=u<=4294967295 ->
 Z.lor (Z.land u 2147483647) (Z.land u 2147483648)=u.
Proof.
 intros u H. rewrite <- Z.land_lor_distr_r.
 change (Z.lor 2147483647 2147483648) with 4294967295.
 replace 4294967295 with (Z.ones 32) by reflexivity.
 rewrite Z.land_ones by lia. apply Z.mod_small;lia.
Qed.
Lemma qm_of_int_not_nan:forall z,
 qm_nan_bits(bits_of_fp32(qm_of_int z))=0.
Proof.
 intro z;destruct(qm_nan_cases(bits_of_fp32(qm_of_int z)))as[H|H];[exact H|].
 apply qm_nan_fp32 in H;unfold fp32_isNaN,qm_of_int,Binary.binary_normalize in H.
 rewrite Binary.is_nan_BSN2B' in H;discriminate.
Qed.
Lemma qm_self_ne:forall x,qm_ne x x=qm_nan_bits(bits_of_fp32 x).
Proof.
 intro x;unfold qm_ne,qm_ne_bits.
 destruct(qm_nan_cases(bits_of_fp32 x))as[H|H];rewrite H;cbn[Z.eqb orb];
 rewrite ?Z.eqb_refl;try reflexivity.
 destruct(andb(Z.eqb(qm_abs_bits(bits_of_fp32 x))0)
  (Z.eqb(qm_abs_bits(bits_of_fp32 x))0));reflexivity.
Qed.
Lemma qm_arm_rvv_mul_nonnan:forall a b,
 qm_nan_bits(bits_of_fp32 a)=0 -> qm_nan_bits(bits_of_fp32 b)=0 ->
 qm_arm_mul a b=qm_rvv_mul a b.
Proof.
 intros a b Ha Hb;unfold qm_arm_mul,qm_arm_result,qm_rvv_mul,qm_rvv_result.
 rewrite Ha,Hb;reflexivity.
Qed.
Lemma qm_add_rvv_representative:forall r,
 qm_arm_add(qm_rvv_result r)qm_magic=qm_rvv_add(qm_rvv_result r)qm_magic.
Proof.
 intro r;unfold qm_rvv_result at 1 2.
 destruct(Z.eqb_spec(qm_nan_bits(bits_of_fp32 r))1)as[H|H].
 - reflexivity.
 - unfold qm_arm_add,qm_arm_result,qm_rvv_add,qm_rvv_result.
   destruct(qm_nan_cases(bits_of_fp32 r));
   [rewrite H0,qm_magic_nan_zero;reflexivity|contradiction].
Qed.
Lemma qm_arm_nan_right:forall a b,
 qm_nan_bits(bits_of_fp32 a)=0 -> qm_nan_bits(bits_of_fp32 b)=1 ->
 qm_arm_nan a b=Z.lor(bits_of_fp32 b)4194304.
Proof.
 intros a b Ha Hb;unfold qm_arm_nan;rewrite(qm_snan_zero _ Ha),Ha;cbn[Z.eqb].
 destruct(Z.eqb_spec(qm_snan_bits(bits_of_fp32 b))1)as[Hs|Hs];[reflexivity|].
 symmetry;apply qm_lor_quiet_present;intro Hz;apply Hs.
 unfold qm_snan_bits;rewrite Hb,Hz;reflexivity.
Qed.
Lemma qm_arm_mul_nan_right:forall a b,
 qm_nan_bits(bits_of_fp32 a)=0 -> qm_nan_bits(bits_of_fp32 b)=1 ->
 qm_arm_mul a b=qm_quiet b.
Proof.
 intros a b Ha Hb;unfold qm_arm_mul,qm_arm_result;rewrite Ha,Hb.
 cbn[Z.eqb orb];rewrite qm_arm_nan_right by assumption;reflexivity.
Qed.
Lemma qm_rvv_mul_nan_right:forall a b,
 qm_nan_bits(bits_of_fp32 b)=1 -> qm_rvv_mul a b=qm_canonical_nan.
Proof.
 intros a b Hb;apply qm_nan_fp32 in Hb.
 destruct b as[s|s|s p Hp|s m e Hv];try discriminate.
 destruct a;reflexivity.
Qed.
Lemma qm_rvv_add_canonical:qm_rvv_add qm_canonical_nan qm_magic=qm_canonical_nan.
Proof. reflexivity. Qed.
Lemma qm_lane_nonnan:forall a b az bz scale oz lo hi,
 qm_nan_bits(bits_of_fp32 scale)=0 ->
 qm_neon_lane a b az bz scale oz lo hi=qm_rvv_lane a b az bz scale oz lo hi.
Proof.
 intros a b az bz scale oz lo hi H.
 unfold qm_neon_lane,qm_rvv_lane;rewrite qm_self_ne,H;cbn[Z.eqb].
 rewrite qm_arm_rvv_mul_nonnan by(first[apply qm_of_int_not_nan|assumption]).
 unfold qm_rvv_mul;rewrite qm_add_rvv_representative;reflexivity.
Qed.
Lemma qm_lane_nan_neon:forall a b az bz scale oz lo hi,
 qm_nan_bits(bits_of_fp32 scale)=1 ->
 qm_neon_lane a b az bz scale oz lo hi=
 qm_quant_bits(bits_of_fp32(qm_quiet scale))oz lo hi.
Proof.
 intros a b az bz scale oz lo hi H;unfold qm_neon_lane.
 rewrite qm_arm_mul_nan_right by(first[apply qm_of_int_not_nan|assumption]).
 unfold qm_arm_add;rewrite qm_arm_result_left_nan by(apply qm_quiet_nan;assumption).
 rewrite qm_quiet_twice;reflexivity.
Qed.
Lemma qm_lane_nan_rvv:forall a b az bz scale oz lo hi,
 qm_nan_bits(bits_of_fp32 scale)=1 ->
 qm_rvv_lane a b az bz scale oz lo hi=
 qm_quant_bits(bits_of_fp32(qm_sign qm_canonical_nan scale))oz lo hi.
Proof.
 intros a b az bz scale oz lo hi H;unfold qm_rvv_lane.
 rewrite qm_rvv_mul_nan_right by assumption.
 rewrite qm_rvv_add_canonical,qm_self_ne,H;reflexivity.
Qed.
Print Assumptions qm_of_int_not_nan.
Print Assumptions qm_self_ne.
Print Assumptions qm_arm_rvv_mul_nonnan.
Print Assumptions qm_add_rvv_representative.
Print Assumptions qm_arm_mul_nan_right.
Print Assumptions qm_rvv_mul_nan_right.
Print Assumptions qm_lane_nonnan.
Print Assumptions qm_lane_nan_neon.
Print Assumptions qm_lane_nan_rvv.
