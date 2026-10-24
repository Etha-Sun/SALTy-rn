From Coq Require Import ZArith Lia List.
From Sqrt Require Import Frame store_adapters_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedStorePart12.
Lemma proof_of_qcp_sqrt_store2_partial_solve_wit_1 : Sqrt.store_adapters_goal.qcp_sqrt_store2_partial_solve_wit_1.
Proof. unfold Sqrt.store_adapters_goal.qcp_sqrt_store2_partial_solve_wit_1. sqrt_store_finish. Qed.
End CheckedStorePart12.
