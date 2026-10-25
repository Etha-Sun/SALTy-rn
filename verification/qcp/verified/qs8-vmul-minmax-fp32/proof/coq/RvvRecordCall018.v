From Coq Require Import ZArith Lia.
From Qs8Mul Require Import RvvRecordCallTactics rvv_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_partial_solve_wit_1:Qs8Mul.rvv_unit_goal.test_rvv_partial_solve_wit_1.
Proof. unfold Qs8Mul.rvv_unit_goal.test_rvv_partial_solve_wit_1,Qs8Mul.rvv_unit_goal.test_rvv_partial_solve_wit_1_aux;qm_record_main_solve. Qed.
Print Assumptions proof_of_test_rvv_partial_solve_wit_1.
