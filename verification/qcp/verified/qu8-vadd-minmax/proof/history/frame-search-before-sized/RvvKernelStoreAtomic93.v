From Qu8Add Require Import RvvKernelArithmeticAutomation KernelArrayProps2 RvvKernelCallResource RvvKernelAtomicFrame2.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_partial_solve_wit_93 : Qu8Add.rvv_unit_goal.test_rvv_partial_solve_wit_93.
Proof. unfold Qu8Add.rvv_unit_goal.test_rvv_partial_solve_wit_93,Qu8Add.rvv_unit_goal_chunk10.test_rvv_partial_solve_wit_93,Qu8Add.rvv_unit_goal.test_rvv_partial_solve_wit_93_aux,Qu8Add.rvv_unit_goal_chunk10.test_rvv_partial_solve_wit_93_aux;try left;intros;subst;try(qu_array_values_fast input_a_pre(batch_pre+7)A HAValues);try(qu_array_values_fast input_b_pre(batch_pre+7)B HBValues) .
Time qu_call_split_store.
Time qu_clean_emp.
Time unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t,UndefStructPreduint16x8_t,UndefStructPredint16x4_t,UndefStructPredint16x8_t,UndefStructPredint32x4_t,UndefStructPredvuint8m2_t,UndefStructPredvuint16m4_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t.
Time rewrite ?local_field_address,?byte_typed_field_address.
Time repeat progress rewrite <-logic_equiv_andp_assoc.
apply _derivable1_andp_intros.
- Time(unfold derivable1,andp,coq_prop;intros;repeat match goal with H:context[sepcon _ _]|-_=>clear H end;first[solve[repeat first[assumption|split|reflexivity];lia]|qu_rem_bounds;qu_rvv_active_target_ranges;qu_target_ranges;unfold qu_umin,qu_umax;repeat first[assumption|split|reflexivity];lia]).
- Time rewrite !sizeof_char,!sizeof_uchar.
  Time qu_atomic2_frame.
Qed.
Print Assumptions proof_of_test_rvv_partial_solve_wit_93.
