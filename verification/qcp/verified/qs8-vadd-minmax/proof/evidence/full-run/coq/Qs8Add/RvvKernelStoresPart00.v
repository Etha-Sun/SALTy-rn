From Qs8Add Require Import RvvKernelCallResource2.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_rvv_partial_solve_wit_71 : Qs8Add.rvv_unit_goal.test_rvv_partial_solve_wit_71.
Proof. unfold Qs8Add.rvv_unit_goal.test_rvv_partial_solve_wit_71,Qs8Add.rvv_unit_goal_chunk00.test_rvv_partial_solve_wit_71,Qs8Add.rvv_unit_goal.test_rvv_partial_solve_wit_71_aux,Qs8Add.rvv_unit_goal_chunk00.test_rvv_partial_solve_wit_71_aux; try left; intros; subst; qa_call_split_store; qa_clean_emp; qa_rvv_kernel_arith_frame. Qed.
Print Assumptions proof_of_test_rvv_partial_solve_wit_71.
