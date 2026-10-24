From Coq Require Import ZArith Lia.
From Dwconv Require Import RvvKernelMemorySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_5_1:Dwconv.rvv_unit_goal.test_rvv_entail_wit_5_1.
Proof.
 unfold Dwconv.rvv_unit_goal.test_rvv_entail_wit_5_1;right;dw_prepare;dwrm_windows F P W D output_width c w retval.
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop,truep;intros;repeat first[assumption|dwrm_window_known|split|reflexivity];lia.
 - entailer!.
Qed.
Lemma proof_of_test_rvv_entail_wit_5_2:Dwconv.rvv_unit_goal.test_rvv_entail_wit_5_2.
Proof.
 unfold Dwconv.rvv_unit_goal.test_rvv_entail_wit_5_2;right;dw_prepare;dwrm_windows F P W D output_width c w retval.
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop,truep;intros;repeat first[assumption|dwrm_window_known|split|reflexivity];lia.
 - entailer!.
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_5_1.
Print Assumptions proof_of_test_rvv_entail_wit_5_2.
