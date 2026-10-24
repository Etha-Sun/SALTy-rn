From Coq Require Import ZArith List Lia Strings.String.
From FloatIgRvv Require Import rvv_goal.
From FloatAutomation Require Import Frame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac ig_pure := unfold derivable1,andp,coq_prop;intros;
 repeat first[assumption|reflexivity|apply conj];lia.
Lemma proof_of_test_rvv_partial_solve_wit_83:rvv_goal.test_rvv_partial_solve_wit_83.
Proof. unfold rvv_goal.test_rvv_partial_solve_wit_83,rvv_goal.test_rvv_partial_solve_wit_83_aux;try left;intros;rewrite ?sizeof_char,?sizeof_float,?sizeof_int,?sizeof_ptr in *;rvv_normalize;
 timeout 180 (first [solve [ig_pure]|solve [ig_frame]|solve [entailer!]]).
Qed.
Print Assumptions proof_of_test_rvv_partial_solve_wit_83.
