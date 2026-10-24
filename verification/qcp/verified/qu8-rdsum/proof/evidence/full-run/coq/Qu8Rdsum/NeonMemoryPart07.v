From Coq Require Import ZArith Lia List.
From Qu8Rdsum Require Import neon_unit_goal NeonMemorySupportExtra.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque rd_partial rd_result_lane rd_column rd_acc32 rd_acc16.
Module CheckedNeonMemoryPart07.
Lemma proof_of_test_neon_entail_wit_34_1 : Qu8Rdsum.neon_unit_goal.test_neon_entail_wit_34_1.
Proof. unfold Qu8Rdsum.neon_unit_goal.test_neon_entail_wit_34_1.
left;intros.
rd_neon_memory_prepare.
assert(Hnb:num_batches=0)by lia;subst num_batches.
assert(Hr:r=0)by(apply (proj1(rd_ceil252_zero_iff r ltac:(lia)));lia);subst r;rewrite !Z.sub_0_r in *.
pose proof (rd_neon_bit4_nonzero channels ltac:(lia) ltac:(assumption)) as [Hfour Hc].
pose proof(rd_neon_low_bits channels ltac:(lia))as Hbits;destruct Hbits as[Hb4[Hb2[Hb1 Hsum]]].
rewrite Hfour in *.
rewrite !rd_neon_final_lane_at by(try assumption;lia).
rewrite rd_neon_four_store by lia.
rd_neon_memory_frame.
Qed.

End CheckedNeonMemoryPart07.

Print Assumptions CheckedNeonMemoryPart07.proof_of_test_neon_entail_wit_34_1.
