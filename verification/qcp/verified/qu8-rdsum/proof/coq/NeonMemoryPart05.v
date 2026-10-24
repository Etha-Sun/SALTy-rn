From Coq Require Import ZArith Lia List.
From Qu8Rdsum Require Import neon_unit_goal NeonMemorySupportExtra.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque rd_partial rd_result_lane rd_column rd_acc32 rd_acc16.
Module CheckedNeonMemoryPart05.
Lemma proof_of_test_neon_entail_wit_32 : Qu8Rdsum.neon_unit_goal.test_neon_entail_wit_32.
Proof. unfold Qu8Rdsum.neon_unit_goal.test_neon_entail_wit_32.
left;intros.
rd_neon_memory_prepare.
assert(Hnb:num_batches=0)by lia;subst num_batches.
assert(Hr:r=0)by(apply (proj1(rd_ceil252_zero_iff r ltac:(lia)));lia);subst r;rewrite !Z.sub_0_r in *.
rewrite !rd_neon_final_lane_at by (try assumption;lia).
rewrite rd_neon_four_store by lia.
repeat rewrite rd_partial_suffix by lia.
try rewrite !rd_neon_final_initial_lane by(try assumption;lia).
rewrite !Z.add_0_r.
rd_neon_memory_frame.
Qed.

End CheckedNeonMemoryPart05.

Print Assumptions CheckedNeonMemoryPart05.proof_of_test_neon_entail_wit_32.
