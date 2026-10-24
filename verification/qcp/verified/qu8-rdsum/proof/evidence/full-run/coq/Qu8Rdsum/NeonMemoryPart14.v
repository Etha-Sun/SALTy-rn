From Coq Require Import ZArith Lia List.
From Qu8Rdsum Require Import neon_unit_goal NeonMemorySupportExtra.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque rd_partial rd_result_lane rd_column rd_acc32 rd_acc16.
Module CheckedNeonMemoryPart14.
Lemma proof_of_test_neon_entail_wit_37_3 : Qu8Rdsum.neon_unit_goal.test_neon_entail_wit_37_3.
Proof. unfold Qu8Rdsum.neon_unit_goal.test_neon_entail_wit_37_3.
left;intros.
rd_neon_memory_prepare.
assert(Hindex:channels_pre-channels+rd_bit4 channels+rd_bit2 channels=channels_pre)by lia.
rewrite Hindex,Z.sub_0_r.
unfold rd_ptr_gate.
rd_neon_memory_frame.
Qed.

End CheckedNeonMemoryPart14.

Print Assumptions CheckedNeonMemoryPart14.proof_of_test_neon_entail_wit_37_3.
