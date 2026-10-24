From Coq Require Import ZArith Lia Bool.
From Flocq.IEEE754 Require Import Binary Bits.
From Flocq.Core Require Import Zaux.
From F32F16 Require Import Model Bits.
Definition f16_canonical_nan : fp32 := fp32_of_bits 2143289344.
Local Open Scope Z_scope.
Lemma f16_split_magnitude : forall u,
 u mod 2147483648 = 8388608*((u/8388608) mod 256) + u mod 8388608.
Proof.
 intros u.
 pose proof (Z.div_mod u 8388608 ltac:(lia)) as Hu.
 pose proof (Z.div_mod (u/8388608) 256 ltac:(lia)) as Hq.
 pose proof (Z.mod_pos_bound u 8388608 ltac:(lia)) as Hm.
 pose proof (Z.mod_pos_bound (u/8388608) 256 ltac:(lia)) as He.
 symmetry. apply Z.mod_unique with (q:=(u/8388608)/256); lia.
Qed.
Lemma f16_nan_decode : forall u,
 f16_nan_bits u = 1 <-> fp32_isNaN (fp32_of_bits u).
Proof.
 intros u. unfold f16_nan_bits, f16_abs_bits.
 replace 2147483647 with (Z.ones 31) by reflexivity.
 rewrite Z.land_ones by lia.
 change (2^31) with 2147483648.
 rewrite f16_split_magnitude.
 unfold fp32_isNaN, fp32_of_bits, b32_of_bits, binary_float_of_bits.
 rewrite Binary.is_nan_FF2B.
 unfold binary_float_of_bits_aux, split_bits.
 cbn -[Z.modulo Z.div Z.eqb Z.ltb Zeq_bool].
 remember (u mod 8388608) as m eqn:Hm.
 remember ((u/8388608) mod 256) as e eqn:He.
 assert (HmB:0<=m<8388608) by (subst m;apply Z.mod_pos_bound;lia).
 assert (HeB:0<=e<256) by (subst e;apply Z.mod_pos_bound;lia).
 change ((if Z.ltb 2139095040 (8388608*e+m) then 1 else 0)=1 <->
 is_nan_FF (if Zeq_bool e 0 then
   match m with | Z0=>F754_zero (2147483648 <=? u)
   | Zpos p=>F754_finite (2147483648 <=? u) p (-149)
   | Zneg _=>F754_nan false 1%positive end
 else if Zeq_bool e 255 then
   match m with | Z0=>F754_infinity (2147483648 <=? u)
   | Zpos p=>F754_nan (2147483648 <=? u) p
   | Zneg _=>F754_nan false 1%positive end
 else match m+8388608 with
   | Zpos p=>F754_finite (2147483648 <=? u) p (e + -149 -1)
   | _=>F754_nan false 1%positive end)=true).
 destruct (Zeq_bool_spec e 0); destruct (Zeq_bool_spec e 255);
 destruct m; cbn [is_nan_FF];
 repeat match goal with |- context[Z.ltb ?a ?b] => destruct (Z.ltb_spec a b) end;
 simpl; try tauto; try lia.
Qed.
Lemma f16_nan_fp32 : forall x,
 f16_nan_bits(bits_of_fp32 x)=1 <-> fp32_isNaN x.
Proof.
 intro x. rewrite f16_nan_decode, fp32_of_bits_of_fp32. reflexivity.
Qed.
Lemma f16_nan_cases : forall u, f16_nan_bits u=0 \/ f16_nan_bits u=1.
Proof. intro u; unfold f16_nan_bits; destruct (Z.ltb 2139095040 (f16_abs_bits u)); auto. Qed.
Lemma f16_snan_implies_nan : forall u,
 f16_snan_bits u=1 -> f16_nan_bits u=1.
Proof.
 intros u H; unfold f16_snan_bits in H.
 destruct (Z.eqb_spec (f16_nan_bits u) 1); [assumption|discriminate].
Qed.
Lemma f16_quiet_preserves_nan : forall u,
 f16_nan_bits u=1 -> f16_nan_bits (Z.lor u 4194304)=1.
Proof.
 intros u H. unfold f16_nan_bits,f16_abs_bits in *.
 rewrite Z.land_lor_distr_l.
 change (Z.land 4194304 2147483647) with 4194304.
 pose proof (Z.sub_lor_l_same_l 4194304 (Z.land u 2147483647)) as Hq.
 assert (0<=Z.land 4194304 (Z.lnot (Z.land u 2147483647))) as Hb.
 { apply Z.land_nonneg; left;lia. }
 destruct (Z.ltb_spec 2139095040 (Z.land u 2147483647)); [|discriminate].
 destruct (Z.ltb_spec 2139095040 (Z.lor (Z.land u 2147483647) 4194304)); [reflexivity|lia].
Qed.
Lemma f16_canonical_is_nan : fp32_isNaN f16_canonical_nan.
Proof. unfold f16_canonical_nan; apply (proj1 (f16_nan_decode 2143289344)); reflexivity. Qed.
Print Assumptions f16_nan_decode.
Print Assumptions f16_nan_fp32.
Print Assumptions f16_quiet_preserves_nan.
