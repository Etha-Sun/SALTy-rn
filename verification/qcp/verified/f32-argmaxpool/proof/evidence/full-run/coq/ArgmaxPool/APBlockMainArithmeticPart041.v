From ArgmaxPool Require Import APBlockMainArithmeticSupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_safety_wit_42:ArgmaxPool.annotated_goal.test_rvv_safety_wit_42.
Proof. unfold ArgmaxPool.annotated_goal.test_rvv_safety_wit_42;apma_simple. Qed.
Print Assumptions proof_of_test_rvv_safety_wit_42.
