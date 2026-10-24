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
Lemma proof_of_ig_compare_outputs_entail_wit_1:caller_goal.ig_compare_outputs_entail_wit_1.
Proof. unfold caller_goal.ig_compare_outputs_entail_wit_1;left;intros right_pre left_pre n_pre R L PreH1 PreH2 PreH3.
 prop_apply (FloatArray.full_Zlength left_pre n_pre L);Intros;entailer!.
Qed.
Print Assumptions proof_of_ig_compare_outputs_entail_wit_1.
