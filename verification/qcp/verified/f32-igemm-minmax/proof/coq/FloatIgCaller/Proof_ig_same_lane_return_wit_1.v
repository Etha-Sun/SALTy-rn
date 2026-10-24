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
Lemma proof_of_ig_same_lane_return_wit_1:caller_goal.ig_same_lane_return_wit_1.
Proof. unfold caller_goal.ig_same_lane_return_wit_1;left;intros.
 unfold ig_bit_same in *;subst retval retval_2.
 exfalso;eapply same_ne_left_self_eq_false;eassumption.
Qed.
Print Assumptions proof_of_ig_same_lane_return_wit_1.
