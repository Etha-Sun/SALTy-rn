From Qu8Add Require Import RvvKernelArithmeticAutomation KernelArrayProps2 RvvKernelCallResource.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_partial_solve_wit_18 : Qu8Add.rvv_unit_goal.test_rvv_partial_solve_wit_18.
Proof. unfold Qu8Add.rvv_unit_goal.test_rvv_partial_solve_wit_18,Qu8Add.rvv_unit_goal_chunk15.test_rvv_partial_solve_wit_18;try left;intros;subst;try(qu_array_values_fast input_a_pre(batch_pre+7)A HAValues);try(qu_array_values_fast input_b_pre(batch_pre+7)B HBValues);first[qu_call_split_store;qu_clean_emp;qu_rvv_kernel_arith_frame|qu_rvv_kernel_arith_frame]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_50 : Qu8Add.rvv_unit_goal.test_rvv_partial_solve_wit_50.
Proof. unfold Qu8Add.rvv_unit_goal.test_rvv_partial_solve_wit_50,Qu8Add.rvv_unit_goal_chunk15.test_rvv_partial_solve_wit_50;try left;intros;subst;try(qu_array_values_fast input_a_pre(batch_pre+7)A HAValues);try(qu_array_values_fast input_b_pre(batch_pre+7)B HBValues);first[qu_call_split_store;qu_clean_emp;qu_rvv_kernel_arith_frame|qu_rvv_kernel_arith_frame]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_82 : Qu8Add.rvv_unit_goal.test_rvv_partial_solve_wit_82.
Proof. unfold Qu8Add.rvv_unit_goal.test_rvv_partial_solve_wit_82,Qu8Add.rvv_unit_goal_chunk15.test_rvv_partial_solve_wit_82;try left;intros;subst;try(qu_array_values_fast input_a_pre(batch_pre+7)A HAValues);try(qu_array_values_fast input_b_pre(batch_pre+7)B HBValues);first[qu_call_split_store;qu_clean_emp;qu_rvv_kernel_arith_frame|qu_rvv_kernel_arith_frame]. Qed.
