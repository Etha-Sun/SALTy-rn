From MaxPool Require Import NanArrayAutomation.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma checked:MaxPool.propagate_goal.mp_propagate_nan_safety_wit_5.
Proof. unfold MaxPool.propagate_goal.mp_propagate_nan_safety_wit_5;try left;na_intro;na_pure. Qed.
Print Assumptions checked.
