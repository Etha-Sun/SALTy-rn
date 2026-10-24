From FloatIgNeon Require Import neon_goal.
From FloatIgCheckedNeonauto02 Require Import Facts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_safety_wit_70:neon_goal.test_neon_safety_wit_70.
Proof. unfold neon_goal.test_neon_safety_wit_70;try left;intros;rewrite ?sizeof_char,?sizeof_float,?sizeof_int,?sizeof_ptr in *;rvv_normalize;
 timeout 180(first[solve[ig_pure]|solve[ig_frame]|solve[entailer!]]).
Qed.
Print Assumptions proof_of_test_neon_safety_wit_70.
