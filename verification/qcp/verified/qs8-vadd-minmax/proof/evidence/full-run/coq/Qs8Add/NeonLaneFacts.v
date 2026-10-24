From Coq Require Import ZArith Lia.
From Qs8Add Require Export RvvLaneFacts.
Local Open Scope Z_scope.
Lemma qa_canonical_count_observed : forall x raw,
 qa_neon_shift x(qa_ctrl raw)=qa_neon_shift x(qa_negword raw).
Proof. intros;rewrite <-(qa_control_decode_correct raw) at 1;apply qa_control_decode_neon_observation. Qed.
Definition qa_neon_observed_lane (a b az bz ma mb raw oz lo hi:Z):Z :=
 qa_min(qa_max(qa_sat8(qa_neon_add16(qa_sat16(qa_neon_shift(qa_neon_mla(qa_neon_mul(qa_s16(a-az))ma)(qa_s16(b-bz))mb)(qa_ctrl raw)))oz))lo)hi.
Lemma qa_neon_observed_lane_correct : forall a b az bz ma mb raw oz lo hi,
 qa_neon_observed_lane a b az bz ma mb raw oz lo hi=qa_neon_lane a b az bz ma mb raw oz lo hi.
Proof. intros;unfold qa_neon_observed_lane;rewrite qa_canonical_count_observed;unfold qa_neon_lane,qa_neon_acc,qa_clamp,qa_min,qa_max;reflexivity. Qed.
Print Assumptions qa_canonical_count_observed.
Print Assumptions qa_neon_observed_lane_correct.
