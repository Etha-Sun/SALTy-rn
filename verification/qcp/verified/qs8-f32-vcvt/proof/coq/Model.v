From Coq Require Import ZArith Lia List.
From compcert.lib Require Import Coqlib.
From SimpleC.SL Require Export IntLib FloatLib.
Import ListNotations.
Local Open Scope Z_scope.
Definition cvt_s16 (x:Z):Z := signed_last_nbits x 16.
Definition cvt_seed (z:Z):Z := signed_last_nbits
 (unsigned_last_nbits(0-unsigned_last_nbits z 32)32)16.
Definition cvt_addw (a b:Z):Z := cvt_s16(a+b).
Definition cvt_sub16 (a b:Z):Z := cvt_s16(a-b).
Definition cvt_same (a b:fp32):Prop := a=b.
Definition cvt_neon_delta (x z:Z):Z := cvt_addw(cvt_seed z)x.
Definition cvt_rvv_delta (x z:Z):Z := cvt_sub16 x(cvt_s16 z).
Definition cvt_neon_lane (x z:Z)(scale:fp32):fp32 := fp32_mul(Z_to_fp32(cvt_neon_delta x z))scale.
Definition cvt_rvv_lane (x z:Z)(scale:fp32):fp32 := fp32_mul(Z_to_fp32(cvt_rvv_delta x z))scale.
Lemma cvt_s16_range : forall x,-32768<=cvt_s16 x<=32767.
Proof.
 intro x. unfold cvt_s16,signed_last_nbits.
 change(-32768<=(let u:=x mod 65536 in if zlt u 32768 then u else u-65536)<=32767).
 pose proof(Z.mod_pos_bound x 65536 ltac:(lia));cbv zeta;destruct(zlt(x mod 65536)32768);lia.
Qed.
Lemma cvt_s16_id : forall x,-32768<=x<=32767 -> cvt_s16 x=x.
Proof. intros;unfold cvt_s16;apply signed_last_nbits_eq;[lia|];change(-32768<=x<32768);lia. Qed.
Lemma cvt_seed_equiv : forall z,cvt_seed z=cvt_s16(-z).
Proof.
 intro z. unfold cvt_seed,cvt_s16.
 rewrite signed_unsigned_revolutive_less by lia.
 rewrite <-(signed_unsigned_sub_r 0(unsigned_last_nbits z 32)16 ltac:(lia)).
 rewrite unsigned_revolutive_less by lia.
 rewrite signed_unsigned_sub_r by lia;reflexivity.
Qed.
Lemma cvt_seed_range : forall z,-32768<=cvt_seed z<=32767.
Proof. intro;rewrite cvt_seed_equiv;apply cvt_s16_range. Qed.
Lemma cvt_addw_range : forall a b,-32768<=cvt_addw a b<=32767.
Proof. intros;apply cvt_s16_range. Qed.
Lemma cvt_sub16_range : forall a b,-32768<=cvt_sub16 a b<=32767.
Proof. intros;apply cvt_s16_range. Qed.
Lemma cvt_delta_equiv : forall x z,cvt_neon_delta x z=cvt_rvv_delta x z.
Proof.
 intros. unfold cvt_neon_delta,cvt_rvv_delta,cvt_addw,cvt_sub16.
 rewrite cvt_seed_equiv. unfold cvt_s16.
 rewrite signed_signed_add_l,signed_signed_sub_r by lia.
 f_equal;lia.
Qed.
Lemma cvt_lane_equiv : forall x z scale,cvt_neon_lane x z scale=cvt_rvv_lane x z scale.
Proof. intros;unfold cvt_neon_lane,cvt_rvv_lane;rewrite cvt_delta_equiv;reflexivity. Qed.
Print Assumptions cvt_s16_range.
Print Assumptions cvt_seed_equiv.
Print Assumptions cvt_delta_equiv.
Print Assumptions cvt_lane_equiv.
