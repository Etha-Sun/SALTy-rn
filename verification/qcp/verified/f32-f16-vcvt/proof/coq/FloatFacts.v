From Coq Require Import ZArith Lia Bool.
From F32F16 Require Import Bits Model NanFacts.
Local Open Scope Z_scope.
Lemma f16_magnitude_range : forall u, 0 <= f16_abs_bits u < 2147483648.
Proof. intro u; unfold f16_abs_bits. replace 2147483647 with (Z.ones 31) by reflexivity.
 rewrite Z.land_ones by lia. apply Z.mod_pos_bound. lia. Qed.
Lemma f16_magnitude_idempotent : forall u,
 f16_abs_bits (f16_abs_bits u) = f16_abs_bits u.
Proof. intro u. unfold f16_abs_bits. rewrite <- Z.land_assoc, Z.land_diag. reflexivity. Qed.
Lemma f16_magnitude_sign_zero : forall u,
 Z.land (f16_abs_bits u) 2147483648=0.
Proof. intro u. unfold f16_abs_bits. rewrite <- Z.land_assoc.
 change (Z.land 2147483647 2147483648) with 0. apply Z.land_0_r. Qed.
Lemma f16_abs_bits_exact : forall x,
 bits_of_fp32 (f16_abs x) = f16_abs_bits (bits_of_fp32 x).
Proof. intros x; unfold f16_abs. apply bits_of_fp32_of_bits.
 pose proof (f16_magnitude_range (bits_of_fp32 x)). unfold f16_abs_bits in *; lia. Qed.
Lemma f16_abs_nan : forall x,
 f16_nan_bits (bits_of_fp32 (f16_abs x)) = f16_nan_bits (bits_of_fp32 x).
Proof. intro x. rewrite f16_abs_bits_exact. unfold f16_nan_bits.
 rewrite f16_magnitude_idempotent. reflexivity. Qed.
