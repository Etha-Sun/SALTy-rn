From Coq Require Import ZArith Lia List.
From Qu8Rdsum Require Import neon_unit_goal NeonMemorySupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque rd_partial rd_result_lane rd_column rd_acc32 rd_acc16.
Module CheckedNeonMemoryPart00.
Lemma proof_of_test_neon_entail_wit_12 : Qu8Rdsum.neon_unit_goal.test_neon_entail_wit_12.
Proof. unfold Qu8Rdsum.neon_unit_goal.test_neon_entail_wit_12.
left;intros.
rd_neon_memory_prepare.
assert(Hz:r=0)by lia;subst r;rewrite !Z.sub_0_r in *.
rewrite !rd_neon_final_lane by (try assumption;lia).
rewrite rd_neon_four_store by lia.
repeat rewrite rd_partial_suffix by lia.
rd_neon_memory_frame.
Qed.

Lemma proof_of_test_neon_return_wit_2 : Qu8Rdsum.neon_unit_goal.test_neon_return_wit_2.
Proof. unfold Qu8Rdsum.neon_unit_goal.test_neon_return_wit_2.
left;intros.
rd_neon_memory_prepare.
assert (Hz:channels=0) by lia;subst channels.
rewrite Z.sub_0_r,rd_partial_full by lia.
apply derivable1_refl.
Qed.

End CheckedNeonMemoryPart00.

Print Assumptions CheckedNeonMemoryPart00.proof_of_test_neon_entail_wit_12.
Print Assumptions CheckedNeonMemoryPart00.proof_of_test_neon_return_wit_2.
