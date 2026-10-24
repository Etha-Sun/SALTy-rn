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
Lemma proof_of_equivalent_which_implies_wit_1:caller_goal.equivalent_which_implies_wit_1.
Proof. unfold caller_goal.equivalent_which_implies_wit_1;left;intros.
 sep_apply (two_output_states_related left right (total_depth kc Refs) nc zp (flat_inputs Blocks Refs kc) Ps inv lo hi).
 Intros L R;Exists L R;entailer!.
Qed.
Print Assumptions proof_of_equivalent_which_implies_wit_1.
