From Qu8Add Require Import RvvKernelArithmeticAutomation KernelArrayProps2 RvvKernelCallResource.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_safety_wit_14 : Qu8Add.rvv_unit_goal.test_rvv_safety_wit_14.
Proof. unfold Qu8Add.rvv_unit_goal.test_rvv_safety_wit_14,Qu8Add.rvv_unit_goal_chunk14.test_rvv_safety_wit_14;try left;intros;subst;try(qu_array_values_fast input_a_pre(batch_pre+7)A HAValues);try(qu_array_values_fast input_b_pre(batch_pre+7)B HBValues);qu_rvv_kernel_arith_pure. Qed.
Lemma proof_of_test_rvv_safety_wit_47 : Qu8Add.rvv_unit_goal.test_rvv_safety_wit_47.
Proof. unfold Qu8Add.rvv_unit_goal.test_rvv_safety_wit_47,Qu8Add.rvv_unit_goal_chunk15.test_rvv_safety_wit_47;try left;intros;subst;try(qu_array_values_fast input_a_pre(batch_pre+7)A HAValues);try(qu_array_values_fast input_b_pre(batch_pre+7)B HBValues);qu_rvv_kernel_arith_pure. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_36_pure : Qu8Add.rvv_unit_goal.test_rvv_partial_solve_wit_36_pure.
Proof. unfold Qu8Add.rvv_unit_goal.test_rvv_partial_solve_wit_36_pure,Qu8Add.rvv_unit_goal_chunk01.test_rvv_partial_solve_wit_36_pure;try left;intros;subst;try(qu_array_values_fast input_a_pre(batch_pre+7)A HAValues);try(qu_array_values_fast input_b_pre(batch_pre+7)B HBValues);qu_rvv_kernel_arith_pure. Qed.
