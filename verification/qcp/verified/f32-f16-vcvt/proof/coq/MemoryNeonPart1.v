From F32F16 Require Import VectorSupport memory_neon_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedMemoryNeonPart1.
Lemma proof_of_vld1q_f32_safety_wit_2 : F32F16.memory_neon_goal.vld1q_f32_safety_wit_2.
Proof. unfold F32F16.memory_neon_goal.vld1q_f32_safety_wit_2; f16_vector_finish. Qed.
Lemma proof_of_qcp_f16_store4_safety_wit_3 : F32F16.memory_neon_goal.qcp_f16_store4_safety_wit_3.
Proof. unfold F32F16.memory_neon_goal.qcp_f16_store4_safety_wit_3; f16_vector_finish. Qed.
End CheckedMemoryNeonPart1.
