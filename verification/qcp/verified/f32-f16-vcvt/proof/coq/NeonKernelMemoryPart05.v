From Coq Require Import ZArith Lia List.
From F32F16 Require Import NeonKernelMemorySupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedNeonKernelMemoryPart05.
Lemma proof_of_test_neon_entail_wit_7_1 : F32F16.neon_unit_goal.test_neon_entail_wit_7_1.
Proof. unfold F32F16.neon_unit_goal.test_neon_entail_wit_7_1.
f16_kernel_finish.
Qed.
End CheckedNeonKernelMemoryPart05.
