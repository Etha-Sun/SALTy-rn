From Coq Require Import ZArith List Lia.
From X32Packw Require Import MainAutomation rvv_unit_goal.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma checked_test_rvv_partial_solve_wit_14:X32Packw.rvv_unit_goal.test_rvv_partial_solve_wit_14.
Proof. unfold X32Packw.rvv_unit_goal.test_rvv_partial_solve_wit_14, X32Packw.rvv_unit_goal.test_rvv_partial_solve_wit_14_aux.
 first[right;intros;pw_main_auto|left;intros;pw_main_auto|intros;pw_main_auto].
Qed.
Print Assumptions checked_test_rvv_partial_solve_wit_14.
