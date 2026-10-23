From Coq Require Import ZArith Lia.
From VLRelu Require Import Model Bits.
Local Open Scope Z_scope.

Lemma fp32_land_mask : forall x,
 Z.land 4294967295 (bits_of_fp32 x) = bits_of_fp32 x.
Proof.
 intros x. pose proof (fp32_bits_range x).
 replace 4294967295 with (Z.ones 32) by reflexivity.
 rewrite Z.land_comm, Z.land_ones by lia.
 change (bits_of_fp32 x mod 4294967296 = bits_of_fp32 x).
 apply Z.mod_small. lia.
Qed.

Lemma vlrelu_select_false : forall a b, vlrelu_bitselect 0 a b = b.
Proof.
 intros. unfold vlrelu_bitselect.
 rewrite Z.land_0_l, Z.lxor_0_l, Z.lor_0_l, fp32_land_mask.
 apply fp32_of_bits_of_fp32.
Qed.

Lemma vlrelu_select_true : forall a b,
 vlrelu_bitselect 4294967295 a b = a.
Proof.
 intros. unfold vlrelu_bitselect.
 rewrite Z.lxor_nilpotent, Z.land_0_l, Z.lor_0_r, fp32_land_mask.
 apply fp32_of_bits_of_fp32.
Qed.

Lemma vlrelu_neon_scalar : forall x c,
 vlrelu_bitselect (vlrelu_compare_mask (vlrelu_signed32 (bits_of_fp32 x)) 0)
    (fp32_mul x c) x = vlrelu_scalar x c.
Proof.
 intros x c. pose proof (fp32_bits_range x).
 unfold vlrelu_compare_mask, vlrelu_signed32, vlrelu_scalar.
 destruct (Z.ltb_spec (bits_of_fp32 x) 2147483648).
 - assert (Z.ltb (bits_of_fp32 x) 0 = false) by (apply Z.ltb_ge; lia).
   assert (Z.ltb 2147483647 (bits_of_fp32 x) = false) by (apply Z.ltb_ge; lia).
   rewrite H1, H2. apply vlrelu_select_false.
 - assert (Z.ltb (bits_of_fp32 x-4294967296) 0 = true) by (apply Z.ltb_lt; lia).
   assert (Z.ltb 2147483647 (bits_of_fp32 x) = true) by (apply Z.ltb_lt; lia).
   rewrite H1, H2. apply vlrelu_select_true.
Qed.

Print Assumptions vlrelu_neon_scalar.
