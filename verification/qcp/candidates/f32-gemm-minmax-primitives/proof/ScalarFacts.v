From Coq Require Import ZArith Reals Psatz.
From SimpleC.SL Require Export FloatLib.
From Flocq.IEEE754 Require Import Binary Bits.
From GemmSpec Require Import FmaModel IntrinsicModel.
Local Open Scope Z_scope.
Lemma c_zero : fp32_of_real (0.0%R) = fp32_zero.
Proof.
 replace (0.0%R) with (0%R) by (unfold Q2R; simpl; ring).
 unfold fp32_of_real, rounded32.
 rewrite Generic_fmt.round_0 by apply BinarySingleNaN.valid_rnd_round_mode.
 rewrite Generic_fmt.scaled_mantissa_0, Raux.Ztrunc_IZR.
 rewrite Raux.Rlt_bool_false by lra. reflexivity.
Qed.
Lemma self_compare : forall x:fp32,
 fp32_compare x x = if Binary.is_nan 24 128 x then None else Some Eq.
Proof.
 intros x;unfold fp32_compare,Binary.Bcompare,BinarySingleNaN.Bcompare.
 destruct x as[s|s|s p H|s m e H];
  cbn [Binary.B2BSN BinarySingleNaN.B2SF Binary.is_nan SpecFloat.SFcompare];
  try reflexivity.
 - destruct s;reflexivity.
 - destruct s;cbn [SpecFloat.SFcompare];rewrite Z.compare_refl;
   rewrite Pos.compare_refl;reflexivity.
Qed.
Lemma eq_self_not_nan : forall x, fp32_eq x x -> Binary.is_nan 24 128 x=false.
Proof. intros x;unfold fp32_eq;rewrite self_compare;destruct (Binary.is_nan 24 128 x);congruence. Qed.
Lemma ne_self_nan : forall x, fp32_ne x x -> Binary.is_nan 24 128 x=true.
Proof. intros x;unfold fp32_ne;rewrite self_compare;destruct (Binary.is_nan 24 128 x);congruence. Qed.
Lemma eq_zero_shape : forall x, fp32_eq x fp32_zero -> exists s, x=@Binary.B754_zero 24 128 s.
Proof.
 intros x; destruct x as[s|s|s p H|s m e H];
 unfold fp32_eq,fp32_compare,fp32_zero,fp32_of_bits,Bits.b32_of_bits;
 cbn; try (destruct s; discriminate); intros; exists s;reflexivity.
Qed.
Lemma zero_test_shape : forall x, fp32_zero_test x=true -> exists s, x=@Binary.B754_zero 24 128 s.
Proof.
 intros x H. unfold fp32_zero_test in H. apply Bool.orb_true_iff in H.
 assert (E:fp32_of_bits(bits_of_fp32 x)=x).
 { unfold fp32_of_bits,bits_of_fp32,b32_of_bits,bits_of_b32.
   exact (@binary_float_of_bits_of_binary_float 23 8 eq_refl eq_refl eq_refl x). }
 destruct H as[H|H];apply Z.eqb_eq in H;rewrite H in E.
 - exists false;now rewrite <-E.
 - exists true;now rewrite <-E.
Qed.
Lemma zero_test_eq : forall x, fp32_eq x fp32_zero -> fp32_zero_test x=true.
Proof. intros x H;apply eq_zero_shape in H;destruct H as[s ->];destruct s;reflexivity. Qed.
Lemma zero_test_ne : forall x, fp32_ne x fp32_zero -> fp32_zero_test x=false.
Proof.
 intros x H;destruct (fp32_zero_test x) eqn:E;try reflexivity.
 apply zero_test_shape in E;destruct E as[s ->];destruct s;exfalso;apply H;reflexivity.
Qed.
Lemma min_zeros : forall a b,
 fp32_eq a fp32_zero -> fp32_eq b fp32_zero ->
 fp32_neg (fp32_add (fp32_neg a) (fp32_neg b)) = fp32_min_number a b.
Proof.
 intros a b A B;apply eq_zero_shape in A;apply eq_zero_shape in B;
 destruct A as[s ->];destruct B as[t ->];destruct s,t;reflexivity.
Qed.
Lemma max_zeros : forall a b,
 fp32_eq a fp32_zero -> fp32_eq b fp32_zero ->
 fp32_add a b = fp32_max_number a b.
Proof.
 intros a b A B;apply eq_zero_shape in A;apply eq_zero_shape in B;
 destruct A as[s ->];destruct B as[t ->];destruct s,t;reflexivity.
Qed.
