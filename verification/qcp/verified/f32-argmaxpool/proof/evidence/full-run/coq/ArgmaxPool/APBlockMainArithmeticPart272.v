From ArgmaxPool Require Import APBlockMainArithmeticFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_partial_solve_wit_25_pure:ArgmaxPool.annotated_goal.test_rvv_partial_solve_wit_25_pure.
Proof.
 unfold ArgmaxPool.annotated_goal.test_rvv_partial_solve_wit_25_pure;right;apb_intro.
 apply apb_pure_right.
 eapply apma_previous_pair;[exact PreH56|exact PreH57| | |exact PreH58|exact PreH59].
 - exact (proj1 PreH74).
 - exact (proj1 PreH75).
Qed.
Print Assumptions proof_of_test_rvv_partial_solve_wit_25_pure.
