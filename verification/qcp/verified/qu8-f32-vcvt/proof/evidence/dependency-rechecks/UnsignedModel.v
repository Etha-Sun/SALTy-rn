From Coq Require Import ZArith Lia.
From Qu8Cvt Require Export Model.
Local Open Scope Z_scope.
Definition cvt_u16 (x:Z):Z := unsigned_last_nbits x 16.
Definition cvt_add_u16 (a b:Z):Z := cvt_u16(a+b).
Definition cvt_seed_u16 (z:Z):Z := unsigned_last_nbits(unsigned_last_nbits(0-unsigned_last_nbits z 32)32)16.
Lemma cvt_u16_range : forall x,0<=cvt_u16 x<=65535.
Proof. intro;unfold cvt_u16;pose proof(unsigned_Lastnbits_range x 16 ltac:(lia));change(0<=unsigned_last_nbits x 16<65536)in H;lia. Qed.
Lemma cvt_u16_id : forall x,0<=x<=65535->cvt_u16 x=x.
Proof. intros;unfold cvt_u16;apply unsigned_last_nbits_eq;change(0<=x<65536);lia. Qed.
Lemma cvt_s16_u16 : forall x,cvt_s16(cvt_u16 x)=cvt_s16 x.
Proof. intro;unfold cvt_s16,cvt_u16;apply signed_unsigned_revolutive_less;lia. Qed.
Lemma cvt_u16_s16 : forall x,cvt_u16(cvt_s16 x)=cvt_u16 x.
Proof. intro;unfold cvt_s16,cvt_u16;apply unsigned_signed_revolutive;lia. Qed.
Lemma cvt_seed_u16_equiv : forall z,cvt_s16(cvt_seed_u16 z)=cvt_seed z.
Proof. intro;unfold cvt_seed_u16,cvt_s16,cvt_seed;rewrite signed_unsigned_revolutive_less by lia;reflexivity. Qed.
Lemma cvt_unsigned_delta : forall x z,cvt_s16(cvt_add_u16 x(cvt_seed_u16 z))=cvt_neon_delta x z.
Proof. intros;unfold cvt_add_u16;rewrite cvt_s16_u16;unfold cvt_neon_delta,cvt_addw,cvt_s16;rewrite <-signed_signed_add_r by lia;change(signed_last_nbits(x+cvt_s16(cvt_seed_u16 z))16=signed_last_nbits(cvt_seed z+x)16);rewrite cvt_seed_u16_equiv;f_equal;lia. Qed.

Lemma cvt_unsigned_addw : forall a b,cvt_s16(cvt_add_u16(cvt_u16 a)b)=cvt_addw a b.
Proof. intros;unfold cvt_add_u16;rewrite cvt_s16_u16;unfold cvt_u16,cvt_s16,cvt_addw;rewrite signed_unsigned_add_l by lia;reflexivity. Qed.

Lemma cvt_add_u16_range : forall a b,0<=cvt_add_u16 a b<=65535.
Proof. intros;apply cvt_u16_range. Qed.
