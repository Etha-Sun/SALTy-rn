From Coq Require Import ZArith Lia List.
From Qu8Rdsum Require Import neon_unit_goal NeonMemorySupportExtra.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque rd_partial rd_result_lane rd_column rd_acc32 rd_acc16.
Module CheckedNeonMemoryPart02.
Lemma proof_of_test_neon_entail_wit_14 : Qu8Rdsum.neon_unit_goal.test_neon_entail_wit_14.
Proof. unfold Qu8Rdsum.neon_unit_goal.test_neon_entail_wit_14.
left;intros.
rd_neon_memory_prepare.
rewrite rd_neon_four_store by lia.
rd_neon_memory_frame.
Qed.

End CheckedNeonMemoryPart02.

Print Assumptions CheckedNeonMemoryPart02.proof_of_test_neon_entail_wit_14.
