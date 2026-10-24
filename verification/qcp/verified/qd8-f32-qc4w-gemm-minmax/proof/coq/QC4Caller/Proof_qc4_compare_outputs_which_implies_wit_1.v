From Coq Require Import ZArith List Lia Strings.String.
From QC4Caller Require Import caller_goal.
From QC4W Require Import PublicModel.
From QC4Auto Require Import Frame.

From NanBridge Require Import BridgeLogic ListBridge.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac call_pure := unfold derivable1,andp,coq_prop;intros;
 repeat first[assumption|reflexivity|apply conj];lia.
Lemma proof_of_qc4_compare_outputs_which_implies_wit_1:caller_goal.qc4_compare_outputs_which_implies_wit_1.
Proof. unfold caller_goal.qc4_compare_outputs_which_implies_wit_1;left;intros R L i n left right __default_fp32 PreH1 PreH2 PreH3.
 prop_apply (FloatArray.full_Zlength left n L);Intros.
 assert(Hrel:qc4_same_value (Znth i L __default_fp32)(Znth i R __default_fp32)).
 { eapply related_Znth;[exact PreH3|]. rewrite <- Zlength_correct;lia. }
 sep_apply (FloatArray.full_split_to_missing_i left i n L __default_fp32);[|lia].
 sep_apply (FloatArray.full_split_to_missing_i right i n R __default_fp32);[|lia].
 unfold StoreFloatAsElement.storeA;entailer!.
Qed.
Print Assumptions proof_of_qc4_compare_outputs_which_implies_wit_1.
