From Qs8Add Require Import NeonKernelCallSplitSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_partial_solve_wit_778 : Qs8Add.neon_unit_goal.test_neon_partial_solve_wit_778.
Proof. unfold Qs8Add.neon_unit_goal.test_neon_partial_solve_wit_778,Qs8Add.neon_unit_goal_chunk05.test_neon_partial_solve_wit_778;try left;intros;subst;qa_neon_split_frame 2. Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_778.
