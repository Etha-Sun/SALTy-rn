From Coq Require Import ZArith List Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From IGemmRvv Require Import rvv_goal.
From Qd8RvvMath Require Import RvvMath.
From IGemmSupport Require Import IGemmFacts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac rvv_pure := unfold derivable1,andp,coq_prop;intros;
 repeat first [assumption|reflexivity|apply conj];lia.
Module Checked.
Lemma proof_of_test_rvv_partial_solve_wit_157:rvv_goal.test_rvv_partial_solve_wit_157.
Proof. unfold rvv_goal.test_rvv_partial_solve_wit_157;try left;intros;rewrite ?sizeof_char,?sizeof_float,?sizeof_int,?sizeof_ptr in *;rewrite ?Z.add_0_r,?Z.add_0_l,?Z.add_assoc;timeout 1800 (first [solve [rvv_frame]|solve [entailer!]]).
Qed.
End Checked.
