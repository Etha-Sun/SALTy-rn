From MaxPool Require Import NanArrayAutomation.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma checked:MaxPool.propagate_goal.mp_propagate_nan_partial_solve_wit_10.
Proof. unfold MaxPool.propagate_goal.mp_propagate_nan_partial_solve_wit_10;unfold MaxPool.propagate_goal.mp_propagate_nan_partial_solve_wit_10_aux;try left;na_intro;na_frame. Qed.
Print Assumptions checked.
