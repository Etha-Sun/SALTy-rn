From Coq Require Import ZArith Lia Psatz.
From Qs8I8Cvt Require Export Model.
Local Open Scope Z_scope.
Lemma qcv_floor_negative : forall x d,0<d -> -((-x+d-1)/d)=x/d.
Proof.
 intros x d Hd;apply Z.div_unique with(r:=d-1-((-x+d-1)mod d)).
 - left;pose proof(Z.mod_pos_bound (-x+d-1) d Hd);lia.
 - pose proof(Z.div_mod (-x+d-1) d ltac:(lia));ring_simplify;lia.
Qed.
Lemma qcv_asr15_div : forall x,qcv_asr15 x=x/32768.
Proof. intros;unfold qcv_asr15;rewrite Z.shiftr_div_pow2 by lia;reflexivity. Qed.
Lemma qcv_asr16_div : forall x,qcv_asr16 x=x/65536.
Proof. intros;unfold qcv_asr16;rewrite Z.shiftr_div_pow2 by lia;reflexivity. Qed.
Lemma qcv_asr15_bounds : forall x,-4294967296<=x<=4294967296 -> -131072<=qcv_asr15 x<=131072.
Proof. intros x H;rewrite qcv_asr15_div;pose proof(Z.div_mod x 32768 ltac:(lia));pose proof(Z.mod_pos_bound x 32768 ltac:(lia));lia. Qed.
Lemma qcv_asr16_bounds : forall x,-4294967296<=x<=4294967296 -> -65536<=qcv_asr16 x<=65536.
Proof. intros x H;rewrite qcv_asr16_div;pose proof(Z.div_mod x 65536 ltac:(lia));pose proof(Z.mod_pos_bound x 65536 ltac:(lia));lia. Qed.
Lemma qcv_shl7_unsigned : forall x,signed_last_nbits(Z.shiftl(unsigned_last_nbits x 16)7)16=qcv_shl7 x.
Proof.
 intro;unfold qcv_shl7,qcv_s16;rewrite Z.shiftl_mul_pow2 by lia;change(signed_last_nbits(unsigned_last_nbits x 16*128)16=signed_last_nbits(x*128)16);rewrite signed_unsigned_mul_l by lia;reflexivity.
Qed.
Lemma qcv_product16_bounds : forall a b,-32768<=a<=32767 -> -32768<=b<=32767 -> -1073741824<=a*b<=1073741824.
Proof.
 intros a b Ha Hb. destruct(Z_le_dec 0 a), (Z_le_dec 0 b).
 - pose proof(Z.mul_nonneg_nonneg a b ltac:(lia) ltac:(lia)). pose proof(Z.mul_nonneg_nonneg (32768-a) b ltac:(lia) ltac:(lia));nia.
 - pose proof(Z.mul_nonneg_nonneg a (-b) ltac:(lia) ltac:(lia)). pose proof(Z.mul_nonneg_nonneg (32768-a) (-b) ltac:(lia) ltac:(lia));nia.
 - pose proof(Z.mul_nonneg_nonneg (-a) b ltac:(lia) ltac:(lia)). pose proof(Z.mul_nonneg_nonneg (32768+a) b ltac:(lia) ltac:(lia));nia.
 - pose proof(Z.mul_nonneg_nonneg (-a) (-b) ltac:(lia) ltac:(lia)). pose proof(Z.mul_nonneg_nonneg (32768+a) (-b) ltac:(lia) ltac:(lia));nia.
Qed.
