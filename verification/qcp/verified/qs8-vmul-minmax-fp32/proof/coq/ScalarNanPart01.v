From Qs8Mul Require Import ScalarNanTactics qm_scale_is_nan_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_qm_scale_is_nan_safety_wit_2 : Qs8Mul.qm_scale_is_nan_goal.qm_scale_is_nan_safety_wit_2.
Proof. unfold Qs8Mul.qm_scale_is_nan_goal.qm_scale_is_nan_safety_wit_2;try left;qm_bits_start;qm_bits_finish. Qed.
Print Assumptions proof_of_qm_scale_is_nan_safety_wit_2.
