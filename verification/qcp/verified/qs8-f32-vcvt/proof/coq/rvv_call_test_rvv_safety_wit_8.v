From Qs8Cvt Require Import KernelBounds rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_rvv_safety_wit_8 : Qs8Cvt.rvv_unit_goal.test_rvv_safety_wit_8.
Proof. unfold Qs8Cvt.rvv_unit_goal.test_rvv_safety_wit_8;try left;cvt_complete. Qed.
Print Assumptions proof_of_test_rvv_safety_wit_8.
