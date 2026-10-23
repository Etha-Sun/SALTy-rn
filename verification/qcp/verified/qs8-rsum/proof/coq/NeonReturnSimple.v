From Coq Require Import ZArith Lia List.
From Qs8Rsum Require Import NeonSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma rs_pair_s16_range : forall c x y,
 -2147483648<=c<=2147483647 -> -32768<=x<=32767 -> -32768<=y<=32767 ->
 -2147483648<=rs_pair_s16 c x y<=2147483647.
Proof. intros;rewrite rs_pair_s16_wrap by assumption;apply rs_s32_bound. Qed.
Lemma proof_of_test_neon_return_wit_1 : Qs8Rsum.neon_unit_goal.test_neon_return_wit_1.
Proof.
 unfold Qs8Rsum.neon_unit_goal.test_neon_return_wit_1;left;intros;subst.
 try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *.
 pose proof(rs_rem2048_bound batch_pre)as Hr.
 pose proof(rs_count16_bound(rs_rem2048 batch_pre)ltac:(lia))as Hk.
 replace(rs_rem2048 batch_pre-0)with(rs_rem2048 batch_pre)in *by lia.
 rewrite signed_unsigned_add_l,signed_unsigned_add_r by lia;fold rs_s32.
 rewrite rs_reduce4 by(apply rs_pair_s16_range;lia).
 rewrite rs_sum4_pair_step by lia.
 rewrite PreH37;unfold rs_s32;rewrite signed_signed_add_r by lia.
 replace(batch_pre-0)with batch_pre by lia.
 exact(derivable1_refl _).
Qed.
Print Assumptions proof_of_test_neon_return_wit_1.
Lemma proof_of_test_neon_return_wit_3 : Qs8Rsum.neon_unit_goal.test_neon_return_wit_3.
Proof.
 unfold Qs8Rsum.neon_unit_goal.test_neon_return_wit_3;left;intros;subst.
 try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *.
 rewrite signed_unsigned_add_l,signed_unsigned_add_r by lia;fold rs_s32.
 rewrite rs_reduce4 by lia.
 rewrite PreH21;unfold rs_s32;rewrite signed_signed_add_r by lia.
 replace(batch_pre-0)with batch_pre by lia.
 exact(derivable1_refl _).
Qed.
Print Assumptions proof_of_test_neon_return_wit_3.
