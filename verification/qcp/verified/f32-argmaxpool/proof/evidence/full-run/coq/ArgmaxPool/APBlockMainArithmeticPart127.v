From ArgmaxPool Require Import APBlockMainArithmeticSupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_safety_wit_128:ArgmaxPool.annotated_goal.test_rvv_safety_wit_128.
Proof. unfold ArgmaxPool.annotated_goal.test_rvv_safety_wit_128;apma_simple. Qed.
Print Assumptions proof_of_test_rvv_safety_wit_128.
