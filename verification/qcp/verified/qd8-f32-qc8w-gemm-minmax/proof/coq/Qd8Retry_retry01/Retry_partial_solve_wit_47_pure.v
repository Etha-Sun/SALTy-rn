From Coq Require Import ZArith List Lia.
From Qd8RvvIsnan Require Import rvv_isnan_goal.
From Qd8RvvArith Require Import RvvArithmetic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac retry_pure := unfold derivable1,andp,coq_prop;intros;
 repeat first[assumption|reflexivity|apply conj];lia.
Module Checked.
Lemma proof_of_test_rvv_partial_solve_wit_47_pure:rvv_isnan_goal.test_rvv_partial_solve_wit_47_pure.
Proof. unfold rvv_isnan_goal.test_rvv_partial_solve_wit_47_pure;try left;intros;rvv_normalize;rvv_subst;rvv_normalize;rvv_arithmetic_facts kc_pre;timeout 1800 (first[retry_pure|entailer!]).
Qed.
End Checked.
