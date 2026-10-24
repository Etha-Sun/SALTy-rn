From Coq Require Import ZArith List Lia.
From FloatIgRvv Require Import rvv_goal.
From FloatIgCheckedRvvmath08 Require Import Facts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_rvv_partial_solve_wit_32_pure:rvv_goal.test_rvv_partial_solve_wit_32_pure.
Proof. unfold rvv_goal.test_rvv_partial_solve_wit_32_pure;try left;intros;rvv_normalize;ig_extra;try ig_selected_rewrite;try ig_div_facts.
 all: timeout 180 (first[solve[ig_math_pure]|solve[entailer!;unfold packed_length,total_depth in *;nia]]).
Qed.
Print Assumptions proof_of_test_rvv_partial_solve_wit_32_pure.
