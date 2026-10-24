From Coq Require Import ZArith Lia List.
From Qu8Rdsum Require Import neon_unit_goal NeonMemorySupportExtra.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque rd_partial rd_result_lane rd_column rd_acc32 rd_acc16.
Module CheckedNeonMemoryPart09.
Lemma proof_of_test_neon_entail_wit_35_1 : Qu8Rdsum.neon_unit_goal.test_neon_entail_wit_35_1.
Proof. unfold Qu8Rdsum.neon_unit_goal.test_neon_entail_wit_35_1.
left;intros.
rd_neon_memory_prepare.
assert(Htwo:rd_bit2 channels=2)by(apply rd_neon_bit2_nonzero;lia).
unfold rd_tail_lane;rewrite Htwo in *;repeat match goal with |-context[Z.modulo ?a 4]=>let v:=eval vm_compute in(Z.modulo a 4)in progress change(Z.modulo a 4)with v end.
rewrite !rd_neon_final_lane_at by(try assumption;lia).
rewrite rd_neon_two_store by lia.
rd_neon_memory_frame.
Qed.

End CheckedNeonMemoryPart09.

Print Assumptions CheckedNeonMemoryPart09.proof_of_test_neon_entail_wit_35_1.
