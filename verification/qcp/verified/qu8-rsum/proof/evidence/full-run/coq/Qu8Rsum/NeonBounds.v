From Coq Require Import ZArith Lia.
From Qu8Rsum Require Export RvvBounds RvvFacts NeonProgramModel.
Local Open Scope Z_scope.
Lemma rs_pair_u8_bound : forall a x y,0<=rs_pair_u8 a x y<=65535.
Proof.
 intros;unfold rs_pair_u8,rs_u16.
 pose proof(unsigned_Lastnbits_range(a+x+y)16 ltac:(lia))as H.
 change(0<=unsigned_last_nbits(a+x+y)16<65536)in H;lia.
Qed.
Lemma rs_mul_u8_bound : forall a b,0<=rs_mul_u8 a b<=255.
Proof.
 intros;unfold rs_mul_u8.
 pose proof(unsigned_Lastnbits_range(a*b)8 ltac:(lia))as H.
 change(0<=unsigned_last_nbits(a*b)8<256)in H;lia.
Qed.
Lemma rs_pair_u16_bound : forall a x y,
 0<=a<=4294967295 -> 0<=x<=65535 -> 0<=y<=65535 ->
 0<=rs_pair_u16 a x y<=4294967295.
Proof. intros;unfold rs_pair_u16;apply rs_add_u32_bound;lia. Qed.
Print Assumptions rs_pair_u8_bound.
Print Assumptions rs_mul_u8_bound.
Print Assumptions rs_pair_u16_bound.
