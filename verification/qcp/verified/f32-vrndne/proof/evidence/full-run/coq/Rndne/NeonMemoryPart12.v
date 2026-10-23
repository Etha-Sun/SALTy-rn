From Coq Require Import ZArith Lia List.
From Rndne Require Import NeonMemorySupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedNeonMemoryPart12.
Lemma proof_of_test_neon_entail_wit_6_2 : Rndne.neon_unit_goal.test_neon_entail_wit_6_2.
Proof. unfold Rndne.neon_unit_goal.test_neon_entail_wit_6_2; rndne_kernel_finish. 
Qed.
End CheckedNeonMemoryPart12.
