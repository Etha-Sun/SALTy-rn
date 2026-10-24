From Coq Require Import ZArith Lia.
From Qu8Add Require Export RvvLaneFacts.
Local Open Scope Z_scope.
Lemma qu_canonical_count_observed : forall x raw,
 qu_neon_shift x(qu_ctrl raw)=qu_neon_shift x(qu_negword raw).
Proof. intros;rewrite <-(qu_control_decode_correct raw) at 1;apply qu_control_decode_neon_observation. Qed.
Definition qu_neon_observed_lane (a b az bz ma mb raw oz lo hi:Z):Z :=
 qu_umin(qu_umax(qu_usat8(qu_neon_add16(qu_sat16(qu_neon_shift(qu_neon_mla(qu_neon_mul(qu_s16(qu_udiff a az))ma)(qu_s16(qu_udiff b bz))mb)(qu_ctrl raw)))oz))lo)hi.
Lemma qu_neon_observed_lane_correct : forall a b az bz ma mb raw oz lo hi,
 qu_neon_observed_lane a b az bz ma mb raw oz lo hi=qu_neon_lane a b az bz ma mb raw oz lo hi.
Proof. intros;unfold qu_neon_observed_lane;rewrite qu_canonical_count_observed;unfold qu_neon_lane,qu_neon_acc,qu_clamp,qu_umin,qu_umax,qu_signed_difference;reflexivity. Qed.
Print Assumptions qu_canonical_count_observed.
Print Assumptions qu_neon_observed_lane_correct.
