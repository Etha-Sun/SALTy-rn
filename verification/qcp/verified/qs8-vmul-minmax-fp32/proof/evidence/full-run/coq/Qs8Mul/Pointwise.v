From Coq Require Import ZArith Lia.
From Qs8Mul Require Import Model Bits NanFacts ArithmeticFacts NaNBitQuantization.
Local Open Scope Z_scope.
(* Full binary32 scale domain, signed16 output zero point. No finite/positive
   scale cut and no ordering constraint on the final min/max bounds. This
   mathematical theorem does not itself prove either actual C kernel. *)
Lemma qm_pointwise_equivalence:forall a b az bz scale oz lo hi,
 -32768<=oz<=32767 ->
 qm_neon_lane a b az bz scale oz lo hi=qm_rvv_lane a b az bz scale oz lo hi.
Proof.
 intros a b az bz scale oz lo hi Hz.
 destruct(qm_nan_cases(bits_of_fp32 scale))as[H|H].
 - apply qm_lane_nonnan;assumption.
 - rewrite qm_lane_nan_neon,qm_lane_nan_rvv by assumption.
   rewrite qm_quiet_bits,qm_signed_canonical_bits.
   apply qm_restored_nan_quantization;[apply fp32_bits_range|assumption|assumption].
Qed.
Print Assumptions qm_pointwise_equivalence.
