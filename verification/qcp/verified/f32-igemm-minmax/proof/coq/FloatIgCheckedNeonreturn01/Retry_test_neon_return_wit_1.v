From Coq Require Import ZArith List Lia.
From FloatIgNeon Require Import neon_goal.
From FloatIgCheckedNeonreturn01 Require Import Facts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_return_wit_1:test_neon_return_wit_1.
Proof. unfold test_neon_return_wit_1;left;intros;rvv_subst;rvv_normalize.
 all: try lia.
 sep_apply ig_finished_output. ig_frame.
Qed.
Print Assumptions proof_of_test_neon_return_wit_1.
