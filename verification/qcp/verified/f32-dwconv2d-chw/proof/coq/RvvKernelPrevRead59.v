From Coq Require Import ZArith Lia.
From DwChw Require Import RvvKernelPrevReadTactics rvv_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_partial_solve_wit_59:DwChw.rvv_unit_goal.test_rvv_partial_solve_wit_59.
Proof. unfold DwChw.rvv_unit_goal.test_rvv_partial_solve_wit_59,DwChw.rvv_unit_goal.test_rvv_partial_solve_wit_59_aux;dw_prev_read_solve. Qed.
Print Assumptions proof_of_test_rvv_partial_solve_wit_59.
