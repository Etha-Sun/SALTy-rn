From Coq Require Import ZArith Lia Psatz.
From Qu8Add Require Export ShiftFacts.
Local Open Scope Z_scope.
Definition qu_u16(x:Z):Z := unsigned_last_nbits x 16.
Definition qu_udiff(a z:Z):Z := qu_u16(a-z).
Definition qu_signed_difference(a z:Z):Z := qu_s16(qu_udiff a z).
Definition qu_neon_acc(a b az bz ma mb:Z):Z :=
 qu_neon_mla(qu_neon_mul(qu_signed_difference a az)ma)(qu_signed_difference b bz)mb.
Definition qu_rvv_acc(a b az bz ma mb:Z):Z :=
 qu_rvv_macc(qu_rvv_mul(qu_signed_difference a az)ma)mb(qu_signed_difference b bz).
(* Actual target sequence: signed max with0, bit reinterpret as unsigned16,
   unsigned saturating clip with shift0. It is kept separate from NEON SQXTUN. *)
Definition qu_rvv_unsigned_finish(x:Z):Z := Z.min(qu_u16(Z.max x 0))255.
Definition qu_neon_lane(a b az bz ma mb raw oz lo hi:Z):Z :=
 qu_clamp(qu_usat8(qu_neon_add16(qu_sat16(qu_neon_shift(qu_neon_acc a b az bz ma mb)(qu_negword raw)))oz))lo hi.
Definition qu_rvv_lane(a b az bz ma mb raw oz lo hi:Z):Z :=
 qu_clamp(qu_rvv_unsigned_finish(qu_rvv_add16(qu_sat16(qu_repaired_shift(qu_rvv_acc a b az bz ma mb)raw))oz))lo hi.
Lemma qu_u16_range : forall x,0<=qu_u16 x<=65535.
Proof. intros;unfold qu_u16;pose proof(unsigned_Lastnbits_range x 16 ltac:(lia));change(0<=unsigned_last_nbits x 16<65536)in H;lia. Qed.
Lemma qu_u16_id : forall x,0<=x<=65535 -> qu_u16 x=x.
Proof. intros;unfold qu_u16;apply unsigned_last_nbits_eq;change(0<=x<65536);lia. Qed.
Lemma qu_signed_u16_same_word : forall x,qu_s16(qu_u16 x)=qu_s16 x.
Proof. intros;unfold qu_s16,qu_u16;rewrite signed_unsigned_revolutive by lia;reflexivity. Qed.
Lemma qu_signed_difference_exact : forall a z,0<=a<=255 -> 0<=z<=255 -> qu_signed_difference a z=a-z.
Proof. intros;unfold qu_signed_difference,qu_udiff;rewrite qu_signed_u16_same_word;apply qu_s16_id;lia. Qed.
Lemma qu_usat8_range : forall x,0<=qu_usat8 x<=255.
Proof. intros;unfold qu_usat8;destruct(Z.ltb_spec x 0);[lia|];destruct(Z.ltb_spec 255 x);lia. Qed.
Lemma qu_rvv_unsigned_finish_exact : forall x,-32768<=x<=32767 -> qu_rvv_unsigned_finish x=qu_usat8 x.
Proof. intros x Hx;unfold qu_rvv_unsigned_finish;rewrite qu_u16_id by lia;unfold qu_usat8;destruct(Z.ltb_spec x 0);[lia|];destruct(Z.ltb_spec 255 x);lia. Qed.
Lemma qu_acc_equiv : forall a b az bz ma mb,qu_neon_acc a b az bz ma mb=qu_rvv_acc a b az bz ma mb.
Proof. intros;unfold qu_neon_acc,qu_rvv_acc,qu_neon_mul,qu_rvv_mul;rewrite qu_mla_equiv;unfold qu_rvv_macc;replace(qu_signed_difference b bz*mb)with(mb*qu_signed_difference b bz)by ring;reflexivity. Qed.
Lemma qu_lane_equiv : forall a b az bz ma mb raw oz lo hi,
 qu_neon_lane a b az bz ma mb raw oz lo hi=qu_rvv_lane a b az bz ma mb raw oz lo hi.
Proof.
 intros;unfold qu_neon_lane,qu_rvv_lane;rewrite qu_acc_equiv.
 rewrite qu_shift_equiv by(unfold qu_rvv_acc,qu_rvv_macc;apply qu_s32_range).
 unfold qu_neon_add16,qu_rvv_add16;rewrite qu_rvv_unsigned_finish_exact by apply qu_sat16_range;reflexivity.
Qed.
Lemma qu_lane_range : forall a b az bz ma mb raw oz lo hi,
 0<=lo<=255 -> 0<=hi<=255 -> 0<=qu_neon_lane a b az bz ma mb raw oz lo hi<=255.
Proof. intros;unfold qu_neon_lane,qu_clamp;pose proof(qu_usat8_range(qu_neon_add16(qu_sat16(qu_neon_shift(qu_neon_acc a b az bz ma mb)(qu_negword raw)))oz));lia. Qed.
