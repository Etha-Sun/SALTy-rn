From Coq Require Import ZArith Lia List.
From Qu8Rdsum Require Import neon_unit_goal NeonMemorySupportExtra.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque rd_partial rd_result_lane rd_column rd_acc32 rd_acc16.
Module CheckedNeonMemoryPart15.
Lemma proof_of_test_neon_return_wit_1 : Qu8Rdsum.neon_unit_goal.test_neon_return_wit_1.
Proof. unfold Qu8Rdsum.neon_unit_goal.test_neon_return_wit_1.
left;intros.
rd_neon_memory_prepare.
assert (Hz:channels=0) by lia;subst channels.
rewrite Z.sub_0_r,rd_partial_full by lia.
apply derivable1_refl.
Qed.

End CheckedNeonMemoryPart15.

Print Assumptions CheckedNeonMemoryPart15.proof_of_test_neon_return_wit_1.
