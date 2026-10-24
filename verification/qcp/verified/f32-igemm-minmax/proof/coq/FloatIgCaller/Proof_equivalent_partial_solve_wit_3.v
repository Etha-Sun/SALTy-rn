From Coq Require Import ZArith List Lia Strings.String.
From FloatIgCaller Require Import caller_goal.
From FloatIndirect Require Import ApiModel.
From FloatAutomation Require Import Frame.

From NanBridge Require Import BridgeLogic ListBridge.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac call_pure := unfold derivable1,andp,coq_prop;intros;
 repeat first[assumption|reflexivity|apply conj];lia.
Lemma proof_of_equivalent_partial_solve_wit_3:caller_goal.equivalent_partial_solve_wit_3.
Proof. unfold caller_goal.equivalent_partial_solve_wit_3,caller_goal.equivalent_partial_solve_wit_3_aux;intros;
 (rvv_normalize;try lia);timeout 1800 (first[call_pure|rvv_frame|entailer!]). Qed.
Print Assumptions proof_of_equivalent_partial_solve_wit_3.
