From Coq Require Import ZArith List Lia.
From Qd8RvvIsnan Require Import rvv_isnan_goal.
From Qd8RvvArith Require Import RvvArithmetic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac retry_pure := unfold derivable1,andp,coq_prop;intros;
 repeat first[assumption|reflexivity|apply conj];lia.
Module Checked.
Lemma proof_of_test_rvv_partial_solve_wit_53:rvv_isnan_goal.test_rvv_partial_solve_wit_53.
Proof. unfold rvv_isnan_goal.test_rvv_partial_solve_wit_53;try left;intros;(rvv_normalize;try lia);rvv_subst;(rvv_normalize;try lia);rvv_arithmetic_facts kc_pre;sep_apply (CharArray.full_split_to_missing_i a_pre 0 (a_read_extent kc_pre) A 0);[|lia].
 unfold StoreCharAsElement.storeA;cbn beta.
 (rvv_normalize;try lia).
 rewrite ?Z.add_assoc;timeout 1800 rvv_frame.
Qed.
End Checked.
