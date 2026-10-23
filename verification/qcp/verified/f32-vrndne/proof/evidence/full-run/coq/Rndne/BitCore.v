From Coq Require Import ZArith Lia Bool.
From Rndne Require Import Bits Model NanFacts.
Local Open Scope Z_scope.
Lemma rndne_magnitude_range : forall u, 0 <= rndne_abs_bits u < 2147483648.
Proof. intro u; unfold rndne_abs_bits. replace 2147483647 with (Z.ones 31) by reflexivity.
 rewrite Z.land_ones by lia. apply Z.mod_pos_bound. lia. Qed.
Lemma rndne_magnitude_idempotent : forall u,
 rndne_abs_bits (rndne_abs_bits u) = rndne_abs_bits u.
Proof. intro u. unfold rndne_abs_bits. rewrite <- Z.land_assoc, Z.land_diag. reflexivity. Qed.
Lemma rndne_magnitude_sign_zero : forall u,
 Z.land (rndne_abs_bits u) 2147483648=0.
Proof. intro u. unfold rndne_abs_bits. rewrite <- Z.land_assoc.
 change (Z.land 2147483647 2147483648) with 0. apply Z.land_0_r. Qed.
Lemma rndne_abs_bits_exact : forall x,
 bits_of_fp32 (rndne_abs x) = rndne_abs_bits (bits_of_fp32 x).
Proof. intros x; unfold rndne_abs. apply bits_of_fp32_of_bits.
 pose proof (rndne_magnitude_range (bits_of_fp32 x)). unfold rndne_abs_bits in *; lia. Qed.
Lemma rndne_abs_nan : forall x,
 rndne_nan_bits (bits_of_fp32 (rndne_abs x)) = rndne_nan_bits (bits_of_fp32 x).
Proof. intro x. rewrite rndne_abs_bits_exact. unfold rndne_nan_bits.
 rewrite rndne_magnitude_idempotent. reflexivity. Qed.
Lemma rndne_self_ne : forall x,
 rndne_ne x x = rndne_nan_bits (bits_of_fp32 x).
Proof. intro x. unfold rndne_ne, rndne_ne_bits.
 destruct (rndne_nan_cases (bits_of_fp32 x)) as [H|H];rewrite H; cbn.
 - rewrite Z.eqb_refl. destruct (Z.eqb (rndne_abs_bits (bits_of_fp32 x)) 0);reflexivity.
 - reflexivity. Qed.
Lemma rndne_select_sign : forall a b,
 rndne_select 2147483648 a b = rndne_sign b a.
Proof. intros. unfold rndne_select,rndne_sign.
 change (Z.lxor 2147483648 4294967295) with 2147483647.
 rewrite (Z.land_comm 2147483648), (Z.land_comm 2147483647), Z.lor_comm. reflexivity. Qed.
Lemma rndne_uint_mask : forall x,
 Z.land 4294967295 (bits_of_fp32 x)=bits_of_fp32 x.
Proof. intro x. pose proof (fp32_bits_range x).
 replace 4294967295 with (Z.ones 32) by reflexivity.
 rewrite Z.land_comm, Z.land_ones by lia. apply Z.mod_small. lia. Qed.
Lemma rndne_select_all : forall a b, rndne_select 4294967295 a b=a.
Proof. intros. unfold rndne_select. rewrite Z.lxor_nilpotent,Z.land_0_l,Z.lor_0_r,rndne_uint_mask.
 apply fp32_of_bits_of_fp32. Qed.
Lemma rndne_magnitude_key : forall u,
 rndne_key (rndne_abs_bits u)=rndne_abs_bits u+2147483648.
Proof. intro u. unfold rndne_key. rewrite rndne_magnitude_sign_zero. cbn [Z.eqb].
 symmetry. apply Z.add_nocarry_lxor. apply rndne_magnitude_sign_zero. Qed.
Lemma rndne_compare_magic : forall x,
 rndne_abs_lt rndne_magic x = 4294967295 * rndne_gt (rndne_abs x) rndne_magic.
Proof. intro x. unfold rndne_abs_lt,rndne_gt,rndne_abs_lt_bits,rndne_gt_bits.
 rewrite rndne_abs_nan, rndne_abs_bits_exact.
 change (bits_of_fp32 rndne_magic) with 1258291200.
 change (rndne_nan_bits 1258291200) with 0.
 change (rndne_abs_bits 1258291200) with 1258291200.
 change (rndne_key 1258291200) with 3405774848.
 change (Z.eqb 1258291200 0) with false.
 rewrite rndne_magnitude_key. rewrite andb_false_r. cbn [orb].
 destruct (Z.eqb (rndne_nan_bits (bits_of_fp32 x)) 1); cbn; [reflexivity|].
 destruct (Z.ltb_spec 1258291200 (rndne_abs_bits (bits_of_fp32 x)));
 destruct (Z.ltb_spec 3405774848 (rndne_abs_bits (bits_of_fp32 x)+2147483648)); cbn; lia.
Qed.
Print Assumptions rndne_self_ne.
Print Assumptions rndne_select_sign.
Print Assumptions rndne_compare_magic.
