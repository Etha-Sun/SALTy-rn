From Coq Require Import ZArith List Lia.
From FloatIgNeon Require Import neon_goal.
From FloatIgCheckedNeontail02 Require Import Facts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_partial_solve_wit_86_pure:neon_goal.test_neon_partial_solve_wit_86_pure.
Proof. unfold neon_goal.test_neon_partial_solve_wit_86_pure;try left;intros;rewrite ?sizeof_ptr in *;unfold Arch64.ptr_size_Z in *;rvv_normalize;ig_extra;try ig_div_facts.
 all: try lia.
 all: ig_tail_split nc.
 all: timeout 180(first[solve[ig_math_pure]|solve[ig_math_frame]|solve[entailer!;lia]]).

Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_86_pure.
