From F32F16 Require Import VectorSupport memory_neon_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedMemoryNeonPart8.
Lemma proof_of_qcp_f16_store8_safety_wit_3 : F32F16.memory_neon_goal.qcp_f16_store8_safety_wit_3.
Proof. unfold F32F16.memory_neon_goal.qcp_f16_store8_safety_wit_3; f16_vector_finish. Qed.
Lemma proof_of_qcp_f16_store1_0_return_wit_1 : F32F16.memory_neon_goal.qcp_f16_store1_0_return_wit_1.
Proof. unfold F32F16.memory_neon_goal.qcp_f16_store1_0_return_wit_1; f16_vector_finish. Qed.
End CheckedMemoryNeonPart8.
