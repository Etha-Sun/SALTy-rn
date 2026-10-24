From Coq Require Import ZArith Lia List.
From Sqrt Require Import Frame store_adapters_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedStorePart2.
Lemma proof_of_qcp_sqrt_store4_safety_wit_3 : Sqrt.store_adapters_goal.qcp_sqrt_store4_safety_wit_3.
Proof. unfold Sqrt.store_adapters_goal.qcp_sqrt_store4_safety_wit_3. sqrt_store_finish. Qed.
End CheckedStorePart2.
