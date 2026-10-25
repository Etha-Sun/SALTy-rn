From Coq Require Import ZArith Bool Lia.
From MaxPool Require Import Model Bits NanFacts VectorModel.
Local Open Scope Z_scope.
Lemma mp_land_word_mask:forall u,0<=u<=4294967295->Z.land u 4294967295=u.
Proof.
 intros u H;change 4294967295 with(Z.ones 32).
 rewrite Z.land_ones by lia;change(2^32)with 4294967296;rewrite Z.mod_small by lia;reflexivity.
Qed.
Lemma mp_mask_fixed_range:forall u,Z.land u 4294967295=u->0<=u<=4294967295.
Proof.
 intros u H;change 4294967295 with(Z.ones 32)in H;rewrite Z.land_ones in H by lia.
 change(2^32)with 4294967296 in H;pose proof(Z.mod_pos_bound u 4294967296 ltac:(lia));lia.
Qed.
Lemma mp_land_word_range:forall a b,0<=a<=4294967295->0<=b<=4294967295->0<=Z.land a b<=4294967295.
Proof.
 intros a b Ha Hb;apply mp_mask_fixed_range;rewrite <-Z.land_assoc,mp_land_word_mask by assumption;reflexivity.
Qed.
Lemma mp_lor_word_range:forall a b,0<=a<=4294967295->0<=b<=4294967295->0<=Z.lor a b<=4294967295.
Proof.
 intros a b Ha Hb;apply mp_mask_fixed_range;rewrite Z.land_lor_distr_l,!mp_land_word_mask by assumption;reflexivity.
Qed.
Lemma mp_quiet_bits_range:forall a,0<=a<=4294967295->0<=mp_quiet_bits a<=4294967295.
Proof. intros;unfold mp_quiet_bits;apply mp_lor_word_range;lia. Qed.
Lemma mp_ordered_bits_range:forall minimum a b,0<=a<=4294967295->0<=b<=4294967295->0<=mp_ordered_bits minimum a b<=4294967295.
Proof.
 intros minimum a b Ha Hb;unfold mp_ordered_bits.
 destruct(andb(Z.eqb(mp_abs_bits a)0)(Z.eqb(mp_abs_bits b)0)).
 - destruct minimum;[apply mp_lor_word_range|apply mp_land_word_range];assumption.
 - destruct(if minimum then Z.ltb(mp_key a)(mp_key b)else Z.ltb(mp_key b)(mp_key a));assumption.
Qed.
Lemma mp_rvv_bits_range:forall minimum a b,0<=a<=4294967295->0<=b<=4294967295->0<=mp_rvv_bits minimum a b<=4294967295.
Proof.
 intros minimum a b Ha Hb;unfold mp_rvv_bits.
 destruct(mp_nan_bits a), (mp_nan_bits b);try assumption;try lia.
 apply mp_ordered_bits_range;assumption.
Qed.
Lemma mp_arm_bits_range:forall minimum a b,0<=a<=4294967295->0<=b<=4294967295->0<=mp_arm_bits minimum a b<=4294967295.
Proof.
 intros minimum a b Ha Hb;unfold mp_arm_bits.
 destruct(mp_snan_bits a), (mp_snan_bits b), (mp_nan_bits a), (mp_nan_bits b);
 try(apply mp_quiet_bits_range;assumption);try assumption.
 apply mp_ordered_bits_range;assumption.
Qed.
Lemma mp_restore_float_rvv:forall minimum a b,mp_restore_float a b(mp_rvv minimum a b)=mp_arm minimum a b.
Proof.
 intros;unfold mp_restore_float,mp_rvv,mp_arm.
 rewrite mp_bits_of_fp32_of_bits by(apply mp_rvv_bits_range;apply mp_fp32_bits_range).
 rewrite mp_restore_rvv_arm;reflexivity.
Qed.
