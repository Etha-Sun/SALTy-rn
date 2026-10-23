From Coq Require Import ZArith Lia.
From Qs8I8Cvt Require Export Model.
Local Open Scope Z_scope.
Lemma qcv_seed_bounds : forall m,-32768<=qcv_seed m<=32767.
Proof. intro;rewrite qcv_seed_equiv;apply qcv_s16_range. Qed.
Lemma qcv_cast16_bounds : forall x,-32768<=signed_last_nbits x 16<=32767.
Proof. intro;change(-32768<=qcv_s16 x<=32767);apply qcv_s16_range. Qed.
Lemma qcv_subw_bounds : forall z x,-32768<=qcv_subw z x<=32767.
Proof. intros;unfold qcv_subw;apply qcv_s16_range. Qed.
Lemma qcv_shl7_bounds : forall x,-32768<=qcv_shl7 x<=32767.
Proof. intro;unfold qcv_shl7;apply qcv_s16_range. Qed.
Lemma qcv_qrd_bounds : forall a b,-32768<=qcv_neon_qrdmulh a b<=32767.
Proof. intros;unfold qcv_neon_qrdmulh;apply qcv_sat16_range. Qed.
Lemma qcv_add_bounds : forall a b,-32768<=qcv_neon_add a b<=32767.
Proof. intros;unfold qcv_neon_add;apply qcv_sat16_range. Qed.
