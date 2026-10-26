From Coq Require Import ZArith Lia List.
From ArgmaxPool Require Export APBlockMainMemorySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_partial_solve_wit_12 : annotated_goal.test_rvv_partial_solve_wit_12.
Proof. unfold annotated_goal.test_rvv_partial_solve_wit_12,annotated_goal.test_rvv_partial_solve_wit_12_aux;apbm_call_frame. Qed.
Print Assumptions proof_of_test_rvv_partial_solve_wit_12.
