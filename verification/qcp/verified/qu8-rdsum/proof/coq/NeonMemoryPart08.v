From Coq Require Import ZArith Lia List.
From Qu8Rdsum Require Import neon_unit_goal NeonMemorySupportExtra.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque rd_partial rd_result_lane rd_column rd_acc32 rd_acc16.
Module CheckedNeonMemoryPart08.
Lemma proof_of_test_neon_entail_wit_34_2 : Qu8Rdsum.neon_unit_goal.test_neon_entail_wit_34_2.
Proof. unfold Qu8Rdsum.neon_unit_goal.test_neon_entail_wit_34_2.
left;intros.
rd_neon_memory_prepare.
assert(Hnb:num_batches=0)by lia;subst num_batches.
assert(Hr:r=0)by(apply (proj1(rd_ceil252_zero_iff r ltac:(lia)));lia);subst r;rewrite !Z.sub_0_r in *.
assert(Hfour:rd_bit4 channels=0)by(unfold rd_bit4;assumption).
pose proof(rd_neon_low_bits channels ltac:(lia))as Hbits;destruct Hbits as[Hb4[Hb2[Hb1 Hsum]]].
rewrite Hfour in *;rewrite !Z.add_0_r.
rd_neon_memory_frame.
Qed.

End CheckedNeonMemoryPart08.

Print Assumptions CheckedNeonMemoryPart08.proof_of_test_neon_entail_wit_34_2.
