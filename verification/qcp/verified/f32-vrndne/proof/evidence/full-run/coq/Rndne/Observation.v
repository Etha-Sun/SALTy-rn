From Coq Require Import ZArith Lia Bool.
From Flocq.IEEE754 Require Import Binary.
From Flocq.Core Require Import Raux.
From Rndne Require Import Bits Model NanFacts BitCore BitFacts.
Local Open Scope Z_scope.
Lemma rndne_magic_nan_zero : rndne_nan_bits (bits_of_fp32 rndne_magic)=0.
Proof. reflexivity. Qed.
Lemma rndne_abs_magic : rndne_abs rndne_magic = rndne_magic.
Proof. reflexivity. Qed.
Lemma rndne_snan_zero : forall u, rndne_nan_bits u=0 -> rndne_snan_bits u=0.
Proof. intros u H;unfold rndne_snan_bits;rewrite H;reflexivity. Qed.
Lemma rndne_lor_word : forall u q,
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
Lemma rndne_quiet_bits : forall x,
 bits_of_fp32 (rndne_quiet x)=Z.lor (bits_of_fp32 x) 4194304.
Proof. intro x;unfold rndne_quiet;apply bits_of_fp32_of_bits.
 apply rndne_lor_word;[apply fp32_bits_range|lia]. Qed.
Lemma rndne_quiet_twice : forall x, rndne_quiet (rndne_quiet x)=rndne_quiet x.
Proof. intro x;unfold rndne_quiet at 1;rewrite rndne_quiet_bits.
 rewrite <- Z.lor_assoc,Z.lor_diag;reflexivity. Qed.
Lemma rndne_quiet_nan : forall x,
 rndne_nan_bits(bits_of_fp32 x)=1 -> rndne_nan_bits(bits_of_fp32(rndne_quiet x))=1.
Proof. intros x H;rewrite rndne_quiet_bits;apply rndne_quiet_preserves_nan;assumption. Qed.
Lemma rndne_arm_nan_left : forall x,
 rndne_nan_bits(bits_of_fp32 x)=1 ->
 rndne_arm_nan x rndne_magic=Z.lor (bits_of_fp32 x) 4194304.
Proof.
 intros x H. unfold rndne_arm_nan. rewrite (rndne_snan_zero _ rndne_magic_nan_zero).
 destruct (Z.eqb_spec (rndne_snan_bits (bits_of_fp32 x)) 1) as [Hs|Hs];[reflexivity|].
 rewrite H. cbn.
 symmetry. apply rndne_lor_quiet_present.
 intro Hz;apply Hs. unfold rndne_snan_bits. rewrite H,Hz. reflexivity.
Qed.
Lemma rndne_arm_result_left_nan : forall x r,
 rndne_nan_bits(bits_of_fp32 x)=1 ->
 rndne_arm_result x rndne_magic r=rndne_quiet x.
Proof.
 intros x r H. unfold rndne_arm_result. rewrite H. cbn [Z.eqb orb].
 rewrite rndne_arm_nan_left by assumption. reflexivity.
Qed.
Lemma rndne_split_word : forall u,
 0<=u<=4294967295 ->
 Z.lor (Z.land u 2147483647) (Z.land u 2147483648)=u.
Proof.
 intros u H. rewrite <- Z.land_lor_distr_r.
 change (Z.lor 2147483647 2147483648) with 4294967295.
 replace 4294967295 with (Z.ones 32) by reflexivity.
 rewrite Z.land_ones by lia. apply Z.mod_small;lia.
Qed.
Lemma rndne_sign_quiet_abs : forall x,
 rndne_sign (rndne_quiet (rndne_abs x)) x = rndne_quiet x.
Proof.
 intro x. unfold rndne_sign. rewrite rndne_quiet_bits,rndne_abs_bits_exact.
 unfold rndne_abs_bits. rewrite Z.land_lor_distr_l.
 change (Z.land 4194304 2147483647) with 4194304.
 rewrite <- Z.land_assoc,Z.land_diag.
 replace (Z.lor (Z.lor (Z.land (bits_of_fp32 x) 2147483647) 4194304)
    (Z.land (bits_of_fp32 x) 2147483648)) with
   (Z.lor (Z.lor (Z.land (bits_of_fp32 x) 2147483647)
     (Z.land (bits_of_fp32 x) 2147483648)) 4194304).
 - rewrite rndne_split_word by apply fp32_bits_range. reflexivity.
 - rewrite <- !Z.lor_assoc. f_equal. apply Z.lor_comm.
Qed.
Lemma rndne_sub_rvv_representative : forall r,
 rndne_arm_sub (rndne_rvv_result r) rndne_magic =
 rndne_rvv_sub (rndne_rvv_result r) rndne_magic.
Proof.
 intro r. unfold rndne_rvv_result at 1 2.
 destruct (Z.eqb_spec (rndne_nan_bits(bits_of_fp32 r)) 1) as [H|H].
 - reflexivity.
 - unfold rndne_arm_sub,rndne_arm_result,rndne_rvv_sub,rndne_rvv_result.
   destruct (rndne_nan_cases (bits_of_fp32 r));[rewrite H0,rndne_magic_nan_zero;reflexivity|contradiction].
Qed.
Lemma rndne_nonnan_arithmetic : forall x,
 rndne_nan_bits(bits_of_fp32 x)=0 ->
 rndne_round_abs x = rndne_rvv_sub (rndne_rvv_add (rndne_abs x) rndne_magic) rndne_magic.
Proof.
 intros x H. unfold rndne_round_abs,rndne_arm_add,rndne_arm_result.
 rewrite rndne_abs_nan,H,rndne_magic_nan_zero. cbn [Z.eqb orb].
 apply rndne_sub_rvv_representative.
Qed.
Lemma rndne_nan_round : forall x,
 rndne_nan_bits(bits_of_fp32 x)=1 ->
 rndne_round_abs x=rndne_quiet (rndne_abs x).
Proof.
 intros x H. unfold rndne_round_abs,rndne_arm_add,rndne_arm_sub.
 rewrite (rndne_arm_result_left_nan (rndne_abs x)) by (rewrite rndne_abs_nan;assumption).
 rewrite rndne_arm_result_left_nan by (apply rndne_quiet_nan;rewrite rndne_abs_nan;assumption).
 apply rndne_quiet_twice.
Qed.
Lemma rndne_pointwise_bits : forall x, rndne_neon x=rndne_rvv x.
Proof.
 intro x. unfold rndne_neon,rndne_rvv. rewrite rndne_self_ne.
 destruct (rndne_nan_cases (bits_of_fp32 x)) as [H|H].
 - rewrite H. cbn [Z.eqb]. rewrite rndne_nonnan_arithmetic by assumption.
   rewrite rndne_compare_magic.
   assert (Hg:rndne_gt (rndne_abs x) rndne_magic=0 \/ rndne_gt (rndne_abs x) rndne_magic=1).
   { unfold rndne_gt,rndne_gt_bits.
     repeat match goal with |- context[if ?b then _ else _] => destruct b end;auto. }
   destruct Hg as [Hg|Hg];rewrite Hg;cbn [Z.mul Z.eqb].
   + change (Z.lor 0 2147483648) with 2147483648. apply rndne_select_sign.
   + change (Z.lor 4294967295 2147483648) with 4294967295. apply rndne_select_all.
 - rewrite H. cbn [Z.eqb].
   unfold rndne_abs_lt,rndne_abs_lt_bits. rewrite H. cbn [Z.eqb orb].
   rewrite rndne_nan_round by assumption.
   change (Z.lor 0 2147483648) with 2147483648.
   rewrite rndne_select_sign. apply rndne_sign_quiet_abs.
Qed.
Lemma rndne_observe_refl : forall x, rndne_observe x x.
Proof.
 intro x. destruct x as [s|s|s p H|s m e H].
 - left;unfold fp32_eq,fp32_compare;destruct s;reflexivity.
 - left;unfold fp32_eq,fp32_compare;destruct s;reflexivity.
 - right;split;reflexivity.
 - left;unfold fp32_eq,fp32_compare;rewrite Binary.Bcompare_correct by reflexivity.
   rewrite Rcompare_Eq by reflexivity. reflexivity.
Qed.
Lemma rndne_pointwise_observation : forall x, rndne_observe (rndne_neon x) (rndne_rvv x).
Proof. intro x;rewrite rndne_pointwise_bits;apply rndne_observe_refl. Qed.
Print Assumptions rndne_pointwise_bits.
Print Assumptions rndne_pointwise_observation.
