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
Lemma proof_of_ig_compare_outputs_safety_wit_3:caller_goal.ig_compare_outputs_safety_wit_3.
Proof. unfold caller_goal.ig_compare_outputs_safety_wit_3;intros;(rvv_normalize;try lia);unfold ig_ret_one,ig_bit_same in *;timeout 1800 (first[call_pure|rvv_frame|entailer!]).
Qed.
Print Assumptions proof_of_ig_compare_outputs_safety_wit_3.
