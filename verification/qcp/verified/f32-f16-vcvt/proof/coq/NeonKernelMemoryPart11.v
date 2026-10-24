From Coq Require Import ZArith Lia List.
From F32F16 Require Import NeonKernelMemorySupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedNeonKernelMemoryPart11.
Lemma proof_of_test_neon_entail_wit_8_2 : F32F16.neon_unit_goal.test_neon_entail_wit_8_2.
Proof. unfold F32F16.neon_unit_goal.test_neon_entail_wit_8_2.
f16_kernel_finish.
Qed.
End CheckedNeonKernelMemoryPart11.
