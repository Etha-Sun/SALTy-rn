From Qu8Add Require Import NeonKernelResourceFrame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_partial_solve_wit_392 : Qu8Add.neon_unit_goal.test_neon_partial_solve_wit_392.
Proof.
 unfold Qu8Add.neon_unit_goal.test_neon_partial_solve_wit_392;try left;intros;subst.
 qu_split_undef_prefix 1.
 rewrite ?sizeof_uchar,?Z.mul_1_r;repeat rewrite Z.add_assoc;qu_resource_frame.
Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_392.
