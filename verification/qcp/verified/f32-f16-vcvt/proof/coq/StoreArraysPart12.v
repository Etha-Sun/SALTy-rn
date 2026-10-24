From F32F16 Require Import UShortArrayBridge store_arrays_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedStoreArraysPart12.
Lemma proof_of_qcp_f16_store2_0_array_return_wit_1 : F32F16.store_arrays_goal.qcp_f16_store2_0_array_return_wit_1.
Proof. unfold F32F16.store_arrays_goal.qcp_f16_store2_0_array_return_wit_1; f16_store_arrays_finish. Qed.
End CheckedStoreArraysPart12.
