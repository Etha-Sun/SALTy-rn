From Qu8Add Require Import RvvKernelArithmeticAutomation KernelArrayProps2 RvvKernelCallResource.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_safety_wit_6 : Qu8Add.rvv_unit_goal.test_rvv_safety_wit_6.
Proof. unfold Qu8Add.rvv_unit_goal.test_rvv_safety_wit_6,Qu8Add.rvv_unit_goal_chunk05.test_rvv_safety_wit_6;try left;intros;subst;try(qu_array_values_fast input_a_pre(batch_pre+7)A HAValues);try(qu_array_values_fast input_b_pre(batch_pre+7)B HBValues);qu_rvv_kernel_arith_pure. Qed.
Lemma proof_of_test_rvv_safety_wit_39 : Qu8Add.rvv_unit_goal.test_rvv_safety_wit_39.
Proof. unfold Qu8Add.rvv_unit_goal.test_rvv_safety_wit_39,Qu8Add.rvv_unit_goal_chunk07.test_rvv_safety_wit_39;try left;intros;subst;try(qu_array_values_fast input_a_pre(batch_pre+7)A HAValues);try(qu_array_values_fast input_b_pre(batch_pre+7)B HBValues);qu_rvv_kernel_arith_pure. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_21_pure : Qu8Add.rvv_unit_goal.test_rvv_partial_solve_wit_21_pure.
Proof. unfold Qu8Add.rvv_unit_goal.test_rvv_partial_solve_wit_21_pure,Qu8Add.rvv_unit_goal_chunk02.test_rvv_partial_solve_wit_21_pure;try left;intros;subst;try(qu_array_values_fast input_a_pre(batch_pre+7)A HAValues);try(qu_array_values_fast input_b_pre(batch_pre+7)B HBValues);qu_rvv_kernel_arith_pure. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_85_pure : Qu8Add.rvv_unit_goal.test_rvv_partial_solve_wit_85_pure.
Proof. unfold Qu8Add.rvv_unit_goal.test_rvv_partial_solve_wit_85_pure,Qu8Add.rvv_unit_goal_chunk02.test_rvv_partial_solve_wit_85_pure;try left;intros;subst;try(qu_array_values_fast input_a_pre(batch_pre+7)A HAValues);try(qu_array_values_fast input_b_pre(batch_pre+7)B HBValues);qu_rvv_kernel_arith_pure. Qed.
