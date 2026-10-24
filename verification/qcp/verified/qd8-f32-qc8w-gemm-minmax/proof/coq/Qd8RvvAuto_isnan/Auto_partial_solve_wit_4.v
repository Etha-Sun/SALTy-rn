From Coq Require Import ZArith List Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qd8RvvIsnan Require Import rvv_isnan_goal.
From Qd8RvvMath Require Import RvvMath.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac rvv_pure :=
 unfold derivable1,andp,coq_prop;intros;
 repeat first [assumption|reflexivity|apply conj];lia.
Module Checked.
Lemma proof_of_test_rvv_partial_solve_wit_4:rvv_isnan_goal.test_rvv_partial_solve_wit_4.
Proof. unfold rvv_isnan_goal.test_rvv_partial_solve_wit_4,rvv_isnan_goal.test_rvv_partial_solve_wit_4_aux;intros;rewrite ?sizeof_char,?sizeof_float,?sizeof_int in *;rewrite ?Z.add_0_r,?Z.add_0_l,?Z.add_assoc;timeout 1800 rvv_frame.
Qed.
End Checked.
