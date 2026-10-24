From Coq Require Import ZArith List Lia Strings.String.
From IGemmCaller Require Import caller_goal.
From Qd8CallerModel Require Import CallerModel.
From Qd8RvvArith Require Import RvvArithmetic.
From Qd8IGemm Require Import IGemmModel.
From NanBridge Require Import BridgeLogic ListBridge.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac call_pure := unfold derivable1,andp,coq_prop;intros;
 repeat first[assumption|reflexivity|apply conj];lia.
Lemma proof_of_qd8_compare_outputs_partial_solve_wit_1:caller_goal.qd8_compare_outputs_partial_solve_wit_1.
Proof. unfold caller_goal.qd8_compare_outputs_partial_solve_wit_1,caller_goal.qd8_compare_outputs_partial_solve_wit_1_aux;intros;(rvv_normalize;try lia);unfold qd8_ret_one,qd8_bit_same in *;timeout 1800 (first[call_pure|rvv_frame|entailer!]).
Qed.
Print Assumptions proof_of_qd8_compare_outputs_partial_solve_wit_1.
