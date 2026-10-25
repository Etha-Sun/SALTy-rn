From Coq Require Import ZArith Lia.
From DwChw Require Import NeonKernelTactics NeonKernelInitReadFacts neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque dw_data dw_output dw_progress dw_neon_results.
Lemma proof_of_test_neon_partial_solve_wit_87:DwChw.neon_unit_goal.test_neon_partial_solve_wit_87.
Proof.
 unfold DwChw.neon_unit_goal.test_neon_partial_solve_wit_87;intro HP.
 unfold DwChw.neon_unit_goal.test_neon_partial_solve_wit_87_aux;intros.
 pose proof(dw_neon_init_read_87 params_pre padding_top_pre output_pre zero_pre weights_pre input_pre input_width_pre input_height_pre Hi Lo Params Output Weights Zero Input N H W O F retval retval_2 retval_3 PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31)as HRead.
 lazymatch type of HRead with ?P |--?R=>lazymatch goal with|-_ |--?Q=>
 eapply(derivable1_trans P (R && P) Q);[apply _derivable1_andp_intros;[exact HRead|apply derivable1_refl]|]end end.
 repeat progress rewrite<-logic_equiv_andp_assoc.
 Intros_p HW1. Intros_p HW2.
 dw_neon_kernel_solve.
Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_87.
