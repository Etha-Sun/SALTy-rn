From Coq Require Import ZArith Lia List.
From Qu8Rsum Require Import NeonSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_return_wit_3 : Qu8Rsum.neon_unit_goal.test_neon_return_wit_3.
Proof.
 unfold Qu8Rsum.neon_unit_goal.test_neon_return_wit_3;left;intros;subst.
 try change Int.max_unsigned with 4294967295 in *.
 repeat rewrite Z.sub_0_r in *.
 rewrite rs_reduce4 by lia;rewrite PreH21.
 unfold rs_u32;rewrite unsigned_unsigned_add_r by lia.
 exact(derivable1_refl _).
Qed.
Print Assumptions proof_of_test_neon_return_wit_3.
Lemma proof_of_test_neon_return_wit_1 : Qu8Rsum.neon_unit_goal.test_neon_return_wit_1.
Proof.
 unfold Qu8Rsum.neon_unit_goal.test_neon_return_wit_1;left;intros;subst.
 try change Int.max_unsigned with 4294967295 in *.
 repeat rewrite Z.sub_0_r in *.
 pose proof(rs_rem2048_bound batch_pre)as Hrem.
 pose proof(rs_count16_strict(rs_rem2048 batch_pre)ltac:(lia))as Hcount.
 assert(Hc0:0<=rs_pair_u16 c0 w0 w1<=4294967295)by(rewrite rs_pair_u16_wrap by lia;apply rs_u32_bound).
 assert(Hc1:0<=rs_pair_u16 c1 w2 w3<=4294967295)by(rewrite rs_pair_u16_wrap by lia;apply rs_u32_bound).
 assert(Hc2:0<=rs_pair_u16 c2 w4 w5<=4294967295)by(rewrite rs_pair_u16_wrap by lia;apply rs_u32_bound).
 assert(Hc3:0<=rs_pair_u16 c3 w6 w7<=4294967295)by(rewrite rs_pair_u16_wrap by lia;apply rs_u32_bound).
 rewrite rs_reduce4 by lia;rewrite rs_sum4_pair_step by lia.
 rewrite PreH37.
 unfold rs_u32;rewrite unsigned_unsigned_add_r by lia.
 exact(derivable1_refl _).
Qed.
Print Assumptions proof_of_test_neon_return_wit_1.

Lemma rs_pair_u16_range : forall a x y,
 0<=a<=4294967295 -> 0<=x<=65535 -> 0<=y<=65535 ->
 0<=rs_pair_u16 a x y<=4294967295.
Proof. intros;rewrite rs_pair_u16_wrap by lia;apply rs_u32_bound. Qed.
Print Assumptions rs_pair_u16_range.
